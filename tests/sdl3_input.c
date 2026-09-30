#include <SDL3/SDL.h>
#include "imgui.mod/imgui.mod/db_generated/dcimgui.h"
void imgui_test_capture(int keyboard, int mouse) {
	ImGui_GetIO()->WantCaptureKeyboard = keyboard != 0;
	ImGui_GetIO()->WantCaptureMouse = mouse != 0;
}
void imgui_test_key(SDL_Window *window, int down) {
	SDL_Event event = {0};
	event.type = down ? SDL_EVENT_KEY_DOWN : SDL_EVENT_KEY_UP;
	event.key.windowID = SDL_GetWindowID(window);
	event.key.scancode = SDL_SCANCODE_A;
	event.key.key = SDLK_A;
	event.key.down = down != 0;
	SDL_PushEvent(&event);
}
void imgui_test_mouse(SDL_Window *window, int down) {
	SDL_Event event = {0};
	event.type = down ? SDL_EVENT_MOUSE_BUTTON_DOWN : SDL_EVENT_MOUSE_BUTTON_UP;
	event.button.windowID = SDL_GetWindowID(window);
	event.button.button = SDL_BUTTON_LEFT;
	event.button.down = down != 0;
	SDL_PushEvent(&event);
}
void imgui_test_text(SDL_Window *window) {
	SDL_Event event = {0};
	event.type = SDL_EVENT_TEXT_INPUT;
	event.text.windowID = SDL_GetWindowID(window);
	event.text.text = "Gr\xc3\xbc\xc3\x9f" "e";
	SDL_PushEvent(&event);
}
int imgui_test_characters(void) { return ImGui_GetIO()->InputQueueCharacters.Size; }
