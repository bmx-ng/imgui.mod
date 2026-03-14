
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

