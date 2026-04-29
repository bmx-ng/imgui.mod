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

Import ImGui.ImGui

Import "../imgui.mod/imgui/*.h"

Import "textedit/*.h"
Import "textedit/TextEditor.cpp"

Import "glue.cpp"
Import "bmax_language.cpp"

Extern

	Function bmx_imgui_imcolortextedit_create:Byte Ptr()
	Function bmx_imgui_imcolortextedit_free(editor:Byte Ptr)

	Function bmx_imgui_imcolortextedit_Render(editor:Byte Ptr, title:String)
	Function bmx_imgui_imcolortextedit_RenderEx(editor:Byte Ptr, title:String, size:SImVec2, border:Int)

	Function bmx_imgui_imcolortextedit_SetTabSize(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_GetTabSize:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetInsertSpacesOnTabs(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsInsertSpacesOnTabs:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetLineSpacing(editor:Byte Ptr, value:Float)
	Function bmx_imgui_imcolortextedit_GetLineSpacing:Float(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetReadOnlyEnabled(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsReadOnlyEnabled:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetAutoIndentEnabled(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsAutoIndentEnabled:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetShowWhitespacesEnabled(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsShowWhitespacesEnabled:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetShowSpacesEnabled(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsShowSpacesEnabled:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetShowTabsEnabled(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsShowTabsEnabled:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetShowLineNumbersEnabled(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsShowLineNumbersEnabled:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetShowScrollbarMiniMapEnabled(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsShowScrollbarMiniMapEnabled:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetShowPanScrollIndicatorEnabled(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsShowPanScrollIndicatorEnabled:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetShowMatchingBrackets(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsShowingMatchingBrackets:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetCompletePairedGlyphs(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsCompletingPairedGlyphs:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetOverwriteEnabled(editor:Byte Ptr, value:Int)
	Function bmx_imgui_imcolortextedit_IsOverwriteEnabled:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetMiddleMousePanMode(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetMiddleMouseScrollMode(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_IsMiddleMousePanMode:Int(editor:Byte Ptr)

	Function bmx_imgui_imcolortextedit_SetText(editor:Byte Ptr, text:String)
	Function bmx_imgui_imcolortextedit_GetText:String(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetCursorText:String(editor:Byte Ptr, cursor:Size_T)
	Function bmx_imgui_imcolortextedit_GetLineText:String(editor:Byte Ptr, line:Int)
	Function bmx_imgui_imcolortextedit_GetSectionText:String(editor:Byte Ptr, startLine:Int, startColumn:Int, endLine:Int, endColumn:Int)
	Function bmx_imgui_imcolortextedit_ReplaceSectionText(editor:Byte Ptr, startLine:Int, startColumn:Int, endLine:Int, endColumn:Int, text:String)
	Function bmx_imgui_imcolortextedit_ClearText(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_IsEmpty:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetLineCount:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetFocus(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_Cut(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_Copy(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_Paste(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_Undo(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_Redo(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_CanUndo:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_CanRedo:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetUndoIndex:Size_T(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetCursor(editor:Byte Ptr, line:Int, column:Int)
	Function bmx_imgui_imcolortextedit_SelectAll(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SelectLine(editor:Byte Ptr, line:Int)
	Function bmx_imgui_imcolortextedit_SelectLines(editor:Byte Ptr, _start:Int, _end:Int)
	Function bmx_imgui_imcolortextedit_SelectRegion(editor:Byte Ptr, startLine:Int, startColumn:Int, endLine:Int, endColumn:Int)
	Function bmx_imgui_imcolortextedit_SelectToBrackets(editor:Byte Ptr, includeBrackets:Int)
	Function bmx_imgui_imcolortextedit_GrowSelectionsToCurlyBrackets(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_ShrinkSelectionsToCurlyBrackets(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_AddNextOccurrence(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SelectAllOccurrences(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_AnyCursorHasSelection:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_AllCursorsHaveSelection:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_CurrentCursorHasSelection:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_ClearCursors(editor:Byte Ptr)
	
	Function bmx_imgui_imcolortextedit_GetNumberOfCursors:Size_T(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetCursor(editor:Byte Ptr, line:Int Var, column:Int Var, cursor:Size_T)
	Function bmx_imgui_imcolortextedit_GetCursorSelection(editor:Byte Ptr, startLine:Int Var, startColumn:Int Var, endLine:Int Var, endColumn:Int Var, cursor:Size_T)
	Function bmx_imgui_imcolortextedit_GetMainCursor(editor:Byte Ptr, line:Int Var, column:Int Var)
	Function bmx_imgui_imcolortextedit_GetCurrentCursor(editor:Byte Ptr, line:Int Var, column:Int Var)
	Function bmx_imgui_imcolortextedit_GetMainCursorPosition:SCursorPosition(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetCurrentCursorPosition:SCursorPosition(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetCursorPosition:SCursorPosition(editor:Byte Ptr, cursor:Size_T)
	Function bmx_imgui_imcolortextedit_GetCursorSelectionEx:SCursorSelection(editor:Byte Ptr, cursor:Size_T)
	Function bmx_imgui_imcolortextedit_GetMainCursorSelection:SCursorSelection(editor:Byte Ptr)

	Function bmx_imgui_imcolortextedit_GetWordAtScreenPos:String(editor:Byte Ptr, screenPos:SImVec2)
	Function bmx_imgui_imcolortextedit_ScrollToLine(editor:Byte Ptr, line:Int, alignment:EScroll)
	Function bmx_imgui_imcolortextedit_GetFirstVisibleLine:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetLastVisibleLine:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetFirstVisibleColumn:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetLastVisibleColumn:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetLineHeight:Float(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_GetGlyphWidth:Float(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SelectFirstOccurrenceOf(editor:Byte Ptr, text:String, caseSensitive:Int, wholeWord:Int)
	Function bmx_imgui_imcolortextedit_SelectNextOccurrenceOf(editor:Byte Ptr, text:String, caseSensitive:Int, wholeWord:Int)
	Function bmx_imgui_imcolortextedit_SelectAllOccurrencesOf(editor:Byte Ptr, text:String, caseSensitive:Int, wholeWord:Int)
	Function bmx_imgui_imcolortextedit_ReplaceTextInCurrentCursor(editor:Byte Ptr, text:String)
	Function bmx_imgui_imcolortextedit_ReplaceTextInAllCursors(editor:Byte Ptr, text:String)

	Function bmx_imgui_imcolortextedit_OpenFindReplaceWindow(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_CloseFindReplaceWindow(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SetFindButtonLabel(editor:Byte Ptr, label:String)
	Function bmx_imgui_imcolortextedit_SetFindAllButtonLabel(editor:Byte Ptr, label:String)
	Function bmx_imgui_imcolortextedit_SetReplaceButtonLabel(editor:Byte Ptr, label:String)
	Function bmx_imgui_imcolortextedit_SetReplaceAllButtonLabel(editor:Byte Ptr, label:String)
	Function bmx_imgui_imcolortextedit_HasFindString:Int(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_FindNext(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_FindAll(editor:Byte Ptr)

	Function bmx_imgui_imcolortextedit_AddMarker(editor:Byte Ptr, line:Int, lineNumberColor:UInt, textColor:UInt, lineNumberTooltip:String, textTooltip:String)
	Function bmx_imgui_imcolortextedit_ClearMarkers(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_HasMarkers:Int(editor:Byte Ptr)

	Function bmx_imgui_imcolortextedit_IndentLines(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_DeindentLines(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_MoveUpLines(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_MoveDownLines(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_ToggleComments(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SelectionToLowerCase(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SelectionToUpperCase(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_StripTrailingWhitespaces(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_TabsToSpaces(editor:Byte Ptr)
	Function bmx_imgui_imcolortextedit_SpacesToTabs(editor:Byte Ptr)

	Function bmx_imgui_imcolortextedit_GetLanguage:Byte Ptr(lang:EImTextEditLanguage)
	Function bmx_imgui_imcolortextedit_language_blitzmax:Byte Ptr()
	Function bmx_imgui_imcolortextedit_setlanguage(editor:Byte Ptr, language:Byte Ptr)
End Extern

Struct SCursorPosition
	Field _line:Int
	Field _column:Int
End Struct

Struct SCursorSelection
	Field _start:SCursorPosition
	Field _end:SCursorPosition
End Struct

Enum EScroll
	_AlignTop
	_AlignMiddle
	_AlignBottom
End Enum

Enum EImTextEditLanguage
	_None = 0
	_C
	_Cpp
	_Cs
	_AngelScript
	_Lua
	_Python
	_Glsl
	_Hlsl
	_Json
	_Markdown
	_Sql
	_BlitzMax
End Enum
