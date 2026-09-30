SuperStrict
Framework Max2D.SDL3GPUMax2D
Import ImGui.ImGuiSDL3GPUMax2D
Import BRL.StandardIO

Function Check(ok:Int,message:String)
	If Not ok Then Throw message
End Function
Graphics 320,240
Local context:TSDLGPUMax2DContext=TSDLGPUMax2DContext(TMax2DGraphics.Current().context)
For Local cycle:Int=0 Until 2
	ImGui_CreateContext()
	ImGui_GetIO().SetIniFilename(Null)
	Local overlay:TImGuiSDL3GPUOverlay=TImGuiSDL3GPUOverlay.Create()
	Check(overlay<>Null,"GPU overlay initializes")
	SetClsColor(12,24,36)
	Cls()
	overlay.NewFrame()
	ImGui_NewFrame()
	ImGui_SetNextWindowPos(New SImVec2(10,10),EImGuiCond._Always)
	ImGui_SetNextWindowSize(New SImVec2(150,100),EImGuiCond._Always)
	ImGui_Begin("GPU test",Null,EImGuiWindowFlags._None)
	ImGui_Text("Native GPU overlay")
	ImGui_End()
	ImGui_Render()
	Local target:TRenderImage=CreateRenderImage(32,32)
	SetRenderImage(target)
	Local rejected:Int
	Try
		overlay.Render(ImGui_GetDrawData())
	Catch error:Object
		rejected=True
	End Try
	Check(rejected,"Window overlay rejects texture targets")
	SetRenderImage(Null)
	overlay.Render(ImGui_GetDrawData())
	' Drawing after the external pass must retain Max2D's pipeline and view state.
	SetColor(0,255,0)
	DrawRect(280,200,20,20)
	Local pixels:TPixmap=context.Read(Null,0,0,NativeResolutionWidth(),NativeResolutionHeight())
	Local sx:Float=Float(pixels.width)/320
	Local sy:Float=Float(pixels.height)/240
	Check((pixels.ReadPixel(Int(290*sx),Int(210*sy)) & $ffffff)=$00ff00,"Drawing after overlay")
	Check((pixels.ReadPixel(Int(250*sx),Int(180*sy)) & $ffffff)=$0c1824,"Overlay preserves background")
	Flip()
	overlay.Shutdown()
	overlay.Shutdown()
	ImGui_DestroyContext()
	target.ReleaseFrames()
Next
EndGraphics()
Print "SDL3 GPU overlay ordering and lifecycle tests passed"
