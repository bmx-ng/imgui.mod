SuperStrict

Rem
bbdoc: The SDL2 renderer backend for ImGui.
End Rem
Module ImGui.ImGuiSDL2Renderer

ModuleInfo "CPP_OPTS: -std=c++11"
ModuleInfo "C_OPTS: -std=c99"

Import ImGui.ImGuiSDL2
Import SDL.SDLRender

Import "../../sdl.mod/sdl.mod/SDL/include/*.h"
Import "../imgui.mod/imgui/*.h"
Import "../imgui.mod/imgui/backends/*.h"
Import "../imgui.mod/db_generated/*.h"
Import "../imgui.mod/imgui/backends/imgui_impl_sdlrenderer2.cpp"
Import "../imgui.mod/db_generated/backends/dcimgui_impl_sdlrenderer2.cpp"


Rem
bbdoc: Initializes the SDL2 renderer for ImGui.
End Rem
Function ImGui_ImplSDLRenderer2_Init:Int(renderer:TSDLRenderer)
	Return _ImGui_ImplSDLRenderer2_Init(renderer.rendererPtr)
End Function

Rem
bbdoc: Shuts down the SDL2 renderer for ImGui.
End Rem
Function ImGui_ImplSDLRenderer2_Shutdown()
	_ImGui_ImplSDLRenderer2_Shutdown()
End Function

Rem
bbdoc: Starts a new frame for the SDL2 renderer for ImGui.
End Rem
Function ImGui_ImplSDLRenderer2_NewFrame()
	_ImGui_ImplSDLRenderer2_NewFrame()
End Function

Rem
bbdoc: Renders the draw data for the SDL2 renderer for ImGui.
End Rem
Function ImGui_ImplSDLRenderer2_RenderDrawData(draw_data:Byte Ptr, renderer:TSDLRenderer)
	_ImGui_ImplSDLRenderer2_RenderDrawData(draw_data, renderer.rendererPtr)
End Function

Private
Extern
	Function _ImGui_ImplSDLRenderer2_Init:Int(renderer:Byte Ptr) = "cImGui_ImplSDLRenderer2_Init"
	Function _ImGui_ImplSDLRenderer2_Shutdown() = "cImGui_ImplSDLRenderer2_Shutdown"
	Function _ImGui_ImplSDLRenderer2_NewFrame() = "cImGui_ImplSDLRenderer2_NewFrame"
	Function _ImGui_ImplSDLRenderer2_RenderDrawData(draw_data:Byte Ptr, renderer:Byte Ptr) = "cImGui_ImplSDLRenderer2_RenderDrawData"
End Extern
