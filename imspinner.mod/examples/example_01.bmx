SuperStrict

Framework BRL.StandardIO
Import ImGui.ImSpinner
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

Local show:Int = True

Local red:UInt = ImGui_ColorConvertFloat4ToU32(New SImVec4(1.0, 0.0, 0.0, 1.0))
Local blue:UInt = ImGui_ColorConvertFloat4ToU32(New SImVec4(0.0, 0.0, 1.0, 1.0))

While Not KeyHit(KEY_ESCAPE)

	Cls

	ImGui_ImplSDLRenderer2_NewFrame()
	ImGui_ImplSDL2_NewFrame()
	ImGui_NewFrame()

	ImGui_Begin("Spinner Demo", show, EImGuiWindowFlags._None)

	ImSpinner_DnaDots("DnaDotV", 16, 2, red, 1.2, 8, 0.25, true)
	ImGui_SameLine()
	ImSpinner_RainbowMix("Rmix", 16, 2, blue, 4)
	ImGui_SameLine()
	ImSpinner_Ang8("Ang", 16, 2)
	ImGui_SameLine()
	ImSpinner_Pulsar("Pulsar", 16, 2)
	ImGui_SameLine()
	ImSpinner_Clock("Clock", 16, 2)
	ImGui_SameLine()
	ImSpinner_Atom("atom", 16, 2)
	ImGui_SameLine()
	ImSpinner_SwingDots("wheel", 16, 6)
	ImGui_SameLine()
	ImSpinner_DotsToBar("tobar", 16, 2, 0.5)
	ImGui_SameLine()
	ImSpinner_BarChartRainbow("rainbow", 16, 4, red, 4)

	ImGui_End()

	ImGui_Render()

	ImGui_ImplSDLRenderer2_RenderDrawData(ImGui_GetDrawData(), renderer)

	Flip
Wend
