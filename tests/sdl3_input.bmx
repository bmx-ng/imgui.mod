SuperStrict
Framework Max2D.SDL3RenderMax2D
Import ImGui.ImGuiSDL3Renderer
Import BRL.StandardIO
Import "sdl3_input.c"
Import "../imgui.mod/imgui/*.h"

Extern "C"
	Function imgui_test_capture(keyboard:Int,mouse:Int)
	Function imgui_test_key(window:Byte Ptr,down:Int)
	Function imgui_test_mouse(window:Byte Ptr,down:Int)
	Function imgui_test_text(window:Byte Ptr)
	Function imgui_test_characters:Int()
End Extern
Function Check(ok:Int,message:String)
	If Not ok Then Throw message
End Function

Graphics 640,360
Local context:TSDLRenderContext=TSDLRenderContext(TMax2DGraphics.Current().context)
Local renderer:TSDLRenderer=context.renderer
Local window:TSDLWindow=TSDLGraphics(context.graphics)._context.window
For Local cycle:Int=0 Until 2
	ImGui_CreateContext()
	ImGui_GetIO().SetIniFilename(Null)
	' Process this synthetic sequence together rather than distributing presses over frames.
	ImGui_GetIO().SetConfigInputTrickleEventQueue(False)
	Check(ImGui_ImplSDL3_InitForSDLRenderer(window,renderer),"Platform initialization")
	Check(Not ImGui_ImplSDL3_InitForSDLRenderer(window,renderer),"Duplicate initialization rejected")
	Check(ImGui_ImplSDLRenderer3_Init(renderer),"Renderer initialization")
	imgui_test_capture(False,False)
	imgui_test_key(window.windowPtr,True)
	Check(KeyDown(KEY_A),"Uncaptured key reaches BlitzMax")
	imgui_test_capture(True,True)
	imgui_test_key(window.windowPtr,False)
	Check(Not KeyDown(KEY_A),"Key release survives capture transition")
	FlushKeys()
	imgui_test_key(window.windowPtr,True)
	Check(Not KeyDown(KEY_A),"Captured key suppressed")
	imgui_test_key(window.windowPtr,False)
	imgui_test_capture(False,False)
	imgui_test_mouse(window.windowPtr,True)
	Check(MouseDown(1),"Uncaptured mouse reaches BlitzMax")
	imgui_test_capture(True,True)
	imgui_test_mouse(window.windowPtr,False)
	Check(Not MouseDown(1),"Mouse release survives capture transition")
	imgui_test_mouse(window.windowPtr,True)
	Check(Not MouseDown(1),"Captured mouse suppressed")
	imgui_test_mouse(window.windowPtr,False)
	imgui_test_text(window.windowPtr)
	PollSystem()
	ImGui_ImplSDLRenderer3_NewFrame()
	ImGui_ImplSDL3_NewFrame()
	ImGui_NewFrame()
	Check(imgui_test_characters()=5,"UTF-8 text forwarded exactly once")
	ImGui_Render()
	ImGui_ImplSDLRenderer3_RenderDrawData(ImGui_GetDrawData(),renderer)
	Flip()
	ImGui_ImplSDLRenderer3_Shutdown()
	ImGui_ImplSDL3_Shutdown()
	ImGui_ImplSDL3_Shutdown()
	ImGui_DestroyContext()
	imgui_test_key(window.windowPtr,True)
	Check(KeyDown(KEY_A),"No stale observer after destruction")
	imgui_test_key(window.windowPtr,False)
	Check(Not KeyDown(KEY_A),"Final release")
Next
EndGraphics()
Print "SDL3 ImGui input and lifecycle tests passed"
