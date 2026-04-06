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

Import Net.Html
Import ImGui.ImGui

Import "../imgui.mod/imgui/*.h"
Import "../../net.mod/html.mod/litehtml/include/*.h"

Import "imhtml/*.h"
Import "imhtml/imhtml.cpp"

Import "glue.cpp"

Extern

	Function _ImHTML_Canvas:Int(id:String, html:String, width:Float) = "bmx_ImHTML_Canvas"
	Function _ImHTML_CanvasEx:Int(id:String, html:String, width:Float, clickedURL:String Var) = "bmx_ImHTML_CanvasEx"

	Function bmx_ImHTML_GetConfig:Byte Ptr()
	Function bmx_ImHTML_SetConfig(config:Byte Ptr)
	Function bmx_ImHTML_PushConfig(config:Byte Ptr)
	Function bmx_ImHTML_PopConfig()
	Function bmx_ImHTML_CreateConfig:Byte Ptr()
	Function bmx_ImHTML_FreeConfig(config:Byte Ptr)

	Function bmx_ImHTML_Config_GetBaseFontSize:Float(config:Byte Ptr)
	Function bmx_ImHTML_Config_SetBaseFontSize(config:Byte Ptr, size:Float)
	Function bmx_ImHTML_Config_GetDefaultFont:Byte Ptr(config:Byte Ptr)
	Function bmx_ImHTML_Config_SetDefaultFont(config:Byte Ptr, family:Byte Ptr)
	Function bmx_ImHTML_Config_GetFontFamily:Byte Ptr(config:Byte Ptr, name:String)
	Function bmx_ImHTML_Config_SetFontFamily(config:Byte Ptr, name:String, family:Byte Ptr)
	Function bmx_ImHTML_FontFamily_Create:Byte Ptr()
	Function bmx_ImHTML_FontFamily_Free(family:Byte Ptr)

	Function bmx_ImHTML_FontFamily_GetRegular:Byte Ptr(family:Byte Ptr)
	Function bmx_ImHTML_FontFamily_GetBold:Byte Ptr(family:Byte Ptr)
	Function bmx_ImHTML_FontFamily_GetItalic:Byte Ptr(family:Byte Ptr)
	Function bmx_ImHTML_FontFamily_GetBoldItalic:Byte Ptr(family:Byte Ptr)
	Function bmx_ImHTML_FontFamily_SetRegular(family:Byte Ptr, font:Byte Ptr)
	Function bmx_ImHTML_FontFamily_SetBold(family:Byte Ptr, font:Byte Ptr)
	Function bmx_ImHTML_FontFamily_SetItalic(family:Byte Ptr, font:Byte Ptr)
	Function bmx_ImHTML_FontFamily_SetBoldItalic(family:Byte Ptr, font:Byte Ptr)
End Extern
