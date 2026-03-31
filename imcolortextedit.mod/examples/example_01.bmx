SuperStrict

Framework BRL.StandardIO
Import ImGui.ImColorTextEdit
import ImGui.ImGuiSDL2Renderer
import SDL.sdlrendermax2d

Graphics 1424, 768

ImGui_CreateContext()

' Setup Dear ImGui style
ImGui_StyleColorsDark()

Local renderer:TSDLRenderer = SDLRenderMax2DDriver().GetRenderer()
Local window:TSDLWindow = SDLRenderMax2DDriver().GetWindow()

ImGui_ImplSDL2_InitForSDLRenderer(window, renderer)
ImGui_ImplSDLRenderer2_Init(renderer)

'Local show:Int = True

Local editor:TImTextEditor = New TImTextEditor

While Not KeyHit(KEY_ESCAPE)

	Cls

	ImGui_ImplSDLRenderer2_NewFrame()
	ImGui_ImplSDL2_NewFrame()
	ImGui_NewFrame()

	ImGui_Begin("Text Editor Demo", Null, EImGuiWindowFlags._None)

	editor.Render("Text Editor")

	ImGui_End()

	ImGui_Render()

	ImGui_ImplSDLRenderer2_RenderDrawData(ImGui_GetDrawData(), renderer)

	Flip
Wend
