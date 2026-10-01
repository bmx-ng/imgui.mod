SuperStrict

Framework ImGui.ImGuiSDL3Renderer
Import BRL.EventQueue
Import BRL.KeyCodes

Local window:TSDLWindow=TSDLWindow.Create("ImGui SDL3 renderer",960,540,SDL_WINDOW_RESIZABLE | SDL_WINDOW_HIGH_PIXEL_DENSITY)
If Not window Then Throw SDL_GetError()
Local renderer:TSDLRenderer=TSDLRenderer.Create(window)
If Not renderer Then Throw SDL_GetError()
renderer.SetVSync(1)

ImGui_CreateContext()
ImGui_GetIO().SetIniFilename(Null)
ImGui_GetIO().SetConfigDpiScaleFonts(True)
ImGui_StyleColorsDark()
If Not ImGui_ImplSDL3_InitForSDLRenderer(window,renderer) Then Throw SDL_GetError()
If Not ImGui_ImplSDLRenderer3_Init(renderer) Then Throw SDL_GetError()

Local running:Int=True
Local demo:Int=True
While running
	' Raw SDL windows use event queues; Graphics() is not used here.
	While PollEvent()
		Select EventID()
			Case EVENT_APPTERMINATE
				running=False
			Case EVENT_WINDOWCLOSE
				If UInt(EventData())=window.GetID() Then running=False
			Case EVENT_KEYDOWN
				If EventData()=KEY_ESCAPE Then running=False
		End Select
	Wend
	If Not running Then Exit

	ImGui_ImplSDLRenderer3_NewFrame()
	ImGui_ImplSDL3_NewFrame()
	ImGui_NewFrame()
	ImGui_ShowDemoWindow(Varptr demo)
	ImGui_Render()
	renderer.SetDrawColor(24,32,48)
	renderer.Clear()
	ImGui_ImplSDLRenderer3_RenderDrawData(ImGui_GetDrawData(),renderer)
	renderer.Present()
Wend

ImGui_ImplSDLRenderer3_Shutdown()
ImGui_ImplSDL3_Shutdown()
ImGui_DestroyContext()
renderer.Destroy()
window.Destroy()
