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

Rem
bbdoc: A text editor for ImGui.
End Rem
Module ImGui.ImColorTextEdit

ModuleInfo "Version: 1.00"
ModuleInfo "License: MIT"
ModuleInfo "Copyright: imgui TextEditor - 2024-2026 Johan A. Goossens."
ModuleInfo "Copyright: BlitzMax wrapper - 2026 Bruce A Henderson"

ModuleInfo "History: 1.00 Initial Release"

ModuleInfo "CPP_OPTS: -std=c++17"

Import "common.bmx"

'
' Build notes : 
'
'  TextEditor.cpp
'   Added resetting of 'cursorAnimationTimer' for changes to text/position to prevent cursor from disappearing when typing or moving the cursor.
'

Rem
bbdoc: A syntax highlighting text editor for ImGui.
about:
Call #Render() to render the editor. This must be called between ImGui_Begin() and ImGui_End().
End Rem
Type TImTextEditor

	Field editorPtr:Byte Ptr

	Rem
	bbdoc: Creates a new text editor instance.
	End Rem
	Method New()
		editorPtr = bmx_imgui_imcolortextedit_create()
	End Method

	Rem
	bbdoc: Frees the resources used by the text editor.
	about: After calling this method, the editor instance should not be used anymore.
	End Rem
	Method Free()
		If editorPtr
			bmx_imgui_imcolortextedit_free(editorPtr)
			editorPtr = Null
		End If
	End Method

	Method Delete()
		Self.Free()
	End Method

	Rem
	bbdoc: Renders the text editor with the given unique title.
	about: Must be called between ImGui_Begin() and ImGui_End().
	End Rem
	Method Render(title:String)
		bmx_imgui_imcolortextedit_Render(editorPtr, title)
	End Method

	Rem
	bbdoc: Renders the text editor with the given unique title and size.
	about: Must be called between ImGui_Begin() and ImGui_End().
	End Rem
	Method Render(title:String, size:SImVec2, border:Int = False)
		bmx_imgui_imcolortextedit_RenderEx(editorPtr, title, size, border)
	End Method

	Rem
	bbdoc: Sets the tab size in number of spaces. Default is 4.
	about: This needs to be set before any text is added to the editor.
	End Rem
	Method SetTabSize(value:Int)
		bmx_imgui_imcolortextedit_SetTabSize(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets the tab size in number of spaces.
	End Rem
	Method GetTabSize:Int()
		Return bmx_imgui_imcolortextedit_GetTabSize(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether to insert spaces when the tab key is pressed.
	End Rem
	Method SetInsertSpacesOnTabs(value:Int)
		bmx_imgui_imcolortextedit_SetInsertSpacesOnTabs(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether to insert spaces when the tab key is pressed.
	End Rem
	Method IsInsertSpacesOnTabs:Int()
		Return bmx_imgui_imcolortextedit_IsInsertSpacesOnTabs(editorPtr)
	End Method

	Rem
	bbdoc: Sets the line spacing. The default is 1.
	End Rem
	Method SetLineSpacing(value:Float)
		bmx_imgui_imcolortextedit_SetLineSpacing(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets the line spacing.
	End Rem
	Method GetLineSpacing:Float()
		Return bmx_imgui_imcolortextedit_GetLineSpacing(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether the editor is read-only.
	End Rem
	Method SetReadOnlyEnabled(value:Int)
		bmx_imgui_imcolortextedit_SetReadOnlyEnabled(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether the editor is read-only.
	End Rem
	Method IsReadOnlyEnabled:Int()
		Return bmx_imgui_imcolortextedit_IsReadOnlyEnabled(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether auto-indentation is enabled.
	about: When enabled, new lines will be automatically indented to the same level as the previous line.
	End Rem
	Method SetAutoIndentEnabled(value:Int)
		bmx_imgui_imcolortextedit_SetAutoIndentEnabled(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether auto-indentation is enabled.
	about: When enabled, new lines will be automatically indented to the same level as the previous line.
	End Rem
	Method IsAutoIndentEnabled:Int()
		Return bmx_imgui_imcolortextedit_IsAutoIndentEnabled(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether to show whitespace characters.
	about: When enabled, whitespace characters will be rendered as visible symbols.
	End Rem
	Method SetShowWhitespacesEnabled(value:Int)
		bmx_imgui_imcolortextedit_SetShowWhitespacesEnabled(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether to show whitespace characters.
	about: When enabled, whitespace characters will be rendered as visible symbols.
	End Rem
	Method IsShowWhitespacesEnabled:Int()
		Return bmx_imgui_imcolortextedit_IsShowWhitespacesEnabled(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether to show spaces.
	about: When enabled, space characters will be rendered as visible symbols.
	End Rem
	Method SetShowSpacesEnabled(value:Int)
		bmx_imgui_imcolortextedit_SetShowSpacesEnabled(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether to show spaces.
	about: When enabled, space characters will be rendered as visible symbols.
	End Rem
	Method IsShowSpacesEnabled:Int()
		Return bmx_imgui_imcolortextedit_IsShowSpacesEnabled(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether to show tabs.
	about: When enabled, tab characters will be rendered as visible symbols.
	End Rem
	Method SetShowTabsEnabled(value:Int)
		bmx_imgui_imcolortextedit_SetShowTabsEnabled(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether to show tabs.
	about: When enabled, tab characters will be rendered as visible symbols.
	End Rem
	Method IsShowTabsEnabled:Int()
		Return bmx_imgui_imcolortextedit_IsShowTabsEnabled(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether to show line numbers.
	about: When enabled, line numbers will be rendered in a dedicated gutter on the left side of the editor.
	End Rem
	Method SetShowLineNumbersEnabled(value:Int)
		bmx_imgui_imcolortextedit_SetShowLineNumbersEnabled(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether to show line numbers.
	about: When enabled, line numbers will be rendered in a dedicated gutter on the left side of the editor.
	End Rem
	Method IsShowLineNumbersEnabled:Int()
		Return bmx_imgui_imcolortextedit_IsShowLineNumbersEnabled(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether to show the scrollbar mini map.
	about: When enabled, a mini map of the scrollbar will be rendered on the right side of the editor.
	End Rem
	Method SetShowScrollbarMiniMapEnabled(value:Int)
		bmx_imgui_imcolortextedit_SetShowScrollbarMiniMapEnabled(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether the scrollbar mini map is shown.
	about: When enabled, a mini map of the scrollbar will be rendered on the right side of the editor.
	End Rem
	Method IsShowScrollbarMiniMapEnabled:Int()
		Return bmx_imgui_imcolortextedit_IsShowScrollbarMiniMapEnabled(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether to show the pan scroll indicator.
	about: When enabled, a pan scroll indicator will be rendered in the editor.
	End Rem
	Method SetShowPanScrollIndicatorEnabled(value:Int)
		bmx_imgui_imcolortextedit_SetShowPanScrollIndicatorEnabled(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether the pan scroll indicator is shown.
	about: When enabled, a pan scroll indicator will be rendered in the editor.
	End Rem
	Method IsShowPanScrollIndicatorEnabled:Int()
		Return bmx_imgui_imcolortextedit_IsShowPanScrollIndicatorEnabled(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether to show matching brackets.
	about: When enabled, matching brackets will be highlighted when the cursor is next to a bracket.
	End Rem
	Method SetShowMatchingBrackets(value:Int)
		bmx_imgui_imcolortextedit_SetShowMatchingBrackets(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether matching brackets are shown.
	about: When enabled, matching brackets will be highlighted when the cursor is next to a bracket.
	End Rem
	Method IsShowingMatchingBrackets:Int()
		Return bmx_imgui_imcolortextedit_IsShowingMatchingBrackets(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether to complete paired glyphs.
	about: When enabled, paired glyphs like brackets and quotes will be automatically completed when typing them.
	End Rem
	Method SetCompletePairedGlyphs(value:Int)
		bmx_imgui_imcolortextedit_SetCompletePairedGlyphs(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether to complete paired glyphs.
	about: When enabled, paired glyphs like brackets and quotes will be automatically completed when typing them.
	End Rem
	Method IsCompletingPairedGlyphs:Int()
		Return bmx_imgui_imcolortextedit_IsCompletingPairedGlyphs(editorPtr)
	End Method

	Rem
	bbdoc: Sets whether overwrite mode is enabled.
	about: When enabled, typing will overwrite existing text instead of inserting new text.
	End Rem
	Method SetOverwriteEnabled(value:Int)
		bmx_imgui_imcolortextedit_SetOverwriteEnabled(editorPtr, value)
	End Method

	Rem
	bbdoc: Gets whether overwrite mode is enabled.
	about: When enabled, typing will overwrite existing text instead of inserting new text.
	End Rem
	Method IsOverwriteEnabled:Int()
		Return bmx_imgui_imcolortextedit_IsOverwriteEnabled(editorPtr)
	End Method

	Rem
	bbdoc: Sets middle mouse button behavior to pan the editor.
	about: When enabled, dragging with the middle mouse button will pan the editor.
	Otherwise, dragging with the middle mouse button will scroll the editor.
	End Rem
	Method SetMiddleMousePanMode()
		bmx_imgui_imcolortextedit_SetMiddleMousePanMode(editorPtr)
	End Method

	Rem
	bbdoc: Sets middle mouse button behavior to scroll the editor.
	about: When enabled, dragging with the middle mouse button will scroll the editor.
	Otherwise, dragging with the middle mouse button will pan the editor.
	End Rem
	Method SetMiddleMouseScrollMode()
		bmx_imgui_imcolortextedit_SetMiddleMouseScrollMode(editorPtr)
	End Method

	Rem
	bbdoc: Gets whether middle mouse button is in pan mode.
	about: When enabled, dragging with the middle mouse button will pan the editor.
	Otherwise, dragging with the middle mouse button will scroll the editor.
	End Rem
	Method IsMiddleMousePanMode:Int()
		Return bmx_imgui_imcolortextedit_IsMiddleMousePanMode(editorPtr)
	End Method

	Rem
	bbdoc: Sets the text in the editor.
	about: This replaces all existing text in the editor with the given text.
	End Rem
	Method SetText(text:String)
		bmx_imgui_imcolortextedit_SetText(editorPtr, text)
	End Method

	Rem
	bbdoc: Gets the entire text from the editor.
	End Rem
	Method GetText:String()
		Return bmx_imgui_imcolortextedit_GetText(editorPtr)
	End Method

	Rem
	bbdoc: Gets the text at the given cursor index.
	End Rem
	Method GetCursorText:String(cursor:Size_T)
		Return bmx_imgui_imcolortextedit_GetCursorText(editorPtr, cursor)
	End Method

	Rem
	bbdoc: Gets the text of the given line.
	End Rem
	Method GetLineText:String(line:Int)
		Return bmx_imgui_imcolortextedit_GetLineText(editorPtr, line)
	End Method

	Rem
	bbdoc: Gets the text in the given section.
	End Rem
	Method GetSectionText:String(startLine:Int, startColumn:Int, endLine:Int, endColumn:Int)
		Return bmx_imgui_imcolortextedit_GetSectionText(editorPtr, startLine, startColumn, endLine, endColumn)
	End Method

	Rem
	bbdoc: Replaces the text in the given section with the provided text.
	End Rem
	Method ReplaceSectionText(startLine:Int, startColumn:Int, endLine:Int, endColumn:Int, text:String)
		bmx_imgui_imcolortextedit_ReplaceSectionText(editorPtr, startLine, startColumn, endLine, endColumn, text)
	End Method

	Rem
	bbdoc: Clears all text from the editor.
	End Rem
	Method ClearText()
		bmx_imgui_imcolortextedit_ClearText(editorPtr)
	End Method

	Rem
	bbdoc: Gets whether the editor is empty (i.e. contains no text).
	End Rem
	Method IsEmpty:Int()
		Return bmx_imgui_imcolortextedit_IsEmpty(editorPtr)
	End Method

	Rem
	bbdoc: Gets the number of lines in the editor.
	End Rem
	Method GetLineCount:Int()
		Return bmx_imgui_imcolortextedit_GetLineCount(editorPtr)
	End Method

	Rem
	bbdoc: Sets the keyboard focus to the editor.
	about: This does not affect the mouse cursor position in the editor.
	End Rem
	Method SetFocus()
		bmx_imgui_imcolortextedit_SetFocus(editorPtr)
	End Method

	Rem
	bbdoc: Cuts the selected text to the clipboard.
	End Rem
	Method Cut()
		bmx_imgui_imcolortextedit_Cut(editorPtr)
	End Method

	Rem
	bbdoc: Copies the selected text to the clipboard.
	End Rem
	Method Copy()
		bmx_imgui_imcolortextedit_Copy(editorPtr)
	End Method

	Rem
	bbdoc: Pastes the text from the clipboard into the editor at the current cursor position.
	End Rem
	Method Paste()
		bmx_imgui_imcolortextedit_Paste(editorPtr)
	End Method

	Rem
	bbdoc: Undoes the last edit operation.
	about: The editor maintains an undo stack that allows you to undo and redo changes to the text.
	Calling #Undo() will revert the last change made to the text, and move it to the redo stack.
	You can then call #Redo() to re-apply the change. The #CanUndo() and #CanRedo() methods can be used to check if
	there are changes available to undo or redo.
	End Rem
	Method Undo()
		bmx_imgui_imcolortextedit_Undo(editorPtr)
	End Method

	Rem
	bbdoc: Redoes the last undone edit operation.
	about: The editor maintains an undo stack that allows you to undo and redo changes to the text.
	Calling #Undo() will revert the last change made to the text, and move it to the redo stack.
	Calling #Redo() will re-apply the last change that was undone. The #CanUndo() and #CanRedo() methods
	can be used to check if there are changes available to undo or redo.
	End Rem
	Method Redo()
		bmx_imgui_imcolortextedit_Redo(editorPtr)
	End Method

	Rem
	bbdoc: Gets whether there are changes available to undo.
	about: The editor maintains an undo stack that allows you to undo and redo changes to the text.
	Calling #Undo() will revert the last change made to the text, and move it to the redo stack. Calling #Redo()
	will re-apply the last change that was undone. The #CanUndo() and #CanRedo() methods can be used to check if there are
	changes available to undo or redo.
	End Rem
	Method CanUndo:Int()
		Return bmx_imgui_imcolortextedit_CanUndo(editorPtr)
	End Method

	Rem
	bbdoc: Gets whether there are changes available to redo.
	about: The editor maintains an undo stack that allows you to undo and redo changes to the text.
	Calling #Undo() will revert the last change made to the text, and move it to the redo stack.
	Calling #Redo() will re-apply the last change that was undone. The #CanUndo() and #CanRedo() methods can
	be used to check if there are changes available to undo or redo.
	End Rem
	Method CanRedo:Int()
		Return bmx_imgui_imcolortextedit_CanRedo(editorPtr)
	End Method

	Rem
	bbdoc: Gets the current index in the undo stack.
	about: The editor maintains an undo stack that allows you to undo and redo changes to the text. Calling #Undo() will
	revert the last change made to the text, and move it to the redo stack. Calling #Redo() will re-apply the last change
	that was undone. The #CanUndo() and #CanRedo() methods can be used to check if there are changes available to undo or redo.
	End Rem
	Method GetUndoIndex:Size_T()
		Return bmx_imgui_imcolortextedit_GetUndoIndex(editorPtr)
	End Method

	Rem
	bbdoc: Sets the cursor position to the given line and column.
	about: The cursor position is zero-based, so the first line and column are at index 0.
	End Rem
	Method SetCursor(line:Int, column:Int)
		bmx_imgui_imcolortextedit_SetCursor(editorPtr, line, column)
	End Method

	Rem
	bbdoc: Selects all text in the editor.
	End Rem
	Method SelectAll()
		bmx_imgui_imcolortextedit_SelectAll(editorPtr)
	End Method

	Rem
	bbdoc: Selects the given line.
	End Rem
	Method SelectLine(line:Int)
		bmx_imgui_imcolortextedit_SelectLine(editorPtr, line)
	End Method

	Rem
	bbdoc: Selects lines from the given start line to the given end line (inclusive).
	End Rem
	Method SelectLines(_start:Int, _end:Int)
		bmx_imgui_imcolortextedit_SelectLines(editorPtr, _start, _end)
	End Method

	Rem
	bbdoc: Selects a region from the given start line and column to the given end line and column.
	End Rem
	Method SelectRegion(startLine:Int, startColumn:Int, endLine:Int, endColumn:Int)
		bmx_imgui_imcolortextedit_SelectRegion(editorPtr, startLine, startColumn, endLine, endColumn)
	End Method

	Rem
	bbdoc: Selects text from the current cursor position to the next matching bracket.
	about: When @includeBrackets is enabled, the matching brackets will be included in the selection.
	When @includeBrackets is disabled, the selection will end just before the matching bracket.
	End Rem
	Method SelectToBrackets(includeBrackets:Int)
		bmx_imgui_imcolortextedit_SelectToBrackets(editorPtr, includeBrackets)
	End Method

	Rem
	bbdoc: Grows the current selection(s) to the next matching curly brackets.
	End Rem
	Method GrowSelectionsToCurlyBrackets()
		bmx_imgui_imcolortextedit_GrowSelectionsToCurlyBrackets(editorPtr)
	End Method

	Rem
	bbdoc: Shrinks the current selection(s) to the previous matching curly brackets.
	End Rem
	Method ShrinkSelectionsToCurlyBrackets()
		bmx_imgui_imcolortextedit_ShrinkSelectionsToCurlyBrackets(editorPtr)
	End Method

	Rem
	bbdoc: Adds the next occurrence of the current selection to the selection set.
	about: This allows you to have multiple selections in the editor. When you have a selection and call this method,
	the next occurrence of the selected text will be added as another selection.
	End Rem
	Method AddNextOccurrence()
		bmx_imgui_imcolortextedit_AddNextOccurrence(editorPtr)
	End Method

	Rem
	bbdoc: Selects all occurrences of the current selection.
	about: This allows you to have multiple selections in the editor. When you have a selection and call this method,
	all occurrences of the selected text will be added as selections.
	End Rem
	Method SelectAllOccurrences()
		bmx_imgui_imcolortextedit_SelectAllOccurrences(editorPtr)
	End Method

	Rem
	bbdoc: Gets whether any cursor has a selection.
	about: This allows you to check if there is at least one selection in the editor.
	End Rem
	Method AnyCursorHasSelection:Int()
		Return bmx_imgui_imcolortextedit_AnyCursorHasSelection(editorPtr)
	End Method

	Rem
	bbdoc: Gets whether all cursors have a selection.
	about: This allows you to check if all cursors in the editor have a selection.
	End Rem
	Method AllCursorsHaveSelection:Int()
		Return bmx_imgui_imcolortextedit_AllCursorsHaveSelection(editorPtr)
	End Method

	Rem
	bbdoc: Gets whether the current cursor has a selection.
	about: This allows you to check if the current cursor in the editor has a selection.
	End Rem
	Method CurrentCursorHasSelection:Int()
		Return bmx_imgui_imcolortextedit_CurrentCursorHasSelection(editorPtr)
	End Method

	Rem
	bbdoc: Clears all cursors and selections from the editor.
	End Rem
	Method ClearCursors()
		bmx_imgui_imcolortextedit_ClearCursors(editorPtr)
	End Method

	Rem
	bbdoc: Gets the number of cursors in the editor.
	about: The editor supports multiple cursors, which can be used for multi-line editing.
	End Rem
	Method GetNumberOfCursors:Size_T()
		Return bmx_imgui_imcolortextedit_GetNumberOfCursors(editorPtr)
	End Method

	Rem
	bbdoc: Gets the line and column of the given cursor index.
	about: The cursor index is zero-based, so the first cursor is at index 0. The line and column are returned through
	the @line and @column parameters, which are passed by reference.
	End Rem
	Method GetCursor(line:Int Var, column:Int Var, cursor:Size_T)
		bmx_imgui_imcolortextedit_GetCursor(editorPtr, line, column, cursor)
	End Method

	Rem
	bbdoc: Gets the selection start and end line and column of the given cursor index.
	about: The cursor index is zero-based, so the first cursor is at index 0. The selection start and end line and
	column are returned through the @startLine, @startColumn, @endLine, and @endColumn parameters, which are passed by reference.
	End Rem
	Method GetCursorSelection(startLine:Int Var, startColumn:Int Var, endLine:Int Var, endColumn:Int Var, cursor:Size_T)
		bmx_imgui_imcolortextedit_GetCursorSelection(editorPtr, startLine, startColumn, endLine, endColumn, cursor)
	End Method

	Rem
	bbdoc: Gets the line and column of the main cursor.
	about: The main cursor is the primary cursor in the editor, which is used for most operations.
	When there are multiple cursors, the main cursor is usually the first cursor that was created, but this can vary depending
	on the operations performed. The line and column of the main cursor are returned through the @line and @column parameters, which
	are passed by reference.
	End Rem
	Method GetMainCursor(line:Int Var, column:Int Var)
		bmx_imgui_imcolortextedit_GetMainCursor(editorPtr, line, column)
	End Method

	Rem
	bbdoc: Gets the line and column of the current cursor.
	about: The current cursor is the cursor that is currently active in the editor. When there are multiple cursors, the current
	cursor is usually the most recently created cursor, but this can vary	depending on the operations performed. The line
	and column of the current cursor are returned through the @line and @column parameters, which are passed by reference.
	End Rem
	Method GetCurrentCursor(line:Int Var, column:Int Var)
		bmx_imgui_imcolortextedit_GetCurrentCursor(editorPtr, line, column)
	End Method

	Rem
	bbdoc: Gets the line and column of the given cursor index.
	about: The cursor index is zero-based, so the first cursor is at index 0.
	End Rem
	Method GetMainCursorPosition:SCursorPosition()
		Return bmx_imgui_imcolortextedit_GetMainCursorPosition(editorPtr)
	End Method

	Rem
	bbdoc: Gets the line and column of the current cursor.
	about: The current cursor is the cursor that is currently active in the editor. When there are multiple cursors, the
	current cursor is usually the most recently created cursor, but this can vary depending on the operations performed.
	End Rem
	Method GetCurrentCursorPosition:SCursorPosition()
		Return bmx_imgui_imcolortextedit_GetCurrentCursorPosition(editorPtr)
	End Method

	Rem
	bbdoc: Gets the line and column of the given cursor index.
	about: The cursor index is zero-based, so the first cursor is at index 0.
	End Rem
	Method GetCursorPosition:SCursorPosition(cursor:Size_T)
		Return bmx_imgui_imcolortextedit_GetCursorPosition(editorPtr, cursor)
	End Method

	Rem
	bbdoc: Gets the selection start and end line and column of the given cursor index.
	about: The cursor index is zero-based, so the first cursor is at index 0.
	End Rem
	Method GetCursorSelection:SCursorSelection(cursor:Size_T)
		Return bmx_imgui_imcolortextedit_GetCursorSelectionEx(editorPtr, cursor)
	End Method

	Rem
	bbdoc: Gets the selection start and end line and column of the main cursor.
	about: The main cursor is the primary cursor in the editor, which is used for most operations.
	When there are multiple cursors, the main cursor is usually the first cursor that was created, but this can vary
	depending on the operations performed.
	End Rem
	Method GetMainCursorSelection:SCursorSelection()
		Return bmx_imgui_imcolortextedit_GetMainCursorSelection(editorPtr)
	End Method

	Rem
	bbdoc: Gets the word at the given screen position.
	about: The screen position is given in pixels, relative to the top-left corner of the editor. The word at the given
	screen position is returned as a string. If there is no word at the given screen position, an empty string is returned.
	End Rem
	Method GetWordAtScreenPos:String(screenPos:SImVec2)
		Return bmx_imgui_imcolortextedit_GetWordAtScreenPos(editorPtr, screenPos)
	End Method

	Rem
	bbdoc: Scrolls the editor to the given line with the specified alignment.
	about: The line is zero-based, so the first line is at index 0. The alignment specifies how the line should be aligned in the editor after scrolling.
	See #EScroll for possible alignment values.
	End Rem
	Method ScrollToLine(line:Int, alignment:EScroll)
		bmx_imgui_imcolortextedit_ScrollToLine(editorPtr, line, alignment)
	End Method

	Rem
	bbdoc: Gets the index of the first visible line in the editor.
	about: The index is zero-based, so the first line is at index 0.
	End Rem
	Method GetFirstVisibleLine:Int()
		Return bmx_imgui_imcolortextedit_GetFirstVisibleLine(editorPtr)
	End Method

	Rem
	bbdoc: Gets the index of the last visible line in the editor.
	about: The index is zero-based, so the first line is at index 0.
	End Rem
	Method GetLastVisibleLine:Int()
		Return bmx_imgui_imcolortextedit_GetLastVisibleLine(editorPtr)
	End Method

	Rem
	bbdoc: Gets the index of the first visible column in the editor.
	about: The index is zero-based, so the first column is at index 0.
	End Rem
	Method GetFirstVisibleColumn:Int()
		Return bmx_imgui_imcolortextedit_GetFirstVisibleColumn(editorPtr)
	End Method

	Rem
	bbdoc: Gets the index of the last visible column in the editor.
	about: The index is zero-based, so the first column is at index 0.
	End Rem
	Method GetLastVisibleColumn:Int()
		Return bmx_imgui_imcolortextedit_GetLastVisibleColumn(editorPtr)
	End Method

	Rem
	bbdoc: Gets the line height in pixels.
	End Rem
	Method GetLineHeight:Float()
		Return bmx_imgui_imcolortextedit_GetLineHeight(editorPtr)
	End Method

	Rem
	bbdoc: Gets the glyph width in pixels.
	End Rem
	Method GetGlyphWidth:Float()
		Return bmx_imgui_imcolortextedit_GetGlyphWidth(editorPtr)
	End Method

	Rem
	bbdoc: Selects the first occurrence of the given text in the editor.
	about: The search can be case-sensitive or case-insensitive, and can match whole words only.
	End Rem
	Method SelectFirstOccurrenceOf(text:String, caseSensitive:Int = True, wholeWord:Int = False)
		bmx_imgui_imcolortextedit_SelectFirstOccurrenceOf(editorPtr, text, caseSensitive, wholeWord)
	End Method

	Rem
	bbdoc: Selects the next occurrence of the given text in the editor.
	about: The search can be case-sensitive or case-insensitive, and can match whole words only.
	The search starts from the current cursor position.
	End Rem
	Method SelectNextOccurrenceOf(text:String, caseSensitive:Int = True, wholeWord:Int = False)
		bmx_imgui_imcolortextedit_SelectNextOccurrenceOf(editorPtr, text, caseSensitive, wholeWord)
	End Method

	Rem
	bbdoc: Selects all occurrences of the given text in the editor.
	about: The search can be case-sensitive or case-insensitive, and can match whole words only.
	End Rem
	Method SelectAllOccurrencesOf(text:String, caseSensitive:Int = True, wholeWord:Int = False)
		bmx_imgui_imcolortextedit_SelectAllOccurrencesOf(editorPtr, text, caseSensitive, wholeWord)
	End Method

	Rem
	bbdoc: Replaces the text in the current cursor selection with the given text.
	about: If there is no selection in the current cursor, the text will be inserted at the cursor position.
	End Rem
	Method ReplaceTextInCurrentCursor(text:String)
		bmx_imgui_imcolortextedit_ReplaceTextInCurrentCursor(editorPtr, text)
	End Method

	Rem
	bbdoc: Replaces the text in all cursor selections with the given text.
	about: If there is no selection in a cursor, the text will be inserted at the cursor position.
	End Rem
	Method ReplaceTextInAllCursors(text:String)
		bmx_imgui_imcolortextedit_ReplaceTextInAllCursors(editorPtr, text)
	End Method

	Rem
	bbdoc: Opens the find and replace window.
	about: The find and replace window allows you to search for text in the editor and replace it with different text.
	End Rem
	Method OpenFindReplaceWindow()
		bmx_imgui_imcolortextedit_OpenFindReplaceWindow(editorPtr)
	End Method

	Rem
	bbdoc: Closes the find and replace window.
	End Rem
	Method CloseFindReplaceWindow()
		bmx_imgui_imcolortextedit_CloseFindReplaceWindow(editorPtr)
	End Method

	Rem
	bbdoc: Sets the label of the find button in the find and replace window.
	End Rem
	Method SetFindButtonLabel(label:String)
		bmx_imgui_imcolortextedit_SetFindButtonLabel(editorPtr, label)
	End Method

	Rem
	bbdoc: Sets the label of the find all button in the find and replace window.
	End Rem
	Method SetFindAllButtonLabel(label:String)
		bmx_imgui_imcolortextedit_SetFindAllButtonLabel(editorPtr, label)
	End Method

	Rem
	bbdoc: Sets the label of the replace button in the find and replace window.
	End Rem
	Method SetReplaceButtonLabel(label:String)
		bmx_imgui_imcolortextedit_SetReplaceButtonLabel(editorPtr, label)
	End Method

	Rem
	bbdoc: Sets the label of the replace all button in the find and replace window.
	End Rem
	Method SetReplaceAllButtonLabel(label:String)
		bmx_imgui_imcolortextedit_SetReplaceAllButtonLabel(editorPtr, label)
	End Method

	Rem
	bbdoc: Gets whether a string is currently entered in the find input field of the find and replace window.
	about: This allows you to check if there is a search string entered in the find input field of the find and replace window.
	End Rem
	Method HasFindString:Int()
		Return bmx_imgui_imcolortextedit_HasFindString(editorPtr)
	End Method

	Rem
	bbdoc: Finds the next occurrence of the search string entered in the find input field of the find and replace window.
	End Rem
	Method FindNext()
		bmx_imgui_imcolortextedit_FindNext(editorPtr)
	End Method

	Rem
	bbdoc: Finds the previous occurrence of the search string entered in the find input field of the find and replace window.
	End Rem
	Method FindAll()
		bmx_imgui_imcolortextedit_FindAll(editorPtr)
	End Method

	Rem
	bbdoc: Adds a marker to the given line with the specified colors and tooltips.
	about: Markers are visual indicators that can be added to specific lines in the editor. They are rendered in the
	line number gutter and can also affect the text color of the line.
	The line number color specifies the color of the line number for the marked line, while the text color specifies the
	color of the text for the marked line. The line number tooltip is a string that will be shown as a tooltip when
	hovering over the line number of the marked line, and the text tooltip is a string that will be shown as a tooltip when
	hovering over the text of the marked line.
	End Rem
	Method AddMarker(line:Int, lineNumberColor:UInt, textColor:UInt, lineNumberTooltip:String, textTooltip:String)
		bmx_imgui_imcolortextedit_AddMarker(editorPtr, line, lineNumberColor, textColor, lineNumberTooltip, textTooltip)
	End Method

	Rem
	bbdoc: Clears all markers from the editor.
	End Rem
	Method ClearMarkers()
		bmx_imgui_imcolortextedit_ClearMarkers(editorPtr)
	End Method

	Rem
	bbdoc: Gets whether there are any markers in the editor.
	End Rem
	Method HasMarkers:Int()
		Return bmx_imgui_imcolortextedit_HasMarkers(editorPtr)
	End Method

	Rem
	bbdoc: Applies indentation to the selected lines.
	End Rem
	Method IndentLines()
		bmx_imgui_imcolortextedit_IndentLines(editorPtr)
	End Method

	Rem
	bbdoc: Removes indentation from the selected lines.
	End Rem
	Method DeindentLines()
		bmx_imgui_imcolortextedit_DeindentLines(editorPtr)
	End Method

	Rem
	bbdoc: Moves the selected lines up by one line.
	End Rem
	Method MoveUpLines()
		bmx_imgui_imcolortextedit_MoveUpLines(editorPtr)
	End Method

	Rem
	bbdoc: Moves the selected lines down by one line.
	End Rem
	Method MoveDownLines()
		bmx_imgui_imcolortextedit_MoveDownLines(editorPtr)
	End Method

	Rem
	bbdoc: Toggles comments on the selected lines.
	End Rem
	Method ToggleComments()
		bmx_imgui_imcolortextedit_ToggleComments(editorPtr)
	End Method

	Rem
	bbdoc: Converts the selected text to lowercase.
	End Rem
	Method SelectionToLowerCase()
		bmx_imgui_imcolortextedit_SelectionToLowerCase(editorPtr)
	End Method

	Rem
	bbdoc: Converts the selected text to uppercase.
	End Rem
	Method SelectionToUpperCase()
		bmx_imgui_imcolortextedit_SelectionToUpperCase(editorPtr)
	End Method

	Rem
	bbdoc: Strips trailing whitespace characters from the end of each line in the editor.
	End Rem
	Method StripTrailingWhitespaces()
		bmx_imgui_imcolortextedit_StripTrailingWhitespaces(editorPtr)
	End Method

	Rem
	bbdoc: Converts tabs to spaces..
	End Rem
	Method TabsToSpaces()
		bmx_imgui_imcolortextedit_TabsToSpaces(editorPtr)
	End Method

	Rem
	bbdoc: Converts spaces to tabs.
	End Rem
	Method SpacesToTabs()
		bmx_imgui_imcolortextedit_SpacesToTabs(editorPtr)
	End Method

	Method SetLanguage(language:EImTextEditLanguage)
		Local lang:TImTextEditLanguage = TImTextEditLanguage.GetLanguage(language)
		bmx_imgui_imcolortextedit_SetLanguage(editorPtr, lang.languagePtr)
	End Method

End Type

Type TImTextEditLanguage

	Field languagePtr:Byte Ptr

	Function Create:TImTextEditLanguage(languagePtr:Byte Ptr)
		If languagePtr Then
			Local lang:TImTextEditLanguage = New TImTextEditLanguage
			lang.languagePtr = languagePtr
			Return lang
		End If
	End Function

	Function GetLanguage:TImTextEditLanguage(language:EImTextEditLanguage)
		Return TImTextEditLanguage.Create(bmx_imgui_imcolortextedit_GetLanguage(language))
	End Function
End Type


