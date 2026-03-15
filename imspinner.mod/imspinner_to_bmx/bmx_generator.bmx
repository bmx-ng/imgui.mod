SuperStrict

Framework BRL.StandardIO
Import BRL.FileSystem
Import Text.RegEx
Import Collections.ArrayList

Type TDiscoveredArg
	Field raw:String          ' original arg text
	Field decl:String         ' "const ImColor &color"
	Field argType:String	  ' "ImColor"
	Field name:String         ' "color"
	Field hasDefault:Int
	Field defaultValue:String ' "white"
End Type

Type TDiscoveredFunc
	Field name:String
	Field rawArgs:String
	Field requiredArgs:TArrayList<TDiscoveredArg> = New TArrayList<TDiscoveredArg>
	Field optionalArgs:TArrayList<TDiscoveredArg> = New TArrayList<TDiscoveredArg>

	Method Dump()
		Print "Function : " + name
		Print "Raw args  : " + rawArgs

		Print "  Required:"
		For Local a:TDiscoveredArg = EachIn requiredArgs
			Print "    " + a.decl + "    [name=" + a.name + "] [type=" + a.argType + "]"
		Next

		Print "  Optional:"
		For Local a:TDiscoveredArg = EachIn optionalArgs
			Print "    " + a.decl + " = " + a.defaultValue + "    [name=" + a.name + "] [type=" + a.argType + "]"
		Next

		Print ""
	End Method
End Type


