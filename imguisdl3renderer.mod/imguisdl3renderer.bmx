SuperStrict

Rem
bbdoc: Dear ImGui rendering through SDL3 SDL_Renderer.
End Rem
Module ImGui.ImGuiSDL3Renderer

ModuleInfo "Version: 1.00"
ModuleInfo "License: MIT"
ModuleInfo "CPP_OPTS: -std=c++11"
ModuleInfo "CC_OPTS: -I%PWD%/../../sdl3.mod/sdl3.mod/SDL3/include"

Import ImGui.ImGuiSDL3
Import BRL.Pixmap
Import "../imgui.mod/imgui/*.h"
Import "../imgui.mod/imgui/backends/*.h"
Import "../imgui.mod/db_generated/*.h"
Import "../imgui.mod/db_generated/backends/*.h"
Import "../imgui.mod/imgui/backends/imgui_impl_sdlrenderer3.cpp"
Import "../imgui.mod/db_generated/backends/dcimgui_impl_sdlrenderer3.cpp"
Import "glue.c"

Rem
bbdoc: Initializes ImGui rendering on an existing SDL3 renderer.
param: Application-owned renderer; shut down this backend before destroying it.
returns: True on success.
End Rem
Function ImGui_ImplSDLRenderer3_Init:Int(renderer:TSDLRenderer)
	If Not renderer Or Not renderer.IsValid() Then Return False
	Return bmx_imguisdlrenderer3_init(renderer.rendererPtr)
End Function

Rem
bbdoc: Releases renderer resources for the current ImGui context.
End Rem
Function ImGui_ImplSDLRenderer3_Shutdown()
	_ImGui_ImplSDLRenderer3_Shutdown()
End Function

Rem
bbdoc: Prepares renderer resources before the platform backend's NewFrame.
End Rem
Function ImGui_ImplSDLRenderer3_NewFrame()
	_ImGui_ImplSDLRenderer3_NewFrame()
End Function

Rem
bbdoc: Draws ImGui into the SDL renderer's current target.
param: Draw data returned by ImGui_GetDrawData after ImGui_Render.
param: Renderer used at initialization.
about: Flush pending application drawing first. For Max2D overlays use the window target and call FlushMax2D before this function. Framebuffer scaling is applied for high-DPI windows. Renderer scale, viewport and clip state are restored. Multi-viewport rendering is not supported by this backend.
End Rem
Function ImGui_ImplSDLRenderer3_RenderDrawData(data:TImDrawData,renderer:TSDLRenderer)
	If Not data Or Not renderer Or Not renderer.IsValid() Then Return
	_ImGui_ImplSDLRenderer3_RenderDrawData(data.handle,renderer.rendererPtr)
End Function

Private
Extern "C"
	Function bmx_imguisdlrenderer3_init:Int(renderer:Byte Ptr)
	Function _ImGui_ImplSDLRenderer3_Shutdown()="cImGui_ImplSDLRenderer3_Shutdown"
	Function _ImGui_ImplSDLRenderer3_NewFrame()="cImGui_ImplSDLRenderer3_NewFrame"
	Function _ImGui_ImplSDLRenderer3_RenderDrawData(data:Byte Ptr,renderer:Byte Ptr)="bmx_imguisdlrenderer3_draw"
	Function bmx_imguisdlrenderer3_texture:Byte Ptr(renderer:Byte Ptr,pixels:Byte Ptr,width:Int,height:Int,pitch:Int)
End Extern

Public
Rem
bbdoc: An SDL3 texture resource used by the ImGui image cache.
about: Destroy owned resources before their renderer. The cache controls ownership of registered external textures.
End Rem
Type TSDL3RenderImGuiImageResource Extends TImGuiImageResource
	Rem
	bbdoc: SDL texture used as the ImGui texture identifier.
	End Rem
	Field texture:TSDLTexture
	Rem
	bbdoc: Texture width in pixels.
	End Rem
	Field width:Int
	Rem
	bbdoc: Texture height in pixels.
	End Rem
	Field height:Int

	Rem
	bbdoc: Returns the live SDL texture identifier, or zero after destruction.
	End Rem
	Method GetImTextureID:ULong() Override
		If texture = Null Or Not texture.IsValid() Then
			Return 0
		End If
		Return ULong(texture.texturePtr)
	End Method

	Rem
	bbdoc: Returns the texture width in pixels.
	End Rem
	Method GetWidth:Int() Override
		Return width
	End Method

	Rem
	bbdoc: Returns the texture height in pixels.
	End Rem
	Method GetHeight:Int() Override
		Return height
	End Method

	Rem
	bbdoc: Destroys the texture; repeated calls are harmless.
	End Rem
	Method Destroy() Override
		If texture Then
			texture.Destroy()
			texture = Null
		End If
	End Method
End Type

