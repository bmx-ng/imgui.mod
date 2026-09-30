#include <SDL3/SDL.h>
#include "dcimgui_impl_sdlrenderer3.h"
int bmx_imguisdlrenderer3_init(SDL_Renderer *renderer) {
	return cImGui_ImplSDLRenderer3_Init(renderer) ? 1 : 0;
}
SDL_Texture *bmx_imguisdlrenderer3_texture(SDL_Renderer *renderer, void *pixels, int width, int height, int pitch) {
	SDL_Surface *surface = SDL_CreateSurfaceFrom(width, height, SDL_PIXELFORMAT_RGBA32, pixels, pitch);
	if (!surface) return NULL;
	SDL_Texture *texture = SDL_CreateTextureFromSurface(renderer, surface);
	SDL_DestroySurface(surface);
	return texture;
}

void bmx_imguisdlrenderer3_draw(ImDrawData *data, SDL_Renderer *renderer) {
	float x, y;
	SDL_GetRenderScale(renderer, &x, &y);
	SDL_SetRenderScale(renderer, data->FramebufferScale.x, data->FramebufferScale.y);
	cImGui_ImplSDLRenderer3_RenderDrawData(data, renderer);
	SDL_SetRenderScale(renderer, x, y);
}
