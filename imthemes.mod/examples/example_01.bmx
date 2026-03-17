SuperStrict

Framework BRL.StandardIO
Import ImGui.ImThemes
import ImGui.ImGuiSDL2Renderer
import SDL.sdlrendermax2d

Graphics 1424, 768

ImGui_CreateContext()


ImGui_ApplyTheme(EImGuiTheme._ImGuiColorsClassic)

Local renderer:TSDLRenderer = SDLRenderMax2DDriver().GetRenderer()
Local window:TSDLWindow = SDLRenderMax2DDriver().GetWindow()

ImGui_ImplSDL2_InitForSDLRenderer(window, renderer)
ImGui_ImplSDLRenderer2_Init(renderer)

Local show_demo_window:Int = True
Local show:Int = True

Local red:UInt = ImGui_ColorConvertFloat4ToU32(New SImVec4(1.0, 0.0, 0.0, 1.0))
Local blue:UInt = ImGui_ColorConvertFloat4ToU32(New SImVec4(0.0, 0.0, 1.0, 1.0))

Local current:EImGuiTheme = EImGuiTheme._ImGuiColorsClassic

Local themes:EImGuiTheme[] = EImGuiTheme.Values()


While Not KeyHit(KEY_ESCAPE)

	Cls

	ImGui_ImplSDLRenderer2_NewFrame()
	ImGui_ImplSDL2_NewFrame()
	ImGui_NewFrame()

	ImGui_Begin("Themes Demo", show, EImGuiWindowFlags._None)

	' listbox for theme selection
	If ImGui_BeginCombo("Theme", ImGui_ThemeName(current), EImGuiComboFlags._None)
		For Local theme:EImGuiTheme = Eachin themes
			Local is_selected:Int = current = theme
			If ImGui_SelectableBoolPtr(ImGui_ThemeName(theme), is_selected, EImGuiSelectableFlags._None)
				current = theme
				ImGui_ApplyTheme(current)
			End If
		Next
		ImGui_EndCombo()
	End If

	If show_demo_window Then
		ImGui_ShowDemoWindow(show_demo_window)
	End If

	ImGui_End()

	ImGui_Render()

	ImGui_ImplSDLRenderer2_RenderDrawData(ImGui_GetDrawData(), renderer)

	Flip
Wend
