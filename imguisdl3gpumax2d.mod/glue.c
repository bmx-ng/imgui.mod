#include <SDL3/SDL.h>
#include "dcimgui_impl_sdlgpu3.h"
static void prepare(void *data, SDL_GPUCommandBuffer *command) {
	cImGui_ImplSDLGPU3_PrepareDrawData(data, command);
}
static void draw(void *data, SDL_GPUCommandBuffer *command, SDL_GPURenderPass *pass) {
	cImGui_ImplSDLGPU3_RenderDrawData(data, command, pass);
}
void *bmx_imgui_gpu_prepare_callback(void) { return (void *)prepare; }
void *bmx_imgui_gpu_draw_callback(void) { return (void *)draw; }
