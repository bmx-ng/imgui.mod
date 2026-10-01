SuperStrict

Framework Max2D.SDL3GPUMax2D
Import ImGui.ImGuiSDL3GPUMax2D
Import BRL.PNGLoader
Import Pub.StdC

Graphics 960,540,0
ImGui_CreateContext()
ImGui_GetIO().SetIniFilename(Null)
ImGui_GetIO().SetConfigDpiScaleFonts(True)
ImGui_StyleColorsDark()
Local overlay:TImGuiSDL3GPUOverlay=TImGuiSDL3GPUOverlay.Create()
If Not overlay Then Throw SDL_GetError()

Local images:TImGuiImageBackend=New TSDLGPUImGuiImageBackend(TSDLGPUMax2DContext(TMax2DGraphics.Current().context).GetGPUDevice())
Local pixels:TPixmap=CreatePixmap(32,32,PF_RGB888)
For Local y:Int=0 Until 32
	For Local x:Int=0 Until 32
		pixels.WritePixel(x,y,$ff000000 | UInt(x*8 Shl 16) | UInt(y*8 Shl 8) | $60)
	Next
Next
Local image:TImGuiImageResource=images.CreateResourceFromPixmap(pixels)
If Not image Then Throw SDL_GetError()

SetVirtualResolution(480,270,VIRTUAL_LETTERBOX)
Local text:String="Hello SDL3"
Local angle:Float
Local rotating:Int=True
Local demo:Int=True
' Optional automated smoke run; normal launches remain interactive.
Local limit:Int=Int(getenv_("IMGUI_SMOKE_FRAMES"))
Local frame:Int
While Not KeyDown(KEY_ESCAPE) And Not AppTerminate()
	SetClsColor(24,32,48)
	Cls()
	If rotating Then angle:+0.5
	PushMax2DState()
	SetColor(70,170,230)
	SetRotation(angle)
	SetHandle(40,40)
	DrawRect(310,145,80,80)
	PopMax2DState()
	overlay.NewFrame()
	ImGui_NewFrame()
	ImGui_SetNextWindowPos(New SImVec2(20,20),EImGuiCond._FirstUseEver)
	ImGui_SetNextWindowSize(New SImVec2(360,220),EImGuiCond._FirstUseEver)
	If ImGui_Begin("SDL3 Max2D overlay",Null,EImGuiWindowFlags._None)
		ImGui_Text("Native UI over a virtual-resolution scene")
		ImGui_InputText("Text",text,256,EImGuiInputTextFlags._None)
		ImGui_Image(New SImTextureRef(image.GetImTextureID()),New SImVec2(48,48))
		ImGui_Checkbox("Rotate scene",Varptr rotating)
		ImGui_Checkbox("ImGui demo",Varptr demo)
		ImGui_Text("Resize the window or drag this panel.")
	End If
	ImGui_End()
	If demo
		ImGui_SetNextWindowPos(New SImVec2(410,20),EImGuiCond._FirstUseEver)
		ImGui_SetNextWindowSize(New SImVec2(510,490),EImGuiCond._FirstUseEver)
		ImGui_ShowDemoWindow(Varptr demo)
	End If
	ImGui_Render()
	overlay.Render(ImGui_GetDrawData())
	frame:+1
	If limit And frame=limit
		Local path:String=getenv_("IMGUI_CAPTURE")
		If path Then SavePixmapPNG(TMax2DGraphics.Current().context.Read(Null,0,0,NativeResolutionWidth(),NativeResolutionHeight()),path)
	End If
	Flip()
	If limit And frame>=limit Then Exit
Wend
image.Destroy()
overlay.Shutdown()
ImGui_DestroyContext()
EndGraphics()
