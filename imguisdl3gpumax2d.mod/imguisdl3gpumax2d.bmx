SuperStrict

Rem
bbdoc: Dear ImGui window overlays for Max2D's native SDL3 GPU backend.
End Rem
Module ImGui.ImGuiSDL3GPUMax2D
ModuleInfo "Version: 1.00"
ModuleInfo "License: MIT"
ModuleInfo "CC_OPTS: -I%PWD%/../../sdl3.mod/sdl3.mod/SDL3/include"

Import ImGui.ImGuiSDL3GPU
Import Max2D.SDL3GPUMax2D
Import "../imgui.mod/db_generated/*.h"
Import "../imgui.mod/db_generated/backends/*.h"
Import "../imgui.mod/imgui/*.h"
Import "glue.c"

Rem
bbdoc: Connects an existing ImGui context to the current SDL3 GPU Max2D window.
about: Call Shutdown before destroying the ImGui context or closing graphics. This object owns the two ImGui backends, not either context. Render draws a window overlay independent of Max2D cameras and virtual resolution. Detached ImGui viewports are not managed by this convenience adapter.
End Rem
Type TImGuiSDL3GPUOverlay
	Private
	Field graphics:TSDLGPUMax2DContext
	Field ui:TImGuiContext
	Field active:Int

	Public
	Rem
	bbdoc: Initializes the platform and GPU backends on the current contexts.
	returns: A live overlay, or Null if native initialization fails (see SDL_GetError).
	End Rem
	Function Create:TImGuiSDL3GPUOverlay()
		Local graphics:TSDLGPUMax2DContext=TSDLGPUMax2DContext(TMax2DGraphics.Current().context)
		If Not graphics Then Throw "ImGui overlay requires Max2D.SDL3GPUMax2D"
		Local ui:TImGuiContext=ImGui_GetCurrentContext()
		If Not ui Then Throw "Create an ImGui context before its overlay"
		Local window:TSDLWindow=TSDLGraphics(graphics.graphics)._context.window
		If Not ImGui_ImplSDL3_InitForSDLGPU(window) Then Return Null
		If Not ImGui_ImplSDLGPU3_Init(graphics.GetGPUDevice(),graphics.WindowOverlayFormat())
			ImGui_ImplSDL3_Shutdown()
			Return Null
		End If
		Local overlay:TImGuiSDL3GPUOverlay=New TImGuiSDL3GPUOverlay
		overlay.graphics=graphics
		overlay.ui=ui
		overlay.active=True
		Return overlay
	End Function

	Rem
	bbdoc: Updates both backends before the application's ImGui_NewFrame call.
	End Rem
	Method NewFrame()
		CheckCurrent()
		ImGui_ImplSDLGPU3_NewFrame()
		ImGui_ImplSDL3_NewFrame()
	End Method

	Rem
	bbdoc: Flushes Max2D and renders the completed ImGui frame onto the window.
	param: Draw data returned by ImGui_GetDrawData after ImGui_Render.
	about: Call before Flip with the window selected as Max2D's render target. The existing window pixels are preserved.
	End Rem
	Method Render(data:TImDrawData)
		CheckCurrent()
		If Not data Then Return
		graphics.RenderWindowOverlay(bmx_imgui_gpu_prepare_callback(),bmx_imgui_gpu_draw_callback(),data.handle)
	End Method

	Rem
	bbdoc: Releases both backends while keeping the application-owned contexts alive.
	about: Both contexts must remain alive. Repeated calls are harmless.
	End Rem
	Method Shutdown()
		If Not active Then Return
		If graphics.closed Then Throw "Shut down ImGui before closing graphics"
		Local previous:TImGuiContext=ImGui_GetCurrentContext()
		ImGui_SetCurrentContext(ui)
		ImGui_ImplSDLGPU3_Shutdown()
		ImGui_ImplSDL3_Shutdown()
		ImGui_SetCurrentContext(previous)
		active=False
	End Method

	Private
	Method CheckCurrent()
		If Not active Or graphics.closed Then Throw "ImGui overlay is closed"
		If TMax2DGraphics.Current().context<>graphics Then Throw "ImGui overlay requires its original graphics context"
		Local current:TImGuiContext=ImGui_GetCurrentContext()
		If Not current Or current.handle<>ui.handle Then Throw "ImGui overlay requires its original ImGui context"
	End Method
End Type

Private
Extern "C"
	Function bmx_imgui_gpu_prepare_callback:Byte Ptr()
	Function bmx_imgui_gpu_draw_callback:Byte Ptr()
End Extern
