//
// This file is generated. Do not modify it manually.
// Generated from ImGui 1.91.9b header file.
//

#include "dcimgui.h"
#include "brl.mod/blitz.mod/blitz.h"

int bmx_ImGui_InputText(BBString * label, BBString ** buf, int bufSize, ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);

	size_t size = bufSize * 4; // worst case scenario 4 bytes to 1 BlitzMax character
	char * bufPtr = (char *)malloc(size);
	size_t length = size;
	bbStringToUTF8StringBuffer(*buf, bufPtr, &length);

	int result = ImGui_InputText(v0, bufPtr, size < length ? length : size, flags);

	bbMemFree(v0);

	*buf = bbStringFromUTF8String(bufPtr);
	free(bufPtr);

	return result;
}

float bmx_imgui_io_get_delta_time(ImGuiIO * io) {
	return io->DeltaTime;
}

float bmx_imgui_io_get_ini_saving_rate(ImGuiIO * io) {
	return io->IniSavingRate;
}

ImVec2 bmx_imgui_io_get_display_size(ImGuiIO * io) {
	return io->DisplaySize;
}

BBString * bmx_imgui_io_get_ini_filename(ImGuiIO * io) {
	return bbStringFromUTF8String(io->IniFilename);
}

void bmx_imgui_io_set_ini_filename(ImGuiIO * io, BBString * filename) {
	const char * v0 = NULL;
	if ( filename != &bbEmptyString ) {
		v0 = (const char *)bbStringToUTF8String(filename);
	}
	io->IniFilename = v0;
	bbMemFree(v0);
}

BBString * bmx_imgui_io_get_log_filename(ImGuiIO * io) {
	return bbStringFromUTF8String(io->LogFilename);
}

void bmx_imgui_io_set_log_filename(ImGuiIO * io, BBString * filename) {
	const char * v0 = NULL;
	if ( filename != &bbEmptyString ) {
		v0 = (const char *)bbStringToUTF8String(filename);
	}
	io->LogFilename = v0;
	bbMemFree(v0);
}

int bmx_imgui_io_get_want_capture_mouse(ImGuiIO * io) {
	return io->WantCaptureMouse;
}

int bmx_imgui_io_get_want_capture_keyboard(ImGuiIO * io) {
	return io->WantCaptureKeyboard;
}

int bmx_imgui_io_get_want_text_input(ImGuiIO * io) {
	return io->WantTextInput;
}

int bmx_imgui_io_get_want_set_mouse_pos(ImGuiIO * io) {
	return io->WantSetMousePos;
}

int bmx_imgui_io_get_want_save_ini_settings(ImGuiIO * io) {
	return io->WantSaveIniSettings;
}

void bmx_imgui_io_set_want_save_ini_settings(ImGuiIO * io, int value) {
	io->WantSaveIniSettings = value;
}

int bmx_imgui_io_get_nav_active(ImGuiIO * io) {
	return io->NavActive;
}

int bmx_imgui_io_get_nav_visible(ImGuiIO * io) {
	return io->NavVisible;
}

float bmx_imgui_io_get_framerate(ImGuiIO * io) {
	return io->Framerate;
}

int bmx_imgui_io_get_metrics_render_vertices(ImGuiIO * io) {
	return io->MetricsRenderVertices;
}

int bmx_imgui_io_get_metrics_render_indices(ImGuiIO * io) {
	return io->MetricsRenderIndices;
}

int bmx_imgui_io_get_metrics_render_windows(ImGuiIO * io) {
	return io->MetricsRenderWindows;
}

int bmx_imgui_io_get_metrics_active_windows(ImGuiIO * io) {
	return io->MetricsActiveWindows;
}

ImVec2 bmx_imgui_io_get_mouse_delta(ImGuiIO * io) {
	return io->MouseDelta;
}

float bmx_imgui_io_get_font_global_scale(ImGuiIO * io) {
	return io->FontGlobalScale;
}

void bmx_imgui_io_set_font_global_scale(ImGuiIO * io, float scale) {
	io->FontGlobalScale = scale;
}

ImVec2 bmx_imgui_io_get_display_framebuffer_scale(ImGuiIO * io) {
	return io->DisplayFramebufferScale;
}

void bmx_imgui_io_set_display_framebuffer_scale(ImGuiIO * io, ImVec2 scale) {
	io->DisplayFramebufferScale = scale;
}

int bmx_imgui_io_get_config_nav_swap_gamepad_buttons(ImGuiIO * io) {
	return io->ConfigNavSwapGamepadButtons;
}

void bmx_imgui_io_set_config_nav_swap_gamepad_buttons(ImGuiIO * io, int value) {
	io->ConfigNavSwapGamepadButtons = value;
}

int bmx_imgui_io_get_config_nav_move_set_mouse_pos(ImGuiIO * io) {
	return io->ConfigNavMoveSetMousePos;
}

void bmx_imgui_io_set_config_nav_move_set_mouse_pos(ImGuiIO * io, int value) {
	io->ConfigNavMoveSetMousePos = value;
}

int bmx_imgui_io_get_config_nav_capture_keyboard(ImGuiIO * io) {
	return io->ConfigNavCaptureKeyboard;
}

void bmx_imgui_io_set_config_nav_capture_keyboard(ImGuiIO * io, int value) {
	io->ConfigNavCaptureKeyboard = value;
}

int bmx_imgui_io_get_config_nav_escape_clear_focus_item(ImGuiIO * io) {
	return io->ConfigNavEscapeClearFocusItem;
}

void bmx_imgui_io_set_config_nav_escape_clear_focus_item(ImGuiIO * io, int value) {
	io->ConfigNavEscapeClearFocusItem = value;
}

int bmx_imgui_io_get_config_nav_escape_clear_focus_window(ImGuiIO * io) {
	return io->ConfigNavEscapeClearFocusWindow;
}

void bmx_imgui_io_set_config_nav_escape_clear_focus_window(ImGuiIO * io, int value) {
	io->ConfigNavEscapeClearFocusWindow = value;
}

int bmx_imgui_io_get_config_nav_cursor_visible_auto(ImGuiIO * io) {
	return io->ConfigNavCursorVisibleAuto;
}

void bmx_imgui_io_set_config_nav_cursor_visible_auto(ImGuiIO * io, int value) {
	io->ConfigNavCursorVisibleAuto = value;
}

int bmx_imgui_io_get_config_nav_cursor_visible_always(ImGuiIO * io) {
	return io->ConfigNavCursorVisibleAlways;
}

void bmx_imgui_io_set_config_nav_cursor_visible_always(ImGuiIO * io, int value) {
	io->ConfigNavCursorVisibleAlways = value;
}

int bmx_imgui_io_get_mouse_draw_cursor(ImGuiIO * io) {
	return io->MouseDrawCursor;
}

void bmx_imgui_io_set_mouse_draw_cursor(ImGuiIO * io, int value) {
	io->MouseDrawCursor = value;
}

int bmx_imgui_io_get_config_macosx_behaviors(ImGuiIO * io) {
	return io->ConfigMacOSXBehaviors;
}

