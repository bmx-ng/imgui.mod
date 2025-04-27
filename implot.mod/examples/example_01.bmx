SuperStrict

Framework BRL.StandardIO
Import ImGui.ImPlot
import ImGui.ImGuiSDL2Renderer
import SDL.sdlrendermax2d

Graphics 1424, 768

ImGui_CreateContext()
ImPlot_CreateContext()

' Setup Dear ImGui style
ImGui_StyleColorsDark()

Local renderer:TSDLRenderer = SDLRenderMax2DDriver().GetRenderer()
Local window:TSDLWindow = SDLRenderMax2DDriver().GetWindow()

ImGui_ImplSDL2_InitForSDLRenderer(window, renderer)
ImGui_ImplSDLRenderer2_Init(renderer)

Local show_demo_window:Int = True
Local show_plot_window:Int = True


While Not KeyHit(KEY_ESCAPE)

	Cls

	ImGui_ImplSDLRenderer2_NewFrame()
	ImGui_ImplSDL2_NewFrame()
	ImGui_NewFrame()

	If show_plot_window Then
		ImPlot_ShowDemoWindow(show_plot_window)
	End If

	If show_demo_window Then
		ImGui_ShowDemoWindow(show_demo_window)
	End If

	ImGui_Render()

	ImGui_ImplSDLRenderer2_RenderDrawData(ImGui_GetDrawData(), renderer)

	Flip
Wend