Type TCodeGenerator

	Const GEN_FOLDER:String = "../generated"
	Const GEN_COMMON:String = "common_gen.bmx"
	Const GEN_GLUE:String = "glue_gen.cpp"

	Field path:String

	Field funcs:TArrayList<TDiscoveredFunc> = New TArrayList<TDiscoveredFunc>

	Method New(path:String)
		Self.path = RealPath(path)
	End Method

	Method Load()
		funcs = DiscoverSpinnerFunctions(path)
	End Method

	Method Generate()
		
		If Not CreateDir(GEN_FOLDER, True) Then
			Print "Failed to create generation folder : " + GEN_FOLDER
			End
		End If

		Print "Using generation folder : " + GEN_FOLDER

		GenerateCommon()
		GenerateGlue()

	End Method

	Method GenerateCommon()
		Print "Generating common file... : " + GEN_COMMON

		Using
			Local stream:TStream = WriteStream(GEN_FOLDER + "/" + GEN_COMMON)
		Do
			CommonHeader(stream)

			GenerateCommonBmx(stream)

			' gen blitzmax functions
			GenerateBmxFunctions(stream)

			' gen extern functions
			GenerateExterns(stream)
		End Using
	End Method

	Method GenerateGlue()
		Print "Generating glue file... : " + GEN_GLUE

		Using
			Local stream:TStream = WriteStream(GEN_FOLDER + "/" + GEN_GLUE)
		Do

			GlueHeader(stream)
			GenerateGlueFunctions(stream)

		End Using
	End Method

	Method StripCommentMarkers:String(s:String)
		s = s.Replace("/*", "")
		s = s.Replace("*/", "")
		Return s.Trim()
	End Method

	Method NormalizeType:String(t:String)

		t = t.Trim()

		t = t.Replace("const ", "")
		t = t.Replace("&", "")
		t = t.Trim()

		If t.Contains("char *") Or t.Contains("char*") Then
			Return "char*"
		End If

		If t.Contains("float *") Then
			Return "float*"
		End If

		Local parts:String[] = t.Split(" ")

		Return parts[0]
	End Method

	Method ExtractArgName:String(argDecl:String)

		Local s:String = StripCommentMarkers(argDecl)
		s = s.Replace("&", " ")
		s = s.Replace("*", " ")
		s = s.Trim()

		Local parts:String[] = s.Split(" ")
		If parts.Length = 0 Then Return ""

		For Local i:Int = parts.Length - 1 To 0 Step -1
			Local p:String = parts[i].Trim()
			If p <> "" Then Return p
		Next

		Return ""
	End Method

	Method ParseArgument:TDiscoveredArg(argText:String)
		Local a:TDiscoveredArg = New TDiscoveredArg
		a.raw = argText.Trim()

		Local eqPos:Int = a.raw.Find("=")
		If eqPos >= 0 Then
			a.hasDefault = True
			a.decl = StripCommentMarkers(a.raw[..eqPos].Trim())
			a.argType = NormalizeType(a.decl)
			a.defaultValue = a.raw[eqPos + 1..].Trim()
		Else
			a.hasDefault = False
			a.decl = StripCommentMarkers(a.raw)
			a.argType = NormalizeType(a.decl)
			a.defaultValue = ""
		End If

		a.name = ExtractArgName(a.decl)
		Return a
	End Method

	Method ParseSpinnerFunction:TDiscoveredFunc(line:String, rx:TRegEx)
		If line.Find("inline void Spinner") = -1 Then
			Return Null
		End If

		Local m:TRegExMatch = rx.Find(line)
		If Not m Then Return Null

		' Assumes capture group 1 = function name
		'         capture group 2 = argument list
		Local funcName:String = m.SubExp(1)
		Local rawArgs:String = m.SubExp(2)

		Local f:TDiscoveredFunc = New TDiscoveredFunc
		f.name = funcName
		f.rawArgs = rawArgs

		Local args:String[] = rawArgs.Split(",")

		For Local i:Int = 0 Until args.Length
			Local part:String = args[i].Trim()
			If part = "" Then Continue

			Local a:TDiscoveredArg = ParseArgument(part)
			If a.hasDefault Then
				f.optionalArgs.Add(a)
			Else
				f.requiredArgs.Add(a)
			End If
		Next

		Return f
	End Method

	Method DiscoverSpinnerFunctions:TArrayList<TDiscoveredFunc>(headerPath:String)
		Local results:TArrayList<TDiscoveredFunc> = New TArrayList<TDiscoveredFunc>

		Using
			Local file:TStream = ReadFile(headerPath)
		Do
			If Not file Then
				RuntimeError "Could not open header: " + headerPath
			End If

			Local rx:TRegEx = TRegEx.Create("^\s*inline\s+void\s+(Spinner\w+)\(([^)]*)\)")

			While Not Eof(file)
				Local line:String = ReadLine(file)

				Local f:TDiscoveredFunc = ParseSpinnerFunction(line, rx)
				If f Then
					results.Add(f)
				End If
			Wend
		End Using
		Return results
	End Method

	Method CommonHeader(stream:TStream)
		stream.WriteString("""
		'
		' This file is generated. Do not modify it manually.~n
		""")
		stream.WriteString("' Generated from imspinner.h header file.~n")
		stream.WriteString("""
		'
		SuperStrict

		Import "../../imgui.mod/imgui/*.h"
		Import "../imspinner/*.h"
		Import "glue_gen.cpp"


		""")
	End Method

	Method GenerateCommonBmx(stream:TStream)

		stream.WriteString("""
		
		Const COLOR_WHITE:UInt = $FFFFFFFF:UInt
		Const COLOR_HALF_WHITE:UInt = $80FFFFFF:UInt
		Const COLOR_RED:UInt = $FF0000FF:UInt
	
		~n~n
		""")
	End Method

	Method ToBlitzType:String(cppType:String)
		Select cppType
			Case "char*"
				Return ":String"
			Case "bool", "int"
				Return ":Int"
			Case "size_t"
				Return ":Size_T"
			Case "float"
				Return ":Float"
			Case "double"
				Return ":Double"
			Case "ImColor"
				Return ":UInt"
			Case "LeafColor"
				Return ":UInt(userData:Object, i:Int), userData:Object"
			Case "float*"
				Return ":Float Ptr"
			Default
				Throw "Unmapped type: " + cppType
		End Select
	End Method

	Method ToBlitzValue:String(value:String)

		value = value.Trim()

		If value.EndsWith("f") Then
			value = value[..value.Length-1]
			If value.EndsWith(".") Then
				value = value + "0"
			End If
		End If

		If value = "white" Then
			Return "COLOR_WHITE"
		Else If value = "half_white" Then
			Return "COLOR_HALF_WHITE"
		Else If value = "red" Then
			Return "COLOR_RED"
		End If

		If value = "true" Then
			Return "True"
		Else If value = "false" Then
			Return "False"
		End If

		If value.StartsWith("0x") Then
			Return "$" + value[2..]
		End If

		If value = "PI_2" Then
			Return "360"
		End If

		If value = "IM_PI" Then
			Return "180"
		End If

		If value = "PI_DIV_4" Then
			Return "45"
		End If

		If value = "PI_DIV_2" Then
			Return "90"
		End If

		If value.StartsWith("IM_PI") Then
			' Handle things like "IM_PI * 2"
			Return value.Replace("IM_PI", "180")
		End If

		Return value
	End Method

	Method ToBlitzGlueType:String(cppType:String)
		Select cppType
			Case "char*"
				Return "BBString *"
			Case "bool"
				Return "int"
			Case "ImColor"
				Return "ImU32"
			Case "LeafColor"
				Return "LeafColorFuncEx"
		End Select

		Return cppType
	End Method

	Method GenerateBmxFunctions(stream:TStream)

		For Local f:TDiscoveredFunc = EachIn funcs
			stream.WriteString("Function ImSpinner_" + f.name.Replace("Spinner", "") + "(")

			Local first:Int = True

			For Local a:TDiscoveredArg = EachIn f.requiredArgs
				If Not first Then
					stream.WriteString(", ")
				End If
				
				stream.WriteString(a.name)
				stream.WriteString(ToBlitzType(a.argType))
				first = False
			Next

			For Local a:TDiscoveredArg = EachIn f.optionalArgs
				If Not first Then
					stream.WriteString(", ")
				End If

				stream.WriteString(a.name)
				stream.WriteString(ToBlitzType(a.argType))
				stream.WriteString(" = " + ToBlitzValue(a.defaultValue))

				first = False
			Next

			stream.WriteString(")~n")

			stream.WriteString("~t_ImSpinner_" + f.name.Replace("Spinner", "") + "(")

			first = True

			For Local a:TDiscoveredArg = EachIn f.requiredArgs
				If Not first Then stream.WriteString(", ")

				If a.argType = "LeafColor" Then
					stream.WriteString(a.name + ", userData")
				Else
					stream.WriteString(a.name)
				End If
				first = False
			Next

			For Local a:TDiscoveredArg = EachIn f.optionalArgs
				If Not first Then stream.WriteString(", ")
				stream.WriteString(a.name)
				first = False
			Next

			stream.WriteString(")~n")
			stream.WriteString("End Function~n~n")
		Next

	End Method

	Method GenerateExterns(stream:TStream)
		stream.WriteString("Extern~n")

		For Local f:TDiscoveredFunc = EachIn funcs

			stream.WriteString("~tFunction _ImSpinner_" + f.name.Replace("Spinner", "") + "(")

			Local first:Int = True

			For Local a:TDiscoveredArg = EachIn f.requiredArgs
				If Not first Then
					stream.WriteString(", ")
				End If
				
				stream.WriteString(a.name)
				stream.WriteString(ToBlitzType(a.argType))
				first = False
			Next

			For Local a:TDiscoveredArg = EachIn f.optionalArgs
				If Not first Then
					stream.WriteString(", ")
				End If

				stream.WriteString(a.name)
				stream.WriteString(ToBlitzType(a.argType))

				first = False
			Next

			stream.WriteString(")")

			stream.WriteString("=~qImSpinner_" + f.name.Replace("Spinner", "")) + "~q~n"
		Next

		stream.WriteString("End Extern~n")
	End Method

	Method GlueHeader(stream:TStream)
		stream.WriteString("""
		//
		// This file is generated. Do not modify it manually.
		// Generated from imspinner.h header file.
		//
		#include "imspinner.h"
		#include "brl.mod/blitz.mod/blitz.h"
		~n
		""")
	End Method

	Method GenerateGlueFunctions(stream:TStream)
		stream.WriteString("extern ~qC~q {~n")

		stream.WriteString("~tinline static float degToRad(float deg) { return deg * (IM_PI / 180.0f); }~n~n")
		stream.WriteString("""
		typedef ImU32 (*LeafColorFuncEx)(void* userData, int index);

		struct LeafColorContext {
			LeafColorFuncEx func;
			void* userData;
		};

		static thread_local LeafColorContext* g_leaf_ctx = nullptr;

		static ImColor LeafColorThunk(int i) {
			if (!g_leaf_ctx || !g_leaf_ctx->func) {
				return ImColor(0);
			}
			return ImColor(g_leaf_ctx->func(g_leaf_ctx->userData, i));
		}
		~n~n
		""")

		For Local f:TDiscoveredFunc = EachIn funcs
			stream.WriteString("~tvoid ImSpinner_" + f.name.Replace("Spinner", "") + "(")

			Local first:Int = True

			For Local a:TDiscoveredArg = EachIn f.requiredArgs
				If Not first Then
					stream.WriteString(", ")
				End If
				
				If a.argType = "LeafColor" Then
					stream.WriteString("LeafColorFuncEx " + a.name)
					stream.WriteString(", ")
					stream.WriteString("void* userData")
				Else
					stream.WriteString(ToBlitzGlueType(a.argType) + " " + a.name)
				End If
				first = False
			Next

			For Local a:TDiscoveredArg = EachIn f.optionalArgs
				If Not first Then
					stream.WriteString(", ")
				End If

				stream.WriteString(ToBlitzGlueType(a.argType) + " " + a.name)

				first = False
			Next

			stream.WriteString(") {~n")

			Local c:Int
			Local col:Int
			' strings
			For Local a:TDiscoveredArg = EachIn f.requiredArgs
				If a.argType = "char*" Then
					stream.WriteString("~t~tchar* c" + c + " = (char*)bbStringToUTF8String(" + a.name + ");~n")
					c :+ 1
				End If

				If a.argType = "ImColor" Then
					stream.WriteString("~t~tImColor col" + col + " = ImColor(" + a.name + ");~n")
					col :+ 1
				End If

				If a.argType = "LeafColor" Then
					stream.WriteString("~t~tLeafColorContext ctx { " + a.name + ", userData };~n")
        			stream.WriteString("~t~tLeafColorContext* prev = g_leaf_ctx;~n")
        			stream.WriteString("~t~tg_leaf_ctx = &ctx;~n")
				End If
			Next

			For Local a:TDiscoveredArg = EachIn f.optionalArgs
				If a.argType = "char*" Then
					stream.WriteString("~t~tchar* c" + c + " = (char*)bbStringToUTF8String(" + a.name + ");~n")
					c :+ 1
				End If

				If a.argType = "ImColor" Then
					stream.WriteString("~t~tImColor col" + col + " = ImColor(" + a.name + ");~n")
					col :+ 1
				End If
			Next

			Local maxC:Int = c

			stream.WriteString("~t~tImSpinner::" + f.name + "(")

			first = True

			c = 0
			col = 0
			For Local a:TDiscoveredArg = EachIn f.requiredArgs
				If Not first Then stream.WriteString(", ")
				If a.argType = "char*" Then
					stream.WriteString("c" + c)
					c :+ 1
				Else If a.argType = "ImColor" Then
					stream.WriteString("col" + col)
					col :+ 1
				Else If a.argType = "bool" Then
					stream.WriteString("(bool)" + a.name)
				Else If a.name.StartsWith("ang") Or a.name.EndsWith("angle") Then
					' Handle angle parameters by converting from degrees to radians.
					stream.WriteString("degToRad(" + a.name + ")")
				Else If a.argType = "LeafColor" Then
					stream.WriteString("LeafColorThunk")
				Else
					stream.WriteString(a.name)
				End If
				first = False
			Next

			For Local a:TDiscoveredArg = EachIn f.optionalArgs
				If Not first Then stream.WriteString(", ")
				If a.argType = "char*" Then
					stream.WriteString("c" + c)
					c :+ 1
				Else If a.argType = "ImColor" Then
					stream.WriteString("ImColor(" + a.name + ")")
				Else If a.argType = "bool" Then
					stream.WriteString("(bool)" + a.name)
				Else If a.name.StartsWith("ang") Or a.name.EndsWith("angle") Then
					' Handle angle parameters by converting from degrees to radians.
					stream.WriteString("degToRad(" + a.name + ")")
				Else
					stream.WriteString(a.name)
				End If
				first = False
			Next

			stream.WriteString(");~n")

			For Local i:Int = 0 Until maxC
				stream.WriteString("~t~tbbMemFree(c" + i + ");~n")
			Next

			stream.WriteString("~t}~n~n")
		Next

		stream.WriteString("} // extern ~qC~q~n")
	End Method
End Type

Local gen:TCodeGenerator = New TCodeGenerator("../imspinner/imspinner.h")

gen.Load()

gen.Generate()
