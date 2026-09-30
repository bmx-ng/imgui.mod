SuperStrict

Rem
bbdoc: Dear ImGui rendering through SDL3 GPU devices and render passes.
End Rem
Module ImGui.ImGuiSDL3GPU

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
Import "../imgui.mod/imgui/backends/imgui_impl_sdlgpu3.cpp"
Import "../imgui.mod/db_generated/backends/dcimgui_impl_sdlgpu3.cpp"
Import "glue.c"

Rem
bbdoc: Initializes ImGui rendering on an application-owned SDL_GPUDevice.
param: Borrowed SDL_GPUDevice pointer; keep it alive until shutdown.
param: SDL_GPUTextureFormat of the render target.
param: SDL_GPUSampleCount enum value; zero means one sample.
param: SDL_GPUSwapchainComposition for secondary viewports; zero means SDR.
param: SDL_GPUPresentMode for secondary viewports; zero means VSync.
returns: True on success.
about: Call the SDL3 platform InitForSDLGPU first. This low-level module does not create or own a GPU device.
End Rem
Function ImGui_ImplSDLGPU3_Init:Int(device:Byte Ptr, format:Int, samples:Int=0, composition:Int=0, presentMode:Int=0)
	If Not device Then Return False
	Return bmx_imguisdlgpu3_init(device,format,samples,composition,presentMode)
End Function

Rem
bbdoc: Releases the current context's ImGui GPU resources before its device is destroyed.
End Rem
Function ImGui_ImplSDLGPU3_Shutdown()
	_ImGui_ImplSDLGPU3_Shutdown()
End Function

Rem
bbdoc: Prepares ImGui GPU resources before the platform backend's NewFrame.
End Rem
Function ImGui_ImplSDLGPU3_NewFrame()
	_ImGui_ImplSDLGPU3_NewFrame()
End Function

Rem
bbdoc: Uploads ImGui geometry before beginning the render pass that draws it.
param: Draw data returned after ImGui_Render.
param: SDL_GPUCommandBuffer on the initialization device, outside a render pass.
about: Required before RenderDrawData. The application retains ownership of the command buffer.
End Rem
Function ImGui_ImplSDLGPU3_PrepareDrawData(data:TImDrawData,commandBuffer:Byte Ptr)
	_ImGui_ImplSDLGPU3_PrepareDrawData(data.handle,commandBuffer)
End Function

Rem
bbdoc: Records ImGui drawing into an existing SDL GPU render pass.
param: Draw data already prepared on this command buffer.
param: SDL_GPUCommandBuffer on the initialization device.
param: Active SDL_GPURenderPass with the configured target format and sample count.
param: Optional SDL_GPUGraphicsPipeline override, or Null for the backend pipeline.
about: End and submit the pass/command buffer in the calling application. Use ImGui.ImGuiSDL3GPUMax2D for a Max2D window overlay.
End Rem
Function ImGui_ImplSDLGPU3_RenderDrawData(data:TImDrawData,commandBuffer:Byte Ptr,renderPass:Byte Ptr,pipeline:Byte Ptr=Null)
	_ImGui_ImplSDLGPU3_RenderDrawData(data.handle,commandBuffer,renderPass,pipeline)
End Function

Rem
bbdoc: Creates device resources after explicitly destroying them.
End Rem
Function ImGui_ImplSDLGPU3_CreateDeviceObjects()
	_ImGui_ImplSDLGPU3_CreateDeviceObjects()
End Function

Rem
bbdoc: Releases device resources while preserving the ImGui context.
End Rem
Function ImGui_ImplSDLGPU3_DestroyDeviceObjects()
	_ImGui_ImplSDLGPU3_DestroyDeviceObjects()
End Function

Private
Extern "C"
	Function bmx_imguisdlgpu3_init:Int(device:Byte Ptr,format:Int,samples:Int,composition:Int,presentMode:Int)
	Function _ImGui_ImplSDLGPU3_Shutdown()="cImGui_ImplSDLGPU3_Shutdown"
	Function _ImGui_ImplSDLGPU3_NewFrame()="cImGui_ImplSDLGPU3_NewFrame"
	Function _ImGui_ImplSDLGPU3_PrepareDrawData(data:Byte Ptr,command:Byte Ptr)="cImGui_ImplSDLGPU3_PrepareDrawData"
	Function _ImGui_ImplSDLGPU3_RenderDrawData(data:Byte Ptr,command:Byte Ptr,pass:Byte Ptr,pipeline:Byte Ptr)="cImGui_ImplSDLGPU3_RenderDrawDataEx"
	Function _ImGui_ImplSDLGPU3_CreateDeviceObjects()="cImGui_ImplSDLGPU3_CreateDeviceObjects"
	Function _ImGui_ImplSDLGPU3_DestroyDeviceObjects()="cImGui_ImplSDLGPU3_DestroyDeviceObjects"