void bmx_imgui_io_set_config_macosx_behaviors(ImGuiIO * io, int value) {
	io->ConfigMacOSXBehaviors = value;
}

int bmx_imgui_io_get_config_input_trickle_event_queue(ImGuiIO * io) {
	return io->ConfigInputTrickleEventQueue;
}

void bmx_imgui_io_set_config_input_trickle_event_queue(ImGuiIO * io, int value) {
	io->ConfigInputTrickleEventQueue = value;
}

int bmx_imgui_io_get_config_input_text_cursor_blink(ImGuiIO * io) {
	return io->ConfigInputTextCursorBlink;
}

void bmx_imgui_io_set_config_input_text_cursor_blink(ImGuiIO * io, int value) {
	io->ConfigInputTextCursorBlink = value;
}

int bmx_imgui_io_get_config_input_text_enter_keep_active(ImGuiIO * io) {
	return io->ConfigInputTextEnterKeepActive;
}

void bmx_imgui_io_set_config_input_text_enter_keep_active(ImGuiIO * io, int value) {
	io->ConfigInputTextEnterKeepActive = value;
}

int bmx_imgui_io_get_config_drag_click_to_input_text(ImGuiIO * io) {
	return io->ConfigDragClickToInputText;
}

void bmx_imgui_io_set_config_drag_click_to_input_text(ImGuiIO * io, int value) {
	io->ConfigDragClickToInputText = value;
}

int bmx_imgui_io_get_config_windows_resize_from_edges(ImGuiIO * io) {
	return io->ConfigWindowsResizeFromEdges;
}

void bmx_imgui_io_set_config_windows_resize_from_edges(ImGuiIO * io, int value) {
	io->ConfigWindowsResizeFromEdges = value;
}

int bmx_imgui_io_get_config_windows_move_from_title_bar_only(ImGuiIO * io) {
	return io->ConfigWindowsMoveFromTitleBarOnly;
}

void bmx_imgui_io_set_config_windows_move_from_title_bar_only(ImGuiIO * io, int value) {
	io->ConfigWindowsMoveFromTitleBarOnly = value;
}

int bmx_imgui_io_get_config_windows_copy_contents_with_ctrlc(ImGuiIO * io) {
	return io->ConfigWindowsCopyContentsWithCtrlC;
}

void bmx_imgui_io_set_config_windows_copy_contents_with_ctrlc(ImGuiIO * io, int value) {
	io->ConfigWindowsCopyContentsWithCtrlC = value;
}

int bmx_imgui_io_get_config_scrollbar_scroll_by_page(ImGuiIO * io) {
	return io->ConfigScrollbarScrollByPage;
}

void bmx_imgui_io_set_config_scrollbar_scroll_by_page(ImGuiIO * io, int value) {
	io->ConfigScrollbarScrollByPage = value;
}

float bmx_imgui_io_get_config_memory_compact_timer(ImGuiIO * io) {
	return io->ConfigMemoryCompactTimer;
}

void bmx_imgui_io_set_config_memory_compact_timer(ImGuiIO * io, float value) {
	io->ConfigMemoryCompactTimer = value;
}

float bmx_imgui_io_get_mouse_double_click_time(ImGuiIO * io) {
	return io->MouseDoubleClickTime;
}

void bmx_imgui_io_set_mouse_double_click_time(ImGuiIO * io, float value) {
	io->MouseDoubleClickTime = value;
}

float bmx_imgui_io_get_mouse_double_click_max_dist(ImGuiIO * io) {
	return io->MouseDoubleClickMaxDist;
}

void bmx_imgui_io_set_mouse_double_click_max_dist(ImGuiIO * io, float value) {
	io->MouseDoubleClickMaxDist = value;
}

float bmx_imgui_io_get_mouse_drag_threshold(ImGuiIO * io) {
	return io->MouseDragThreshold;
}

void bmx_imgui_io_set_mouse_drag_threshold(ImGuiIO * io, float value) {
	io->MouseDragThreshold = value;
}

float bmx_imgui_io_get_key_repeat_delay(ImGuiIO * io) {
	return io->KeyRepeatDelay;
}

void bmx_imgui_io_set_key_repeat_delay(ImGuiIO * io, float value) {
	io->KeyRepeatDelay = value;
}

float bmx_imgui_io_get_key_repeat_rate(ImGuiIO * io) {
	return io->KeyRepeatRate;
}

void bmx_imgui_io_set_key_repeat_rate(ImGuiIO * io, float value) {
	io->KeyRepeatRate = value;
}


int bmx_ImGui_ShowStyleSelector(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ShowStyleSelector(v0);
	bbMemFree(v0);
	return result;
}

void bmx_ImGui_ShowFontSelector(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	ImGui_ShowFontSelector(v0);
	bbMemFree(v0);
}

BBString * bmx_ImGui_GetVersion() {
	BBString * result = bbStringFromUTF8String((const unsigned char *)ImGui_GetVersion());
	return result;
}

int bmx_ImGui_Begin(BBString * name, bool* p_open, ImGuiWindowFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(name);
	int result = ImGui_Begin(v0, p_open, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_BeginChild(BBString * str_id, ImVec2 size, ImGuiChildFlags child_flags, ImGuiWindowFlags window_flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_BeginChild(v0, size, child_flags, window_flags);
	bbMemFree(v0);
	return result;
}

void bmx_ImGui_SetWindowPosStr(BBString * name, ImVec2 pos, ImGuiCond cond) {
	const char * v0 = (const char *)bbStringToUTF8String(name);
	ImGui_SetWindowPosStr(v0, pos, cond);
	bbMemFree(v0);
}

void bmx_ImGui_SetWindowSizeStr(BBString * name, ImVec2 size, ImGuiCond cond) {
	const char * v0 = (const char *)bbStringToUTF8String(name);
	ImGui_SetWindowSizeStr(v0, size, cond);
	bbMemFree(v0);
}

void bmx_ImGui_SetWindowCollapsedStr(BBString * name, bool collapsed, ImGuiCond cond) {
	const char * v0 = (const char *)bbStringToUTF8String(name);
	ImGui_SetWindowCollapsedStr(v0, collapsed, cond);
	bbMemFree(v0);
}

void bmx_ImGui_SetWindowFocusStr(BBString * name) {
	const char * v0 = (const char *)bbStringToUTF8String(name);
	ImGui_SetWindowFocusStr(v0);
	bbMemFree(v0);
}

void bmx_ImGui_PushID(BBString * str_id) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	ImGui_PushID(v0);
	bbMemFree(v0);
}

void bmx_ImGui_PushIDStr(BBString * str_id_begin, BBString * str_id_end) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id_begin);
	const char * v1 = (const char *)bbStringToUTF8String(str_id_end);
	ImGui_PushIDStr(v0, v1);
	bbMemFree(v0);
	bbMemFree(v1);
}

ImGuiID bmx_ImGui_GetID(BBString * str_id) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	ImGuiID result = ImGui_GetID(v0);
	bbMemFree(v0);
	return result;
}

ImGuiID bmx_ImGui_GetIDStr(BBString * str_id_begin, BBString * str_id_end) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id_begin);
	const char * v1 = (const char *)bbStringToUTF8String(str_id_end);
	ImGuiID result = ImGui_GetIDStr(v0, v1);
	bbMemFree(v0);
	bbMemFree(v1);
	return result;
}

