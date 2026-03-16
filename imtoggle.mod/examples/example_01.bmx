SuperStrict

Framework BRL.StandardIO
Import ImGui.ImToggle
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

Local values:Int[] = [True, True, True, True, True, True, True, True]
Local valuesPtr:Int Ptr = values

Local green_shadow:UInt = ImGui_ColorConvertFloat4ToU32(New SImVec4(0.0, 1.0, 0.0, 0.4))
Local green:UInt = ImGui_ColorConvertFloat4ToU32(New SImVec4(0.16, 0.66, 0.45, 1.0))
Local green_hover:UInt = ImGui_ColorConvertFloat4ToU32(New SImVec4(0.0, 1.0, 0.57, 1.0))

While Not KeyHit(KEY_ESCAPE)

	Cls

	ImGui_ImplSDLRenderer2_NewFrame()
	ImGui_ImplSDL2_NewFrame()
	ImGui_NewFrame()

	ImGui_Begin("Toggle Demo", show, EImGuiWindowFlags._None)

	' a default and default animated toggle
	ImGui_Toggle("Toggle", valuesPtr)
	ImGui_Toggle("Animated Toggle", valuesPtr + 1, EImGuiToggleFlags._Animated)

	' this toggle draws a simple border around its frame and knob
	ImGui_Toggle("Bordered Knob", valuesPtr + 2, EImGuiToggleFlags._Bordered, 1.0)

	' this toggle draws a simple shadow around its frame and knob
	ImGui_PushStyleColor(EImGuiCol._BorderShadow, green_shadow)
	ImGui_Toggle("Shadowed Knob", valuesPtr + 3, EImGuiToggleFlags._Shadowed, 1.0)

	' this toggle draws the shadow & and the border around its frame and knob.
	ImGui_Toggle("Bordered + Shadowed Knob", valuesPtr + 4, EImGuiToggleFlags._Bordered | EImGuiToggleFlags._Shadowed, 1.0)

	ImGui_PopStyleColor()

	' this toggle uses stack-pushed style colors to change the way it displays
	ImGui_PushStyleColor(EImGuiCol._Button, green)
	ImGui_PushStyleColor(EImGuiCol._ButtonHovered, green_hover)
	ImGui_Toggle("Green Toggle", valuesPtr + 5)
	ImGui_PopStyleColorEx(2)

	ImGui_Toggle("Toggle with A11y Labels", valuesPtr + 6, EImGuiToggleFlags._A11y)

	' this toggle shows no label
	ImGui_Toggle("##Toggle With Hidden Label", valuesPtr + 7)

	ImGui_End()

	ImGui_Render()

	ImGui_ImplSDLRenderer2_RenderDrawData(ImGui_GetDrawData(), renderer)

	Flip
Wend
