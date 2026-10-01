
## How-to Source Generation

There are several steps to generate all of the source files for this module.

### Step 1: Generate the c glue

Copy `gen.sh` to the db_generated folder and run it. This will generate the c glue code for all of the imgui headers.

### Step 2: Generate the bmx glue and main source files

Build and run `bmx_generator.bmx` from the `imgui_to_bmx` folder. This will generate the bmx glue code and the main source files for the module.

It requires the first step to be completed as it uses the generated c glue code to create the bmx glue and main source files.

### Step 3: Fixup generated code

The generated SDL2 glue (eg. dcimgui_impl_sdl2.h) is usually broken. Namely the definition of '_SDL_GameController'. Check diff with previous commits to see the changes that need to be made to fix it up.
In the cpp, some 'cimgui::' namespaces are missing.

It's possibly that changes to the imgui headers may cause the generated code to be broken. This may require updating bmx_generator to handle the new changes.


## Python dependencies

From the directory containing `dear_bindings`, `db_generated` and `imgui_to_bmx`:

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -r dear_bindings/requirements.txt
. .venv/bin/activate
cd db_generated
sh ../imgui_to_bmx/gen.sh
```

This runs the maintained script directly; copying it into `db_generated` is not required. The virtual environment is excluded from Git.

## SDL3 backend generation

`gen.sh` generates C headers, C++ wrappers and JSON metadata for `sdl3`, `sdlrenderer3` and `sdlgpu3`. Build these against the same ImGui and SDL3 headers used by the modules. The generated wrappers for 1.92.9b compiled without manual SDL3 fixups.

The BlitzMax modules `ImGuiSDL3`, `ImGuiSDL3Renderer`, `ImGuiSDL3GPU` and the optional `ImGuiSDL3GPUMax2D` adapter are maintained separately. `bmx_generator.bmx` generates the main ImGui API, not these backend modules. Review upstream backend signature changes when updating them, including texture identifiers and GPU initialization defaults. Native bool results cross our backend glue as Int values.

Keep changes to generated core code in `bmx_generator.bmx`, then rebuild and run that executable **from its source directory** (its output paths are relative to the executable). In particular, generated `bbMemFree` calls cast owned UTF-8 buffers to `void *`.

After generation, build the ImGui namespace and run the SDL3 examples and regression tests. The SDL3 GPU Max2D adapter requires the Max2D native window-overlay API. The test-directory `pre.bmk` supplies the SDL headers for native event fixtures.