End Extern

Public
Rem
bbdoc: A texture image resource belonging to an SDL GPU device.
about: Destroy owned resources before the device. The image cache determines ownership of registered resources.
End Rem
Type TSDLGPUImGuiImageResource Extends TImGuiImageResource
	Rem
	bbdoc: Borrowed owning SDL_GPUDevice pointer.
	End Rem
	Field device:Byte Ptr
	Rem
	bbdoc: SDL_GPUTexture pointer used as ImGui's texture identifier.
	End Rem
	Field texture:Byte Ptr
	Rem
	bbdoc: Texture width in pixels.
	End Rem
	Field width:Int
	Rem
	bbdoc: Texture height in pixels.
	End Rem
	Field height:Int

	Rem
	bbdoc: Returns the texture identifier expected by the ImGui GPU backend.
	End Rem
	Method GetImTextureID:ULong() Override
		Return ULong(texture)
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
	bbdoc: Releases the texture on its still-live device; repeated calls are harmless.
	End Rem
	Method Destroy() Override
		If texture Then bmx_imguisdlgpu3_release_texture(device,texture)
		texture=Null
	End Method
End Type

Rem
bbdoc: Creates RGBA image-cache resources for the SDL GPU ImGui backend.
about: The application owns the device and must clear owned image resources before closing it. Uploads occur outside render passes.
End Rem
Type TSDLGPUImGuiImageBackend Extends TImGuiImageBackend
	Private
	Field device:Byte Ptr
	Public
	Rem
	bbdoc: Selects the device used by ImGui rendering.
	param: Borrowed live SDL_GPUDevice pointer.
	End Rem
	Method New(device:Byte Ptr)
		If Not device Then Throw "ImGui GPU images require a device"
		Self.device=device
	End Method

	Rem
	bbdoc: Converts a pixmap to RGBA32 and uploads an owned GPU texture.
	param: Source pixmap; its storage is not retained.
	param: Optional source label used by callers.
	returns: Resource, or Null on upload failure.
	End Rem
	Method CreateResourceFromPixmap:TImGuiImageResource(pixmap:TPixmap,sourceName:String="") Override
		If Not pixmap Then Return Null
		Local rgba:TPixmap=ConvertPixmap(pixmap,PF_RGBA8888)
		Local texture:Byte Ptr=bmx_imguisdlgpu3_texture(device,rgba.pixels,rgba.width,rgba.height,rgba.pitch)
		If Not texture Then Return Null
		Local resource:TSDLGPUImGuiImageResource=New TSDLGPUImGuiImageResource
		resource.device=device
		resource.texture=texture
		resource.width=rgba.width
		resource.height=rgba.height
		Return resource
	End Method

	Rem
	bbdoc: Registers a caller-provided texture from this device in an image cache.
	param: Destination image cache.
	param: Lookup key for the texture.
	param: SDL_GPUTexture with sampler usage on this device.
	param: Texture width in pixels.
	param: Texture height in pixels.
	param: True transfers release responsibility to the cache; False keeps caller ownership.
	param: Optional source description.
	End Rem
	Method RegisterExternalTexture:TImGuiImageEntry(cache:TImGuiImageCache,key:String,texture:Byte Ptr,width:Int,height:Int,owned:Int=False,sourceName:String="")
		If Not cache Or Not texture Or width<=0 Or height<=0 Then Return Null
		Local resource:TSDLGPUImGuiImageResource=New TSDLGPUImGuiImageResource
		resource.device=device
		resource.texture=texture
		resource.width=width
		resource.height=height
		Return cache.RegisterResource(key,resource,owned,EImGuiImageSource.ExternalTexture,sourceName)
	End Method
End Type

Private
Extern "C"
	Function bmx_imguisdlgpu3_texture:Byte Ptr(device:Byte Ptr,pixels:Byte Ptr,width:Int,height:Int,pitch:Int)
	Function bmx_imguisdlgpu3_release_texture(device:Byte Ptr,texture:Byte Ptr)
End Extern
