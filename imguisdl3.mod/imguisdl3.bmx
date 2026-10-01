SuperStrict

Rem
bbdoc: SDL3 window and input backend for Dear ImGui.
End Rem
Module ImGui.ImGuiSDL3

ModuleInfo "Version: 1.00"
ModuleInfo "License: MIT"
ModuleInfo "CPP_OPTS: -std=c++11"
ModuleInfo "CC_OPTS: -I%PWD%/../../sdl3.mod/sdl3.mod/SDL3/include"

Import ImGui.ImGui
Import SDL3.SDL3Render
Import SDL3.SDL3System
Import "../imgui.mod/imgui/*.h"
Import "../imgui.mod/imgui/backends/*.h"
Import "../imgui.mod/db_generated/*.h"
Import "../imgui.mod/db_generated/backends/*.h"
Import "../imgui.mod/imgui/backends/imgui_impl_sdl3.cpp"
Import "../imgui.mod/db_generated/backends/dcimgui_impl_sdl3.cpp"
Import "glue.c"

Rem
bbdoc: Initializes the current ImGui context for SDL3 with OpenGL rendering.
param: Window owned by the application; keep it alive until shutdown.
param: OpenGL context handle.
returns: True on success; False on failure (see SDL_GetError).
about: Registers automatic event forwarding through SDL3System. Shut down the renderer backend before this platform backend, then destroy the ImGui context.
End Rem
Function ImGui_ImplSDL3_InitForOpenGL:Int(window:TSDLWindow, context:Byte Ptr)
	If Not window Or Not window.windowPtr Then Return False
	Return bmx_imguisdl3_init(window.windowPtr,context,0)
End Function

Rem
bbdoc: Initializes the current ImGui context for SDL3 with Vulkan rendering.
param: Window owned by the application; keep it alive until shutdown.
returns: True on success; False on failure (see SDL_GetError).
about: Registers automatic event forwarding through SDL3System. Shut down the renderer backend before this platform backend, then destroy the ImGui context.
End Rem
Function ImGui_ImplSDL3_InitForVulkan:Int(window:TSDLWindow)
	If Not window Or Not window.windowPtr Then Return False
	Return bmx_imguisdl3_init(window.windowPtr,Null,1)
End Function

Rem
bbdoc: Initializes the current ImGui context for SDL3 with D3D rendering.
param: Window owned by the application; keep it alive until shutdown.
returns: True on success; False on failure (see SDL_GetError).
about: Registers automatic event forwarding through SDL3System. Shut down the renderer backend before this platform backend, then destroy the ImGui context.
End Rem
Function ImGui_ImplSDL3_InitForD3D:Int(window:TSDLWindow)
	If Not window Or Not window.windowPtr Then Return False
	Return bmx_imguisdl3_init(window.windowPtr,Null,2)
End Function

Rem
bbdoc: Initializes the current ImGui context for SDL3 with Metal rendering.
param: Window owned by the application; keep it alive until shutdown.
returns: True on success; False on failure (see SDL_GetError).
about: Registers automatic event forwarding through SDL3System. Shut down the renderer backend before this platform backend, then destroy the ImGui context.
End Rem
Function ImGui_ImplSDL3_InitForMetal:Int(window:TSDLWindow)
	If Not window Or Not window.windowPtr Then Return False
	Return bmx_imguisdl3_init(window.windowPtr,Null,3)
End Function

Rem
bbdoc: Initializes the current ImGui context for SDL3 with SDLRenderer rendering.
param: Window owned by the application; keep it alive until shutdown.
param: SDL renderer belonging to this window.
returns: True on success; False on failure (see SDL_GetError).
about: Registers automatic event forwarding through SDL3System. Shut down the renderer backend before this platform backend, then destroy the ImGui context.
End Rem
Function ImGui_ImplSDL3_InitForSDLRenderer:Int(window:TSDLWindow, renderer:TSDLRenderer)
	If Not window Or Not window.windowPtr Then Return False
	If Not renderer Or Not renderer.IsValid() Then Return False
	Return bmx_imguisdl3_init(window.windowPtr,renderer.rendererPtr,4)
End Function

