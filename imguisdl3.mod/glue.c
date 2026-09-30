/* SDL3 event integration. MIT licence. */
#include <SDL3/SDL.h>
#include "dcimgui_impl_sdl3.h"
#include "sdl3.mod/sdl3system.mod/event_observer.h"
#include <stdlib.h>

typedef struct ContextNode {
	ImGuiContext *context;
	struct ContextNode *next;
} ContextNode;
static ContextNode *contexts;

static int observe(void *userdata, SDL_Event *event) {
	(void)userdata;
	ImGuiContext *previous = ImGui_GetCurrentContext();
	int capture = 0;
	for (ContextNode *node = contexts; node; node = node->next) {
		ImGui_SetCurrentContext(node->context);
		if (cImGui_ImplSDL3_ProcessEvent(event)) {
			ImGuiIO *io = ImGui_GetIO();
			if (io->WantCaptureKeyboard) capture |= BMX_SDL3_CAPTURE_KEYBOARD;
			if (io->WantCaptureMouse) capture |= BMX_SDL3_CAPTURE_MOUSE;
		}
	}
	ImGui_SetCurrentContext(previous);
	return capture;
}

int bmx_imguisdl3_init(SDL_Window *window, void *extra, int mode) {
	ImGuiContext *context = ImGui_GetCurrentContext();
	if (!context) return SDL_SetError("ImGui: create a context before initializing SDL3"), 0;
	if (ImGui_GetIO()->BackendPlatformUserData) return SDL_SetError("ImGui: platform backend already initialized"), 0;
	ContextNode *node = malloc(sizeof(*node));
	if (!node) return SDL_SetError("ImGui SDL3: out of memory"), 0;
	bool ok = false;
	switch (mode) {
	case 0: ok = cImGui_ImplSDL3_InitForOpenGL(window, extra); break;
	case 1: ok = cImGui_ImplSDL3_InitForVulkan(window); break;
	case 2: ok = cImGui_ImplSDL3_InitForD3D(window); break;
	case 3: ok = cImGui_ImplSDL3_InitForMetal(window); break;
	case 4: ok = cImGui_ImplSDL3_InitForSDLRenderer(window, extra); break;
	case 5: ok = cImGui_ImplSDL3_InitForSDLGPU(window); break;
	case 6: ok = cImGui_ImplSDL3_InitForOther(window); break;
	}
	if (!ok) { free(node); return 0; }
	if (!contexts) bmx_SDL3_AddEventObserver(observe, NULL);
	node->context = context;
	node->next = contexts;
	contexts = node;
	return 1;
}

void bmx_imguisdl3_shutdown(void) {
	ImGuiContext *context = ImGui_GetCurrentContext();
	ContextNode **slot = &contexts;
	while (*slot && (*slot)->context != context) slot = &(*slot)->next;
	if (!*slot) return;
	ContextNode *node = *slot;
	*slot = node->next;
	free(node);
	if (!contexts) bmx_SDL3_RemoveEventObserver(observe);
	cImGui_ImplSDL3_Shutdown();
}

int bmx_imguisdl3_process(const SDL_Event *event) {
	return cImGui_ImplSDL3_ProcessEvent(event) ? 1 : 0;
}
