SuperStrict

Framework brl.standardio
Import text.jconv
import brl.filesystem
import brl.collections

Type TIGModel
	Field defines:TIGDefine[]
	Field enums:TIGEnum[]
	Field typedefs:TIGTypeDef[]
	Field structs:TIGStruct[]
	Field functions:TIGFunction[]
End Type

Type TIGFunction
	Field name:String
	Field original_fully_qualified_name:String
	Field return_type:TIGType
	Field arguments:TIGArgument[]
	Field is_default_argument_helper:Int
	Field is_manual_helper:Int
	Field is_imstr_helper:Int
	Field has_imstr_helper:Int
	Field is_unformatted_helper:Int
	Field is_static:Int
	Field comments:TIGComments
	Field conditionals:TIGConditional[]
	Field is_internal:Int
	Field source_location:TIGSourceLocation

End Type

Type TIGSourceLocation
	Field filename:String
	Field line:Int
End Type

Type TIGComments
	Field preceding:String[]
	Field attached:String
End Type

Type TIGArgument
	Field name:String
	Field arg_type:TIGType { serializedName = "type" }
	Field is_array:Int
	Field is_varargs:Int
	Field default_value:String
	Field is_instance_pointer:Int
End Type

Type TIGType
	Field declaration:String
	Field description:TIGDescription
	Field type_details:TIGTypeDetails
End Type

Type TIGDescription
	Field kind:String
	Field name:String
	Field inner_type:TIGInnerType
End Type

Type TIGTypeDetails
	Field flavour:String
	Field return_type:TIGType
	Field arguments:TIGArgument[]
End Type

Type TIGInnerType
	Field kind:String
	Field builtin_type:String
	Field storage_classes:String[]
	Field return_type:TIGType
	Field parameters:TIGDescription[]
	Field inner_type:TIGInnerType
End Type

Type TIGStruct
	Field name:String
	Field original_fully_qualified_name:String
	Field kind:String
	Field by_value:Int
	Field forward_declaration:Int
	Field is_anonymous:Int
	Field fields:TIGField[]
	Field is_internal:Int
	Field source_location:TIGSourceLocation
End Type

Type TIGField
	Field name:String
	Field is_array:Int
	Field is_anonymous:Int
	Field arg_type:TIGType
	Field is_internal:Int
	Field source_location:TIGSourceLocation
End Type

Type TIGTypeDef
	Field name:String
	Field original_fully_qualified_name:String
	Field typedef_type:TIGType { serializedName = "type" }
	Field comments:TIGComments
	Field is_internal:Int
	Field source_location:TIGSourceLocation
End Type

Type TIGEnum
	Field name:String
	Field original_fully_qualified_name:String
	Field is_flags_enum:Int
	Field elements:TIGEnumElement[]
	Field comments:TIGComments
	Field is_internal:Int
	Field source_location:TIGSourceLocation
End Type

Type TIGEnumElement
	Field name:String
	Field value_expression:String
	Field value:Int
	Field is_count:Int
	Field comments:TIGComments
	Field is_internal:Int
	Field source_location:TIGSourceLocation
End Type

Type TIGDefine
	Field name:String
	Field content:String
	Field conditionals:TIGConditional[]
	Field is_internal:Int
	Field source_location:TIGSourceLocation
End Type

Type TIGConditional
	Field condition:String
	Field expression:String
End Type

