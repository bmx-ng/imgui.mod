' Copyright (c) 2026 Bruce A Henderson
'
' Permission to use, copy, modify, and/or distribute this software for any
' purpose with or without fee is hereby granted.
'
' THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
' WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
' MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
' ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
' WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
' ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
' OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
'
'
SuperStrict

Import imgui.imgui
Import "source.bmx"

Rem
bbdoc: Renders a toggle switch with the given label and value.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will
be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr)
	Return _ImGui_Toggle_value(label, value)
End Function

Rem
bbdoc: Renders a toggle switch with the given label, value, and size.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will
be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr, size:SImVec2)
	Return _ImGui_Toggle_value_size(label, value, size)
End Function

Rem
bbdoc: Renders a toggle switch with the given label, value, and flags.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will
be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
The @flags parameter allows you to modify the behavior and appearance of the toggle. See #EImGuiToggleFlags for more details.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags)
	Return _ImGui_Toggle_value_flags(label, value, flags)
End Function

Rem
bbdoc: Renders a toggle switch with the given label, value, flags, and size.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will
be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
The @flags parameter allows you to modify the behavior and appearance of the toggle. See #EImGuiToggleFlags for more details.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, size:SImVec2)
	Return _ImGui_Toggle_value_flags_size(label, value, flags, size)
End Function

Rem
bbdoc: Renders a toggle switch with the given label, value, flags, and animation duration.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will
be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
The @flags parameter allows you to modify the behavior and appearance of the toggle. See #EImGuiToggleFlags for more details.
The @animation_duration parameter controls how long the toggle's animation should last when transitioning between on and off states.
A value of 0 will disable animation, while a value of 0.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, animation_duration:Float)
	Return _ImGui_Toggle_value_flags_anim(label, value, flags, animation_duration)
End Function

Rem
bbdoc: Renders a toggle switch with the given label, value, flags, animation duration, and size.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will
be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
The @flags parameter allows you to modify the behavior and appearance of the toggle. See #EImGuiToggleFlags for more details.
The @animation_duration parameter controls how long the toggle's animation should last when transitioning between on and off states.
A value of 0 will disable animation, while a value of 0.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, animation_duration:Float, size:SImVec2)
	Return _ImGui_Toggle_value_flags_anim_size(label, value, flags, animation_duration, size)
End Function

Rem
bbdoc: Renders a toggle switch with the given label, value, flags, frame rounding, and knob rounding.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will
be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
The @flags parameter allows you to modify the behavior and appearance of the toggle. See #EImGuiToggleFlags for more details.
The @frame_rounding and @knob_rounding parameters control how rounded the toggle's frame and knob are, respectively.
A value of 0 will make the element completely square, while a value of 1 will make it completely round. Values
between 0 and 1 will produce varying degrees of rounding.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, frame_rounding:Float, knob_rounding:Float)
	Return _ImGui_Toggle_value_flags_round(label, value, flags, frame_rounding, knob_rounding)
End Function

Rem
bbdoc: Renders a toggle switch with the given label, value, flags, frame rounding, knob rounding, and size.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will
be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
The @flags parameter allows you to modify the behavior and appearance of the toggle. See #EImGuiToggleFlags for more details.
The @frame_rounding and @knob_rounding parameters control how rounded the toggle's frame and knob are, respectively.
A value of 0 will make the element completely square, while a value of 1 will make it completely round. Values
between 0 and 1 will produce varying degrees of rounding.
The @size parameter allows you to specify the size of the toggle. If not provided, the toggle will use the default size.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, frame_rounding:Float, knob_rounding:Float, size:SImVec2)
	Return _ImGui_Toggle_value_flags_round_size(label, value, flags, frame_rounding, knob_rounding, size)
End Function

Rem
bbdoc: Renders a toggle switch with the given label, value, flags, animation duration, frame rounding, and knob rounding.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will
be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
The @flags parameter allows you to modify the behavior and appearance of the toggle. See #EImGuiToggleFlags for more details.
The @animation_duration parameter controls how long the toggle's animation should last when transitioning between on and off states.
A value of 0 will disable animation, while a value of 0.
The @frame_rounding and @knob_rounding parameters control how rounded the toggle's frame and knob are, respectively.
A value of 0 will make the element completely square, while a value of 1 will make it completely round. Values between 0 and 1 will produce varying degrees of rounding.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, animation_duration:Float, frame_rounding:Float, knob_rounding:Float)
	Return _ImGui_Toggle_value_flags_anim_round(label, value, flags, animation_duration, frame_rounding, knob_rounding)
End Function

