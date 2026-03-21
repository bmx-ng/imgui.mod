#include "dcimgui.h"
#include "dcimgui_internal.h"
#include "brl.mod/blitz.mod/blitz.h"

void bmx_ImGui_DockBuilderDockWindow(BBString * window_name, ImGuiID node_id) {
    const char * v0 = (const char *)bbStringToUTF8String(window_name);
    ImGui_DockBuilderDockWindow(v0, node_id);
    bbMemFree(v0);
}

void bmx_ImGui_DockBuilderCopyWindowSettings(BBString * src_window_name, BBString * dst_window_name) {
    const char * v0 = (const char *)bbStringToUTF8String(src_window_name);
    const char * v1 = (const char *)bbStringToUTF8String(dst_window_name);
    ImGui_DockBuilderCopyWindowSettings(v0, v1);
    bbMemFree(v0);
    bbMemFree(v1);
}
