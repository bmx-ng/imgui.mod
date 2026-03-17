#include "imgui_theme.h"
#include "brl.mod/blitz.mod/blitz.h"

extern "C" {

    void bmx_ImGui_ApplyTheme(int theme) {
        ImGuiTheme::ImGuiTheme_ themeEnum = static_cast<ImGuiTheme::ImGuiTheme_>(theme);
        ImGuiTheme::ApplyTheme(themeEnum);
    }

    void bmx_ImGui_ApplyTheme_Name(BBString * name) {
        if (name == &bbEmptyString) {
            return;
        }
        const char* n = (char*)bbStringToCString(name);
        ImGuiTheme::ImGuiTheme_ themeEnum = ImGuiTheme::ImGuiTheme_FromName(n);
        ImGuiTheme::ApplyTheme(themeEnum);
        bbMemFree((void*)n);
    }

    BBString * bmx_ImGuiTheme_Name(int theme) {
        ImGuiTheme::ImGuiTheme_ themeEnum = static_cast<ImGuiTheme::ImGuiTheme_>(theme);
        const char* name = ImGuiTheme::ImGuiTheme_Name(themeEnum);
        return bbStringFromCString(name);
    }
}