Rem
bbdoc: Renders a toggle switch with the given label, value, flags, animation duration, frame rounding, knob rounding, and size.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
The @flags parameter allows you to modify the behavior and appearance of the toggle. See #EImGuiToggleFlags for more details.
The @animation_duration parameter controls how long the toggle's animation should last when transitioning between on and off states. A value of 0 will disable animation, while a value of 0.
The @frame_rounding and @knob_rounding parameters control how rounded the toggle's frame and knob are, respectively. A value of 0 will make the element completely square, while a value of 1 will make it completely round. Values between 0 and 1 will produce varying degrees of rounding.
The @size parameter allows you to specify the size of the toggle. If not provided, the toggle will use the default size.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, animation_duration:Float, frame_rounding:Float, knob_rounding:Float, size:SImVec2)
	Return _ImGui_Toggle_value_flags_anim_round_size(label, value, flags, animation_duration, frame_rounding, knob_rounding, size)
End Function

Rem
bbdoc: Renders a toggle switch with the given label, value, and configuration.
returns: #True if the value was changed.
about:  The value should be a pointer to an integer that holds either #False or #True, representing the off and on states of the toggle, respectively.
The toggle will display as on when the value is non-zero, and off when the value is zero. When the user clicks on the toggle, the value will be flipped between #False and #True. The function returns #True if the value was changed, and #False if it was not.
The @config parameter allows you to specify all of the toggle's configuration in a single struct. See #SImGuiToggleConfig for more details.
End Rem
Function ImGui_Toggle:Int(label:String, value:Int Ptr, config:SImGuiToggleConfig)
	Return _ImGui_Toggle_value_config(label, value, config)
End Function

Rem
bbdoc: Returns the default, unmodified style.
End Rem
Function ImGuiTogglePresets_DefaultStyle:SImGuiToggleConfig()
	Return bmx_ImGui_Toggle_Config_DefaultStyle()
End Function

Rem
bbdoc: Returns a style similar to the default, but with rectangular knob and frame.
End Rem
Function ImGuiTogglePresets_RectangleStyle:SImGuiToggleConfig()
	bmx_ImGui_Toggle_Config_RectangleStyle()
End Function

Rem
bbdoc: Returns a style that uses a shadow to appear to glow while it's on.
End Rem
Function ImGuiTogglePresets_GlowingStyle:SImGuiToggleConfig()
	Return bmx_ImGui_Toggle_Config_GlowingStyle()
End Function

Rem
bbdoc: Returns a style that emulates the look of iOS toggles.
End Rem
Function ImGuiTogglePresets_iOSStyle:SImGuiToggleConfig(size_scale:Float = 1.0, light_mode:Int = False)
	Return bmx_ImGui_Toggle_Config_iOSStyle(size_scale, light_mode)
End Function

Rem
bbdoc: Returns a style that emulates the look of Material Design toggles.
End Rem
Function ImGuiTogglePresets_MaterialStyle:SImGuiToggleConfig(size_scale:Float = 1.0)
	Return bmx_ImGui_Toggle_Config_MaterialStyle(size_scale)
End Function

Rem
bbdoc: Returns a style that emulates the look of Minecraft toggles.
End Rem
Function ImGuiTogglePresets_MinecraftStyle:SImGuiToggleConfig(size_scale:Float = 1.0)
	Return bmx_ImGui_Toggle_Config_MinecraftStyle(size_scale)
End Function

Extern

	Function _ImGui_Toggle_value:Int(label:String, value:Int Ptr) = "bmx_ImGui_Toggle_value"
	Function _ImGui_Toggle_value_size:Int(label:String, value:Int Ptr, size:SImVec2) = "bmx_ImGui_Toggle_value_size"
	Function _ImGui_Toggle_value_flags:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags) = "bmx_ImGui_Toggle_value_flags"
	Function _ImGui_Toggle_value_flags_size:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, size:SImVec2) = "bmx_ImGui_Toggle_value_flags_size"
	Function _ImGui_Toggle_value_flags_anim:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, animation_duration:Float) = "bmx_ImGui_Toggle_value_flags_anim"
	Function _ImGui_Toggle_value_flags_anim_size:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, animation_duration:Float, size:SImVec2) = "bmx_ImGui_Toggle_value_flags_anim_size"
	Function _ImGui_Toggle_value_flags_round:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, frame_rounding:Float, knob_rounding:Float) = "bmx_ImGui_Toggle_value_flags_round"
	Function _ImGui_Toggle_value_flags_round_size:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, frame_rounding:Float, knob_rounding:Float, size:SImVec2) = "bmx_ImGui_Toggle_value_flags_round_size"
	Function _ImGui_Toggle_value_flags_anim_round:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, animation_duration:Float, frame_rounding:Float, knob_rounding:Float) = "bmx_ImGui_Toggle_value_flags_anim_round"
	Function _ImGui_Toggle_value_flags_anim_round_size:Int(label:String, value:Int Ptr, flags:EImGuiToggleFlags, animation_duration:Float, frame_rounding:Float, knob_rounding:Float, size:SImVec2) = "bmx_ImGui_Toggle_value_flags_anim_round_size"
	Function _ImGui_Toggle_value_config:Int(label:String, value:Int Ptr, config:SImGuiToggleConfig) = "bmx_ImGui_Toggle_value_config"

	Function bmx_ImGui_Toggle_Config_DefaultStyle:SImGuiToggleConfig()
	Function bmx_ImGui_Toggle_Config_RectangleStyle:SImGuiToggleConfig()
	Function bmx_ImGui_Toggle_Config_GlowingStyle:SImGuiToggleConfig()
	Function bmx_ImGui_Toggle_Config_iOSStyle:SImGuiToggleConfig(size_scale:Float, light_mode:Int)
	Function bmx_ImGui_Toggle_Config_MaterialStyle:SImGuiToggleConfig(size_scale:Float)
	Function bmx_ImGui_Toggle_Config_MinecraftStyle:SImGuiToggleConfig(size_scale:Float)
	