void bmx_ImGui_TextUnformatted(BBString * text) {
	const char * v0 = (const char *)bbStringToUTF8String(text);
	ImGui_TextUnformatted(v0);
	bbMemFree(v0);
}

void bmx_ImGui_TextUnformattedEx(BBString * text, BBString * text_end) {
	const char * v0 = (const char *)bbStringToUTF8String(text);
	const char * v1 = (const char *)bbStringToUTF8String(text_end);
	ImGui_TextUnformattedEx(v0, v1);
	bbMemFree(v0);
	bbMemFree(v1);
}

void bmx_ImGui_Text(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_Text(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_TextV(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_TextV(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_TextColored(ImVec4 col, BBString * fmt) {
	const char * v1 = (const char *)bbStringToUTF8String(fmt);
	ImGui_TextColored(col, v1, NULL);
	bbMemFree(v1);
}

void bmx_ImGui_TextColoredV(ImVec4 col, BBString * fmt) {
	const char * v1 = (const char *)bbStringToUTF8String(fmt);
	ImGui_TextColoredV(col, v1, NULL);
	bbMemFree(v1);
}

void bmx_ImGui_TextDisabled(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_TextDisabled(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_TextDisabledV(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_TextDisabledV(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_TextWrapped(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_TextWrapped(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_TextWrappedV(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_TextWrappedV(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_LabelText(BBString * label, BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v1 = (const char *)bbStringToUTF8String(fmt);
	ImGui_LabelText(v0, v1, NULL);
	bbMemFree(v0);
	bbMemFree(v1);
}

void bmx_ImGui_LabelTextV(BBString * label, BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v1 = (const char *)bbStringToUTF8String(fmt);
	ImGui_LabelTextV(v0, v1, NULL);
	bbMemFree(v0);
	bbMemFree(v1);
}

void bmx_ImGui_BulletText(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_BulletText(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_BulletTextV(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_BulletTextV(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_SeparatorText(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	ImGui_SeparatorText(v0);
	bbMemFree(v0);
}

int bmx_ImGui_Button(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_Button(v0);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ButtonEx(BBString * label, ImVec2 size) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ButtonEx(v0, size);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SmallButton(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SmallButton(v0);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InvisibleButton(BBString * str_id, ImVec2 size, ImGuiButtonFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_InvisibleButton(v0, size, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ArrowButton(BBString * str_id, ImGuiDir dir) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_ArrowButton(v0, dir);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_Checkbox(BBString * label, bool* v) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_Checkbox(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_CheckboxFlagsIntPtr(BBString * label, int* flags, int flags_value) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_CheckboxFlagsIntPtr(v0, flags, flags_value);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_CheckboxFlagsUintPtr(BBString * label, unsigned int* flags, unsigned int flags_value) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_CheckboxFlagsUintPtr(v0, flags, flags_value);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_RadioButton(BBString * label, bool active) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_RadioButton(v0, active);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_RadioButtonIntPtr(BBString * label, int* v, int v_button) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_RadioButtonIntPtr(v0, v, v_button);
	bbMemFree(v0);
	return result;
}

void bmx_ImGui_ProgressBar(float fraction, ImVec2 size_arg, BBString * overlay) {
	const char * v2 = (const char *)bbStringToUTF8String(overlay);
	ImGui_ProgressBar(fraction, size_arg, v2);
	bbMemFree(v2);
}

int bmx_ImGui_TextLink(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_TextLink(v0);
	bbMemFree(v0);
	return result;
}

void bmx_ImGui_TextLinkOpenURL(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	ImGui_TextLinkOpenURL(v0);
	bbMemFree(v0);
}

void bmx_ImGui_TextLinkOpenURLEx(BBString * label, BBString * url) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v1 = (const char *)bbStringToUTF8String(url);
	ImGui_TextLinkOpenURLEx(v0, v1);
	bbMemFree(v0);
	bbMemFree(v1);
}

int bmx_ImGui_ImageButton(BBString * str_id, ImTextureID user_texture_id, ImVec2 image_size) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_ImageButton(v0, user_texture_id, image_size);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ImageButtonEx(BBString * str_id, ImTextureID user_texture_id, ImVec2 image_size, ImVec2 uv0, ImVec2 uv1, ImVec4 bg_col, ImVec4 tint_col) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_ImageButtonEx(v0, user_texture_id, image_size, uv0, uv1, bg_col, tint_col);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_BeginCombo(BBString * label, BBString * preview_value, ImGuiComboFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v1 = (const char *)bbStringToUTF8String(preview_value);
	int result = ImGui_BeginCombo(v0, v1, flags);
	bbMemFree(v0);
	bbMemFree(v1);
	return result;
}

int bmx_ImGui_ComboChar(BBString * label, int* current_item, const char*const items[], int items_count) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ComboChar(v0, current_item, items, items_count);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ComboCharEx(BBString * label, int* current_item, const char*const items[], int items_count, int popup_max_height_in_items) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ComboCharEx(v0, current_item, items, items_count, popup_max_height_in_items);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_Combo(BBString * label, int* current_item, BBString * items_separated_by_zeros) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v2 = (const char *)bbStringToUTF8String(items_separated_by_zeros);
	int result = ImGui_Combo(v0, current_item, v2);
	bbMemFree(v0);
	bbMemFree(v2);
	return result;
}

int bmx_ImGui_ComboEx(BBString * label, int* current_item, BBString * items_separated_by_zeros, int popup_max_height_in_items) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v2 = (const char *)bbStringToUTF8String(items_separated_by_zeros);
	int result = ImGui_ComboEx(v0, current_item, v2, popup_max_height_in_items);
	bbMemFree(v0);
	bbMemFree(v2);
	return result;
}

int bmx_ImGui_ComboCallback(BBString * label, int* current_item, const char* (*getter)(void* user_data, int idx) , void* user_data, int items_count) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ComboCallback(v0, current_item, getter, user_data, items_count);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ComboCallbackEx(BBString * label, int* current_item, const char* (*getter)(void* user_data, int idx) , void* user_data, int items_count, int popup_max_height_in_items) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ComboCallbackEx(v0, current_item, getter, user_data, items_count, popup_max_height_in_items);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragFloat(BBString * label, float* v) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragFloat(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragFloatEx(BBString * label, float* v, float v_speed, float v_min, float v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_DragFloatEx(v0, v, v_speed, v_min, v_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_DragFloat2(BBString * label, float v[2]) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragFloat2(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragFloat2Ex(BBString * label, float v[2], float v_speed, float v_min, float v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_DragFloat2Ex(v0, v, v_speed, v_min, v_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_DragFloat3(BBString * label, float v[3]) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragFloat3(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragFloat3Ex(BBString * label, float v[3], float v_speed, float v_min, float v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_DragFloat3Ex(v0, v, v_speed, v_min, v_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_DragFloat4(BBString * label, float v[4]) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragFloat4(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragFloat4Ex(BBString * label, float v[4], float v_speed, float v_min, float v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_DragFloat4Ex(v0, v, v_speed, v_min, v_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_DragFloatRange2(BBString * label, float* v_current_min, float* v_current_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragFloatRange2(v0, v_current_min, v_current_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragFloatRange2Ex(BBString * label, float* v_current_min, float* v_current_max, float v_speed, float v_min, float v_max, BBString * format, BBString * format_max, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v6 = (const char *)bbStringToUTF8String(format);
	const char * v7 = (const char *)bbStringToUTF8String(format_max);
	int result = ImGui_DragFloatRange2Ex(v0, v_current_min, v_current_max, v_speed, v_min, v_max, v6, v7, flags);
	bbMemFree(v0);
	bbMemFree(v6);
	bbMemFree(v7);
	return result;
}

int bmx_ImGui_DragInt(BBString * label, int* v) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragInt(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragIntEx(BBString * label, int* v, float v_speed, int v_min, int v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_DragIntEx(v0, v, v_speed, v_min, v_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_DragInt2(BBString * label, int v[2]) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragInt2(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragInt2Ex(BBString * label, int v[2], float v_speed, int v_min, int v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_DragInt2Ex(v0, v, v_speed, v_min, v_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_DragInt3(BBString * label, int v[3]) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragInt3(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragInt3Ex(BBString * label, int v[3], float v_speed, int v_min, int v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_DragInt3Ex(v0, v, v_speed, v_min, v_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_DragInt4(BBString * label, int v[4]) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragInt4(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragInt4Ex(BBString * label, int v[4], float v_speed, int v_min, int v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_DragInt4Ex(v0, v, v_speed, v_min, v_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_DragIntRange2(BBString * label, int* v_current_min, int* v_current_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragIntRange2(v0, v_current_min, v_current_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragIntRange2Ex(BBString * label, int* v_current_min, int* v_current_max, float v_speed, int v_min, int v_max, BBString * format, BBString * format_max, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v6 = (const char *)bbStringToUTF8String(format);
	const char * v7 = (const char *)bbStringToUTF8String(format_max);
	int result = ImGui_DragIntRange2Ex(v0, v_current_min, v_current_max, v_speed, v_min, v_max, v6, v7, flags);
	bbMemFree(v0);
	bbMemFree(v6);
	bbMemFree(v7);
	return result;
}

int bmx_ImGui_DragScalar(BBString * label, ImGuiDataType data_type, void* p_data) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragScalar(v0, data_type, p_data);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragScalarEx(BBString * label, ImGuiDataType data_type, void* p_data, float v_speed, const void* p_min, const void* p_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v6 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_DragScalarEx(v0, data_type, p_data, v_speed, p_min, p_max, v6, flags);
	bbMemFree(v0);
	bbMemFree(v6);
	return result;
}

int bmx_ImGui_DragScalarN(BBString * label, ImGuiDataType data_type, void* p_data, int components) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_DragScalarN(v0, data_type, p_data, components);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_DragScalarNEx(BBString * label, ImGuiDataType data_type, void* p_data, int components, float v_speed, const void* p_min, const void* p_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v7 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_DragScalarNEx(v0, data_type, p_data, components, v_speed, p_min, p_max, v7, flags);
	bbMemFree(v0);
	bbMemFree(v7);
	return result;
}

int bmx_ImGui_SliderFloat(BBString * label, float* v, float v_min, float v_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderFloat(v0, v, v_min, v_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderFloatEx(BBString * label, float* v, float v_min, float v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderFloatEx(v0, v, v_min, v_max, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_SliderFloat2(BBString * label, float v[2], float v_min, float v_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderFloat2(v0, v, v_min, v_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderFloat2Ex(BBString * label, float v[2], float v_min, float v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderFloat2Ex(v0, v, v_min, v_max, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_SliderFloat3(BBString * label, float v[3], float v_min, float v_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderFloat3(v0, v, v_min, v_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderFloat3Ex(BBString * label, float v[3], float v_min, float v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderFloat3Ex(v0, v, v_min, v_max, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_SliderFloat4(BBString * label, float v[4], float v_min, float v_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderFloat4(v0, v, v_min, v_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderFloat4Ex(BBString * label, float v[4], float v_min, float v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderFloat4Ex(v0, v, v_min, v_max, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_SliderAngle(BBString * label, float* v_rad) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderAngle(v0, v_rad);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderAngleEx(BBString * label, float* v_rad, float v_degrees_min, float v_degrees_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderAngleEx(v0, v_rad, v_degrees_min, v_degrees_max, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_SliderInt(BBString * label, int* v, int v_min, int v_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderInt(v0, v, v_min, v_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderIntEx(BBString * label, int* v, int v_min, int v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderIntEx(v0, v, v_min, v_max, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_SliderInt2(BBString * label, int v[2], int v_min, int v_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderInt2(v0, v, v_min, v_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderInt2Ex(BBString * label, int v[2], int v_min, int v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderInt2Ex(v0, v, v_min, v_max, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_SliderInt3(BBString * label, int v[3], int v_min, int v_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderInt3(v0, v, v_min, v_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderInt3Ex(BBString * label, int v[3], int v_min, int v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderInt3Ex(v0, v, v_min, v_max, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_SliderInt4(BBString * label, int v[4], int v_min, int v_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderInt4(v0, v, v_min, v_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderInt4Ex(BBString * label, int v[4], int v_min, int v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderInt4Ex(v0, v, v_min, v_max, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_SliderScalar(BBString * label, ImGuiDataType data_type, void* p_data, const void* p_min, const void* p_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderScalar(v0, data_type, p_data, p_min, p_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderScalarEx(BBString * label, ImGuiDataType data_type, void* p_data, const void* p_min, const void* p_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderScalarEx(v0, data_type, p_data, p_min, p_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_SliderScalarN(BBString * label, ImGuiDataType data_type, void* p_data, int components, const void* p_min, const void* p_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SliderScalarN(v0, data_type, p_data, components, p_min, p_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SliderScalarNEx(BBString * label, ImGuiDataType data_type, void* p_data, int components, const void* p_min, const void* p_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v6 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_SliderScalarNEx(v0, data_type, p_data, components, p_min, p_max, v6, flags);
	bbMemFree(v0);
	bbMemFree(v6);
	return result;
}

int bmx_ImGui_VSliderFloat(BBString * label, ImVec2 size, float* v, float v_min, float v_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_VSliderFloat(v0, size, v, v_min, v_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_VSliderFloatEx(BBString * label, ImVec2 size, float* v, float v_min, float v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_VSliderFloatEx(v0, size, v, v_min, v_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_VSliderInt(BBString * label, ImVec2 size, int* v, int v_min, int v_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_VSliderInt(v0, size, v, v_min, v_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_VSliderIntEx(BBString * label, ImVec2 size, int* v, int v_min, int v_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_VSliderIntEx(v0, size, v, v_min, v_max, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_VSliderScalar(BBString * label, ImVec2 size, ImGuiDataType data_type, void* p_data, const void* p_min, const void* p_max) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_VSliderScalar(v0, size, data_type, p_data, p_min, p_max);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_VSliderScalarEx(BBString * label, ImVec2 size, ImGuiDataType data_type, void* p_data, const void* p_min, const void* p_max, BBString * format, ImGuiSliderFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v6 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_VSliderScalarEx(v0, size, data_type, p_data, p_min, p_max, v6, flags);
	bbMemFree(v0);
	bbMemFree(v6);
	return result;
}

int bmx_ImGui_InputTextEx(BBString * label, char* buf, size_t buf_size, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputTextEx(v0, buf, buf_size, flags, callback, user_data);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputTextMultiline(BBString * label, char* buf, size_t buf_size) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputTextMultiline(v0, buf, buf_size);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputTextMultilineEx(BBString * label, char* buf, size_t buf_size, ImVec2 size, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputTextMultilineEx(v0, buf, buf_size, size, flags, callback, user_data);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputTextWithHint(BBString * label, BBString * hint, char* buf, size_t buf_size, ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v1 = (const char *)bbStringToUTF8String(hint);
	int result = ImGui_InputTextWithHint(v0, v1, buf, buf_size, flags);
	bbMemFree(v0);
	bbMemFree(v1);
	return result;
}

int bmx_ImGui_InputTextWithHintEx(BBString * label, BBString * hint, char* buf, size_t buf_size, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v1 = (const char *)bbStringToUTF8String(hint);
	int result = ImGui_InputTextWithHintEx(v0, v1, buf, buf_size, flags, callback, user_data);
	bbMemFree(v0);
	bbMemFree(v1);
	return result;
}

int bmx_ImGui_InputFloat(BBString * label, float* v) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputFloat(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputFloatEx(BBString * label, float* v, float stp, float step_fast, BBString * format, ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_InputFloatEx(v0, v, stp, step_fast, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_InputFloat2(BBString * label, float v[2]) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputFloat2(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputFloat2Ex(BBString * label, float v[2], BBString * format, ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v2 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_InputFloat2Ex(v0, v, v2, flags);
	bbMemFree(v0);
	bbMemFree(v2);
	return result;
}

int bmx_ImGui_InputFloat3(BBString * label, float v[3]) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputFloat3(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputFloat3Ex(BBString * label, float v[3], BBString * format, ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v2 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_InputFloat3Ex(v0, v, v2, flags);
	bbMemFree(v0);
	bbMemFree(v2);
	return result;
}

int bmx_ImGui_InputFloat4(BBString * label, float v[4]) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputFloat4(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputFloat4Ex(BBString * label, float v[4], BBString * format, ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v2 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_InputFloat4Ex(v0, v, v2, flags);
	bbMemFree(v0);
	bbMemFree(v2);
	return result;
}

int bmx_ImGui_InputInt(BBString * label, int* v) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputInt(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputIntEx(BBString * label, int* v, int stp, int step_fast, ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputIntEx(v0, v, stp, step_fast, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputInt2(BBString * label, int v[2], ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputInt2(v0, v, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputInt3(BBString * label, int v[3], ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputInt3(v0, v, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputInt4(BBString * label, int v[4], ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputInt4(v0, v, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputDouble(BBString * label, double* v) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputDouble(v0, v);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputDoubleEx(BBString * label, double* v, double stp, double step_fast, BBString * format, ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_InputDoubleEx(v0, v, stp, step_fast, v4, flags);
	bbMemFree(v0);
	bbMemFree(v4);
	return result;
}

int bmx_ImGui_InputScalar(BBString * label, ImGuiDataType data_type, void* p_data) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputScalar(v0, data_type, p_data);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputScalarEx(BBString * label, ImGuiDataType data_type, void* p_data, const void* p_step, const void* p_step_fast, BBString * format, ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_InputScalarEx(v0, data_type, p_data, p_step, p_step_fast, v5, flags);
	bbMemFree(v0);
	bbMemFree(v5);
	return result;
}

int bmx_ImGui_InputScalarN(BBString * label, ImGuiDataType data_type, void* p_data, int components) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_InputScalarN(v0, data_type, p_data, components);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_InputScalarNEx(BBString * label, ImGuiDataType data_type, void* p_data, int components, const void* p_step, const void* p_step_fast, BBString * format, ImGuiInputTextFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v6 = (const char *)bbStringToUTF8String(format);
	int result = ImGui_InputScalarNEx(v0, data_type, p_data, components, p_step, p_step_fast, v6, flags);
	bbMemFree(v0);
	bbMemFree(v6);
	return result;
}

int bmx_ImGui_ColorEdit3(BBString * label, float col[3], ImGuiColorEditFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ColorEdit3(v0, col, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ColorEdit4(BBString * label, float col[4], ImGuiColorEditFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ColorEdit4(v0, col, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ColorPicker3(BBString * label, float col[3], ImGuiColorEditFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ColorPicker3(v0, col, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ColorPicker4(BBString * label, float col[4], ImGuiColorEditFlags flags, const float* ref_col) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ColorPicker4(v0, col, flags, ref_col);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ColorButton(BBString * desc_id, ImVec4 col, ImGuiColorEditFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(desc_id);
	int result = ImGui_ColorButton(v0, col, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ColorButtonEx(BBString * desc_id, ImVec4 col, ImGuiColorEditFlags flags, ImVec2 size) {
	const char * v0 = (const char *)bbStringToUTF8String(desc_id);
	int result = ImGui_ColorButtonEx(v0, col, flags, size);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_TreeNode(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_TreeNode(v0);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_TreeNodeStr(BBString * str_id, BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	const char * v1 = (const char *)bbStringToUTF8String(fmt);
	int result = ImGui_TreeNodeStr(v0, v1, NULL);
	bbMemFree(v0);
	bbMemFree(v1);
	return result;
}

int bmx_ImGui_TreeNodePtr(const void* ptr_id, BBString * fmt) {
	const char * v1 = (const char *)bbStringToUTF8String(fmt);
	int result = ImGui_TreeNodePtr(ptr_id, v1, NULL);
	bbMemFree(v1);
	return result;
}

int bmx_ImGui_TreeNodeV(BBString * str_id, BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	const char * v1 = (const char *)bbStringToUTF8String(fmt);
	int result = ImGui_TreeNodeV(v0, v1, NULL);
	bbMemFree(v0);
	bbMemFree(v1);
	return result;
}

int bmx_ImGui_TreeNodeVPtr(const void* ptr_id, BBString * fmt) {
	const char * v1 = (const char *)bbStringToUTF8String(fmt);
	int result = ImGui_TreeNodeVPtr(ptr_id, v1, NULL);
	bbMemFree(v1);
	return result;
}

int bmx_ImGui_TreeNodeEx(BBString * label, ImGuiTreeNodeFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_TreeNodeEx(v0, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_TreeNodeExStr(BBString * str_id, ImGuiTreeNodeFlags flags, BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	const char * v2 = (const char *)bbStringToUTF8String(fmt);
	int result = ImGui_TreeNodeExStr(v0, flags, v2, NULL);
	bbMemFree(v0);
	bbMemFree(v2);
	return result;
}

int bmx_ImGui_TreeNodeExPtr(const void* ptr_id, ImGuiTreeNodeFlags flags, BBString * fmt) {
	const char * v2 = (const char *)bbStringToUTF8String(fmt);
	int result = ImGui_TreeNodeExPtr(ptr_id, flags, v2, NULL);
	bbMemFree(v2);
	return result;
}

int bmx_ImGui_TreeNodeExV(BBString * str_id, ImGuiTreeNodeFlags flags, BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	const char * v2 = (const char *)bbStringToUTF8String(fmt);
	int result = ImGui_TreeNodeExV(v0, flags, v2, NULL);
	bbMemFree(v0);
	bbMemFree(v2);
	return result;
}

int bmx_ImGui_TreeNodeExVPtr(const void* ptr_id, ImGuiTreeNodeFlags flags, BBString * fmt) {
	const char * v2 = (const char *)bbStringToUTF8String(fmt);
	int result = ImGui_TreeNodeExVPtr(ptr_id, flags, v2, NULL);
	bbMemFree(v2);
	return result;
}

void bmx_ImGui_TreePush(BBString * str_id) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	ImGui_TreePush(v0);
	bbMemFree(v0);
}

int bmx_ImGui_CollapsingHeader(BBString * label, ImGuiTreeNodeFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_CollapsingHeader(v0, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_CollapsingHeaderBoolPtr(BBString * label, bool* p_visible, ImGuiTreeNodeFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_CollapsingHeaderBoolPtr(v0, p_visible, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_Selectable(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_Selectable(v0);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SelectableEx(BBString * label, bool selected, ImGuiSelectableFlags flags, ImVec2 size) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SelectableEx(v0, selected, flags, size);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SelectableBoolPtr(BBString * label, bool* p_selected, ImGuiSelectableFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SelectableBoolPtr(v0, p_selected, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_SelectableBoolPtrEx(BBString * label, bool* p_selected, ImGuiSelectableFlags flags, ImVec2 size) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_SelectableBoolPtrEx(v0, p_selected, flags, size);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_BeginListBox(BBString * label, ImVec2 size) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_BeginListBox(v0, size);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ListBox(BBString * label, int* current_item, const char*const items[], int items_count, int height_in_items) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ListBox(v0, current_item, items, items_count, height_in_items);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ListBoxCallback(BBString * label, int* current_item, const char* (*getter)(void* user_data, int idx) , void* user_data, int items_count) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ListBoxCallback(v0, current_item, getter, user_data, items_count);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_ListBoxCallbackEx(BBString * label, int* current_item, const char* (*getter)(void* user_data, int idx) , void* user_data, int items_count, int height_in_items) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_ListBoxCallbackEx(v0, current_item, getter, user_data, items_count, height_in_items);
	bbMemFree(v0);
	return result;
}

void bmx_ImGui_PlotLines(BBString * label, const float* values, int values_count) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	ImGui_PlotLines(v0, values, values_count);
	bbMemFree(v0);
}

void bmx_ImGui_PlotLinesEx(BBString * label, const float* values, int values_count, int values_offset, BBString * overlay_text, float scale_min, float scale_max, ImVec2 graph_size, int stride) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(overlay_text);
	ImGui_PlotLinesEx(v0, values, values_count, values_offset, v4, scale_min, scale_max, graph_size, stride);
	bbMemFree(v0);
	bbMemFree(v4);
}

void bmx_ImGui_PlotLinesCallback(BBString * label, float (*values_getter)(void* data, int idx) , void* data, int values_count) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	ImGui_PlotLinesCallback(v0, values_getter, data, values_count);
	bbMemFree(v0);
}

void bmx_ImGui_PlotLinesCallbackEx(BBString * label, float (*values_getter)(void* data, int idx) , void* data, int values_count, int values_offset, BBString * overlay_text, float scale_min, float scale_max, ImVec2 graph_size) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(overlay_text);
	ImGui_PlotLinesCallbackEx(v0, values_getter, data, values_count, values_offset, v5, scale_min, scale_max, graph_size);
	bbMemFree(v0);
	bbMemFree(v5);
}

void bmx_ImGui_PlotHistogram(BBString * label, const float* values, int values_count) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	ImGui_PlotHistogram(v0, values, values_count);
	bbMemFree(v0);
}

void bmx_ImGui_PlotHistogramEx(BBString * label, const float* values, int values_count, int values_offset, BBString * overlay_text, float scale_min, float scale_max, ImVec2 graph_size, int stride) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v4 = (const char *)bbStringToUTF8String(overlay_text);
	ImGui_PlotHistogramEx(v0, values, values_count, values_offset, v4, scale_min, scale_max, graph_size, stride);
	bbMemFree(v0);
	bbMemFree(v4);
}

void bmx_ImGui_PlotHistogramCallback(BBString * label, float (*values_getter)(void* data, int idx) , void* data, int values_count) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	ImGui_PlotHistogramCallback(v0, values_getter, data, values_count);
	bbMemFree(v0);
}

void bmx_ImGui_PlotHistogramCallbackEx(BBString * label, float (*values_getter)(void* data, int idx) , void* data, int values_count, int values_offset, BBString * overlay_text, float scale_min, float scale_max, ImVec2 graph_size) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v5 = (const char *)bbStringToUTF8String(overlay_text);
	ImGui_PlotHistogramCallbackEx(v0, values_getter, data, values_count, values_offset, v5, scale_min, scale_max, graph_size);
	bbMemFree(v0);
	bbMemFree(v5);
}

int bmx_ImGui_BeginMenu(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_BeginMenu(v0);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_BeginMenuEx(BBString * label, bool enabled) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_BeginMenuEx(v0, enabled);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_MenuItem(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_MenuItem(v0);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_MenuItemEx(BBString * label, BBString * shortcut, bool selected, bool enabled) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v1 = (const char *)bbStringToUTF8String(shortcut);
	int result = ImGui_MenuItemEx(v0, v1, selected, enabled);
	bbMemFree(v0);
	bbMemFree(v1);
	return result;
}

int bmx_ImGui_MenuItemBoolPtr(BBString * label, BBString * shortcut, bool* p_selected, bool enabled) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	const char * v1 = (const char *)bbStringToUTF8String(shortcut);
	int result = ImGui_MenuItemBoolPtr(v0, v1, p_selected, enabled);
	bbMemFree(v0);
	bbMemFree(v1);
	return result;
}

void bmx_ImGui_SetTooltip(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_SetTooltip(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_SetTooltipV(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_SetTooltipV(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_SetItemTooltip(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_SetItemTooltip(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_SetItemTooltipV(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_SetItemTooltipV(v0, NULL);
	bbMemFree(v0);
}

int bmx_ImGui_BeginPopup(BBString * str_id, ImGuiWindowFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_BeginPopup(v0, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_BeginPopupModal(BBString * name, bool* p_open, ImGuiWindowFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(name);
	int result = ImGui_BeginPopupModal(v0, p_open, flags);
	bbMemFree(v0);
	return result;
}

void bmx_ImGui_OpenPopup(BBString * str_id, ImGuiPopupFlags popup_flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	ImGui_OpenPopup(v0, popup_flags);
	bbMemFree(v0);
}

void bmx_ImGui_OpenPopupOnItemClick(BBString * str_id, ImGuiPopupFlags popup_flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	ImGui_OpenPopupOnItemClick(v0, popup_flags);
	bbMemFree(v0);
}

int bmx_ImGui_BeginPopupContextItemEx(BBString * str_id, ImGuiPopupFlags popup_flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_BeginPopupContextItemEx(v0, popup_flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_BeginPopupContextWindowEx(BBString * str_id, ImGuiPopupFlags popup_flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_BeginPopupContextWindowEx(v0, popup_flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_BeginPopupContextVoidEx(BBString * str_id, ImGuiPopupFlags popup_flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_BeginPopupContextVoidEx(v0, popup_flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_IsPopupOpen(BBString * str_id, ImGuiPopupFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_IsPopupOpen(v0, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_BeginTable(BBString * str_id, int columns, ImGuiTableFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_BeginTable(v0, columns, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_BeginTableEx(BBString * str_id, int columns, ImGuiTableFlags flags, ImVec2 outer_size, float inner_width) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_BeginTableEx(v0, columns, flags, outer_size, inner_width);
	bbMemFree(v0);
	return result;
}

void bmx_ImGui_TableSetupColumn(BBString * label, ImGuiTableColumnFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	ImGui_TableSetupColumn(v0, flags);
	bbMemFree(v0);
}

void bmx_ImGui_TableSetupColumnEx(BBString * label, ImGuiTableColumnFlags flags, float init_width_or_weight, ImGuiID user_id) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	ImGui_TableSetupColumnEx(v0, flags, init_width_or_weight, user_id);
	bbMemFree(v0);
}

void bmx_ImGui_TableHeader(BBString * label) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	ImGui_TableHeader(v0);
	bbMemFree(v0);
}

BBString * bmx_ImGui_TableGetColumnName(int column_n) {
	BBString * result = bbStringFromUTF8String((const unsigned char *)ImGui_TableGetColumnName(column_n));
	return result;
}

void bmx_ImGui_ColumnsEx(int count, BBString * id, bool borders) {
	const char * v1 = (const char *)bbStringToUTF8String(id);
	ImGui_ColumnsEx(count, v1, borders);
	bbMemFree(v1);
}

int bmx_ImGui_BeginTabBar(BBString * str_id, ImGuiTabBarFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(str_id);
	int result = ImGui_BeginTabBar(v0, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_BeginTabItem(BBString * label, bool* p_open, ImGuiTabItemFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_BeginTabItem(v0, p_open, flags);
	bbMemFree(v0);
	return result;
}

int bmx_ImGui_TabItemButton(BBString * label, ImGuiTabItemFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(label);
	int result = ImGui_TabItemButton(v0, flags);
	bbMemFree(v0);
	return result;
}

void bmx_ImGui_SetTabItemClosed(BBString * tab_or_docked_window_label) {
	const char * v0 = (const char *)bbStringToUTF8String(tab_or_docked_window_label);
	ImGui_SetTabItemClosed(v0);
	bbMemFree(v0);
}

void bmx_ImGui_LogToFile(int auto_open_depth, BBString * filename) {
	const char * v1 = (const char *)bbStringToUTF8String(filename);
	ImGui_LogToFile(auto_open_depth, v1);
	bbMemFree(v1);
}

void bmx_ImGui_LogText(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_LogText(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_LogTextV(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_LogTextV(v0, NULL);
	bbMemFree(v0);
}

int bmx_ImGui_SetDragDropPayload(BBString * kind, const void* data, size_t sz, ImGuiCond cond) {
	const char * v0 = (const char *)bbStringToUTF8String(kind);
	int result = ImGui_SetDragDropPayload(v0, data, sz, cond);
	bbMemFree(v0);
	return result;
}

const ImGuiPayload* bmx_ImGui_AcceptDragDropPayload(BBString * kind, ImGuiDragDropFlags flags) {
	const char * v0 = (const char *)bbStringToUTF8String(kind);
	const ImGuiPayload* result = ImGui_AcceptDragDropPayload(v0, flags);
	bbMemFree(v0);
	return result;
}

BBString * bmx_ImGui_GetStyleColorName(ImGuiCol idx) {
	BBString * result = bbStringFromUTF8String((const unsigned char *)ImGui_GetStyleColorName(idx));
	return result;
}

ImVec2 bmx_ImGui_CalcTextSize(BBString * text) {
	const char * v0 = (const char *)bbStringToUTF8String(text);
	ImVec2 result = ImGui_CalcTextSize(v0);
	bbMemFree(v0);
	return result;
}

ImVec2 bmx_ImGui_CalcTextSizeEx(BBString * text, BBString * text_end, bool hide_text_after_double_hash, float wrap_width) {
	const char * v0 = (const char *)bbStringToUTF8String(text);
	const char * v1 = (const char *)bbStringToUTF8String(text_end);
	ImVec2 result = ImGui_CalcTextSizeEx(v0, v1, hide_text_after_double_hash, wrap_width);
	bbMemFree(v0);
	bbMemFree(v1);
	return result;
}

BBString * bmx_ImGui_GetKeyName(ImGuiKey key) {
	BBString * result = bbStringFromUTF8String((const unsigned char *)ImGui_GetKeyName(key));
	return result;
}

BBString * bmx_ImGui_GetClipboardText() {
	BBString * result = bbStringFromUTF8String((const unsigned char *)ImGui_GetClipboardText());
	return result;
}

void bmx_ImGui_SetClipboardText(BBString * text) {
	const char * v0 = (const char *)bbStringToUTF8String(text);
	ImGui_SetClipboardText(v0);
	bbMemFree(v0);
}

void bmx_ImGui_LoadIniSettingsFromDisk(BBString * ini_filename) {
	const char * v0 = (const char *)bbStringToUTF8String(ini_filename);
	ImGui_LoadIniSettingsFromDisk(v0);
	bbMemFree(v0);
}

void bmx_ImGui_LoadIniSettingsFromMemory(BBString * ini_data, size_t ini_size) {
	const char * v0 = (const char *)bbStringToUTF8String(ini_data);
	ImGui_LoadIniSettingsFromMemory(v0, ini_size);
	bbMemFree(v0);
}

void bmx_ImGui_SaveIniSettingsToDisk(BBString * ini_filename) {
	const char * v0 = (const char *)bbStringToUTF8String(ini_filename);
	ImGui_SaveIniSettingsToDisk(v0);
	bbMemFree(v0);
}

BBString * bmx_ImGui_SaveIniSettingsToMemory(size_t* out_ini_size) {
	BBString * result = bbStringFromUTF8String((const unsigned char *)ImGui_SaveIniSettingsToMemory(out_ini_size));
	return result;
}

void bmx_ImGui_DebugTextEncoding(BBString * text) {
	const char * v0 = (const char *)bbStringToUTF8String(text);
	ImGui_DebugTextEncoding(v0);
	bbMemFree(v0);
}

int bmx_ImGui_DebugCheckVersionAndDataLayout(BBString * version_str, size_t sz_io, size_t sz_style, size_t sz_vec2, size_t sz_vec4, size_t sz_drawvert, size_t sz_drawidx) {
	const char * v0 = (const char *)bbStringToUTF8String(version_str);
	int result = ImGui_DebugCheckVersionAndDataLayout(v0, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx);
	bbMemFree(v0);
	return result;
}

void bmx_ImGui_DebugLog(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_DebugLog(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGui_DebugLogV(BBString * fmt) {
	const char * v0 = (const char *)bbStringToUTF8String(fmt);
	ImGui_DebugLogV(v0, NULL);
	bbMemFree(v0);
}

void bmx_ImGuiIO_AddInputCharactersUTF8(ImGuiIO* this, BBString * str) {
	const char * v1 = (const char *)bbStringToUTF8String(str);
	ImGuiIO_AddInputCharactersUTF8(this, v1);
	bbMemFree(v1);
}

void bmx_ImGuiInputTextCallbackData_InsertChars(ImGuiInputTextCallbackData* this, int pos, BBString * text, BBString * text_end) {
	const char * v2 = (const char *)bbStringToUTF8String(text);
	const char * v3 = (const char *)bbStringToUTF8String(text_end);
	ImGuiInputTextCallbackData_InsertChars(this, pos, v2, v3);
	bbMemFree(v2);
	bbMemFree(v3);
}

int bmx_ImGuiPayload_IsDataType(const ImGuiPayload* this, BBString * kind) {
	const char * v1 = (const char *)bbStringToUTF8String(kind);
	int result = ImGuiPayload_IsDataType(this, v1);
	bbMemFree(v1);
	return result;
}

int bmx_ImGuiTextFilter_Draw(ImGuiTextFilter* this, BBString * label, float width) {
	const char * v1 = (const char *)bbStringToUTF8String(label);
	int result = ImGuiTextFilter_Draw(this, v1, width);
	bbMemFree(v1);
	return result;
}

int bmx_ImGuiTextFilter_PassFilter(const ImGuiTextFilter* this, BBString * text, BBString * text_end) {
	const char * v1 = (const char *)bbStringToUTF8String(text);
	const char * v2 = (const char *)bbStringToUTF8String(text_end);
	int result = ImGuiTextFilter_PassFilter(this, v1, v2);
	bbMemFree(v1);
	bbMemFree(v2);
	return result;
}

BBString * bmx_ImGuiTextBuffer_begin(const ImGuiTextBuffer* this) {
	BBString * result = bbStringFromUTF8String((const unsigned char *)ImGuiTextBuffer_begin(this));
	return result;
}

BBString * bmx_ImGuiTextBuffer_end(const ImGuiTextBuffer* this) {
	BBString * result = bbStringFromUTF8String((const unsigned char *)ImGuiTextBuffer_end(this));
	return result;
}

BBString * bmx_ImGuiTextBuffer_c_str(const ImGuiTextBuffer* this) {
	BBString * result = bbStringFromUTF8String((const unsigned char *)ImGuiTextBuffer_c_str(this));
	return result;
}

void bmx_ImGuiTextBuffer_append(ImGuiTextBuffer* this, BBString * str, BBString * str_end) {
	const char * v1 = (const char *)bbStringToUTF8String(str);
	const char * v2 = (const char *)bbStringToUTF8String(str_end);
	ImGuiTextBuffer_append(this, v1, v2);
	bbMemFree(v1);
	bbMemFree(v2);
}

void bmx_ImGuiTextBuffer_appendf(ImGuiTextBuffer* this, BBString * fmt) {
	const char * v1 = (const char *)bbStringToUTF8String(fmt);
	ImGuiTextBuffer_appendf(this, v1, NULL);
	bbMemFree(v1);
}

void bmx_ImGuiTextBuffer_appendfv(ImGuiTextBuffer* this, BBString * fmt) {
	const char * v1 = (const char *)bbStringToUTF8String(fmt);
	ImGuiTextBuffer_appendfv(this, v1, NULL);
	bbMemFree(v1);
}

void bmx_ImDrawList_AddText(ImDrawList* this, ImVec2 pos, ImU32 col, BBString * text_begin) {
	const char * v3 = (const char *)bbStringToUTF8String(text_begin);
	ImDrawList_AddText(this, pos, col, v3);
	bbMemFree(v3);
}

void bmx_ImDrawList_AddTextEx(ImDrawList* this, ImVec2 pos, ImU32 col, BBString * text_begin, BBString * text_end) {
	const char * v3 = (const char *)bbStringToUTF8String(text_begin);
	const char * v4 = (const char *)bbStringToUTF8String(text_end);
	ImDrawList_AddTextEx(this, pos, col, v3, v4);
	bbMemFree(v3);
	bbMemFree(v4);
}

void bmx_ImDrawList_AddTextImFontPtr(ImDrawList* this, ImFont* font, float font_size, ImVec2 pos, ImU32 col, BBString * text_begin) {
	const char * v5 = (const char *)bbStringToUTF8String(text_begin);
	ImDrawList_AddTextImFontPtr(this, font, font_size, pos, col, v5);
	bbMemFree(v5);
}

void bmx_ImDrawList_AddTextImFontPtrEx(ImDrawList* this, ImFont* font, float font_size, ImVec2 pos, ImU32 col, BBString * text_begin, BBString * text_end, float wrap_width, const ImVec4* cpu_fine_clip_rect) {
	const char * v5 = (const char *)bbStringToUTF8String(text_begin);
	const char * v6 = (const char *)bbStringToUTF8String(text_end);
	ImDrawList_AddTextImFontPtrEx(this, font, font_size, pos, col, v5, v6, wrap_width, cpu_fine_clip_rect);
	bbMemFree(v5);
	bbMemFree(v6);
}

void bmx_ImFontGlyphRangesBuilder_AddText(ImFontGlyphRangesBuilder* this, BBString * text, BBString * text_end) {
	const char * v1 = (const char *)bbStringToUTF8String(text);
	const char * v2 = (const char *)bbStringToUTF8String(text_end);
	ImFontGlyphRangesBuilder_AddText(this, v1, v2);
	bbMemFree(v1);
	bbMemFree(v2);
}

ImFont* bmx_ImFontAtlas_AddFontFromFileTTF(ImFontAtlas* this, BBString * filename, float size_pixels, const ImFontConfig* font_cfg, const ImWchar* glyph_ranges) {
	const char * v1 = (const char *)bbStringToUTF8String(filename);
	ImFont* result = ImFontAtlas_AddFontFromFileTTF(this, v1, size_pixels, font_cfg, glyph_ranges);
	bbMemFree(v1);
	return result;
}

ImFont* bmx_ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(ImFontAtlas* this, BBString * compressed_font_data_base85, float size_pixels, const ImFontConfig* font_cfg, const ImWchar* glyph_ranges) {
	const char * v1 = (const char *)bbStringToUTF8String(compressed_font_data_base85);
	ImFont* result = ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(this, v1, size_pixels, font_cfg, glyph_ranges);
	bbMemFree(v1);
	return result;
}

BBString * bmx_ImFont_GetDebugName(const ImFont* this) {
	BBString * result = bbStringFromUTF8String((const unsigned char *)ImFont_GetDebugName(this));
	return result;
}

