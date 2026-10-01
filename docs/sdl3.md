# Using ImGui with SDL3

Choose the renderer that your application already uses. Both renderer modules share `ImGui.ImGuiSDL3` for windows and input.

| Import | Use it with |
| --- | --- |
| `ImGui.ImGuiSDL3Renderer` | `SDL3.SDL3Render`, including `Max2D.SDL3RenderMax2D` |
| `ImGui.ImGuiSDL3GPU` | An application-owned native `SDL_GPUDevice` and command buffers |
| `ImGui.ImGuiSDL3GPUMax2D` | `Max2D.SDL3GPUMax2D`; provides a convenient window overlay |

The low-level renderer modules do not import Max2D. The GPU Max2D adapter is separate so applications with their own GPU rendering loop do not need it. An SDL renderer using SDL's `gpu` renderer driver still uses **ImGuiSDL3Renderer**.

## Examples

- [SDL renderer without Max2D](../imgui.mod/examples/sdl3_renderer.bmx)
- [SDL renderer with Max2D](../imgui.mod/examples/sdl3_renderer_max2d.bmx)
- [Native SDL GPU with Max2D](../imgui.mod/examples/sdl3_gpu_max2d.bmx)

Build with `bmk makeapp -r -t gui <example.bmx>`. The Max2D examples draw a virtual-resolution scene beneath a window-resolution UI. They include text input, an uploaded RGB pixmap, rotation controls and the ImGui demo window. Resize the window and drag the panels to try the integration.

## SDL renderer initialization and frame order

Create the window and renderer, create an ImGui context, then initialize both backends:

```blitzmax
ImGui_CreateContext()
If Not ImGui_ImplSDL3_InitForSDLRenderer(window, renderer) Then Throw SDL_GetError()
If Not ImGui_ImplSDLRenderer3_Init(renderer) Then Throw SDL_GetError()
```

Each frame, process events before updating ImGui:

```blitzmax
ImGui_ImplSDLRenderer3_NewFrame()
ImGui_ImplSDL3_NewFrame()
ImGui_NewFrame()
' Build your UI here.
ImGui_Render()
```

Draw the application scene before calling `ImGui_ImplSDLRenderer3_RenderDrawData(ImGui_GetDrawData(), renderer)`, then present. With Max2D, select the window target and call `FlushMax2D()` immediately before rendering ImGui; use `Flip()` to present.

The wrapper applies the draw data's framebuffer scale for Retina/high-DPI output and restores the renderer scale afterward. The upstream backend restores viewport and clipping. For an offscreen target, the application must provide draw data whose display size and framebuffer scale match that target. ImGui window coordinates are independent of Max2D's camera, virtual resolution and letterboxing.

Shut down in this order:

```blitzmax
ImGui_ImplSDLRenderer3_Shutdown()
ImGui_ImplSDL3_Shutdown()
ImGui_DestroyContext()
' Now close graphics, or destroy your renderer and window.
```

## Native GPU Max2D overlay

Create graphics and an ImGui context, then attach an overlay:

```blitzmax
Local overlay:TImGuiSDL3GPUOverlay = TImGuiSDL3GPUOverlay.Create()
If Not overlay Then Throw SDL_GetError()
```

The frame sequence is:

1. Process events and draw your Max2D scene.
2. Call `overlay.NewFrame()`, then `ImGui_NewFrame()`.
3. Build your UI and call `ImGui_Render()`.
4. Call `overlay.Render(ImGui_GetDrawData())` with the window render target active.
5. Call `Flip()`.

The overlay flushes pending Max2D geometry, prepares ImGui's upload work, draws into a preserving render pass on Max2D's intermediate window texture, and submits it on the same GPU device. Subsequent Max2D draws are ordered after the overlay. Max2D cameras and viewports do not clip the UI. Max2D drawing statistics exclude native ImGui overlay work.

Call `overlay.Shutdown()` before destroying the ImGui context or closing graphics. It does not own either context, and requires the original contexts when drawing. Render-to-texture overlays are intentionally rejected by this convenience adapter.

### Using the GPU backend directly

`ImGui_ImplSDLGPU3_Init` takes the borrowed device pointer, target texture format, sample count and optional secondary-window presentation settings. Enum parameters use SDL's native numeric enum values; defaults match upstream (one sample, SDR and VSync).

Call `ImGui_ImplSDLGPU3_PrepareDrawData` **before** beginning the render pass, then `ImGui_ImplSDLGPU3_RenderDrawData` inside the pass. Your application ends and submits the command buffer. The pass format and sample count must match initialization. The default Max2D adapter uses its intermediate target's format, not the swapchain format.

## Input and capture

Successful platform initialization installs an SDL3System event observer. Ordinary event pumping forwards each event to ImGui before BlitzMax translates it. Do not also call `ImGui_ImplSDL3_ProcessEvent` for those same events.

- Raw SDL windows can use `PollEvent()` as shown in the standalone example.
- Max2D applications commonly poll through `KeyDown()` or `AppTerminate()`; an additional `PollSystem()` is unnecessary in such loops.
- Keyboard/mouse events captured by ImGui are suppressed from BlitzMax input. Releases for keys or buttons already delivered to BlitzMax still pass through, preventing stuck input when capture starts during a press.
- Window and application events remain available, including close requests.
- The backend handles text input and IME activation. Do not independently start/stop text input for the same window without coordinating ownership.

The observer is removed on shutdown. Multiple initialized ImGui contexts receive events with their own context selected; the previously selected context is restored afterward. Destroying an ImGui context without first shutting down its backends is unsupported.

## Images and ownership

Use `TSDL3RenderImGuiImageBackend(renderer)` or `TSDLGPUImGuiImageBackend(device)` with `TImGuiImageCache`. Both accept ordinary `TPixmap` images, convert them to RGBA32, and upload an independent texture. Source pixmaps need not remain alive afterward.

External SDL renderer textures use `TSDLTexture`; native GPU textures use `SDL_GPUTexture` pointers. They must belong to the renderer/device used by ImGui. External registration defaults to borrowed ownership. Set `owned=True` only when the cache should release the texture. Pixmap uploads create owned textures.

Destroy owned resources or clear the owning cache **before** destroying the renderer/device. A Max2D image frame's `native` field is an internal wrapper, not an SDL texture pointer: do not use it as an ImGui texture ID.

## Multiple windows and validation

The SDL3 platform backend and native GPU renderer have upstream multi-viewport support. The SDL renderer backend does not. The Max2D convenience adapter does not manage detached ImGui viewports; leave that feature disabled there.

The initial implementation is built and tested on macOS arm64. Windows/Linux runtime validation remains outstanding. Tests cover input capture, release transitions, UTF-8 event delivery, shutdown/reinitialization and GPU overlay ordering. The Max2D examples provide visual checks for both renderer paths and image uploads.