End Extern

Enum EImGuiToggleFlags Flags
	_None = 0
	_Animated               = 1 Shl 0
	_BorderedFrame          = 1 Shl 3
	_BorderedKnob           = 1 Shl 4
	_ShadowedFrame          = 1 Shl 5
	_ShadowedKnob           = 1 Shl 6

	_A11y                   = 1 Shl 8
	_Bordered               = _BorderedFrame | _BorderedKnob
	_Shadowed               = _ShadowedFrame | _ShadowedKnob
	_Default                = _None
End Enum

Enum EImGuiToggleA11yStyle
	_Label
    _Glyph
    _Dot
    _Default = _Label
End Enum


Rem
bbdoc: The golden ratio.
End Rem
Const ImGuiToggleConstants_Phi:Float = 1.6180339887498948482045

Rem
bbdoc: d = 2r
End Rem
Const ImGuiToggleConstants_DiameterToRadiusRatio:Float = 0.5

Rem
bbdoc: Animation is disabled with a animation_duration of 0.
End Rem
Const ImGuiToggleConstants_AnimationDurationDisabled:Float = 0.0

Rem
bbdoc: The default animation duration, in seconds. (0.1f: 100 ms.)
End Rem
Const ImGuiToggleConstants_AnimationDurationDefault:Float = 0.1

Rem
bbdoc: The lowest allowable value for animation duration. (0.0f: Disabled animation.)
End Rem
Const ImGuiToggleConstants_AnimationDurationMinimum:Float = ImGuiToggleConstants_AnimationDurationDisabled

Rem
bbdoc: The default frame rounding value. (1.0f: Full rounding.)
End Rem
Const ImGuiToggleConstants_FrameRoundingDefault:Float = 1.0

Rem
bbdoc: The minimum frame rounding value. (0.0f: Full rectangle.)
End Rem
Const ImGuiToggleConstants_FrameRoundingMinimum:Float = 0.0

Rem
bbdoc: The maximum frame rounding value. (1.0f: Full rounding.)
End Rem
Const ImGuiToggleConstants_FrameRoundingMaximum:Float = 1.0

Rem
bbdoc: The default knob rounding value. (1.0f: Full rounding.)
End Rem
Const ImGuiToggleConstants_KnobRoundingDefault:Float = 1.0

Rem
bbdoc: The minimum knob rounding value. (0.0f: Full rectangle.)
End Rem
Const ImGuiToggleConstants_KnobRoundingMinimum:Float = 0.0

Rem
bbdoc: The maximum knob rounding value. (1.0f: Full rounding.)
End Rem
Const ImGuiToggleConstants_KnobRoundingMaximum:Float = 1.0

Rem
bbdoc: The default height to width ratio. (Phi: The golden ratio.)
End Rem
Const ImGuiToggleConstants_WidthRatioDefault:Float = ImGuiToggleConstants_Phi

Rem
bbdoc: The minimum allowable width ratio. (1.0f: Toggle width==height, not very useful but interesting.)
End Rem
Const ImGuiToggleConstants_WidthRatioMinimum:Float = 1.0

Rem
bbdoc: The maximum allowable width ratio. (10.0f: It starts to get silly quickly.)
End Rem
Const ImGuiToggleConstants_WidthRatioMaximum:Float = 10.0

Rem
bbdoc: The default amount of pixels the knob should be inset into the toggle frame. (1.5f in each direction: Pleasing to the eye.)
End Rem
Const ImGuiToggleConstants_KnobInsetDefault:Float = 1.5

Rem
bbdoc: The minimum amount of pixels the knob should be negatively inset (outset) from the toggle frame. (-100.0f: Big overgrown toggle.)
End Rem
Const ImGuiToggleConstants_KnobInsetMinimum:Float = -100.0