Rem
bbdoc: An SDL3 renderer backend for ImGui image resources, managing textures created from SDL surfaces or pixmaps.
End Rem
Type TSDL3RenderImGuiImageBackend Extends TImGuiImageBackend
	Rem
	bbdoc: Renderer that owns textures created by this backend.
	End Rem
	Field renderer:TSDLRenderer

	Rem
	bbdoc: Selects the renderer used for image uploads.
	param: Live renderer used by ImGui.
	End Rem
	Method New(renderer:TSDLRenderer)
		If renderer = Null Then
			Throw "TSDL3RenderImGuiImageBackend requires a renderer"
		End If

		Self.renderer = renderer
	End Method

	Rem
	bbdoc: Returns an unchanged image-cache key.
	param: Source key.
	End Rem
	Method NormalizeKey:String(key:String) Override
		Return key
	End Method

	Rem
	bbdoc: Converts a pixmap to RGBA32 and creates an owned texture resource.
	param: Source pixmap; its storage is not retained.
	param: Optional source description.
	End Rem
	Method CreateResourceFromPixmap:TImGuiImageResource(pixmap:TPixmap, sourceName:String = "") Override
		If pixmap = Null Then
			Return Null
		End If

		Local texture:TSDLTexture = CreateTextureFromPixmap(pixmap)
		If texture = Null Then
			Return Null
		End If

		Local resource:TSDL3RenderImGuiImageResource = New TSDL3RenderImGuiImageResource
		resource.texture = texture
		resource.width = pixmap.width
		resource.height = pixmap.height
		Return resource
	End Method

	Rem
	bbdoc: Uploads a pixmap to a newly owned SDL3 texture.
	param: Source pixmap; converted to RGBA32 before upload.
	returns: New texture, or Null on failure.
	End Rem
	Method CreateTextureFromPixmap:TSDLTexture(pixmap:TPixmap)
		If pixmap = Null Then
			Return Null
		End If

		If Not renderer.IsValid() Then Return Null
		Local rgba:TPixmap=ConvertPixmap(pixmap,PF_RGBA8888)
		Local ptr:Byte Ptr=bmx_imguisdlrenderer3_texture(renderer.rendererPtr,rgba.pixels,rgba.width,rgba.height,rgba.pitch)
		If Not ptr Then Return Null
		Local texture:TSDLTexture=New TSDLTexture
		texture.texturePtr=ptr
		texture._renderer=renderer
		Return texture
	End Method

	Rem
	bbdoc: Wraps a texture without copying it.
	param: Texture on this backend’s renderer.
	param: Width in pixels, or zero to query the texture.
	param: Height in pixels, or zero to query the texture.
	End Rem
	Method CreateResourceFromTexture:TSDL3RenderImGuiImageResource(texture:TSDLTexture, width:Int = 0, height:Int = 0)
		If texture = Null Or Not texture.IsValid() Or texture._renderer<>renderer Then
			Return Null
		End If

		If width <= 0 Or height <= 0 Then
			Local w:Float,h:Float
			If Not texture.GetSize(w,h) Then Return Null
			width=Int(w)
			height=Int(h)
			If width<=0 Or height<=0 Then Return Null
		End If

		Local resource:TSDL3RenderImGuiImageResource = New TSDL3RenderImGuiImageResource
		resource.texture = texture
		resource.width = width
		resource.height = height

		Return resource
	End Method

	Rem
	bbdoc: Registers an external texture with explicit ownership.
	param: Destination image cache.
	param: Lookup key.
	param: Texture belonging to this backend’s renderer.
	param: Width, or zero to query.
	param: Height, or zero to query.
	param: True transfers release responsibility to the cache; False keeps caller ownership.
	param: Optional source description.
	End Rem
	Method RegisterExternalTexture:TImGuiImageEntry(cache:TImGuiImageCache, key:String, texture:TSDLTexture, width:Int = 0, height:Int = 0, owned:Int = False, sourceName:String = "")
		If Not cache Then Return Null
		Local resource:TSDL3RenderImGuiImageResource = CreateResourceFromTexture(texture, width, height)
		If resource = Null Then
			Return Null
		End If

		Return cache.RegisterResource(key, resource, owned, EImGuiImageSource.ExternalTexture, sourceName)
	End Method

	Rem
	bbdoc: Uploads and registers an owned pixmap texture.
	param: Destination image cache.
	param: Lookup key.
	param: Source pixmap.
	param: Width, or zero to query.
	param: Height, or zero to query.
	param: Optional source description.
	End Rem
	Method RegisterExternalTexture:TImGuiImageEntry(cache:TImGuiImageCache, key:String, pixmap:TPixmap, width:Int = 0, height:Int = 0, sourceName:String = "")
		If Not cache Then Return Null
		Local texture:TSDLTexture = CreateTextureFromPixmap(pixmap)
		If texture = Null Then
			Return Null
		End If
		Return RegisterExternalTexture(cache, key, texture, width, height, True, sourceName)
	End Method

End Type
