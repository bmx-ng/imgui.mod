/*
Copyright (c) 2026 Bruce A Henderson

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/
#include "imgui_toggle.h"
#include "imgui_toggle_palette.h"
#include "imgui_toggle_presets.h"
#include "brl.mod/blitz.mod/blitz.h"

extern "C" {

    int bmx_ImGui_Toggle_value(BBString * label, int * value) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue);
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    int bmx_ImGui_Toggle_value_size(BBString * label, int * value, ImVec2 size) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue, ImVec2(size.x, size.y));
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    int bmx_ImGui_Toggle_value_flags(BBString * label, int * value, int flags) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue, (ImGuiToggleFlags)flags);
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    int bmx_ImGui_Toggle_value_flags_size(BBString * label, int * value, int flags, ImVec2 size) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue, (ImGuiToggleFlags)flags, ImVec2(size.x, size.y));
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    int bmx_ImGui_Toggle_value_flags_anim(BBString * label, int * value, int flags, float animation_duration) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue, (ImGuiToggleFlags)flags, animation_duration);
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    int bmx_ImGui_Toggle_value_flags_anim_size(BBString * label, int * value, int flags, float animation_duration, ImVec2 size) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue, (ImGuiToggleFlags)flags, animation_duration, ImVec2(size.x, size.y));
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    int bmx_ImGui_Toggle_value_flags_round(BBString * label, int * value, int flags, float frame_rounding, float knob_rounding) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue, (ImGuiToggleFlags)flags, frame_rounding, knob_rounding);
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    int bmx_ImGui_Toggle_value_flags_round_size(BBString * label, int * value, int flags, float frame_rounding, float knob_rounding, ImVec2 size) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue, (ImGuiToggleFlags)flags, frame_rounding, knob_rounding, ImVec2(size.x, size.y));
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    int bmx_ImGui_Toggle_value_flags_anim_round(BBString * label, int * value, int flags, float animation_duration, float frame_rounding, float knob_rounding) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue, (ImGuiToggleFlags)flags, animation_duration, frame_rounding, knob_rounding);
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    int bmx_ImGui_Toggle_value_flags_anim_round_size(BBString * label, int * value, int flags, float animation_duration, float frame_rounding, float knob_rounding, ImVec2 size) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue, (ImGuiToggleFlags)flags, animation_duration, frame_rounding, knob_rounding, ImVec2(size.x, size.y));
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    int bmx_ImGui_Toggle_value_config(BBString * label, int * value, ImGuiToggleConfig config) {
        char* c0 = (char*)bbStringToUTF8String(label);
        bool bvalue = (*value) != 0;
        bool result = ImGui::Toggle(c0, &bvalue, config);
        bbMemFree(c0);
        *value = bvalue ? 1 : 0;
        return result ? 1 : 0;
    }

    ImGuiToggleConfig bmx_ImGui_Toggle_Config_DefaultStyle() {
        return ImGuiTogglePresets::DefaultStyle();
    }

    ImGuiToggleConfig bmx_ImGui_Toggle_Config_RectangleStyle() {
        return ImGuiTogglePresets::RectangleStyle();
    }

    ImGuiToggleConfig bmx_ImGui_Toggle_Config_GlowingStyle() {
        return ImGuiTogglePresets::GlowingStyle();
    }

    ImGuiToggleConfig bmx_ImGui_Toggle_Config_iOSStyle(float size_scale, int light_mode) {
        return ImGuiTogglePresets::iOSStyle(size_scale, light_mode != 0);
    }

    ImGuiToggleConfig bmx_ImGui_Toggle_Config_MaterialStyle(float size_scale) {
        return ImGuiTogglePresets::MaterialStyle(size_scale);
    }

    ImGuiToggleConfig bmx_ImGui_Toggle_Config_MinecraftStyle(float size_scale) {
        return ImGuiTogglePresets::MinecraftStyle(size_scale);
    }
}