Type TCodeGenerator

	Const GEN_FOLDER:String = "../generated"
	Const GEN_COMMON:String = "common_gen.bmx"
	Const GEN_GLUE:String = "glue_gen.c"

	Field path:String
	Field model:TIGModel

	Field imguiVersion:String

	Field conditionals:String[] = ["IMGUI_DISABLE_OBSOLETE_FUNCTIONS", "IMGUI_HAS_IMSTR"]

	Field enumMap:TTreeMap<String, String> = new TTreeMap<String, String>()

	Method New(path:String)
		Self.path = RealPath(path)
	End Method

	Method Load()
		Print "Loading configuration..."

		Local stream:TStream = ReadStream(path)

		If Not stream Then
			Throw "Failed to open model file : " + path
		End If

		Local jconv:TJConv = New TJConvBuilder.Build()

		model = TIGModel(jconv.FromJson(stream, "TIGModel"))

		stream.Close()

		imguiVersion = FindDefineValue("IMGUI_VERSION").Replace("~q", "")

		Print "Loaded (" + imguiVersion + ")"

		Print "Model : "
		Print "  Defines: " + model.defines.Length
		Print "  Enums: " + model.enums.Length
		Print "  Typedefs: " + model.typedefs.Length
		Print "  Structs: " + model.structs.Length
		Print "  Functions: " + model.functions.Length

		BuildEnumMap()
	End Method

	Method BuildEnumMap()
		For Local e:TIGEnum = Eachin model.enums
			If e.is_internal Then Continue

			Local enumName:String = e.name
			If enumName.EndsWith("_") Then
				enumName = enumName[..enumName.Length - 1]
			End If

			enumMap[enumName] = EnumNameToBmxName(e.name)
		Next
	End Method

	Method FindDefineValue:String(defineName:String)
		If model.defines Then
			For Local define:TIGDefine = Eachin model.defines
				If define.name = defineName Then
					Return define.content
				End If
			Next
		End If
	End Method

	Method Generate()

		If FileExists(GEN_FOLDER) Then
			Print "Cleaning generation folder... : " + GEN_FOLDER

			'If Not DeleteDir(GEN_FOLDER, True) Then
			'	Print "Failed to delete generation folder : " + GEN_FOLDER
			'	End
			'End If
		End If
		
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

		Local stream:TStream = WriteStream(GEN_FOLDER + "/" + GEN_COMMON)

		CommonHeader(stream)

		' gen common types
		GenerateCommonBmxTypes(stream)

		GeneratePreconstructed(stream)

		' gen blitzmax functions
		GenerateBmxFunctions(stream)

		' gen extern functions
		GenerateExterns(stream)

		GenerateEnums(stream)

		stream.Close()

	End Method

	Method GenerateGlue()
		Print "Generating glue file... : " + GEN_GLUE

		Local stream:TStream = WriteStream(GEN_FOLDER + "/" + GEN_GLUE)

		GlueHeader(stream)

		GenerateGlueFunctions(stream)

		stream.Close()
	End Method

	Method CommonHeader(stream:TStream)
		stream.WriteString("""
		'
		' This file is generated. Do not modify it manually.~n
		""")
		stream.WriteString("' Generated from ImGui " + imguiVersion + " header file.~n")
		stream.WriteString("""
		'
		SuperStrict

		Import "../source.bmx"


		""")
	End Method

	Method GlueHeader(stream:TStream)
		stream.WriteString("""
		//
		// This file is generated. Do not modify it manually.

		""")
		stream.WriteString("// Generated from ImGui " + imguiVersion + " header file.~n")
		stream.WriteString("""
		//

		#include "dcimgui.h"
		#include "brl.mod/blitz.mod/blitz.h"


		""")
	End Method

	Method GeneratePreconstructed(stream:TStream)
		stream.WriteString("""
		Struct SImVec2
			Field x:Float
			Field y:Float

			Method New(x:Float, y:Float)
				Self.x = x
				Self.y = y
			End Method
		End Struct

		Struct SImVec4
			Field x:Float
			Field y:Float
			Field z:Float
			Field w:Float

			Method New(x:Float, y:Float, z:Float, w:Float)
				Self.x = x
				Self.y = y
				Self.z = z
				Self.w = w
			End Method
		End Struct
		~n~n
		""")

		' functions
		stream.WriteString("""
		Function ImGui_CreateContext:TImGuiContext(atlas:TImguiFontAtlas = Null)
			If atlas Then
				Return TImGuiContext._Create(_ImGui_CreateContext(atlas.handle))
			Else
				Return TImGuiContext._Create(_ImGui_CreateContext(Null))
			End If
		End Function

		Function ImGui_DestroyContext(ctx:TImGuiContext = Null)
			If ctx Then
				_ImGui_DestroyContext(ctx.handle)
			Else
				_ImGui_DestroyContext(Null)
			End If
		End Function

		Function ImGui_SetCurrentContext(ctxt:TImGuiContext)
			_ImGui_SetCurrentContext(ctxt.handle)
		End Function

		Function ImGui_StyleColorsDark(dst:TImGuiStyle = Null)
			If dst Then
				_ImGui_StyleColorsDark(dst.handle)
			Else
				_ImGui_StyleColorsDark(Null)
			End If
		End Function

		Function ImGui_StyleColorsLight(dst:TImGuiStyle = Null)
			If dst Then
				_ImGui_StyleColorsLight(dst.handle)
			Else
				_ImGui_StyleColorsLight(Null)
			End If
		End Function

		Function ImGui_StyleColorsClassic(dst:TImGuiStyle = Null)
			If dst Then
				_ImGui_StyleColorsClassic(dst.handle)
			Else
				_ImGui_StyleColorsClassic(Null)
			End If
		End Function

		Rem
		bbdoc: 
		about: @bufSize is the size of the buffer in characters.
		End Rem
		Function ImGui_InputText:Int(label:String, buf:String Var, bufSize:Int, flags:EImGuiInputTextFlags)
			Return _ImGui_InputText(label, buf, Size_T(bufSize), flags)
		End Function

		""")

		stream.WriteString("~n~n")
	End Method

	Method GenerateBmxFunctions(stream:TStream)

		For Local func:TIGFunction = eachin model.functions
			If Not FunctionRequired(func) Then Continue

			' skip functions that we implement directly
			Select func.name
				Case "ImGui_CreateContext", "ImGui_DestroyContext", "ImGui_SetCurrentContext", "ImGui_StyleColorsDark", ..
					"ImGui_StyleColorsLight", "ImGui_StyleColorsClassic", "ImGui_InputText"
					Continue
			End Select

			' comments
			If func.comments Then
				stream.WriteString("Rem~n")

				stream.WriteString("bbdoc: ")
				If func.comments.attached Then
					stream.WriteString(func.comments.attached.Replace("//", ""))
					stream.WriteString("~n")
				Else
					stream.WriteString("~n")
				End If

				stream.WriteString("End Rem~n")
			End If

			stream.WriteString("Function " + func.name)
			
			' return type
			Local bmxFunc:Int = False
			Local returnType:String
			If func.return_type Then
				If func.return_type.declaration = "const char*" Then
					returnType = ":String"
					bmxFunc = True
				Else If func.return_type.declaration = "ImGuiContext*" Then
					returnType = ":TImGuiContext"
				Else If func.return_type.declaration = "ImFontAtlas*" Then
					returnType = ":TImFontAtlas"
				Else If func.return_type.declaration = "ImDrawList*" Then
					returnType = ":TImDrawList"
				Else If func.return_type.declaration = "ImGuiTextFilter*" Or func.return_type.declaration = "const ImGuiTextFilter*" Then
					returnType = ":TImGuiTextFilter"
				Else If func.return_type.declaration = "ImGuiTextBuffer*" Or func.return_type.declaration = "const ImGuiTextBuffer*" Then
					returnType = ":TImGuiTextBuffer"
				Else If func.return_type.declaration = "ImGuiStyle*" Then
					returnType = ":TImGuiStyle"
				Else If func.return_type.declaration = "ImGuiIO*" Then
					returnType = ":TImGuiIO"
				Else If func.return_type.declaration.EndsWith("*") Then
					returnType = ":Byte Ptr"
				Else
					Select func.return_type.declaration
						Case "void"
							returnType = ""
						Case "bool"
							returnType = ":Int"
						Case "char"
							returnType = ":Byte"
						Case "unsigned char"
							returnType = ":Byte"
						Case "short"
							returnType = ":Short"
						Case "unsigned short"
							returnType = ":UShort"
						Case "int"
							returnType = ":Int"
						Case "unsigned int"
							returnType = ":UInt"
						Case "long"
							returnType = ":Long"
						Case "unsigned long"
							returnType = ":ULong"
						Case "float"
							returnType = ":Float"
						Case "double"
							returnType = ":Double"
						Case "ImGuiID"
							returnType = ":UInt"
						Case "ImU32"
							returnType = ":UInt"
						Case "ImTextureID"
							returnType = ":ULong"
						Case "ImColor"
							returnType = ":UInt"
						Default
							If enumMap.ContainsKey(func.return_type.declaration) Then
								returnType = ":" + enumMap[func.return_type.declaration]
							Else if func.return_type.declaration = "ImVec2" Then
								returnType = ":SImVec2"
							Else if func.return_type.declaration = "ImVec4" Then
								returnType = ":SImVec4"
							Else
								' TODO : probably map to a proper type
								returnType = ":" + func.return_type.declaration
							End If
					End Select
				End If
			End If

			stream.WriteString(returnType)



			stream.WriteString("(")

			' args - function definition
			Local index:Int
			For Local arg:TIGArgument = eachin func.arguments

				' we don't support var args
				If arg.is_varargs Or arg.arg_type.declaration = "va_list" Then
					bmxFunc = True
					Continue
				End If

				If index Then
					stream.WriteString(", ")
				End If

				Local prefix:String
				Local argType:String
				If arg.arg_type Then
					If arg.arg_type.declaration = "const char*" Then
						argType = ":String"
						bmxFunc = True
					Else If arg.arg_type.declaration = "ImFontAtlas*" Then
						argType = ":TImFontAtlas"
					Else If arg.arg_type.declaration = "ImFont*" Then
						argType = ":TImFont"
					Else If arg.arg_type.declaration = "ImDrawList*" Then
						argType = ":TImDrawList"
					Else If arg.arg_type.declaration = "const ImGuiTextFilter*" Or arg.arg_type.declaration = "ImGuiTextFilter*" Then
						argType = ":TImGuiTextFilter"
					Else If arg.arg_type.declaration = "const ImGuiTextBuffer*" Or arg.arg_type.declaration = "ImGuiTextBuffer*" Then
						argType = ":TImGuiTextBuffer"
					Else If arg.arg_type.declaration = "ImGuiStyle*" Then
						argType = ":TImGuiStyle"
					Else If arg.arg_type.declaration = "ImGuiIO*" Then
						argType = ":TImGuiIO"
					Else If arg.arg_type.declaration = "bool*" Then
						argType = ":Int Var"
					Else If arg.arg_type.declaration = "int*" Then
						argType = ":Int Var"
					Else If arg.arg_type.declaration = "float*" Then
						argType = ":Float Var"
					Else If arg.arg_type.declaration = "unsigned int*" Then
						argType = ":UInt Var"
					Else If arg.arg_type.declaration = "const char*const[]" Then
						argType = ":String[]"
						bmxFunc = True
					Else If arg.arg_type.declaration = "float (*values_getter)(void* data, int idx)" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "const char* (*getter)(void* user_data, int idx)" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "ImGuiSizeCallback" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "ImGuiInputTextCallback" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "ImDrawCallback" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "ImGuiSelectionUserData" Then
						argType = ":Long"
					Else If arg.arg_type.declaration = "ImGuiMemAllocFunc" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "ImGuiMemFreeFunc" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration.EndsWith("*") Then
						argType = ":Byte Ptr"
					Else
						Select arg.arg_type.declaration
							Case "void"
								argType = ""
							Case "bool"
								argType = ":Int"
							Case "char"
								argType = ":Byte"
							Case "unsigned char"
								argType = ":Byte"
							Case "short"
								argType = ":Short"
							Case "unsigned short"
								argType = ":UShort"
							Case "int"
								argType = ":Int"
							Case "unsigned int"
								argType = ":UInt"
							Case "long"
								argType = ":Long"
							Case "unsigned long"
								argType = ":ULong"
							Case "float"
								argType = ":Float"
							Case "double"
								argType = ":Double"
							Case "ImGuiID"
								argType = ":UInt"
							Case "ImU32"
								argType = ":UInt"
							Case "ImTextureID"
								argType = ":ULong"
							Case "ImGuiKeyChord"
								argType = ":Int"
							Case "ImWchar16"
								argType = ":Short"
							Case "ImColor"
								argType = ":UInt"
							Case "ImDrawIdx"
								argType = ":Short"
							Case "ImWchar"
								argType = ":Short"
							Default
								If enumMap.ContainsKey(arg.arg_type.declaration) Then
									argType = ":" + enumMap[arg.arg_type.declaration]
								Else if arg.arg_type.declaration.EndsWith("]") Then
									prefix = "StaticArray "
									argType = ":" + arg.arg_type.declaration
								Else if arg.arg_type.declaration = "ImVec2" Then
									argType = ":SImVec2"
								Else if arg.arg_type.declaration = "ImVec4" Then
									argType = ":SImVec4"
								Else
									' TODO : probably map to a proper type
									argType = ":" + arg.arg_type.declaration
								End If
						End Select
					End If
				End If

				Local name:String = arg.name

				If name = "repeat" Then
					name = "rep"
				Else If name = "self" Then
					name = "this"
				Else If name = "step" Then
					name = "stp"
				Else If name = "type" Then
					name = "kind"
				Else If name = "ptr" Then
					name = "handle"
				End If

				stream.WriteString(prefix + name + argType)

				index :+ 1
			Next
			
			stream.WriteString(")~n")

			' body
			Local wrapped:Int = False
			If func.return_type And returnType Then
				stream.WriteString("~tReturn ")

				If func.return_type.declaration = "ImGuiContext*" Then
					stream.WriteString("TImGuiContext._Create(")
					wrapped = True
				Else If func.return_type.declaration = "ImDrawList*" Then
						stream.WriteString("TImDrawList._Create(")
						wrapped = True
				Else If func.return_type.declaration = "ImGuiStyle*" Then
						stream.WriteString("TImGuiStyle._Create(")
						wrapped = True
				Else If func.return_type.declaration = "ImGuiIO*" Then
						stream.WriteString("TImGuiIO._Create(")
						wrapped = True
				End If
			Else
				stream.WriteString("~t")
			End If

			stream.WriteString("_")
			stream.WriteString(func.name)
			stream.WriteString("(")

			' args

			index = 0
			For Local arg:TIGArgument = eachin func.arguments

				' we don't support var args
				If arg.is_varargs Or arg.arg_type.declaration = "va_list" Then
					bmxFunc = True
					Continue
				End If

				If index Then
					stream.WriteString(", ")
				End If

				Local name:String = arg.name

				If name = "repeat" Then
					name = "rep"
				Else If name = "self" Then
					name = "this"
				Else If name = "step" Then
					name = "stp"
				Else If name = "type" Then
					name = "kind"
				Else If name = "ptr" Then
					name = "handle"
				End If

				If arg.arg_type Then
					If arg.arg_type.declaration = "ImGuiContext*" Then
						name = name + ".handle"
					Else If arg.arg_type.declaration = "ImFontAtlas*" Then
						name = name + ".handle"
					Else If arg.arg_type.declaration = "ImFont*" Then
						name = name + ".handle"
					Else If arg.arg_type.declaration = "ImDrawList*" Then
						name = name + ".handle"
					Else If arg.arg_type.declaration = "ImGuiStyle*" Then
						name = name + ".handle"
					Else If arg.arg_type.declaration = "ImGuiIO*" Then
						name = name + ".handle"
					Else If arg.arg_type.declaration = "ImGuiTextFilter*" Or arg.arg_type.declaration = "const ImGuiTextFilter*" Then
						name = name + ".handle"
					Else If arg.arg_type.declaration = "ImGuiTextBuffer*" Or arg.arg_type.declaration = "const ImGuiTextBuffer*" Then
						name = name + ".handle"
					End If
				End If

				stream.WriteString(name)

				index :+ 1
			Next
			
			stream.WriteString(")")

			If wrapped Then
				stream.WriteString(")")
			End If
			
			stream.WriteString("~n")
			stream.WriteString("End Function~n")
			stream.WriteString("~n")
		Next

		stream.WriteString("~n")
	End Method

	Method FunctionRequired:Int(func:TIGFunction)
		If func.is_internal Then
			Return False
		End If

		If SkipForConditional(func) Then
			Return False
		End If

		Return True
	End Method

	Method FunctionRequiresGlue:Int(func:TIGFunction)
		If func.return_type Then
			If func.return_type.declaration = "const char*" Then
				Return True
			End If
		End If

		For Local arg:TIGArgument = eachin func.arguments
			If arg.is_varargs Or arg.arg_type.declaration = "va_list" Then
				Return True
			End If

			If arg.arg_type.declaration = "const char*" Then
				Return True
			Else If arg.arg_type.declaration = "const char*const[]" Then
				Return True
			End If

		Next

		Return False
	End Method

	Method GenerateExterns(stream:TStream)

		stream.WriteString("Private~n")
		stream.WriteString("Extern~n")

		'
		stream.WriteString("""
			~tFunction _ImGui_InputText:Int(label:String, buf:String Var, buf_size:size_t, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputText"

			~tFunction bmx_imgui_io_get_display_size:SImVec2(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_delta_time:Float(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_ini_saving_rate:Float(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_ini_filename:String(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_ini_filename(handle:Byte Ptr, filename:String)
			~tFunction bmx_imgui_io_get_log_filename:String(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_log_filename(handle:Byte Ptr, filename:String)
			~tFunction bmx_imgui_io_get_want_capture_mouse:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_want_capture_keyboard:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_want_text_input:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_want_set_mouse_pos:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_want_save_ini_settings:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_want_save_ini_settings(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_nav_active:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_nav_visible:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_framerate:Float(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_metrics_render_vertices:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_metrics_render_indices:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_metrics_render_windows:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_metrics_active_windows:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_mouse_delta:SImVec2(handle:Byte Ptr)
			~tFunction bmx_imgui_io_get_font_global_scale:Float(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_font_global_scale(handle:Byte Ptr, scale:Float)
			~tFunction bmx_imgui_io_get_display_framebuffer_scale:SImVec2(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_display_framebuffer_scale(handle:Byte Ptr, scale:SImVec2)
			~tFunction bmx_imgui_io_get_config_nav_swap_gamepad_buttons:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_nav_swap_gamepad_buttons(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_nav_move_set_mouse_pos:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_nav_move_set_mouse_pos(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_nav_capture_keyboard:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_nav_capture_keyboard(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_nav_escape_clear_focus_item:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_nav_escape_clear_focus_item(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_nav_escape_clear_focus_window:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_nav_escape_clear_focus_window(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_nav_cursor_visible_auto:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_nav_cursor_visible_auto(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_nav_cursor_visible_always:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_nav_cursor_visible_always(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_mouse_draw_cursor:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_mouse_draw_cursor(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_macosx_behaviors:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_macosx_behaviors(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_input_trickle_event_queue:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_input_trickle_event_queue(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_input_text_cursor_blink:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_input_text_cursor_blink(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_input_text_enter_keep_active:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_input_text_enter_keep_active(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_drag_click_to_input_text:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_drag_click_to_input_text(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_windows_resize_from_edges:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_windows_resize_from_edges(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_windows_move_from_title_bar_only:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_windows_move_from_title_bar_only(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_windows_copy_contents_with_ctrlc:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_windows_copy_contents_with_ctrlc(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_scrollbar_scroll_by_page:Int(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_scrollbar_scroll_by_page(handle:Byte Ptr, value:Int)
			~tFunction bmx_imgui_io_get_config_memory_compact_timer:Float(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_config_memory_compact_timer(handle:Byte Ptr, value:Float)
			~tFunction bmx_imgui_io_get_mouse_double_click_time:Float(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_mouse_double_click_time(handle:Byte Ptr, value:Float)
			~tFunction bmx_imgui_io_get_mouse_double_click_max_dist:Float(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_mouse_double_click_max_dist(handle:Byte Ptr, value:Float)
			~tFunction bmx_imgui_io_get_mouse_drag_threshold:Float(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_mouse_drag_threshold(handle:Byte Ptr, value:Float)
			~tFunction bmx_imgui_io_get_key_repeat_delay:Float(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_key_repeat_delay(handle:Byte Ptr, value:Float)
			~tFunction bmx_imgui_io_get_key_repeat_rate:Float(handle:Byte Ptr)
			~tFunction bmx_imgui_io_set_key_repeat_rate(handle:Byte Ptr, value:Float)
			""")
		stream.WriteString("~n~n")

		For Local func:TIGFunction = eachin model.functions
			If Not FunctionRequired(func) Then Continue

			If func.Name = "ImGui_InputText" Then
				Continue
			End If

			Local bmxFunc:Int = False
			Local returnType:String
			If func.return_type Then
				If func.return_type.declaration = "const char*" Then
					returnType = ":String"
					bmxFunc = True
				Else If func.return_type.declaration.EndsWith("*") Then
					returnType = ":Byte Ptr"
				Else
					Select func.return_type.declaration
						Case "void"
							returnType = ""
						Case "bool"
							returnType = ":Int"
						Case "char"
							returnType = ":Byte"
						Case "unsigned char"
							returnType = ":Byte"
						Case "short"
							returnType = ":Short"
						Case "unsigned short"
							returnType = ":UShort"
						Case "int"
							returnType = ":Int"
						Case "unsigned int"
							returnType = ":UInt"
						Case "long"
							returnType = ":Long"
						Case "unsigned long"
							returnType = ":ULong"
						Case "float"
							returnType = ":Float"
						Case "double"
							returnType = ":Double"
						Case "ImGuiID"
							returnType = ":UInt"
						Case "ImU32"
							returnType = ":UInt"
						Case "ImTextureID"
							returnType = ":ULong"
						Case "ImColor"
							returnType = ":UInt"
						Default
							If enumMap.ContainsKey(func.return_type.declaration) Then
								returnType = ":" + enumMap[func.return_type.declaration]
							Else if func.return_type.declaration = "ImVec2" Then
								returnType = ":SImVec2"
							Else if func.return_type.declaration = "ImVec4" Then
								returnType = ":SImVec4"
							Else
								' TODO : probably map to a proper type
								returnType = ":" + func.return_type.declaration
							End If
					End Select
				End If
			End If

			stream.WriteString("~tFunction _" + func.name + returnType + "(")
			
			Local index:Int
			' args
			For Local arg:TIGArgument = eachin func.arguments

				' we don't support var args
				If arg.is_varargs Or arg.arg_type.declaration = "va_list" Then
					bmxFunc = True
					Continue
				End If

				If index Then
					stream.WriteString(", ")
				End If

				Local prefix:String
				Local argType:String
				If arg.arg_type Then
					If arg.arg_type.declaration = "const char*" Then
						argType = ":String"
						bmxFunc = True
					Else If arg.arg_type.declaration = "bool*" Then
						argType = ":Int Var"
					Else If arg.arg_type.declaration = "int*" Then
						argType = ":Int Var"
					Else If arg.arg_type.declaration = "float*" Then
						argType = ":Float Var"
					Else If arg.arg_type.declaration = "unsigned int*" Then
						argType = ":UInt Var"
					Else If arg.arg_type.declaration = "const char*const[]" Then
						argType = ":String[]"
						bmxFunc = True
					Else If arg.arg_type.declaration = "float (*values_getter)(void* data, int idx)" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "const char* (*getter)(void* user_data, int idx)" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "ImGuiSizeCallback" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "ImGuiInputTextCallback" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "ImDrawCallback" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "ImGuiSelectionUserData" Then
						argType = ":Long"
					Else If arg.arg_type.declaration = "ImGuiMemAllocFunc" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration = "ImGuiMemFreeFunc" Then
						argType = ":Byte Ptr"
					Else If arg.arg_type.declaration.EndsWith("*") Then
						argType = ":Byte Ptr"
					Else
						Select arg.arg_type.declaration
							Case "void"
								argType = ""
							Case "bool"
								argType = ":Int"
							Case "char"
								argType = ":Byte"
							Case "unsigned char"
								argType = ":Byte"
							Case "short"
								argType = ":Short"
							Case "unsigned short"
								argType = ":UShort"
							Case "int"
								argType = ":Int"
							Case "unsigned int"
								argType = ":UInt"
							Case "long"
								argType = ":Long"
							Case "unsigned long"
								argType = ":ULong"
							Case "float"
								argType = ":Float"
							Case "double"
								argType = ":Double"
							Case "ImGuiID"
								argType = ":UInt"
							Case "ImU32"
								argType = ":UInt"
							Case "ImTextureID"
								argType = ":ULong"
							Case "ImGuiKeyChord"
								argType = ":Int"
							Case "ImWchar16"
								argType = ":Short"
							Case "ImColor"
								argType = ":UInt"
							Case "ImDrawIdx"
								argType = ":Short"
							Case "ImWchar"
								argType = ":Short"
							Default
								If enumMap.ContainsKey(arg.arg_type.declaration) Then
									argType = ":" + enumMap[arg.arg_type.declaration]
								Else if arg.arg_type.declaration.EndsWith("]") Then
									prefix = "StaticArray "
									argType = ":" + arg.arg_type.declaration
								Else if arg.arg_type.declaration = "ImVec2" Then
									argType = ":SImVec2"
								Else if arg.arg_type.declaration = "ImVec4" Then
									argType = ":SImVec4"
								Else
									' TODO : probably map to a proper type
									argType = ":" + arg.arg_type.declaration
								End If
						End Select
					End If
				End If

				Local name:String = arg.name

				If name = "repeat" Then
					name = "rep"
				Else If name = "self" Then
					name = "this"
				Else If name = "step" Then
					name = "stp"
				Else If name = "type" Then
					name = "kind"
				Else If name = "ptr" Then
					name = "handle"
				End If

				stream.WriteString(prefix + name + argType)

				index :+ 1
			Next


			stream.WriteString(") = ~q")
			If bmxFunc Then
				stream.WriteString("bmx_")
			End If
			stream.WriteString(func.name + "~q~n")
		Next

		stream.WriteString("End Extern~n~n")
	End Method

	Method SkipForConditional:Int(func:TIGFunction)
		For Local cond:TIGConditional = eachin func.conditionals
			For Local c:String = Eachin conditionals
				If cond.expression = c And cond.condition = "ifndef" Then
					Return True
				End If
			Next

			If cond.condition = "if" Then
				For Local c:String = Eachin conditionals
					If cond.expression = c Then
						Return False
					End If
				Next
				Return True
			End If
		Next

		Return False
	End Method

	Method GenerateEnums(stream:TStream)
		
		stream.WriteString("Public~n")

		For Local e:TIGEnum = eachin model.enums
			If e.is_internal Then Continue

			stream.WriteString("Enum " + EnumNameToBmxName(e.name))
			If e.is_flags_enum Then
				stream.WriteString(" Flags")
			End If
			stream.WriteString("~n")

			For Local element:TIGEnumElement = eachin e.elements
				stream.WriteString("~t" + element.name.Replace(e.name, "_") + " = " + element.value + "~n")
			Next

			stream.WriteString("End Enum~n~n")
		Next
	End Method

	Method EnumNameToBmxName:String(enumName:String)
		If enumName.EndsWith("_") Then
			enumName = enumName[..enumName.Length - 1]
		End If
		Return "E" + enumName
	End Method

	Method GenerateGlueFunctions(stream:TStream)

		' custom functions

		stream.WriteString("""
		int bmx_ImGui_InputText(BBString * label, BBString ** buf, int bufSize, ImGuiInputTextFlags flags) {
			const char * v0 = (const char *)bbStringToUTF8String(label);

			size_t size = bufSize * 4; // worst case scenario 4 bytes to 1 BlitzMax character
			char * bufPtr = (char *)malloc(size);
			size_t length = size;
			bbStringToUTF8StringBuffer(*buf, bufPtr, &length);

			int result = ImGui_InputText(v0, bufPtr, size < length ? length : size, flags);

			bbMemFree(v0);

			*buf = bbStringFromUTF8String(bufPtr);
			free(bufPtr);

			return result;
		}

		float bmx_imgui_io_get_delta_time(ImGuiIO * io) {
			return io->DeltaTime;
		}

		float bmx_imgui_io_get_ini_saving_rate(ImGuiIO * io) {
			return io->IniSavingRate;
		}

		ImVec2 bmx_imgui_io_get_display_size(ImGuiIO * io) {
			return io->DisplaySize;
		}

		BBString * bmx_imgui_io_get_ini_filename(ImGuiIO * io) {
			return bbStringFromUTF8String(io->IniFilename);
		}

		void bmx_imgui_io_set_ini_filename(ImGuiIO * io, BBString * filename) {
			const char * v0 = NULL;
			if ( filename != &bbEmptyString ) {
				v0 = (const char *)bbStringToUTF8String(filename);
			}
			io->IniFilename = v0;
			bbMemFree(v0);
		}

		BBString * bmx_imgui_io_get_log_filename(ImGuiIO * io) {
			return bbStringFromUTF8String(io->LogFilename);
		}

		void bmx_imgui_io_set_log_filename(ImGuiIO * io, BBString * filename) {
			const char * v0 = NULL;
			if ( filename != &bbEmptyString ) {
				v0 = (const char *)bbStringToUTF8String(filename);
			}
			io->LogFilename = v0;
			bbMemFree(v0);
		}

		int bmx_imgui_io_get_want_capture_mouse(ImGuiIO * io) {
			return io->WantCaptureMouse;
		}

		int bmx_imgui_io_get_want_capture_keyboard(ImGuiIO * io) {
			return io->WantCaptureKeyboard;
		}

		int bmx_imgui_io_get_want_text_input(ImGuiIO * io) {
			return io->WantTextInput;
		}

		int bmx_imgui_io_get_want_set_mouse_pos(ImGuiIO * io) {
			return io->WantSetMousePos;
		}

		int bmx_imgui_io_get_want_save_ini_settings(ImGuiIO * io) {
			return io->WantSaveIniSettings;
		}

		void bmx_imgui_io_set_want_save_ini_settings(ImGuiIO * io, int value) {
			io->WantSaveIniSettings = value;
		}

		int bmx_imgui_io_get_nav_active(ImGuiIO * io) {
			return io->NavActive;
		}

		int bmx_imgui_io_get_nav_visible(ImGuiIO * io) {
			return io->NavVisible;
		}

		float bmx_imgui_io_get_framerate(ImGuiIO * io) {
			return io->Framerate;
		}

		int bmx_imgui_io_get_metrics_render_vertices(ImGuiIO * io) {
			return io->MetricsRenderVertices;
		}

		int bmx_imgui_io_get_metrics_render_indices(ImGuiIO * io) {
			return io->MetricsRenderIndices;
		}

		int bmx_imgui_io_get_metrics_render_windows(ImGuiIO * io) {
			return io->MetricsRenderWindows;
		}

		int bmx_imgui_io_get_metrics_active_windows(ImGuiIO * io) {
			return io->MetricsActiveWindows;
		}

		ImVec2 bmx_imgui_io_get_mouse_delta(ImGuiIO * io) {
			return io->MouseDelta;
		}

		float bmx_imgui_io_get_font_global_scale(ImGuiIO * io) {
			return io->FontGlobalScale;
		}

		void bmx_imgui_io_set_font_global_scale(ImGuiIO * io, float scale) {
			io->FontGlobalScale = scale;
		}

		ImVec2 bmx_imgui_io_get_display_framebuffer_scale(ImGuiIO * io) {
			return io->DisplayFramebufferScale;
		}

		void bmx_imgui_io_set_display_framebuffer_scale(ImGuiIO * io, ImVec2 scale) {
			io->DisplayFramebufferScale = scale;
		}

		int bmx_imgui_io_get_config_nav_swap_gamepad_buttons(ImGuiIO * io) {
			return io->ConfigNavSwapGamepadButtons;
		}

		void bmx_imgui_io_set_config_nav_swap_gamepad_buttons(ImGuiIO * io, int value) {
			io->ConfigNavSwapGamepadButtons = value;
		}

		int bmx_imgui_io_get_config_nav_move_set_mouse_pos(ImGuiIO * io) {
			return io->ConfigNavMoveSetMousePos;
		}

		void bmx_imgui_io_set_config_nav_move_set_mouse_pos(ImGuiIO * io, int value) {
			io->ConfigNavMoveSetMousePos = value;
		}

		int bmx_imgui_io_get_config_nav_capture_keyboard(ImGuiIO * io) {
			return io->ConfigNavCaptureKeyboard;
		}

		void bmx_imgui_io_set_config_nav_capture_keyboard(ImGuiIO * io, int value) {
			io->ConfigNavCaptureKeyboard = value;
		}

		int bmx_imgui_io_get_config_nav_escape_clear_focus_item(ImGuiIO * io) {
			return io->ConfigNavEscapeClearFocusItem;
		}

		void bmx_imgui_io_set_config_nav_escape_clear_focus_item(ImGuiIO * io, int value) {
			io->ConfigNavEscapeClearFocusItem = value;
		}

		int bmx_imgui_io_get_config_nav_escape_clear_focus_window(ImGuiIO * io) {
			return io->ConfigNavEscapeClearFocusWindow;
		}

		void bmx_imgui_io_set_config_nav_escape_clear_focus_window(ImGuiIO * io, int value) {
			io->ConfigNavEscapeClearFocusWindow = value;
		}

		int bmx_imgui_io_get_config_nav_cursor_visible_auto(ImGuiIO * io) {
			return io->ConfigNavCursorVisibleAuto;
		}

		void bmx_imgui_io_set_config_nav_cursor_visible_auto(ImGuiIO * io, int value) {
			io->ConfigNavCursorVisibleAuto = value;
		}

		int bmx_imgui_io_get_config_nav_cursor_visible_always(ImGuiIO * io) {
			return io->ConfigNavCursorVisibleAlways;
		}

		void bmx_imgui_io_set_config_nav_cursor_visible_always(ImGuiIO * io, int value) {
			io->ConfigNavCursorVisibleAlways = value;
		}

		int bmx_imgui_io_get_mouse_draw_cursor(ImGuiIO * io) {
			return io->MouseDrawCursor;
		}

		void bmx_imgui_io_set_mouse_draw_cursor(ImGuiIO * io, int value) {
			io->MouseDrawCursor = value;
		}

		int bmx_imgui_io_get_config_macosx_behaviors(ImGuiIO * io) {
			return io->ConfigMacOSXBehaviors;
		}

		void bmx_imgui_io_set_config_macosx_behaviors(ImGuiIO * io, int value) {
			io->ConfigMacOSXBehaviors = value;
		}

		int bmx_imgui_io_get_config_input_trickle_event_queue(ImGuiIO * io) {
			return io->ConfigInputTrickleEventQueue;
		}

		void bmx_imgui_io_set_config_input_trickle_event_queue(ImGuiIO * io, int value) {
			io->ConfigInputTrickleEventQueue = value;
		}

		int bmx_imgui_io_get_config_input_text_cursor_blink(ImGuiIO * io) {
			return io->ConfigInputTextCursorBlink;
		}

		void bmx_imgui_io_set_config_input_text_cursor_blink(ImGuiIO * io, int value) {
			io->ConfigInputTextCursorBlink = value;
		}

		int bmx_imgui_io_get_config_input_text_enter_keep_active(ImGuiIO * io) {
			return io->ConfigInputTextEnterKeepActive;
		}

		void bmx_imgui_io_set_config_input_text_enter_keep_active(ImGuiIO * io, int value) {
			io->ConfigInputTextEnterKeepActive = value;
		}

		int bmx_imgui_io_get_config_drag_click_to_input_text(ImGuiIO * io) {
			return io->ConfigDragClickToInputText;
		}

		void bmx_imgui_io_set_config_drag_click_to_input_text(ImGuiIO * io, int value) {
			io->ConfigDragClickToInputText = value;
		}

		int bmx_imgui_io_get_config_windows_resize_from_edges(ImGuiIO * io) {
			return io->ConfigWindowsResizeFromEdges;
		}

		void bmx_imgui_io_set_config_windows_resize_from_edges(ImGuiIO * io, int value) {
			io->ConfigWindowsResizeFromEdges = value;
		}

		int bmx_imgui_io_get_config_windows_move_from_title_bar_only(ImGuiIO * io) {
			return io->ConfigWindowsMoveFromTitleBarOnly;
		}

		void bmx_imgui_io_set_config_windows_move_from_title_bar_only(ImGuiIO * io, int value) {
			io->ConfigWindowsMoveFromTitleBarOnly = value;
		}

		int bmx_imgui_io_get_config_windows_copy_contents_with_ctrlc(ImGuiIO * io) {
			return io->ConfigWindowsCopyContentsWithCtrlC;
		}

		void bmx_imgui_io_set_config_windows_copy_contents_with_ctrlc(ImGuiIO * io, int value) {
			io->ConfigWindowsCopyContentsWithCtrlC = value;
		}

		int bmx_imgui_io_get_config_scrollbar_scroll_by_page(ImGuiIO * io) {
			return io->ConfigScrollbarScrollByPage;
		}

		void bmx_imgui_io_set_config_scrollbar_scroll_by_page(ImGuiIO * io, int value) {
			io->ConfigScrollbarScrollByPage = value;
		}

		float bmx_imgui_io_get_config_memory_compact_timer(ImGuiIO * io) {
			return io->ConfigMemoryCompactTimer;
		}

		void bmx_imgui_io_set_config_memory_compact_timer(ImGuiIO * io, float value) {
			io->ConfigMemoryCompactTimer = value;
		}

		float bmx_imgui_io_get_mouse_double_click_time(ImGuiIO * io) {
			return io->MouseDoubleClickTime;
		}

		void bmx_imgui_io_set_mouse_double_click_time(ImGuiIO * io, float value) {
			io->MouseDoubleClickTime = value;
		}

		float bmx_imgui_io_get_mouse_double_click_max_dist(ImGuiIO * io) {
			return io->MouseDoubleClickMaxDist;
		}

		void bmx_imgui_io_set_mouse_double_click_max_dist(ImGuiIO * io, float value) {
			io->MouseDoubleClickMaxDist = value;
		}

		float bmx_imgui_io_get_mouse_drag_threshold(ImGuiIO * io) {
			return io->MouseDragThreshold;
		}

		void bmx_imgui_io_set_mouse_drag_threshold(ImGuiIO * io, float value) {
			io->MouseDragThreshold = value;
		}

		float bmx_imgui_io_get_key_repeat_delay(ImGuiIO * io) {
			return io->KeyRepeatDelay;
		}

		void bmx_imgui_io_set_key_repeat_delay(ImGuiIO * io, float value) {
			io->KeyRepeatDelay = value;
		}

		float bmx_imgui_io_get_key_repeat_rate(ImGuiIO * io) {
			return io->KeyRepeatRate;
		}

		void bmx_imgui_io_set_key_repeat_rate(ImGuiIO * io, float value) {
			io->KeyRepeatRate = value;
		}

		""")

		stream.WriteString("~n~n")

		' generated
		For Local func:TIGFunction = eachin model.functions
			If Not FunctionRequired(func) Then Continue
			If Not FunctionRequiresGlue(func) Then Continue

			' skip functions that we implement directly
			If func.name = "ImGui_InputText" Then
				Continue
			End If

			Local returnsString:Int = False
			Local requiresReturn:Int = True
			Local requiresFree:Int = False
			Local returnType:String = func.return_type.declaration
			If func.return_type Then
				If func.return_type.declaration = "void" Then
					requiresReturn = False
				End If
				If func.return_type.declaration = "const char*" Then
					returnType = "BBString *"
					returnsString = True
				End If
				If func.return_type.declaration = "bool" Then
					returnType = "int"
				End If
			End If

			stream.WriteString(returnType + " bmx_" + func.name + "(")
			
			Local index:Int
			' args
			For Local arg:TIGArgument = eachin func.arguments

				' we don't support var args
				If arg.is_varargs Or arg.arg_type.declaration = "va_list" Then
					Continue
				End If

				If index Then
					stream.WriteString(", ")
				End If

				Local prefix:String
				Local argType:String = arg.arg_type.declaration
				If arg.arg_type Then
					If arg.arg_type.declaration = "const char*" Then
						argType = "BBString *"
					Else if arg.arg_type.declaration = "const char*const[]" Then
						argType = "const char*const"
					Else if arg.arg_type.declaration = "float[2]" Then
						argType = "float" 
					Else If arg.arg_type.declaration = "float[3]" Then
						argType = "float" 
					Else If arg.arg_type.declaration = "float[4]" Then
						argType = "float" 
					Else if arg.arg_type.declaration = "int[2]" Then
						argType = "int" 
					Else If arg.arg_type.declaration = "int[3]" Then
						argType = "int" 
					Else If arg.arg_type.declaration = "int[4]" Then
						argType = "int" 
					End If
				End If

				Local name:String = arg.name

				If name = "repeat" Then
					name = "rep"
				Else If name = "self" Then
					name = "this"
				Else If name = "step" Then
					name = "stp"
				Else If name = "type" Then
					name = "kind"
				Else If name = "ptr" Then
					name = "handle"
				End If

				If arg.arg_type.declaration = "const char* (*getter)(void* user_data, int idx)" Then
					name = ""
				Else If arg.arg_type.declaration = "float (*values_getter)(void* data, int idx)" Then
					name = ""
				End If

				stream.WriteString(argType)
				stream.WriteString(" ")
				stream.WriteString(name)

				If arg.arg_type.declaration = "const char*const[]" Then
					stream.WriteString("[]")
				Else If arg.arg_type.declaration = "float[2]" Then
					stream.WriteString("[2]")
				Else If arg.arg_type.declaration = "float[3]" Then
					stream.WriteString("[3]")
				Else If arg.arg_type.declaration = "float[4]" Then
					stream.WriteString("[4]")
				Else If arg.arg_type.declaration = "int[2]" Then
					stream.WriteString("[2]")
				Else If arg.arg_type.declaration = "int[3]" Then
					stream.WriteString("[3]")
				Else If arg.arg_type.declaration = "int[4]" Then
					stream.WriteString("[4]")
				End If

				index :+ 1
			Next

			
			stream.WriteString(") {~n")

			' conversions?

			index = 0
			For Local arg:TIGArgument = eachin func.arguments

				' we don't support var args
				If arg.is_varargs Or arg.arg_type.declaration = "va_list" Then
					Continue
				End If

				Local conv:Int = False
				If arg.arg_type Then
					If arg.arg_type.declaration = "const char*" Then
						conv = True
					End If
				End If

				Local name:String = arg.name

				If name = "repeat" Then
					name = "rep"
				Else If name = "self" Then
					name = "this"
				Else If name = "step" Then
					name = "stp"
				Else If name = "type" Then
					name = "kind"
				Else If name = "ptr" Then
					name = "handle"
				End If

				If conv Then
					Local variable:String = "v" + index
					stream.WriteString("~tconst char * " + variable + " = (const char *)bbStringToUTF8String(" + name + ");~n")
				End If

				index :+ 1
			Next

			If requiresReturn Then
				stream.WriteString("~t" + returnType + " result = ")

				If returnsString Then
					stream.WriteString("bbStringFromUTF8String((const unsigned char *)")
				End If
			Else
				stream.WriteString("~t")
			End If

			stream.WriteString(func.name + "(")

			' args

			index = 0

			For Local arg:TIGArgument = eachin func.arguments

				If index Then
					stream.WriteString(", ")
				End If

				' we don't support var args
				If arg.is_varargs Or arg.arg_type.declaration = "va_list" Then
					stream.WriteString("NULL")
					continue
				End If
				
				Local conv:Int = False
				If arg.arg_type Then
					If arg.arg_type.declaration = "const char*" Then
						conv = True
					End If
				End If

				Local name:String = arg.name

				If name = "repeat" Then
					name = "rep"
				Else If name = "self" Then
					name = "this"
				Else If name = "step" Then
					name = "stp"
				Else If name = "type" Then
					name = "kind"
				Else If name = "ptr" Then
					name = "handle"
				End If

				If conv Then
					name = "v" + index
				End If

				stream.WriteString(name)

				index :+ 1
			Next


			stream.WriteString(")")

			If returnsString Then
				stream.WriteString(")")
			End If

			stream.WriteString(";~n")

			' free stuff

			index = 0
			For Local arg:TIGArgument = eachin func.arguments
				' we don't support var args
				If arg.is_varargs Or arg.arg_type.declaration = "va_list" Then
					Continue
				End If

				Local conv:Int = False
				If arg.arg_type Then
					If arg.arg_type.declaration = "const char*" Then
						conv = True
					End If
				End If

				If conv Then
					Local variable:String = "v" + index
					stream.WriteString("~tbbMemFree(" + variable + ");~n")
				End If

				index :+ 1
			Next

			' return
			If requiresReturn Then
				stream.WriteString("~treturn result;~n")
			End If

			stream.WriteString("}~n~n")
		Next
	End Method

	Method GenerateCommonBmxTypes(stream:TStream)
		stream.WriteString("""
		Type TImguiContext
			Field handle:Byte Ptr
			Function _Create:TImguiContext(handle:Byte Ptr)
				Local this:TImguiContext = New TImguiContext
				this.handle = handle
				Return this
			End Function
		End Type

		Type TImguiFontAtlas
			Field handle:Byte Ptr
			Function _Create:TImguiFontAtlas(handle:Byte Ptr)
				Local this:TImguiFontAtlas = New TImguiFontAtlas
				this.handle = handle
				Return this
			End Function
		End Type

		Type TImFont
			Field handle:Byte Ptr
			Function _Create:TImFont(handle:Byte Ptr)
				Local this:TImFont = New TImFont
				this.handle = handle
				Return this
			End Function
		End Type

		Type TImGuiTextFilter
			Field handle:Byte Ptr
			Function _Create:TImGuiTextFilter(handle:Byte Ptr)
				Local this:TImGuiTextFilter = New TImGuiTextFilter
				this.handle = handle
				Return this
			End Function
		End Type

		Type TImGuiTextBuffer
			Field handle:Byte Ptr
			Function _Create:TImGuiTextBuffer(handle:Byte Ptr)
				Local this:TImGuiTextBuffer = New TImGuiTextBuffer
				this.handle = handle
				Return this
			End Function
		End Type

		Type TImDrawList
			Field handle:Byte Ptr
			Function _Create:TImDrawList(handle:Byte Ptr)
				Local this:TImDrawList = New TImDrawList
				this.handle = handle
				Return this
			End Function
		End Type

		Type TImFontAtlas
			Field handle:Byte Ptr
			Function _Create:TImFontAtlas(handle:Byte Ptr)
				Local this:TImFontAtlas = New TImFontAtlas
				this.handle = handle
				Return this
			End Function
		End Type

		Type TImGuiStyle
			Field handle:Byte Ptr
			Function _Create:TImGuiStyle(handle:Byte Ptr)
				Local this:TImGuiStyle = New TImGuiStyle
				this.handle = handle
				Return this
			End Function
		End Type

		Rem
		bbdoc: Main configuration and I/O between your application and ImGui
		End Rem
		Type TImGuiIO
			Private
			Field handle:Byte Ptr
			Function _Create:TImGuiIO(handle:Byte Ptr)
				Local this:TImGuiIO = New TImGuiIO
				this.handle = handle
				Return this
			End Function
			Public
			Rem
			bbdoc: Main display size, in pixels (generally == GetMainViewport()->Size).
			about: May change every frame.
			End Rem
			Method GetDisplaySize:SImVec2()
				Return bmx_imgui_io_get_display_size(handle)
			End Method

			Rem
			bbdoc: Time elapsed since last frame, in seconds.
			about: May change every frame.
			End Rem
			Method GetDeltaTime:Float()
				Return bmx_imgui_io_get_delta_time(handle)
			End Method

			Rem
			bbdoc: Minimum time between saving positions/sizes to .ini file, in seconds.
			End Rem
			Method GetIniSavingRate:Float()
				Return bmx_imgui_io_get_ini_saving_rate(handle)
			End Method

			Rem
			bbdoc: Returns Path to .ini file
			about: (important: default "imgui.ini" is relative to current working dir!).
			End Rem
			Method GetIniFilename:String()
				Return bmx_imgui_io_get_ini_filename(handle)
			End Method

			Rem
			bbdoc: Sets Path to .ini file
			about: (important: default "imgui.ini" is relative to current working dir!).
			Set #Null to disable automatic .ini loading/saving or if you want to manually call ImGui_LoadIniSettingsXXX() / ImGui_SaveIniSettingsXXX() functions.
			End Rem
			Method SetIniFilename(filename:String)
				bmx_imgui_io_set_ini_filename(handle, filename)
			End Method

			Rem
			bbdoc: Returns the path to .log file
			about: (default parameter of "imgui_log.txt" to ImGui_LogToFile when no file is specified).
			End Rem
			Method GetLogFilename:String()
				Return bmx_imgui_io_get_log_filename(handle)
			End Method

			Rem
			bbdoc: Sets the path to .log file
			about: (default parameter of "imgui_log.txt" to ImGui_LogToFile when no file is specified).
			End Rem
			Method SetLogFilename(filename:String)
				bmx_imgui_io_set_log_filename(handle, filename)
			End Method

			Rem
			bbdoc: Set when Dear ImGui will use mouse inputs, in this case do not dispatch them to your main game/application (either way, always pass on mouse inputs to imgui).
			about: (e.g. unclicked mouse is hovering over an imgui window, widget is active, mouse was clicked over an imgui window, etc.).
			End Rem
			Method GetWantCaptureMouse:Int()
				Return bmx_imgui_io_get_want_capture_mouse(handle)
			End Method

			Rem
			bbdoc: Set when Dear ImGui will use keyboard inputs, in this case do not dispatch them to your main game/application (either way, always pass keyboard inputs to imgui).
			about: (e.g. InputText active, or an imgui window is focused and navigation is enabled, etc.).
			End Rem
			Method GetWantCaptureKeyboard:Int()
				Return bmx_imgui_io_get_want_capture_keyboard(handle)
			End Method

			Rem
			bbdoc: Mobile/console: when set, you may display an on-screen keyboard.
			about: This is set by Dear ImGui when it wants textual keyboard input to happen (e.g. when a InputText widget is active).
			End Rem
			Method GetWantTextInput:Int()
				Return bmx_imgui_io_get_want_text_input(handle)
			End Method

			Rem
			bbdoc: MousePos has been altered, backend should reposition mouse on next frame.
			about: Rarely used! Set only when #GetConfigNavMoveSetMousePos is enabled.
			End Rem
			Method GetWantSetMousePos:Int()
				Return bmx_imgui_io_get_want_set_mouse_pos(handle)
			End Method

			Rem
			bbdoc: When manual .ini load/save is active (io.IniFilename == NULL), this will be set to notify your application that you can call SaveIniSettingsToMemory() and save yourself.
			about: Important: clear with SetWantSaveIniSettings() yourself after saving!
			End Rem
			Method GetWantSaveIniSettings:Int()
				Return bmx_imgui_io_get_want_save_ini_settings(handle)
			End Method

			Rem
			bbdoc: When manual .ini load/save is active (io.IniFilename == NULL), this will be set to notify your application that you can call SaveIniSettingsToMemory() and save yourself.
			End Rem
			Method SetWantSaveIniSettings(value:Int)
				bmx_imgui_io_set_want_save_ini_settings(handle, value)
			End Method

			Rem
			bbdoc: Keyboard/Gamepad navigation is currently allowed (will handle ImGuiKey_NavXXX events) = a window is focused and it doesn't use the ImGuiWindowFlags_NoNavInputs flag.
			End Rem
			Method GetNavActive:Int()
				Return bmx_imgui_io_get_nav_active(handle)
			End Method

			Rem
			bbdoc: Keyboard/Gamepad navigation highlight is visible and allowed (will handle ImGuiKey_NavXXX events).
			End Rem
			Method GetNavVisible:Int()
				Return bmx_imgui_io_get_nav_visible(handle)
			End Method

			Rem
			bbdoc: Estimate of application framerate (rolling average over 60 frames, based on io.DeltaTime), in frame per second.
			about: Solely for convenience. Slow applications may not want to use a moving average or may want to reset underlying buffers occasionally.
			End Rem
			Method GetFramerate:Float()
				Return bmx_imgui_io_get_framerate(handle)
			End Method

			Rem
			bbdoc: Vertices output during last call to Render()
			End Rem
			Method GetMetricsRenderVertices:Int()
				Return bmx_imgui_io_get_metrics_render_vertices(handle)
			End Method

			Rem
			bbdoc: Indices output during last call to Render() = number of triangles * 3
			End Rem
			Method GetMetricsRenderIndices:Int()
				Return bmx_imgui_io_get_metrics_render_indices(handle)
			End Method

			Rem
			bbdoc: Number of visible windows
			End Rem
			Method GetMetricsRenderWindows:Int()
				Return bmx_imgui_io_get_metrics_render_windows(handle)
			End Method

			Rem
			bbdoc: Number of active windows
			End Rem
			Method GetMetricsActiveWindows:Int()
				Return bmx_imgui_io_get_metrics_active_windows(handle)
			End Method

			Rem
			bbdoc: Mouse delta.
			about: Note that this is zero if either current or previous position are invalid (-FLT_MAX,-FLT_MAX), so a
			disappearing/reappearing mouse won't have a huge delta.
			End Rem
			Method GetMouseDelta:SImVec2()
				Return bmx_imgui_io_get_mouse_delta(handle)
			End Method

			Rem
			bbdoc: Returns the global scale for all fonts.
			End Rem
			Method GetFontGlobalScale:Float()
				Return bmx_imgui_io_get_font_global_scale(handle)
			End Method

			Rem
			bbdoc: Sets the global scale for all fonts.
			End Rem
			Method SetFontGlobalScale(scale:Float)
				bmx_imgui_io_set_font_global_scale(handle, scale)
			End Method

			Rem
			bbdoc: For retina display or other situations where window coordinates are different from framebuffer coordinates.
			about: This generally ends up in ImDrawData::FramebufferScale.
			End Rem
			Method GetDisplayFramebufferScale:SImVec2()
				Return bmx_imgui_io_get_display_framebuffer_scale(handle)
			End Method

			Rem
			bbdoc: For retina display or other situations where window coordinates are different from framebuffer coordinates.
			about: This generally ends up in ImDrawData::FramebufferScale.
			End Rem
			Method SetDisplayFramebufferScale(scale:SImVec2)
				bmx_imgui_io_set_display_framebuffer_scale(handle, scale)
			End Method

			Rem
			bbdoc: Swap Activate<>Cancel (A<>B) buttons, matching typical "Nintendo/Japanese style" gamepad layout.
			End Rem
			Method GetConfigNavSwapGamepadButtons:Int()
				Return bmx_imgui_io_get_config_nav_swap_gamepad_buttons(handle)
			End Method

			Rem
			bbdoc: Swap Activate<>Cancel (A<>B) buttons, matching typical "Nintendo/Japanese style" gamepad layout.
			End Rem
			Method SetConfigNavSwapGamepadButtons(value:Int)
				bmx_imgui_io_set_config_nav_swap_gamepad_buttons(handle, value)
			End Method

			Rem
			bbdoc: Directional/tabbing navigation teleports the mouse cursor.
			about: May be useful on TV/console systems where moving a virtual mouse is difficult. Will update io.MousePos and set io.WantSetMousePos=true.
			End Rem
			Method GetConfigNavMoveSetMousePos:Int()
				Return bmx_imgui_io_get_config_nav_move_set_mouse_pos(handle)
			End Method

			Rem
			bbdoc: Directional/tabbing navigation teleports the mouse cursor.
			about: May be useful on TV/console systems where moving a virtual mouse is difficult. Will update io.MousePos and set io.WantSetMousePos=true.
			End Rem
			Method SetConfigNavMoveSetMousePos(value:Int)
				bmx_imgui_io_set_config_nav_move_set_mouse_pos(handle, value)
			End Method

			Rem
			bbdoc: Gets the keyboard input capture mode, which sets io.WantCaptureKeyboard when io.NavActive is set.
			End Rem
			Method GetConfigNavCaptureKeyboard:Int()
				Return bmx_imgui_io_get_config_nav_capture_keyboard(handle)
			End Method

			Rem
			bbdoc: Sets the keyboard input capture mode, which sets io.WantCaptureKeyboard when io.NavActive is set.
			End Rem
			Method SetConfigNavCaptureKeyboard(value:Int)
				bmx_imgui_io_set_config_nav_capture_keyboard(handle, value)
			End Method

			Rem
			bbdoc: Pressing Escape can clear focused item + navigation id/highlight.
			about: Set to #False if you want to always keep highlight on.
			End Rem
			Method GetConfigNavEscapeClearFocusItem:Int()
				Return bmx_imgui_io_get_config_nav_escape_clear_focus_item(handle)
			End Method

			Rem
			bbdoc: Pressing Escape can clear focused item + navigation id/highlight.
			about: Set to #False if you want to always keep highlight on.
			End Rem
			Method SetConfigNavEscapeClearFocusItem(value:Int)
				bmx_imgui_io_set_config_nav_escape_clear_focus_item(handle, value)
			End Method

			Rem
			bbdoc: Pressing Escape can clear focused window as well (super set of io.ConfigNavEscapeClearFocusItem).
			End Rem
			Method GetConfigNavEscapeClearFocusWindow:Int()
				Return bmx_imgui_io_get_config_nav_escape_clear_focus_window(handle)
			End Method

			Rem
			bbdoc: Pressing Escape can clear focused window as well (super set of io.ConfigNavEscapeClearFocusItem).
			End Rem
			Method SetConfigNavEscapeClearFocusWindow(value:Int)
				bmx_imgui_io_set_config_nav_escape_clear_focus_window(handle, value)
			End Method

			Rem
			bbdoc: Using directional navigation key makes the cursor visible. Mouse click hides the cursor.
			End Rem
			Method GetConfigNavCursorVisibleAuto:Int()
				Return bmx_imgui_io_get_config_nav_cursor_visible_auto(handle)
			End Method

			Rem
			bbdoc: Using directional navigation key makes the cursor visible. Mouse click hides the cursor.
			End Rem
			Method SetConfigNavCursorVisibleAuto(value:Int)
				bmx_imgui_io_set_config_nav_cursor_visible_auto(handle, value)
			End Method

			Rem
			bbdoc: Returns whether navigation cursor is always visible.
			End Rem
			Method GetConfigNavCursorVisibleAlways:Int()
				Return bmx_imgui_io_get_config_nav_cursor_visible_always(handle)
			End Method

			Rem
			bbdoc: Sets whether navigation cursor is always visible.
			End Rem
			Method SetConfigNavCursorVisibleAlways(value:Int)
				bmx_imgui_io_set_config_nav_cursor_visible_always(handle, value)
			End Method

			Rem
			bbdoc: Request ImGui to draw a mouse cursor for you (if you are on a platform without a mouse cursor).
			End Rem
			Method GetMouseDrawCursor:Int()
				Return bmx_imgui_io_get_mouse_draw_cursor(handle)
			End Method

			Rem
			bbdoc: Request ImGui to draw a mouse cursor for you (if you are on a platform without a mouse cursor).
			End Rem
			Method SetMouseDrawCursor(value:Int)
				bmx_imgui_io_set_mouse_draw_cursor(handle, value)
			End Method

			Rem
			bbdoc: Returns whether MacOS keys are swapped.
			about: Swaps Cmd<>Ctrl keys + OS X style text editing cursor movement using Alt instead of Ctrl,
			Shortcuts using Cmd/Super instead of Ctrl, Line/Text Start and End using Cmd+Arrows instead of Home/End,
			Double click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd/Super instead of Ctrl.
			End Rem
			Method GetConfigMacOSXBehaviors:Int()
				Return bmx_imgui_io_get_config_macosx_behaviors(handle)
			End Method

			Rem
			bbdoc: Sets whether MacOS keys are swapped.
			about: Swaps Cmd<>Ctrl keys + OS X style text editing cursor movement using Alt instead of Ctrl,
			Shortcuts using Cmd/Super instead of Ctrl, Line/Text Start and End using Cmd+Arrows instead of Home/End,
			Double click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd/Super instead of Ctrl.
			End Rem
			Method SetConfigMacOSXBehaviors(value:Int)
				bmx_imgui_io_set_config_macosx_behaviors(handle, value)
			End Method

			Rem
			bbdoc: Enables input queue trickling: some types of events submitted during the same frame (e.g. button down + up) will be spread over multiple frames, improving interactions with low framerates.
			End Rem
			Method GetConfigInputTrickleEventQueue:Int()
				Return bmx_imgui_io_get_config_input_trickle_event_queue(handle)
			End Method

			Rem
			bbdoc: Enables input queue trickling: some types of events submitted during the same frame (e.g. button down + up) will be spread over multiple frames, improving interactions with low framerates.
			End Rem
			Method SetConfigInputTrickleEventQueue(value:Int)
				bmx_imgui_io_set_config_input_trickle_event_queue(handle, value)
			End Method

			Rem
			bbdoc: Enable blinking cursor (optional as some users consider it to be distracting).
			End Rem
			Method GetConfigInputTextCursorBlink:Int()
				Return bmx_imgui_io_get_config_input_text_cursor_blink(handle)
			End Method

			Rem
			bbdoc: Enable blinking cursor (optional as some users consider it to be distracting).
			End Rem
			Method SetConfigInputTextCursorBlink(value:Int)
				bmx_imgui_io_set_config_input_text_cursor_blink(handle, value)
			End Method

			Rem
			bbdoc: [BETA] Pressing Enter will keep item active and select contents (single-line only).
			End Rem
			Method GetConfigInputTextEnterKeepActive:Int()
				Return bmx_imgui_io_get_config_input_text_enter_keep_active(handle)
			End Method

			Rem
			bbdoc: [BETA] Pressing Enter will keep item active and select contents (single-line only).
			End Rem
			Method SetConfigInputTextEnterKeepActive(value:Int)
				bmx_imgui_io_set_config_input_text_enter_keep_active(handle, value)
			End Method

			Rem
			bbdoc: [BETA] Enable turning DragXXX widgets into text input with a simple mouse click-release (without moving).
			about: Not desirable on devices without a keyboard.
			End Rem
			Method GetConfigDragClickToInputText:Int()
				Return bmx_imgui_io_get_config_drag_click_to_input_text(handle)
			End Method

			Rem
			bbdoc: [BETA] Enable turning DragXXX widgets into text input with a simple mouse click-release (without moving).
			about: Not desirable on devices without a keyboard.
			End Rem
			Method SetConfigDragClickToInputText(value:Int)
				bmx_imgui_io_set_config_drag_click_to_input_text(handle, value)
			End Method

			Rem
			bbdoc: Enable resizing of windows from their edges and from the lower-left corner.
			about: This requires ImGuiBackendFlags_HasMouseCursors for better mouse cursor feedback. (This used to be a per-window ImGuiWindowFlags_ResizeFromAnySide flag)
			End Rem
			Method GetConfigWindowsResizeFromEdges:Int()
				Return bmx_imgui_io_get_config_windows_resize_from_edges(handle)
			End Method

			Rem
			bbdoc: Enable resizing of windows from their edges and from the lower-left corner.
			about: This requires ImGuiBackendFlags_HasMouseCursors for better mouse cursor feedback. (This used to be a per-window ImGuiWindowFlags_ResizeFromAnySide flag)
			End Rem
			Method SetConfigWindowsResizeFromEdges(value:Int)
				bmx_imgui_io_set_config_windows_resize_from_edges(handle, value)
			End Method

			Rem
			bbdoc: Enable allowing to move windows only when clicking on their title bar.
			about: Does not apply to windows without a title bar.
			End Rem
			Method GetConfigWindowsMoveFromTitleBarOnly:Int()
				Return bmx_imgui_io_get_config_windows_move_from_title_bar_only(handle)
			End Method

			Rem
			bbdoc: Enable allowing to move windows only when clicking on their title bar.
			about: Does not apply to windows without a title bar.
			End Rem
			Method SetConfigWindowsMoveFromTitleBarOnly(value:Int)
				bmx_imgui_io_set_config_windows_move_from_title_bar_only(handle, value)
			End Method

			Rem
			bbdoc: [EXPERIMENTAL] CTRL+C copy the contents of focused window into the clipboard.
			about: Experimental because: (1) has known issues with nested Begin/End pairs (2) text output quality varies (3) text output is in submission order rather than spatial order.
			End Rem
			Method GetConfigWindowsCopyContentsWithCtrlC:Int()
				Return bmx_imgui_io_get_config_windows_copy_contents_with_ctrlc(handle)
			End Method

			Rem
			bbdoc: [EXPERIMENTAL] CTRL+C copy the contents of focused window into the clipboard.
			about: Experimental because: (1) has known issues with nested Begin/End pairs (2) text output quality varies (3) text output is in submission order rather than spatial order.
			End Rem
			Method SetConfigWindowsCopyContentsWithCtrlC(value:Int)
				bmx_imgui_io_set_config_windows_copy_contents_with_ctrlc(handle, value)
			End Method

			Rem
			bbdoc: Enable scrolling page by page when clicking outside the scrollbar grab.
			about: When disabled, always scroll to clicked location. When enabled, Shift+Click scrolls to clicked location.
			End Rem
			Method GetConfigScrollbarScrollByPage:Int()
				Return bmx_imgui_io_get_config_scrollbar_scroll_by_page(handle)
			End Method

			Rem
			bbdoc: Enable scrolling page by page when clicking outside the scrollbar grab.
			about: When disabled, always scroll to clicked location. When enabled, Shift+Click scrolls to clicked location.
			End Rem
			Method SetConfigScrollbarScrollByPage(value:Int)
				bmx_imgui_io_set_config_scrollbar_scroll_by_page(handle, value)
			End Method

			Rem
			bbdoc: Timer (in seconds) to free transient windows/tables memory buffers when unused.
			about: Set to -1.0 to disable.
			End Rem
			Method GetConfigMemoryCompactTimer:Float()
				Return bmx_imgui_io_get_config_memory_compact_timer(handle)
			End Method

			Rem
			bbdoc: Timer (in seconds) to free transient windows/tables memory buffers when unused.
			about: Set to -1.0 to disable.
			End Rem
			Method SetConfigMemoryCompactTimer(value:Float)
				bmx_imgui_io_set_config_memory_compact_timer(handle, value)
			End Method

			Rem
			bbdoc: Gets the time for a double-click, in seconds.
			End Rem
			Method GetMouseDoubleClickTime:Float()
				Return bmx_imgui_io_get_mouse_double_click_time(handle)
			End Method

			Rem
			bbdoc: Sets the time for a double-click, in seconds.
			End Rem
			Method SetMouseDoubleClickTime(value:Float)
				bmx_imgui_io_set_mouse_double_click_time(handle, value)
			End Method

			Rem
			bbdoc: Gets the distance threshold to stay in to validate a double-click, in pixels.
			End Rem
			Method GetMouseDoubleClickMaxDist:Float()
				Return bmx_imgui_io_get_mouse_double_click_max_dist(handle)
			End Method

			Rem
			bbdoc: Sets the distance threshold to stay in to validate a double-click, in pixels.
			End Rem
			Method SetMouseDoubleClickMaxDist(value:Float)
				bmx_imgui_io_set_mouse_double_click_max_dist(handle, value)
			End Method

			Rem
			bbdoc: Gets the distance threshold before considering we are dragging.
			End Rem
			Method GetMouseDragThreshold:Float()
				Return bmx_imgui_io_get_mouse_drag_threshold(handle)
			End Method

			Rem
			bbdoc: Sets the distance threshold before considering we are dragging.
			End Rem
			Method SetMouseDragThreshold(value:Float)
				bmx_imgui_io_set_mouse_drag_threshold(handle, value)
			End Method

			Rem
			bbdoc: When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).
			End Rem
			Method GetKeyRepeatDelay:Float()
				Return bmx_imgui_io_get_key_repeat_delay(handle)
			End Method

			Rem
			bbdoc: When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).
			End Rem
			Method SetKeyRepeatDelay(value:Float)
				bmx_imgui_io_set_key_repeat_delay(handle, value)
			End Method

			Rem
			bbdoc: When holding a key/button, rate at which it repeats, in seconds.
			End Rem
			Method GetKeyRepeatRate:Float()
				Return bmx_imgui_io_get_key_repeat_rate(handle)
			End Method

			Rem
			bbdoc: When holding a key/button, rate at which it repeats, in seconds.
			End Rem
			Method SetKeyRepeatRate(value:Float)
				bmx_imgui_io_set_key_repeat_rate(handle, value)
			End Method
		End Type

		""")

		stream.WriteString("~n~n")
	End Method
End Type

Local gen:TCodeGenerator = New TCodeGenerator("../db_generated/dcimgui.json")

gen.Load()

gen.Generate()

