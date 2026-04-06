SuperStrict

Rem
bbdoc: The SDL2 renderer backend for ImGui.
End Rem
Module ImGui.ImGuiSDL2Renderer

ModuleInfo "CPP_OPTS: -std=c++11"
ModuleInfo "C_OPTS: -std=c99"

Import ImGui.ImGuiSDL2
Import SDL.SDLRender

Import "../../sdl.mod/sdl.mod/SDL/include/*.h"
Import "../imgui.mod/imgui/*.h"
Import "../imgui.mod/imgui/backends/*.h"
Import "../imgui.mod/db_generated/*.h"
Import "../imgui.mod/imgui/backends/imgui_impl_sdlrenderer2.cpp"
Import "../imgui.mod/db_generated/backends/dcimgui_impl_sdlrenderer2.cpp"


Rem
bbdoc: Initializes the SDL2 renderer for ImGui.
End Rem
Function ImGui_ImplSDLRenderer2_Init:Int(renderer:TSDLRenderer)
	Return _ImGui_ImplSDLRenderer2_Init(renderer.rendererPtr)
End Function

Rem
bbdoc: Shuts down the SDL2 renderer for ImGui.
End Rem
Function ImGui_ImplSDLRenderer2_Shutdown()
	_ImGui_ImplSDLRenderer2_Shutdown()
End Function

Rem
bbdoc: Starts a new frame for the SDL2 renderer for ImGui.
End Rem
Function ImGui_ImplSDLRenderer2_NewFrame()
	_ImGui_ImplSDLRenderer2_NewFrame()
End Function

Rem
bbdoc: Renders the draw data for the SDL2 renderer for ImGui.
End Rem
Function ImGui_ImplSDLRenderer2_RenderDrawData(draw_data:TImDrawData, renderer:TSDLRenderer)
	_ImGui_ImplSDLRenderer2_RenderDrawData(draw_data.handle, renderer.rendererPtr)
End Function

Private
Extern
	Function _ImGui_ImplSDLRenderer2_Init:Int(renderer:Byte Ptr) = "cImGui_ImplSDLRenderer2_Init"
	Function _ImGui_ImplSDLRenderer2_Shutdown() = "cImGui_ImplSDLRenderer2_Shutdown"
	Function _ImGui_ImplSDLRenderer2_NewFrame() = "cImGui_ImplSDLRenderer2_NewFrame"
	Function _ImGui_ImplSDLRenderer2_RenderDrawData(draw_data:Byte Ptr, renderer:Byte Ptr) = "cImGui_ImplSDLRenderer2_RenderDrawData"
End Extern

Public
Type TSDL2RenderImGuiImageResource Extends TImGuiImageResource
	Field texture:TSDLTexture
	Field width:Int
	Field height:Int

	Method GetImTextureID:ULong() Override
		If texture = Null Then
			Return 0
		End If
		Return ULong(texture.texturePtr)
	End Method

	Method GetWidth:Int() Override
		Return width
	End Method

	Method GetHeight:Int() Override
		Return height
	End Method

	Method Destroy() Override
		If texture Then
			texture.Destroy()
			texture = Null
		End If
	End Method
End Type

Rem
bbdoc: An SDL2 renderer backend for ImGui image resources, managing textures created from SDL surfaces or pixmaps.
End Rem
Type TSDL2RenderImGuiImageBackend Extends TImGuiImageBackend
	Field renderer:TSDLRenderer

	Method New(renderer:TSDLRenderer)
		If renderer = Null Then
			Throw "TSDL2RenderImGuiImageBackend requires a renderer"
		End If

		Self.renderer = renderer
	End Method

	Method NormalizeKey:String(key:String) Override
		Return key
	End Method

	Method CreateResourceFromPixmap:TImGuiImageResource(pixmap:TPixmap, sourceName:String = "") Override
		If pixmap = Null Then
			Return Null
		End If

		Local texture:TSDLTexture = CreateTextureFromPixmap(pixmap)
		If texture = Null Then
			Return Null
		End If

		Local resource:TSDL2RenderImGuiImageResource = New TSDL2RenderImGuiImageResource
		resource.texture = texture
		resource.width = pixmap.width
		resource.height = pixmap.height
		Return resource
	End Method

	Method CreateTextureFromPixmap:TSDLTexture(pixmap:TPixmap)
		If pixmap = Null Then
			Return Null
		End If

		Local surface:TSDLSurface = TSDLSurface.CreateRGBFrom(pixmap.pixels, pixmap.width, pixmap.height, BitsPerPixel[pixmap.format], pixmap.pitch, $000000ff:UInt, $0000ff00:UInt, $00ff0000:UInt, $ff000000:UInt)

		If surface = Null Then
			Return Null
		End If

		Local texture:TSDLTexture = renderer.CreateTextureFromSurface(surface)

		surface.Free()
		Return texture
	End Method

	Method CreateResourceFromTexture:TSDL2RenderImGuiImageResource(texture:TSDLTexture, width:Int = 0, height:Int = 0)
		If texture = Null Then
			Return Null
		End If

		If width <= 0 Or height <= 0 Then
			Local fmt:UInt
			Local access:Int
			If texture.Query(fmt, access, width, height) Then
				If width <= 0 Or height <= 0 Then
					Return Null
				End If
			Else
				Return Null
			End If
		End If

		Local resource:TSDL2RenderImGuiImageResource = New TSDL2RenderImGuiImageResource
		resource.texture = texture
		resource.width = width
		resource.height = height

		Return resource
	End Method

	Method RegisterExternalTexture:TImGuiImageEntry(cache:TImGuiImageCache, key:String, texture:TSDLTexture, width:Int = 0, height:Int = 0, owned:Int = False, sourceName:String = "")
		Local resource:TSDL2RenderImGuiImageResource = CreateResourceFromTexture(texture, width, height)
		If resource = Null Then
			Return Null
		End If

		Return cache.RegisterResource(key, resource, owned, EImGuiImageSource.ExternalTexture, sourceName)
	End Method

	Method RegisterExternalTexture:TImGuiImageEntry(cache:TImGuiImageCache, key:String, pixmap:TPixmap, width:Int = 0, height:Int = 0, owned:Int = False, sourceName:String = "")
		Local texture:TSDLTexture = CreateTextureFromPixmap(pixmap)
		If texture = Null Then
			Return Null
		End If
		Return RegisterExternalTexture(cache, key, texture, width, height, owned, sourceName)
	End Method

End Type