Rem
bbdoc: Initializes the current ImGui context for SDL3 with SDLGPU rendering.
param: Window owned by the application; keep it alive until shutdown.
returns: True on success; False on failure (see SDL_GetError).
about: Registers automatic event forwarding through SDL3System. Shut down the renderer backend before this platform backend, then destroy the ImGui context.
End Rem
Function ImGui_ImplSDL3_InitForSDLGPU:Int(window:TSDLWindow)
	If Not window Or Not window.windowPtr Then Return False
	Return bmx_imguisdl3_init(window.windowPtr,Null,5)
End Function

Rem
bbdoc: Initializes the current ImGui context for SDL3 with Other rendering.
param: Window owned by the application; keep it alive until shutdown.
returns: True on success; False on failure (see SDL_GetError).
about: Registers automatic event forwarding through SDL3System. Shut down the renderer backend before this platform backend, then destroy the ImGui context.
End Rem
Function ImGui_ImplSDL3_InitForOther:Int(window:TSDLWindow)
	If Not window Or Not window.windowPtr Then Return False
	Return bmx_imguisdl3_init(window.windowPtr,Null,6)
End Function

Rem
bbdoc: Removes event forwarding and shuts down the current context's SDL3 platform backend.
End Rem
Function ImGui_ImplSDL3_Shutdown()
	bmx_imguisdl3_shutdown()
End Function

Rem
bbdoc: Updates window and input information before ImGui_NewFrame.
End Rem
Function ImGui_ImplSDL3_NewFrame()
	_ImGui_ImplSDL3_NewFrame()
End Function

Rem
bbdoc: Forwards an SDL event to the current ImGui context.
param: Borrowed SDL_Event pointer, valid for the duration of this call.
returns: True if ImGui recognized the event; this does not mean it requests input capture.
about: SDL3System forwards events automatically after initialization. Do not forward those same events a second time. The automatic observer suppresses BlitzMax input translation when ImGui requests capture.
End Rem
Function ImGui_ImplSDL3_ProcessEvent:Int(event:Byte Ptr)
	If Not event Then Return False
	Return bmx_imguisdl3_process(event)
End Function

Rem
bbdoc: Selects automatic or caller-managed gamepads for the current context.
End Rem
Enum EImGuiSDL3GamepadMode
	AutoFirst=0
	AutoAll=1
	Manual=2
End Enum

Rem
bbdoc: Controls whether SDL captures mouse motion outside the window during dragging.
End Rem
Enum EImGuiSDL3MouseCaptureMode
	Enabled=0
	EnabledAfterDrag=1
	Disabled=2
End Enum

Rem
bbdoc: Selects which gamepads feed ImGui navigation.
param: Automatic first/all selection, or manual ownership.
param: SDL_Gamepad pointer array for Manual mode; the caller owns the gamepads.
param: Number of pointers in the manual array; zero clears the manual selection.
End Rem
Function ImGui_ImplSDL3_SetGamepadMode(mode:EImGuiSDL3GamepadMode, gamepads:Byte Ptr Ptr=Null, count:Int=0)
	If count<0 Or (count>0 And Not gamepads) Then Throw "Invalid ImGui gamepad array"
	_ImGui_ImplSDL3_SetGamepadMode(Int(mode),gamepads,count)
End Function

Rem
bbdoc: Sets the SDL mouse-capture policy, useful when debugging under X11.
param: Desired capture policy.
End Rem
Function ImGui_ImplSDL3_SetMouseCaptureMode(mode:EImGuiSDL3MouseCaptureMode)
	_ImGui_ImplSDL3_SetMouseCaptureMode(Int(mode))
End Function

Private
Extern "C"
	Function bmx_imguisdl3_init:Int(window:Byte Ptr,extra:Byte Ptr,mode:Int)
	Function bmx_imguisdl3_shutdown()
	Function bmx_imguisdl3_process:Int(event:Byte Ptr)
	Function _ImGui_ImplSDL3_NewFrame()="cImGui_ImplSDL3_NewFrame"
	Function _ImGui_ImplSDL3_SetGamepadMode(mode:Int,gamepads:Byte Ptr Ptr,count:Int)="cImGui_ImplSDL3_SetGamepadModeEx"
	Function _ImGui_ImplSDL3_SetMouseCaptureMode(mode:Int)="cImGui_ImplSDL3_SetMouseCaptureMode"
End Extern
