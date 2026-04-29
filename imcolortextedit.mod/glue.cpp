/*
Copyright (c) 2026 Bruce A Henderson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
#include "TextEditor.h"
#include "brl.mod/blitz.mod/blitz.h"

class MaxTextEditor;

extern "C" {

    MaxTextEditor * bmx_imgui_imcolortextedit_create();
    void bmx_imgui_imcolortextedit_free(MaxTextEditor * editor);

    void bmx_imgui_imcolortextedit_SetTabSize(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_GetTabSize(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetInsertSpacesOnTabs(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsInsertSpacesOnTabs(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetLineSpacing(MaxTextEditor * editor, float value);
    float bmx_imgui_imcolortextedit_GetLineSpacing(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetReadOnlyEnabled(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsReadOnlyEnabled(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetAutoIndentEnabled(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsAutoIndentEnabled(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetShowWhitespacesEnabled(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsShowWhitespacesEnabled(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetShowSpacesEnabled(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsShowSpacesEnabled(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetShowTabsEnabled(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsShowTabsEnabled(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetShowLineNumbersEnabled(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsShowLineNumbersEnabled(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetShowScrollbarMiniMapEnabled(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsShowScrollbarMiniMapEnabled(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetShowPanScrollIndicatorEnabled(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsShowPanScrollIndicatorEnabled(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetShowMatchingBrackets(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsShowingMatchingBrackets(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetCompletePairedGlyphs(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsCompletingPairedGlyphs(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetOverwriteEnabled(MaxTextEditor * editor, int value);
    int bmx_imgui_imcolortextedit_IsOverwriteEnabled(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetMiddleMousePanMode(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetMiddleMouseScrollMode(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_IsMiddleMousePanMode(MaxTextEditor * editor);

    void bmx_imgui_imcolortextedit_Render(MaxTextEditor * editor, BBString * title);
    void bmx_imgui_imcolortextedit_RenderEx(MaxTextEditor * editor, BBString * title, ImVec2 size, int border);

    void bmx_imgui_imcolortextedit_SetText(MaxTextEditor * editor, BBString * text);
    BBString * bmx_imgui_imcolortextedit_GetText(MaxTextEditor * editor);
    BBString * bmx_imgui_imcolortextedit_GetCursorText(MaxTextEditor * editor, size_t cursor);
    BBString * bmx_imgui_imcolortextedit_GetLineText(MaxTextEditor * editor, int line);
    BBString * bmx_imgui_imcolortextedit_GetSectionText(MaxTextEditor * editor, int startLine, int startColumn, int endLine, int endColumn);
    void bmx_imgui_imcolortextedit_ReplaceSectionText(MaxTextEditor * editor, int startLine, int startColumn, int endLine, int endColumn, BBString * text);
    void bmx_imgui_imcolortextedit_ClearText(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_IsEmpty(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_GetLineCount(MaxTextEditor * editor);

    void bmx_imgui_imcolortextedit_SetFocus(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_Cut(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_Copy(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_Paste(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_Undo(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_Redo(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_CanUndo(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_CanRedo(MaxTextEditor * editor);
    size_t bmx_imgui_imcolortextedit_GetUndoIndex(MaxTextEditor * editor);

    void bmx_imgui_imcolortextedit_SetCursor(MaxTextEditor * editor, int line, int column);
    void bmx_imgui_imcolortextedit_SelectAll(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SelectLine(MaxTextEditor * editor, int line);
    void bmx_imgui_imcolortextedit_SelectLines(MaxTextEditor * editor, int _start, int _end);
    void bmx_imgui_imcolortextedit_SelectRegion(MaxTextEditor * editor, int startLine, int startColumn, int endLine, int endColumn);
    void bmx_imgui_imcolortextedit_SelectToBrackets(MaxTextEditor * editor, int includeBrackets);
    void bmx_imgui_imcolortextedit_GrowSelectionsToCurlyBrackets(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_ShrinkSelectionsToCurlyBrackets(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_AddNextOccurrence(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SelectAllOccurrences(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_AnyCursorHasSelection(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_AllCursorsHaveSelection(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_CurrentCursorHasSelection(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_ClearCursors(MaxTextEditor * editor);

    size_t bmx_imgui_imcolortextedit_GetNumberOfCursors(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_GetCursor(MaxTextEditor * editor, int * line, int * column, size_t cursor);
    void bmx_imgui_imcolortextedit_GetCursorSelection(MaxTextEditor * editor, int * startLine, int * startColumn, int * endLine, int * endColumn, size_t cursor);
    void bmx_imgui_imcolortextedit_GetMainCursor(MaxTextEditor * editor, int * line, int * column);
    void bmx_imgui_imcolortextedit_GetCurrentCursor(MaxTextEditor * editor, int * line, int * column);

	struct MaxCursorPosition { int line; int column; };
	struct MaxCursorSelection { MaxCursorPosition start; MaxCursorPosition end; };

    MaxCursorPosition bmx_imgui_imcolortextedit_GetMainCursorPosition(MaxTextEditor * editor);
    MaxCursorPosition bmx_imgui_imcolortextedit_GetCurrentCursorPosition(MaxTextEditor * editor);
    MaxCursorPosition bmx_imgui_imcolortextedit_GetCursorPosition(MaxTextEditor * editor, size_t cursor);
    MaxCursorSelection bmx_imgui_imcolortextedit_GetCursorSelectionEx(MaxTextEditor * editor, size_t cursor);
    MaxCursorSelection bmx_imgui_imcolortextedit_GetMainCursorSelection(MaxTextEditor * editor);

    BBString * bmx_imgui_imcolortextedit_GetWordAtScreenPos(MaxTextEditor * editor, ImVec2 screenPos);

    void bmx_imgui_imcolortextedit_ScrollToLine(MaxTextEditor * editor, int line, int alignment);
    int bmx_imgui_imcolortextedit_GetFirstVisibleLine(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_GetLastVisibleLine(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_GetFirstVisibleColumn(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_GetLastVisibleColumn(MaxTextEditor * editor);

    float bmx_imgui_imcolortextedit_GetLineHeight(MaxTextEditor * editor);
    float bmx_imgui_imcolortextedit_GetGlyphWidth(MaxTextEditor * editor);

    void bmx_imgui_imcolortextedit_SelectFirstOccurrenceOf(MaxTextEditor * editor, BBString * text, int caseSensitive, int wholeWord);
    void bmx_imgui_imcolortextedit_SelectNextOccurrenceOf(MaxTextEditor * editor, BBString * text, int caseSensitive, int wholeWord);
    void bmx_imgui_imcolortextedit_SelectAllOccurrencesOf(MaxTextEditor * editor, BBString * text, int caseSensitive, int wholeWord);
    void bmx_imgui_imcolortextedit_ReplaceTextInCurrentCursor(MaxTextEditor * editor, BBString * text);
    void bmx_imgui_imcolortextedit_ReplaceTextInAllCursors(MaxTextEditor * editor, BBString * text);

    void bmx_imgui_imcolortextedit_OpenFindReplaceWindow(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_CloseFindReplaceWindow(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SetFindButtonLabel(MaxTextEditor * editor, BBString * label);
    void bmx_imgui_imcolortextedit_SetFindAllButtonLabel(MaxTextEditor * editor, BBString * label);
    void bmx_imgui_imcolortextedit_SetReplaceButtonLabel(MaxTextEditor * editor, BBString * label);
    void bmx_imgui_imcolortextedit_SetReplaceAllButtonLabel(MaxTextEditor * editor, BBString * label);
    int bmx_imgui_imcolortextedit_HasFindString(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_FindNext(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_FindAll(MaxTextEditor * editor);

    void bmx_imgui_imcolortextedit_AddMarker(MaxTextEditor * editor, int line, unsigned int lineNumberColor, unsigned int textColor, BBString * lineNumberTooltip, BBString * textTooltip);
    void bmx_imgui_imcolortextedit_ClearMarkers(MaxTextEditor * editor);
    int bmx_imgui_imcolortextedit_HasMarkers(MaxTextEditor * editor);

    void bmx_imgui_imcolortextedit_IndentLines(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_DeindentLines(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_MoveUpLines(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_MoveDownLines(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_ToggleComments(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SelectionToLowerCase(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SelectionToUpperCase(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_StripTrailingWhitespaces(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_TabsToSpaces(MaxTextEditor * editor);
    void bmx_imgui_imcolortextedit_SpacesToTabs(MaxTextEditor * editor);

    const TextEditor::Language* bmx_imgui_imcolortextedit_GetLanguage(int language);
    const TextEditor::Language* bmx_imgui_imcolortextedit_language_blitzmax();

    void bmx_imgui_imcolortextedit_setlanguage(MaxTextEditor * editor, const TextEditor::Language * language);
}

///////////////////////////////////////////////////////////

class MaxTextEditor
{
public:

    void SetTabSize(int value) {
        editor.SetTabSize(value);
    }

    int GetTabSize() const {
        return editor.GetTabSize();
    }

    void SetInsertSpacesOnTabs(int value) {
        editor.SetInsertSpacesOnTabs(value != 0);
    }

    int IsInsertSpacesOnTabs() const {
        return editor.IsInsertSpacesOnTabs() ? 1 : 0;
    }

    void SetLineSpacing(float value) {
        editor.SetLineSpacing(value);
    }

    float GetLineSpacing() const {
        return editor.GetLineSpacing();
    }

    void SetReadOnlyEnabled(int value) {
        editor.SetReadOnlyEnabled(value != 0);
    }

    int IsReadOnlyEnabled() const {
        return editor.IsReadOnlyEnabled() ? 1 : 0;
    }

    void SetAutoIndentEnabled(int value) {
        editor.SetAutoIndentEnabled(value != 0);
    }

    int IsAutoIndentEnabled() const {
        return editor.IsAutoIndentEnabled() ? 1 : 0;
    }

    void SetShowWhitespacesEnabled(int value) {
        editor.SetShowWhitespacesEnabled(value != 0);
    }

    int IsShowWhitespacesEnabled() const {
        return editor.IsShowWhitespacesEnabled() ? 1 : 0;
    }

    void SetShowSpacesEnabled(int value) {
        editor.SetShowSpacesEnabled(value != 0);
    }

    int IsShowSpacesEnabled() const {
        return editor.IsShowSpacesEnabled() ? 1 : 0;
    }

    void SetShowTabsEnabled(int value) {
        editor.SetShowTabsEnabled(value != 0);
    }

    int IsShowTabsEnabled() const {
        return editor.IsShowTabsEnabled() ? 1 : 0;
    }

    void SetShowLineNumbersEnabled(int value) {
        editor.SetShowLineNumbersEnabled(value != 0);
    }

    int IsShowLineNumbersEnabled() const {
        return editor.IsShowLineNumbersEnabled() ? 1 : 0;
    }

    void SetShowScrollbarMiniMapEnabled(int value) {
        editor.SetShowScrollbarMiniMapEnabled(value != 0);
    }

    int IsShowScrollbarMiniMapEnabled() const {
        return editor.IsShowScrollbarMiniMapEnabled() ? 1 : 0;
    }

    void SetShowPanScrollIndicatorEnabled(int value) {
        editor.SetShowPanScrollIndicatorEnabled(value != 0);
    }

    int IsShowPanScrollIndicatorEnabled() const {
        return editor.IsShowPanScrollIndicatorEnabled() ? 1 : 0;
    }

    void SetShowMatchingBrackets(int value) {
        editor.SetShowMatchingBrackets(value != 0);
    }

    int IsShowingMatchingBrackets() const {
        return editor.IsShowingMatchingBrackets() ? 1 : 0;
    }

    void SetCompletePairedGlyphs(int value) {
        editor.SetCompletePairedGlyphs(value != 0);
    }

    int IsCompletingPairedGlyphs() const {
        return editor.IsCompletingPairedGlyphs() ? 1 : 0;
    }

    void SetOverwriteEnabled(int value) {
        editor.SetOverwriteEnabled(value != 0);
    }

    int IsOverwriteEnabled() const {
        return editor.IsOverwriteEnabled() ? 1 : 0;
    }

    void SetMiddleMousePanMode() {
        editor.SetMiddleMousePanMode();
    }

    void SetMiddleMouseScrollMode() {
        editor.SetMiddleMouseScrollMode();
    }

    int IsMiddleMousePanMode() const {
        return editor.IsMiddleMousePanMode() ? 1 : 0;
    }

    void Render(BBString * title, ImVec2 size, int border) {
        char * t = (char*)bbStringToUTF8String(title);
        editor.Render(t, size, border != 0);
        bbMemFree(t);
    }

    void SetText(BBString * text) {
        if ( text == &bbEmptyString ) {
            editor.SetText("");
            return;
        }

        char * t = (char*)bbStringToUTF8String(text);
        editor.SetText(t);
        bbMemFree(t);
    }

    BBString * GetText() const {
        std::string text = editor.GetText();
        if (text.empty()) {
            return &bbEmptyString;
        }
        return bbStringFromUTF8String((unsigned char*)text.c_str());
    }

    BBString * GetCursorText(size_t cursor) const {
        std::string text = editor.GetCursorText(cursor);
        if (text.empty()) {
            return &bbEmptyString;
        }
        return bbStringFromUTF8String((unsigned char*)text.c_str());
    }

    BBString * GetLineText(int line) const {
        std::string text = editor.GetLineText(line);
        if (text.empty()) {
            return &bbEmptyString;
        }
        return bbStringFromUTF8String((unsigned char*)text.c_str());
    }

    BBString * GetSectionText(int startLine, int startColumn, int endLine, int endColumn) const {
        std::string text = editor.GetSectionText(startLine, startColumn, endLine, endColumn);
        if (text.empty()) {
            return &bbEmptyString;
        }
        return bbStringFromUTF8String((unsigned char*)text.c_str());
    }

    void ReplaceSectionText(int startLine, int startColumn, int endLine, int endColumn, BBString * text) {
        if ( text == &bbEmptyString ) {
            editor.ReplaceSectionText(startLine, startColumn, endLine, endColumn, "");
            return;
        }

        char * t = (char*)bbStringToUTF8String(text);
        editor.ReplaceSectionText(startLine, startColumn, endLine, endColumn, t);
        bbMemFree(t);
    }

    void ClearText() {
        editor.ClearText();
    }

    int IsEmpty() const {
        return editor.IsEmpty() ? 1 : 0;
    }

    int GetLineCount() const {
        return editor.GetLineCount();
    }

    void SetFocus() {
        editor.SetFocus();
    }

    void Cut() {
        editor.Cut();
    }

    void Copy() {
        editor.Copy();
    }

    void Paste() {
        editor.Paste();
    }

    void Undo() {
        editor.Undo();
    }

    void Redo() {
        editor.Redo();
    }

    int CanUndo() const {
        return editor.CanUndo() ? 1 : 0;
    }

    int CanRedo() const {
        return editor.CanRedo() ? 1 : 0;
    }

    size_t GetUndoIndex() const {
        return editor.GetUndoIndex();
    }

    void SetCursor(int line, int column) {
        editor.SetCursor(line, column);
    }

    void SelectAll() {
        editor.SelectAll();
    }

    void SelectLine(int line) {
        editor.SelectLine(line);
    }

    void SelectLines(int _start, int _end) {
        editor.SelectLines(_start, _end);
    }

    void SelectRegion(int startLine, int startColumn, int endLine, int endColumn) {
        editor.SelectRegion(startLine, startColumn, endLine, endColumn);
    }

    void SelectToBrackets(int includeBrackets) {
        editor.SelectToBrackets(includeBrackets != 0);
    }

    void GrowSelectionsToCurlyBrackets() {
        editor.GrowSelectionsToCurlyBrackets();
    }

    void ShrinkSelectionsToCurlyBrackets() {
        editor.ShrinkSelectionsToCurlyBrackets();
    }

    void AddNextOccurrence() {
        editor.AddNextOccurrence();
    }

    void SelectAllOccurrences() {
        editor.SelectAllOccurrences();
    }

    int AnyCursorHasSelection() const {
        return editor.AnyCursorHasSelection() ? 1 : 0;
    }

    int AllCursorsHaveSelection() const {
        return editor.AllCursorsHaveSelection() ? 1 : 0;
    }

    int CurrentCursorHasSelection() const {
        return editor.CurrentCursorHasSelection() ? 1 : 0;
    }

    void ClearCursors() {
        editor.ClearCursors();
    }

    size_t GetNumberOfCursors() const {
        return editor.GetNumberOfCursors();
    }

    void GetCursor(int* line, int* column, size_t cursor) const {
        editor.GetCursor(*line, *column, cursor);
    }

    void GetCursor(int* startLine, int* startColumn, int* endLine, int* endColumn, size_t cursor) const {
        editor.GetCursor(*startLine, *startColumn, *endLine, *endColumn, cursor);
    }

    void GetMainCursor(int* line, int* column) const {
        editor.GetMainCursor(*line, *column);
    }

    void GetCurrentCursor(int* line, int* column) const {
        editor.GetCurrentCursor(*line, *column);
    }

    MaxCursorPosition GetMainCursorPosition() const {
        TextEditor::CursorPosition pos = editor.GetMainCursorPosition();
        return { pos.line, pos.column };
    }

    MaxCursorPosition GetCurrentCursorPosition() const {
        TextEditor::CursorPosition pos = editor.GetCurrentCursorPosition();
        return { pos.line, pos.column };
    }

    MaxCursorPosition GetCursorPosition(size_t cursor) const {
        TextEditor::CursorPosition pos = editor.GetCursorPosition(cursor);
        return { pos.line, pos.column };
    }

    MaxCursorSelection GetCursorSelection(size_t cursor) const {
        TextEditor::CursorSelection sel = editor.GetCursorSelection(cursor);
        return { sel.start.line, sel.start.column, sel.end.line, sel.end.column };
    }

    MaxCursorSelection GetMainCursorSelection() const {
        TextEditor::CursorSelection sel = editor.GetMainCursorSelection();
        return { sel.start.line, sel.start.column, sel.end.line, sel.end.column };
    }

    BBString * GetWordAtScreenPos(ImVec2 screenPos) const {
        std::string text = editor.GetWordAtScreenPos(screenPos);
        if (text.empty()) {
            return &bbEmptyString;
        }
        return bbStringFromUTF8String((unsigned char*)text.c_str());
    }

    void ScrollToLine(int line, int alignment) {
        editor.ScrollToLine(line, (TextEditor::Scroll)alignment);
    }

    int GetFirstVisibleLine() const {
        return editor.GetFirstVisibleLine();
    }

    int GetLastVisibleLine() const {
        return editor.GetLastVisibleLine();
    }

    int GetFirstVisibleColumn() const {
        return editor.GetFirstVisibleColumn();
    }

    int GetLastVisibleColumn() const {
        return editor.GetLastVisibleColumn();
    }

    float GetLineHeight() const {
        return editor.GetLineHeight();
    }

    float GetGlyphWidth() const {
        return editor.GetGlyphWidth();
    }

    void SelectFirstOccurrenceOf(BBString * text, int caseSensitive, int wholeWord) {
        char * t = (char*)bbStringToUTF8String(text);
        editor.SelectFirstOccurrenceOf(t, caseSensitive != 0, wholeWord != 0);
        bbMemFree(t);
    }

    void SelectNextOccurrenceOf(BBString * text, int caseSensitive, int wholeWord) {
        char * t = (char*)bbStringToUTF8String(text);
        editor.SelectNextOccurrenceOf(t, caseSensitive != 0, wholeWord != 0);
        bbMemFree(t);
    }

    void SelectAllOccurrencesOf(BBString * text, int caseSensitive, int wholeWord) {
        char * t = (char*)bbStringToUTF8String(text);
        editor.SelectAllOccurrencesOf(t, caseSensitive != 0, wholeWord != 0);
        bbMemFree(t);
    }

    void ReplaceTextInCurrentCursor(BBString * text) {
        char * t = (char*)bbStringToUTF8String(text);
        editor.ReplaceTextInCurrentCursor(t);
        bbMemFree(t);
    }

    void ReplaceTextInAllCursors(BBString * text) {
        char * t = (char*)bbStringToUTF8String(text);
        editor.ReplaceTextInAllCursors(t);
        bbMemFree(t);
    }

    void OpenFindReplaceWindow() {
        editor.OpenFindReplaceWindow();
    }

    void CloseFindReplaceWindow() {
        editor.CloseFindReplaceWindow();
    }

    void SetFindButtonLabel(BBString * label) {
        char * t = (char*)bbStringToUTF8String(label);
        editor.SetFindButtonLabel(t);
        bbMemFree(t);
    }

    void SetFindAllButtonLabel(BBString * label) {
        char * t = (char*)bbStringToUTF8String(label);
        editor.SetFindAllButtonLabel(t);
        bbMemFree(t);
    }

    void SetReplaceButtonLabel(BBString * label) {
        char * t = (char*)bbStringToUTF8String(label);
        editor.SetReplaceButtonLabel(t);
        bbMemFree(t);
    }

    void SetReplaceAllButtonLabel(BBString * label) {
        char * t = (char*)bbStringToUTF8String(label);
        editor.SetReplaceAllButtonLabel(t);
        bbMemFree(t);
    }

    int HasFindString() const {
        return editor.HasFindString() ? 1 : 0;
    }

    void FindNext() {
        editor.FindNext();
    }

    void FindAll() {
        editor.FindAll();
    }

    void AddMarker(int line, unsigned int lineNumberColor, unsigned int textColor, BBString * lineNumberTooltip, BBString * textTooltip) {
        char * lnTooltip = (char*)bbStringToUTF8String(lineNumberTooltip);
        char * tTooltip = (char*)bbStringToUTF8String(textTooltip);
        editor.AddMarker(line, lineNumberColor, textColor, lnTooltip, tTooltip);
        bbMemFree(lnTooltip);
        bbMemFree(tTooltip);
    }

    void ClearMarkers() {
        editor.ClearMarkers();
    }

    int HasMarkers() const {
        return editor.HasMarkers() ? 1 : 0;
    }

    void IndentLines() {
        editor.IndentLines();
    }

    void DeindentLines() {
        editor.DeindentLines();
    }

    void MoveUpLines() {
        editor.MoveUpLines();
    }

    void MoveDownLines() {
        editor.MoveDownLines();
    }

    void ToggleComments() {
        editor.ToggleComments();
    }

    void SelectionToLowerCase() {
        editor.SelectionToLowerCase();
    }

    void SelectionToUpperCase() {
        editor.SelectionToUpperCase();
    }

    void StripTrailingWhitespaces() {
        editor.StripTrailingWhitespaces();
    }

    void TabsToSpaces() {
        editor.TabsToSpaces();
    }

    void SpacesToTabs() {
        editor.SpacesToTabs();
    }

    void SetLanguage(const TextEditor::Language * language) {
        editor.SetLanguage(language);
    }

    TextEditor editor;
};

///////////////////////////////////////////////////////////

MaxTextEditor * bmx_imgui_imcolortextedit_create() {
    return new MaxTextEditor();
}

void bmx_imgui_imcolortextedit_free(MaxTextEditor * editor) {
    delete editor;
}

void bmx_imgui_imcolortextedit_SetTabSize(MaxTextEditor * editor, int value) {
    editor->SetTabSize(value);
}

int bmx_imgui_imcolortextedit_GetTabSize(MaxTextEditor * editor) {
    return editor->GetTabSize();
}

void bmx_imgui_imcolortextedit_SetInsertSpacesOnTabs(MaxTextEditor * editor, int value) {
    editor->SetInsertSpacesOnTabs(value);
}

int bmx_imgui_imcolortextedit_IsInsertSpacesOnTabs(MaxTextEditor * editor) {
    return editor->IsInsertSpacesOnTabs();
}

void bmx_imgui_imcolortextedit_SetLineSpacing(MaxTextEditor * editor, float value) {
    editor->SetLineSpacing(value);
}

float bmx_imgui_imcolortextedit_GetLineSpacing(MaxTextEditor * editor) {
    return editor->GetLineSpacing();
}

void bmx_imgui_imcolortextedit_SetReadOnlyEnabled(MaxTextEditor * editor, int value) {
    editor->SetReadOnlyEnabled(value);
}

int bmx_imgui_imcolortextedit_IsReadOnlyEnabled(MaxTextEditor * editor) {
    return editor->IsReadOnlyEnabled();
}

void bmx_imgui_imcolortextedit_SetAutoIndentEnabled(MaxTextEditor * editor, int value) {
    editor->SetAutoIndentEnabled(value);
}

int bmx_imgui_imcolortextedit_IsAutoIndentEnabled(MaxTextEditor * editor) {
    return editor->IsAutoIndentEnabled();
}

void bmx_imgui_imcolortextedit_SetShowWhitespacesEnabled(MaxTextEditor * editor, int value) {
    editor->SetShowWhitespacesEnabled(value);
}

int bmx_imgui_imcolortextedit_IsShowWhitespacesEnabled(MaxTextEditor * editor) {
    return editor->IsShowWhitespacesEnabled();
}

void bmx_imgui_imcolortextedit_SetShowSpacesEnabled(MaxTextEditor * editor, int value) {
    editor->SetShowSpacesEnabled(value);
}

int bmx_imgui_imcolortextedit_IsShowSpacesEnabled(MaxTextEditor * editor) {
    return editor->IsShowSpacesEnabled();
}

void bmx_imgui_imcolortextedit_SetShowTabsEnabled(MaxTextEditor * editor, int value) {
    editor->SetShowTabsEnabled(value);
}

int bmx_imgui_imcolortextedit_IsShowTabsEnabled(MaxTextEditor * editor) {
    return editor->IsShowTabsEnabled();
}

void bmx_imgui_imcolortextedit_SetShowLineNumbersEnabled(MaxTextEditor * editor, int value) {
    editor->SetShowLineNumbersEnabled(value);
}

int bmx_imgui_imcolortextedit_IsShowLineNumbersEnabled(MaxTextEditor * editor) {
    return editor->IsShowLineNumbersEnabled();
}

void bmx_imgui_imcolortextedit_SetShowScrollbarMiniMapEnabled(MaxTextEditor * editor, int value) {
    editor->SetShowScrollbarMiniMapEnabled(value);
}

int bmx_imgui_imcolortextedit_IsShowScrollbarMiniMapEnabled(MaxTextEditor * editor) {
    return editor->IsShowScrollbarMiniMapEnabled();
}

void bmx_imgui_imcolortextedit_SetShowPanScrollIndicatorEnabled(MaxTextEditor * editor, int value) {
    editor->SetShowPanScrollIndicatorEnabled(value);
}

int bmx_imgui_imcolortextedit_IsShowPanScrollIndicatorEnabled(MaxTextEditor * editor) {
    return editor->IsShowPanScrollIndicatorEnabled();
}

void bmx_imgui_imcolortextedit_SetShowMatchingBrackets(MaxTextEditor * editor, int value) {
    editor->SetShowMatchingBrackets(value);
}

int bmx_imgui_imcolortextedit_IsShowingMatchingBrackets(MaxTextEditor * editor) {
    return editor->IsShowingMatchingBrackets();
}

void bmx_imgui_imcolortextedit_SetCompletePairedGlyphs(MaxTextEditor * editor, int value) {
    editor->SetCompletePairedGlyphs(value);
}

int bmx_imgui_imcolortextedit_IsCompletingPairedGlyphs(MaxTextEditor * editor) {
    return editor->IsCompletingPairedGlyphs();
}

void bmx_imgui_imcolortextedit_SetOverwriteEnabled(MaxTextEditor * editor, int value) {
    editor->SetOverwriteEnabled(value);
}

int bmx_imgui_imcolortextedit_IsOverwriteEnabled(MaxTextEditor * editor) {
    return editor->IsOverwriteEnabled();
}

void bmx_imgui_imcolortextedit_SetMiddleMousePanMode(MaxTextEditor * editor) {
    editor->SetMiddleMousePanMode();
}

void bmx_imgui_imcolortextedit_SetMiddleMouseScrollMode(MaxTextEditor * editor) {
    editor->SetMiddleMouseScrollMode();
}

int bmx_imgui_imcolortextedit_IsMiddleMousePanMode(MaxTextEditor * editor) {
    return editor->IsMiddleMousePanMode();
}

void bmx_imgui_imcolortextedit_Render(MaxTextEditor * editor, BBString * title) {
    editor->Render(title, ImVec2(), 0);
}

void bmx_imgui_imcolortextedit_RenderEx(MaxTextEditor * editor, BBString * title, ImVec2 size, int border) {
    editor->Render(title, size, border);
}

void bmx_imgui_imcolortextedit_SetText(MaxTextEditor * editor, BBString * text) {
    editor->SetText(text);
}

BBString * bmx_imgui_imcolortextedit_GetText(MaxTextEditor * editor) {
    return editor->GetText();
}

BBString * bmx_imgui_imcolortextedit_GetCursorText(MaxTextEditor * editor, size_t cursor) {
    return editor->GetCursorText(cursor);
}

BBString * bmx_imgui_imcolortextedit_GetLineText(MaxTextEditor * editor, int line) {
    return editor->GetLineText(line);
}

BBString * bmx_imgui_imcolortextedit_GetSectionText(MaxTextEditor * editor, int startLine, int startColumn, int endLine, int endColumn) {
    return editor->GetSectionText(startLine, startColumn, endLine, endColumn);
}

void bmx_imgui_imcolortextedit_ReplaceSectionText(MaxTextEditor * editor, int startLine, int startColumn, int endLine, int endColumn, BBString * text) {
    editor->ReplaceSectionText(startLine, startColumn, endLine, endColumn, text);
}

void bmx_imgui_imcolortextedit_ClearText(MaxTextEditor * editor) {
    editor->ClearText();
}

int bmx_imgui_imcolortextedit_IsEmpty(MaxTextEditor * editor) {
    return editor->IsEmpty();
}

int bmx_imgui_imcolortextedit_GetLineCount(MaxTextEditor * editor) {
    return editor->GetLineCount();
}

void bmx_imgui_imcolortextedit_SetFocus(MaxTextEditor * editor) {
    editor->SetFocus();
}

void bmx_imgui_imcolortextedit_Cut(MaxTextEditor * editor) {
    editor->Cut();
}

void bmx_imgui_imcolortextedit_Copy(MaxTextEditor * editor) {
    editor->Copy();
}

void bmx_imgui_imcolortextedit_Paste(MaxTextEditor * editor) {
    editor->Paste();
}

void bmx_imgui_imcolortextedit_Undo(MaxTextEditor * editor) {
    editor->Undo();
}

void bmx_imgui_imcolortextedit_Redo(MaxTextEditor * editor) {
    editor->Redo();
}

int bmx_imgui_imcolortextedit_CanUndo(MaxTextEditor * editor) {
    return editor->CanUndo();
}

int bmx_imgui_imcolortextedit_CanRedo(MaxTextEditor * editor) {
    return editor->CanRedo();
}

size_t bmx_imgui_imcolortextedit_GetUndoIndex(MaxTextEditor * editor) {
    return editor->GetUndoIndex();
}

void bmx_imgui_imcolortextedit_SetCursor(MaxTextEditor * editor, int line, int column) {
    editor->SetCursor(line, column);
}

void bmx_imgui_imcolortextedit_SelectAll(MaxTextEditor * editor) {
    editor->SelectAll();
}

void bmx_imgui_imcolortextedit_SelectLine(MaxTextEditor * editor, int line) {
    editor->SelectLine(line);
}

void bmx_imgui_imcolortextedit_SelectLines(MaxTextEditor * editor, int _start, int _end) {
    editor->SelectLines(_start, _end);
}

void bmx_imgui_imcolortextedit_SelectRegion(MaxTextEditor * editor, int startLine, int startColumn, int endLine, int endColumn) {
    editor->SelectRegion(startLine, startColumn, endLine, endColumn);
}

void bmx_imgui_imcolortextedit_SelectToBrackets(MaxTextEditor * editor, int includeBrackets) {
    editor->SelectToBrackets(includeBrackets);
}

void bmx_imgui_imcolortextedit_GrowSelectionsToCurlyBrackets(MaxTextEditor * editor) {
    editor->GrowSelectionsToCurlyBrackets();
}

void bmx_imgui_imcolortextedit_ShrinkSelectionsToCurlyBrackets(MaxTextEditor * editor) {
    editor->ShrinkSelectionsToCurlyBrackets();
}

void bmx_imgui_imcolortextedit_AddNextOccurrence(MaxTextEditor * editor) {
    editor->AddNextOccurrence();
}

void bmx_imgui_imcolortextedit_SelectAllOccurrences(MaxTextEditor * editor) {
    editor->SelectAllOccurrences();
}

int bmx_imgui_imcolortextedit_AnyCursorHasSelection(MaxTextEditor * editor) {
    return editor->AnyCursorHasSelection();
}

int bmx_imgui_imcolortextedit_AllCursorsHaveSelection(MaxTextEditor * editor) {
    return editor->AllCursorsHaveSelection();
}

int bmx_imgui_imcolortextedit_CurrentCursorHasSelection(MaxTextEditor * editor) {
    return editor->CurrentCursorHasSelection();
}

void bmx_imgui_imcolortextedit_ClearCursors(MaxTextEditor * editor) {
    editor->ClearCursors();
}

size_t bmx_imgui_imcolortextedit_GetNumberOfCursors(MaxTextEditor * editor) {
    return editor->GetNumberOfCursors();
}

void bmx_imgui_imcolortextedit_GetCursor(MaxTextEditor * editor, int * line, int * column, size_t cursor) {
    editor->GetCursor(line, column, cursor);
}

void bmx_imgui_imcolortextedit_GetCursorSelection(MaxTextEditor * editor, int * startLine, int * startColumn, int * endLine, int * endColumn, size_t cursor) {
    editor->GetCursor(startLine, startColumn, endLine, endColumn, cursor);
}

void bmx_imgui_imcolortextedit_GetMainCursor(MaxTextEditor * editor, int * line, int * column) {
    editor->GetMainCursor(line, column);
}

void bmx_imgui_imcolortextedit_GetCurrentCursor(MaxTextEditor * editor, int * line, int * column) {
    editor->GetCurrentCursor(line, column);
}

MaxCursorPosition bmx_imgui_imcolortextedit_GetMainCursorPosition(MaxTextEditor * editor) {
    return editor->GetMainCursorPosition();
}

MaxCursorPosition bmx_imgui_imcolortextedit_GetCurrentCursorPosition(MaxTextEditor * editor) {
    return editor->GetCurrentCursorPosition();
}

MaxCursorPosition bmx_imgui_imcolortextedit_GetCursorPosition(MaxTextEditor * editor, size_t cursor) {
    return editor->GetCursorPosition(cursor);
}

MaxCursorSelection bmx_imgui_imcolortextedit_GetCursorSelectionEx(MaxTextEditor * editor, size_t cursor) {
    return editor->GetCursorSelection(cursor);
}

MaxCursorSelection bmx_imgui_imcolortextedit_GetMainCursorSelection(MaxTextEditor * editor) {
    return editor->GetMainCursorSelection();
}

BBString * bmx_imgui_imcolortextedit_GetWordAtScreenPos(MaxTextEditor * editor, ImVec2 screenPos) {
    return editor->GetWordAtScreenPos(screenPos);
}

void bmx_imgui_imcolortextedit_ScrollToLine(MaxTextEditor * editor, int line, int alignment) {
    editor->ScrollToLine(line, alignment);
}

int bmx_imgui_imcolortextedit_GetFirstVisibleLine(MaxTextEditor * editor) {
    return editor->GetFirstVisibleLine();
}

int bmx_imgui_imcolortextedit_GetLastVisibleLine(MaxTextEditor * editor) {
    return editor->GetLastVisibleLine();
}

int bmx_imgui_imcolortextedit_GetFirstVisibleColumn(MaxTextEditor * editor) {
    return editor->GetFirstVisibleColumn();
}

int bmx_imgui_imcolortextedit_GetLastVisibleColumn(MaxTextEditor * editor) {
    return editor->GetLastVisibleColumn();
}

float bmx_imgui_imcolortextedit_GetLineHeight(MaxTextEditor * editor) {
    return editor->GetLineHeight();
}

float bmx_imgui_imcolortextedit_GetGlyphWidth(MaxTextEditor * editor) {
    return editor->GetGlyphWidth();
}

void bmx_imgui_imcolortextedit_SelectFirstOccurrenceOf(MaxTextEditor * editor, BBString * text, int caseSensitive, int wholeWord) {
    editor->SelectFirstOccurrenceOf(text, caseSensitive, wholeWord);
}

void bmx_imgui_imcolortextedit_SelectNextOccurrenceOf(MaxTextEditor * editor, BBString * text, int caseSensitive, int wholeWord) {
    editor->SelectNextOccurrenceOf(text, caseSensitive, wholeWord);
}

void bmx_imgui_imcolortextedit_SelectAllOccurrencesOf(MaxTextEditor * editor, BBString * text, int caseSensitive, int wholeWord) {
    editor->SelectAllOccurrencesOf(text, caseSensitive, wholeWord);
}

void bmx_imgui_imcolortextedit_ReplaceTextInCurrentCursor(MaxTextEditor * editor, BBString * text) {
    editor->ReplaceTextInCurrentCursor(text);
}

void bmx_imgui_imcolortextedit_ReplaceTextInAllCursors(MaxTextEditor * editor, BBString * text) {
    editor->ReplaceTextInAllCursors(text);
}

void bmx_imgui_imcolortextedit_OpenFindReplaceWindow(MaxTextEditor * editor) {
    editor->OpenFindReplaceWindow();
}

void bmx_imgui_imcolortextedit_CloseFindReplaceWindow(MaxTextEditor * editor) {
    editor->CloseFindReplaceWindow();
}

void bmx_imgui_imcolortextedit_SetFindButtonLabel(MaxTextEditor * editor, BBString * label) {
    editor->SetFindButtonLabel(label);
}

void bmx_imgui_imcolortextedit_SetFindAllButtonLabel(MaxTextEditor * editor, BBString * label) {
    editor->SetFindAllButtonLabel(label);
}

void bmx_imgui_imcolortextedit_SetReplaceButtonLabel(MaxTextEditor * editor, BBString * label) {
    editor->SetReplaceButtonLabel(label);
}

void bmx_imgui_imcolortextedit_SetReplaceAllButtonLabel(MaxTextEditor * editor, BBString * label) {
    editor->SetReplaceAllButtonLabel(label);
}

int bmx_imgui_imcolortextedit_HasFindString(MaxTextEditor * editor) {
    return editor->HasFindString();
}

void bmx_imgui_imcolortextedit_FindNext(MaxTextEditor * editor) {
    editor->FindNext();
}

void bmx_imgui_imcolortextedit_FindAll(MaxTextEditor * editor) {
    editor->FindAll();
}

void bmx_imgui_imcolortextedit_AddMarker(MaxTextEditor * editor, int line, unsigned int lineNumberColor, unsigned int textColor, BBString * lineNumberTooltip, BBString * textTooltip) {
    editor->AddMarker(line, lineNumberColor, textColor, lineNumberTooltip, textTooltip);
}

void bmx_imgui_imcolortextedit_ClearMarkers(MaxTextEditor * editor) {
    editor->ClearMarkers();
}

int bmx_imgui_imcolortextedit_HasMarkers(MaxTextEditor * editor) {
    return editor->HasMarkers();
}

void bmx_imgui_imcolortextedit_IndentLines(MaxTextEditor * editor) {
    editor->IndentLines();
}

void bmx_imgui_imcolortextedit_DeindentLines(MaxTextEditor * editor) {
    editor->DeindentLines();
}

void bmx_imgui_imcolortextedit_MoveUpLines(MaxTextEditor * editor) {
    editor->MoveUpLines();
}

void bmx_imgui_imcolortextedit_MoveDownLines(MaxTextEditor * editor) {
    editor->MoveDownLines();
}

void bmx_imgui_imcolortextedit_ToggleComments(MaxTextEditor * editor) {
    editor->ToggleComments();
}

void bmx_imgui_imcolortextedit_SelectionToLowerCase(MaxTextEditor * editor) {
    editor->SelectionToLowerCase();
}

void bmx_imgui_imcolortextedit_SelectionToUpperCase(MaxTextEditor * editor) {
    editor->SelectionToUpperCase();
}

void bmx_imgui_imcolortextedit_StripTrailingWhitespaces(MaxTextEditor * editor) {
    editor->StripTrailingWhitespaces();
}

void bmx_imgui_imcolortextedit_TabsToSpaces(MaxTextEditor * editor) {
    editor->TabsToSpaces();
}

void bmx_imgui_imcolortextedit_SpacesToTabs(MaxTextEditor * editor) {
    editor->SpacesToTabs();
}

void bmx_imgui_imcolortextedit_setlanguage(MaxTextEditor * editor, const TextEditor::Language * language) {
    editor->SetLanguage(language);
}

///////////////////////////////////////////////////////////

const TextEditor::Language* bmx_imgui_imcolortextedit_GetLanguage(int language) {
    switch(language) {
        case 0: return nullptr;
        case 1: return TextEditor::Language::C();
        case 2: return TextEditor::Language::Cpp();
        case 3: return TextEditor::Language::Cs();
        case 4: return TextEditor::Language::AngelScript();
        case 5: return TextEditor::Language::Lua();
        case 6: return TextEditor::Language::Python();
        case 7: return TextEditor::Language::Glsl();
        case 8: return TextEditor::Language::Hlsl();
        case 9: return TextEditor::Language::Json();
        case 10: return TextEditor::Language::Markdown();
        case 11: return TextEditor::Language::Sql();
        case 12: return bmx_imgui_imcolortextedit_language_blitzmax();
        default: return nullptr;
    }
}
