SuperStrict

Framework BRL.StandardIO
Import ImGui.ImGui
import ImGui.ImGuiSDL2Renderer
import SDL.sdlrendermax2d
import ImGui.ImGuiSDL2

Graphics 1424, 768

ImGui_CreateContext()

' Setup Dear ImGui style
ImGui_StyleColorsDark()

Local renderer:TSDLRenderer = SDLRenderMax2DDriver().GetRenderer()
Local window:TSDLWindow = SDLRenderMax2DDriver().GetWindow()

ImGui_ImplSDL2_InitForSDLRenderer(window, renderer)
ImGui_ImplSDLRenderer2_Init(renderer)

Local show_demo_window:Int = True
Local show_simple_window:Int = True

Local text:String = "Hello, world!"

While Not KeyHit(KEY_ESCAPE)

	Cls

	ImGui_ImplSDLRenderer2_NewFrame()
	ImGui_ImplSDL2_NewFrame()
	ImGui_NewFrame()

	' 2. Show a simple window that we create ourselves. We use a Begin/End pair to created a named window.
	'    Begin/End are a fixed way to create a window.
	If show_simple_window
		ImGui_Begin("Hello, world!", show_simple_window, EImGuiWindowFlags._None) ' Create a window called "Hello, world!" and append into it.

		ImGui_Text("This is some useful text.") ' Display some text (you can use a format strings too)
		ImGui_Checkbox("Demo Window", show_demo_window) ' Edit bools storing our window open/close state
		ImGui_SameLine()
		ImGui_Text("Some text")

		ImGui_Text("Hello, world!")
		ImGui_Button("Button") ' Buttons return true when clicked (most widgets return true when edited/activated)
		If ImGui_IsItemHovered(EImGuiHoveredFlags._None) Then
			ImGui_SetTooltip("I am a tooltip")
		End If
		ImGui_SameLine()
		ImGui_Text("Hover over me")

		ImGui_Text("Text input")
		If ImGui_InputText("input", text, 20, EImGuiInputTextFlags._None) Then
			' updated!
		End If

		DrawText "Input: " + text, 10, 10

		ImGui_End()
	End If

	If show_demo_window Then
		ImGui_ShowDemoWindow(show_demo_window)
	End If

	ImGui_Render()

	ImGui_ImplSDLRenderer2_RenderDrawData(ImGui_GetDrawData(), renderer)

	Flip
Wend

