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


extern "C" {
    const TextEditor::Language* bmx_imgui_imcolortextedit_language_blitzmax();
}

//
//	is_max_style_punctuation
//	[]{}!%#^&*()-+=~|<>?:/;,.
//
static bool is_max_style_punctuation(ImWchar character) {
	static bool punctuation[128] = {
		false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
		false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
		false,  true, false,  true, false,  true,  true, false,  true,  true,  true,  true,  true,  true,  true,  true,
		false, false, false, false, false, false, false, false, false, false,  true,  true,  true,  true,  true,  true,
		false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
		false, false, false, false, false, false, false, false, false, false, false,  true, false,  true,  true, false,
		false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
		false, false, false, false, false, false, false, false, false, false, false,  true,  true,  true,  true, false,
	};

	return character < 127 ? punctuation[character] : false;
}

static bool is_max_start_identifier_char(ImWchar codepoint) {
    return codepoint < 0x7f && (codepoint == '_' || static_cast<unsigned>((codepoint | 32) - 'a') < 26);
}

static bool is_max_identifier_char(ImWchar codepoint) {
	return codepoint < 0x7f && (codepoint == '_' || (static_cast<unsigned>((codepoint | 32) - 'a') < 26) || (static_cast<unsigned>(codepoint - '0') < 10));
}

static TextEditor::Iterator bmx_get_identifier(TextEditor::Iterator start, TextEditor::Iterator end) {
	if (start < end && is_max_start_identifier_char(*start)) {
		start++;

		while (start < end && is_max_identifier_char(*start)) {
			start++;
		}
	}

	return start;
}

static TextEditor::Iterator getBlitzMaxStyleNumber(TextEditor::Iterator start, TextEditor::Iterator end) {

	TextEditor::Iterator i = start;
	TextEditor::Iterator marker;

/*!re2c

	re2c:api = custom;
	re2c:api:style = free-form;
	re2c:define:YYCTYPE = ImWchar;
	re2c:define:YYPEEK = "i < end ? *i : 0";
	re2c:define:YYSKIP = "++i;";
	re2c:define:YYBACKUP = "marker = i;";
	re2c:define:YYRESTORE = "i = marker;";
	re2c:define:YYLESSTHAN = "i >= end";
	re2c:yyfill:enable = 0;
	re2c:eof = 0;
	digit        = [0-9];
	hexDigit     = [0-9a-fA-F];
	binDigit     = [01];
	sign         = [+-];
	decInt       = digit+;
	hexInt       = "$" hexDigit+;
	binInt       = "%" binDigit+;
	// Floats:
	//   10.0
	//   .5
	//   1e6
	//   1.5E-6
	float1       = digit+ "." digit* ([eE] sign? digit+)?;
	float2       = "." digit+ ([eE] sign? digit+)?;
	float3       = digit+ [eE] sign? digit+;
	float1 | float2 | float3	{ return i; }
	hexInt							{ return i; }
	binInt							{ return i; }
	decInt							{ return i; }
	$ { return start; }   // explicit end-of-input rule
	* { return start; }

*/

}

const TextEditor::Language* bmx_imgui_imcolortextedit_language_blitzmax() {
	static bool initialized = false;
	static TextEditor::Language language;

	if (!initialized) {
		language.name = "BlitzMax";
		language.singleLineComment = "'";
		language.commentStart = "rem";
		language.commentEnd = "endrem";
		language.commentEndAlt = "end rem";
		language.hasSingleQuotedStrings = false;
		language.hasDoubleQuotedStrings = true;
		language.otherStringStart = "\"\"\"";
		language.otherStringEnd = "\"\"\"";
		language.stringEscape = '~';
        language.caseSensitive = false;

		static const char* const keywords[] = {
			"strict", "superstrict", "public", "private", "protected", "byte", "short", "int", "float", "double", "long", "string", "object", "ptr", "var", "varptr",
            "mod", "continue", "exit", "include", "import", "module", "moduleinfo", "extern", "framework", "new", "self", "super", "eachin", "true", "false",
            "null", "not", "extends", "abstract", "final", "select", "case", "default", "const", "local", "global", "field", "method", "function", "type",
            "and", "or", "shl", "shr", "sar", "end", "if", "then", "else", "elseif", "endif", "while", "wend", "repeat", "until", "forever", "for", "to", "step", "goto",
            "next", "return", "alias", "rem", "endrem", "throw", "assert", "try", "catch", "finally", "nodebug", "incbin", "endselect", "endmethod",
            "endfunction", "endtype", "endextern", "endtry", "endwhile", "pi", "release", "defdata", "readdata", "restoredata", "interface",
            "endinterface", "implements", "size_t", "uint", "ulong", "struct", "endstruct", "operator", "where", "readonly", "export", "override",
            "enum", "endenum", "stackalloc", "inline", "fieldoffset", "staticarray", "threadedglobal", "longint", "ulongint", "using", "endusing", "do"
		};

		for (auto& keyword : keywords) { language.keywords.insert(keyword); }

		language.isPunctuation = is_max_style_punctuation;
		language.getIdentifier = bmx_get_identifier;
		language.getNumber = getBlitzMaxStyleNumber;
		initialized = true;
	}

	return &language;
}
