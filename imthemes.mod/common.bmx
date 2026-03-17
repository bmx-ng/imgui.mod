' Copyright (c) 2026 Bruce A Henderson
'
' Permission is hereby granted, free of charge, to any person obtaining a copy
' of this software and associated documentation files (the "Software"), to deal
' in the Software without restriction, including without limitation the rights
' to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
' copies of the Software, and to permit persons to whom the Software is
' furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all
' copies or substantial portions of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
' IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
' FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
' AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
' LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
' SOFTWARE.
'
SuperStrict

Import "../imgui.mod/imgui/*.h"
Import "hello_imgui/*.h"
Import "hello_imgui/imgui_theme.cpp"
Import "glue.cpp"

Rem
bbdoc: Applies a theme to ImGui.
End Rem
Function ImGui_ApplyTheme(theme:EImGuiTheme)
	_ImGui_ApplyTheme(theme)
End Function

Rem
bbdoc: Applies a theme to ImGui by name.
End Rem
Function ImGui_ApplyTheme(theme:String)
	_ImGui_ApplyTheme_Name(theme)
End Function

Rem
bbdoc: Gets the name of a theme.
End Rem
Function ImGui_ThemeName:String(theme:EImGuiTheme)
	Return _ImGuiTheme_Name(theme)
End Function

Extern
	Function _ImGui_ApplyTheme(theme:EImGuiTheme)="bmx_ImGui_ApplyTheme"
	Function _ImGui_ApplyTheme_Name(theme:String)="bmx_ImGui_ApplyTheme_Name"
	Function _ImGuiTheme_Name:String(theme:EImGuiTheme)="bmx_ImGuiTheme_Name"
End Extern

Rem
bbdoc: Represents the available ImGui themes.
End Rem
Enum EImGuiTheme
	_ImGuiColorsClassic = 0
	_ImGuiColorsDark
	_ImGuiColorsLight
	_MaterialFlat
	_PhotoshopStyle
	_GrayVariations
	_GrayVariations_Darker
	_MicrosoftStyle
	_Cherry
	_Darcula
	_DarculaDarker
	_LightRounded
	_SoDark_AccentBlue
	_SoDark_AccentYellow
	_SoDark_AccentRed
	_BlackIsBlack
	_WhiteIsWhite
End Enum