Rem
bbdoc: The maximum amount of pixels the knob should be inset into the toggle frame. (100.0f: Toggle likely invisible!)
End Rem
Const ImGuiToggleConstants_KnobInsetMaximum:Float = 100.0

Rem
bbdoc: The default thickness for borders drawn on the toggle frame and knob.
End Rem
Const ImGuiToggleConstants_BorderThicknessDefault:Float = 1.0

Rem
bbdoc: The default thickness for shadows drawn under the toggle frame and knob.
End Rem
Const ImGuiToggleConstants_ShadowThicknessDefault:Float = 2.0

Rem
bbdoc: The default a11y string used when the toggle is on.
End Rem
Const ImGuiToggleConstants_LabelA11yOnDefault:String = "1"

Rem
bbdoc: The default a11y string used when the toggle is off.
End Rem
Const ImGuiToggleConstants_LabelA11yOffDefault:String = "0"


Struct SImGuiToggleConfig

    ' Flags that control the toggle's behavior and display.
    Field Flags:EImGuiToggleFlags = EImGuiToggleFlags._Default

    ' What style of A11y glyph to draw on the widget.
    Field A11yStyle:EImGuiToggleA11yStyle = EImGuiToggleA11yStyle._Default

    ' The a duration in seconds that the toggle should animate for. If 0, animation will be disabled.
    Field AnimationDuration:Float = ImGuiToggleConstants_AnimationDurationDefault

    ' A scalar that controls how rounded the toggle frame is. 0 is square, 1 is round. (0, 1) default 1.0f
    Field FrameRounding:Float = ImGuiToggleConstants_FrameRoundingDefault

    'A scalar that controls how rounded the toggle knob is. 0 is square, 1 is round. (0, 1) default 1.0f
    Field KnobRounding:Float = ImGuiToggleConstants_KnobRoundingDefault

    ' A ratio that controls how wide the toggle is compared to it's height. If `Size.x` is non-zero, this value is ignored.
    Field WidthRatio:Float = ImGuiToggleConstants_WidthRatioDefault

    ' A custom size to draw the toggle with. Defaults to (0, 0). If `Size.x` is zero, `WidthRatio` will control the toggle width.
    ' If `Size.y` is zero, the toggle height will be set by `ImGui::GetFrameHeight()`.
    Field Size:SImVec2 = New SImVec2(0.0, 0.0)

    ' Specific configuration data to use when the knob is in the on state.
    Field On:SImGuiToggleStateConfig

    ' Specific configuration data to use when the knob is in the off state.
    Field Off:SImGuiToggleStateConfig
End Struct

Struct SImGuiToggleStateConfig

    ' The thickness the border should be drawn on the frame when ImGuiToggleFlags_BorderedFrame is specified in `Flags`.
    Field FrameBorderThickness:Float = ImGuiToggleConstants_BorderThicknessDefault

    ' The thickness the shadow should be drawn on the frame when ImGuiToggleFlags_ShadowedFrame is specified in `Flags`.
    Field FrameShadowThickness:Float = ImGuiToggleConstants_ShadowThicknessDefault

    ' The thickness the border should be drawn on the frame when ImGuiToggleFlags_BorderedKnob is specified in `Flags`.
    Field KnobBorderThickness:Float = ImGuiToggleConstants_BorderThicknessDefault

    ' The thickness the shadow should be drawn on the frame when ImGuiToggleFlags_ShadowedKnob is specified in `Flags`.
    Field KnobShadowThickness:Float = ImGuiToggleConstants_ShadowThicknessDefault

    ' The label drawn on the toggle to show the toggle is in the when ImGuiToggleFlags_A11yLabels is specified in `Flags`.
    ' If left null, default strings will be used.
    Field Label:Byte Ptr

    ' The number of pixels the knob should be inset into the toggle frame.
    ' With a round (circle) knob, an average of each offset will be used.
    ' With a rectangular knob, each offset will be used in it's intended direction.
    Field KnobInset:SImOffsetRect = New SImOffsetRect(ImGuiToggleConstants_KnobInsetDefault)

    ' A custom amount of pixels to offset the knob by. Positive x values will move the knob towards the inside, negative the outside.
    Field KnobOffset:SImVec2 = New SImVec2(0.0, 0.0)

    ' An optional custom palette to use for the colors to use when drawing the toggle. If left null, theme colors will be used.
    ' If any of the values in the palette are zero, those specific colors will default to theme colors.
    Field Palette:Byte Ptr
End Struct

Struct SImOffsetRect
	Field Top:Float
	Field Left:Float
	Field Bottom:Float
	Field Right:Float

	Method New(all:Float)
		Self.Top = all
		Self.Left = all
		Self.Bottom = all
		Self.Right = all
	End Method
End Struct

