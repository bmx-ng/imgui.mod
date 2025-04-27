SuperStrict

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


Function ImGui_ImplSDL2_InitForOpenGL:Int(window:TSDLWindow, context:Byte Ptr)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForOpenGL(window.windowPtr, context)
End Function

Function ImGui_ImplSDL2_InitForVulkan:Int(window:TSDLWindow)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForVulkan(window.windowPtr)
End Function

Function ImGui_ImplSDL2_InitForD3D:Int(window:TSDLWindow)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForD3D(window.windowPtr)
End Function

Function ImGui_ImplSDL2_InitForMetal:Int(window:TSDLWindow)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForMetal(window.windowPtr)
End Function

Function ImGui_ImplSDL2_InitForSDLRenderer:Int(window:TSDLWindow, renderer:TSDLRenderer)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForSDLRenderer(window.windowPtr, renderer.rendererPtr)
End Function

Function ImGui_ImplSDL2_InitForOther:Int(window:TSDLWindow)
	bmx_imguisdl2_init()
	Return _ImGui_ImplSDL2_InitForOther(window.windowPtr)
End Function

Function ImGui_ImplSDL2_Shutdown()
	_ImGui_ImplSDL2_Shutdown()
End Function

Function ImGui_ImplSDL2_NewFrame()
	_ImGui_ImplSDL2_NewFrame()
End Function

Function ImGui_ImplSDL2_ProcessEvent:Int(event:Byte Ptr)
	Return _ImGui_ImplSDL2_ProcessEvent(event)
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

	Function bmx_imguisdl2_init()
End Extern
