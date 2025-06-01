
#include "dcimgui_impl_sdl2.h"

typedef void (*EventCallback)(void *userdata, SDL_Event *event, int *ignoreKeyboard, int *ignoreMouse);
extern void bmx_SDL_AddEventCallback(EventCallback callback, void *userdata, int priority);

static void bmx_imguisdl2_eventCallback(void *userdata, SDL_Event *event, int *ignoreKeyboard, int *ignoreMouse) {
    cImGui_ImplSDL2_ProcessEvent(event);
    ImGuiIO * io = ImGui_GetIO();
    *ignoreKeyboard = io->WantCaptureKeyboard;
    *ignoreMouse = io->WantCaptureMouse;
}

void bmx_imguisdl2_init() {
    bmx_SDL_AddEventCallback(bmx_imguisdl2_eventCallback, NULL, 9999);
}
