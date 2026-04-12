SuperStrict

Rem
bbdoc: SDL2 backend for ImGui
End Rem
Module ImGui.ImGuiSDL2

ModuleInfo "CPP_OPTS: -std=c++11"
ModuleInfo "C_OPTS: -std=c99"

Import ImGui.ImGui
Import SDL.SDLRender
Import SDL.SDLGameController

Import "../../sdl.mod/sdl.mod/SDL/include/*.h"
Import "../imgui.mod/imgui/*.h"
Import "../imgui.mod/imgui/backends/*.h"
Import "../imgui.mod/db_generated/*.h"
Import "../imgui.mod/db_generated/backends/*.h"
Import "../imgui.mod/imgui/backends/imgui_impl_sdl2.cpp"
Import "../imgui.mod/db_generated/backends/dcimgui_impl_sdl2.cpp"
Import "glue.c"


Rem
bbdoc: Initializes ImGui for use with the OpenGL API.
End Rem
Function ImGui_ImplSDL2_InitForOpenGL:Int(window:TSDLWindow, context:Byte Ptr)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForOpenGL(window.windowPtr, context)
End Function

Rem
bbdoc: Initializes ImGui for use with the Vulkan API.
End Rem
Function ImGui_ImplSDL2_InitForVulkan:Int(window:TSDLWindow)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForVulkan(window.windowPtr)
End Function

Rem
bbdoc: Initializes ImGui for use with the Direct3D API.
End Rem
Function ImGui_ImplSDL2_InitForD3D:Int(window:TSDLWindow)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForD3D(window.windowPtr)
End Function

Rem
bbdoc: Initializes ImGui for use with the Metal API.
End Rem
Function ImGui_ImplSDL2_InitForMetal:Int(window:TSDLWindow)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForMetal(window.windowPtr)
End Function

Rem
bbdoc: Initializes ImGui for use with the SDL renderer.
End Rem
Function ImGui_ImplSDL2_InitForSDLRenderer:Int(window:TSDLWindow, renderer:TSDLRenderer)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForSDLRenderer(window.windowPtr, renderer.rendererPtr)
End Function

Function ImGui_ImplSDL2_InitForOther:Int(window:TSDLWindow)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForOther(window.windowPtr)
End Function

Rem
bbdoc: Shuts down ImGui for SDL2.
End Rem
Function ImGui_ImplSDL2_Shutdown()
	_ImGui_ImplSDL2_Shutdown()
End Function

Rem
bbdoc: Starts a new ImGui frame.
about: You can call this function from your main loop to begin a new ImGui frame.
End Rem
Function ImGui_ImplSDL2_NewFrame()
	_ImGui_ImplSDL2_NewFrame()
End Function

Rem
bbdoc: Processes an SDL event.
returns: #True if the event was processed, #False if it was not.
about: This is already implicitly called via a callback in BlitzMax's SDL event handling, so you don't need to call this function directly.
End Rem
Function ImGui_ImplSDL2_ProcessEvent:Int(event:Byte Ptr)
	Return _ImGui_ImplSDL2_ProcessEvent(event)
End Function

Rem
bbdoc: Gets the content scale for a given display.
about: This is used to determine the appropriate scaling for high-DPI displays.
End Rem
Function ImGui_ImplSDL2_GetContentScaleForDisplay:Float(displayIndex:Int)
	Return _ImGui_ImplSDL2_GetContentScaleForDisplay(displayIndex)
End Function

Rem
bbdoc: Gets the content scale for a given window.
about: This is used to determine the appropriate scaling for high-DPI displays.
End Rem
Function ImGui_ImplSDL2_GetContentScaleForWindow:Float(window:TSDLWindow)
	Return _ImGui_ImplSDL2_GetContentScaleForWindow(window.windowPtr)
End Function

Private
Extern
	Function _ImGui_ImplSDL2_InitForOpenGL:Int(window:Byte Ptr, sdl_gl_context:Byte Ptr)="cImGui_ImplSDL2_InitForOpenGL"
	Function _ImGui_ImplSDL2_InitForVulkan:Int(window:Byte Ptr)="cImGui_ImplSDL2_InitForVulkan"
	Function _ImGui_ImplSDL2_InitForD3D:Int(window:Byte Ptr)="cImGui_ImplSDL2_InitForD3D"
	Function _ImGui_ImplSDL2_InitForMetal:Int(window:Byte Ptr)="cImGui_ImplSDL2_InitForMetal"
	Function _ImGui_ImplSDL2_InitForSDLRenderer:Int(window:Byte Ptr, renderer:Byte Ptr)="cImGui_ImplSDL2_InitForSDLRenderer"
	Function _ImGui_ImplSDL2_InitForOther:Int(window:Byte Ptr)="cImGui_ImplSDL2_InitForOther"
	Function _ImGui_ImplSDL2_Shutdown()="cImGui_ImplSDL2_Shutdown"
	Function _ImGui_ImplSDL2_NewFrame()="cImGui_ImplSDL2_NewFrame"
	Function _ImGui_ImplSDL2_ProcessEvent:Int(event:Byte Ptr)="cImGui_ImplSDL2_ProcessEvent"
	Function _ImGui_ImplSDL2_GetContentScaleForWindow:Float(window:Byte Ptr) ="cImGui_ImplSDL2_GetContentScaleForWindow"
	Function _ImGui_ImplSDL2_GetContentScaleForDisplay:Float(displayIndex:Int) ="cImGui_ImplSDL2_GetContentScaleForDisplay"

	Function bmx_imguisdl2_init()
End Extern
