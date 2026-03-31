SuperStrict

Framework BRL.StandardIO
Import ImGui.ImGui
import ImGui.ImGuiSDL2Renderer
import SDL.sdlrendermax2d
import ImGui.ImGuiSDL2

Graphics 1424, 768,,,SDL_WINDOW_ALLOW_HIGHDPI

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

Local angle:Float = 0.0
Local cx:Float = 1424 / 2
Local cy:Float = 768 / 2
Local rotating:Int = True
Local rectSize:Int = 400

While Not KeyHit(KEY_ESCAPE)

	Cls


	' rotate a rectangle around the center of the screen
	If rotating Then
		angle = (angle + 0.5) Mod 360
	End If
	
	SetRotation(angle)
	SetHandle(rectSize / 2, rectSize / 2)

	SetColor 255, 255, 0
	DrawRect(cx, cy, rectSize, rectSize)

	' reset transform
	SetOrigin(0, 0)
	SetHandle(0, 0)
	SetTransform()
	
	SetColor 0, 0, 0
	DrawText "Center", cx, cy

	SetColor 255, 255, 255

	ImGui_ImplSDLRenderer2_NewFrame()
	ImGui_ImplSDL2_NewFrame()
	ImGui_NewFrame()

	' 2. Show a simple window that we create ourselves. We use a Begin/End pair to created a named window.
	'    Begin/End are a fixed way to create a window.
	If show_simple_window
		ImGui_Begin("Hello, world!", VarPtr show_simple_window, EImGuiWindowFlags._None) ' Create a window called "Hello, world!" and append into it.

		ImGui_Text("This is some useful text.") ' Display some text (you can use a format strings too)
		ImGui_Checkbox("Demo Window", VarPtr show_demo_window) ' Edit bools storing our window open/close state

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

		ImGui_Separator()
		ImGui_Text("Box")

		ImGui_SliderInt("Size", VarPtr rectSize, 50, 600)
		If ImGui_SliderFloat("Angle", VarPtr angle, 0.0, 360.0) Then
			' snap to .5 degree increments
			angle = (Int(angle * 2) / 2.0) Mod 360
		End If
		ImGui_Checkbox("Rotate", VarPtr rotating)


		ImGui_End()
	End If

	If show_demo_window Then
		ImGui_ShowDemoWindow(VarPtr show_demo_window)
	End If

	ImGui_Render()

	ImGui_ImplSDLRenderer2_RenderDrawData(ImGui_GetDrawData(), renderer)

	Flip
Wend

