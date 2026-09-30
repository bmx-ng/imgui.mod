#include <SDL3/SDL.h>
#include "dcimgui_impl_sdlgpu3.h"
int bmx_imguisdlgpu3_init(SDL_GPUDevice *device, int format, int samples, int composition, int presentMode) {
	ImGui_ImplSDLGPU3_InitInfo info = {0};
	info.Device = device;
	info.ColorTargetFormat = (SDL_GPUTextureFormat)format;
	info.MSAASamples = (SDL_GPUSampleCount)samples;
	info.SwapchainComposition = (SDL_GPUSwapchainComposition)composition;
	info.PresentMode = (SDL_GPUPresentMode)presentMode;
	return cImGui_ImplSDLGPU3_Init(&info) ? 1 : 0;
}

SDL_GPUTexture *bmx_imguisdlgpu3_texture(SDL_GPUDevice *device, const void *pixels, int width, int height, int pitch) {
	Uint64 row = (Uint64)width * 4;
	Uint64 size = row * (Uint64)height;
	if (!pixels || width <= 0 || height <= 0 || pitch <= 0 || row > (Uint64)pitch || size > SDL_MAX_UINT32) {
		SDL_SetError("ImGui GPU: invalid image dimensions");
		return NULL;
	}
	SDL_GPUTextureCreateInfo info = {0};
	info.type = SDL_GPU_TEXTURETYPE_2D;
	info.format = SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM;
	info.usage = SDL_GPU_TEXTUREUSAGE_SAMPLER;
	info.width = width;
	info.height = height;
	info.layer_count_or_depth = 1;
	info.num_levels = 1;
	info.sample_count = SDL_GPU_SAMPLECOUNT_1;
	SDL_GPUTexture *texture = SDL_CreateGPUTexture(device, &info);
	if (!texture) return NULL;
	SDL_GPUTransferBufferCreateInfo transferInfo = {0};
	transferInfo.usage = SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD;
	transferInfo.size = (Uint32)size;
	SDL_GPUTransferBuffer *transfer = SDL_CreateGPUTransferBuffer(device, &transferInfo);
	if (!transfer) {
		SDL_ReleaseGPUTexture(device, texture);
		return NULL;
	}
	Uint8 *mapped = SDL_MapGPUTransferBuffer(device, transfer, false);
	if (!mapped) {
		SDL_ReleaseGPUTransferBuffer(device, transfer);
		SDL_ReleaseGPUTexture(device, texture);
		return NULL;
	}
	for (int y = 0; y < height; ++y) SDL_memcpy(mapped + y * row, (const Uint8 *)pixels + (size_t)y * pitch, (size_t)row);
	SDL_UnmapGPUTransferBuffer(device, transfer);
	SDL_GPUCommandBuffer *cmd = SDL_AcquireGPUCommandBuffer(device);
	if (!cmd) {
		SDL_ReleaseGPUTransferBuffer(device, transfer);
		SDL_ReleaseGPUTexture(device, texture);
		return NULL;
	}
	SDL_GPUCopyPass *copy = SDL_BeginGPUCopyPass(cmd);
	if (!copy) {
		SDL_CancelGPUCommandBuffer(cmd);
		SDL_ReleaseGPUTransferBuffer(device, transfer);
		SDL_ReleaseGPUTexture(device, texture);
		return NULL;
	}
	SDL_GPUTextureTransferInfo source = {0};
	source.transfer_buffer = transfer;
	SDL_GPUTextureRegion target = {0};
	target.texture = texture;
	target.w = width;
	target.h = height;
	target.d = 1;
	SDL_UploadToGPUTexture(copy, &source, &target, false);
	SDL_EndGPUCopyPass(copy);
	bool ok = SDL_SubmitGPUCommandBuffer(cmd);
	SDL_ReleaseGPUTransferBuffer(device, transfer);
	if (!ok) {
		SDL_ReleaseGPUTexture(device, texture);
		return NULL;
	}
	return texture;
}
void bmx_imguisdlgpu3_release_texture(SDL_GPUDevice *device, SDL_GPUTexture *texture) {
	SDL_ReleaseGPUTexture(device, texture);
}
