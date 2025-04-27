'
' This file is generated. Do not modify it manually.
' Generated from ImGui 1.91.9b header file.
'
SuperStrict

Import "../source.bmx"

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


Function ImGui_GetCurrentContext:TImGuiContext()
	Return TImGuiContext._Create(_ImGui_GetCurrentContext())
End Function

Rem
bbdoc:  access the ImGuiIO structure (mouse/keyboard/gamepad inputs, time, various configuration options/flags)
End Rem
Function ImGui_GetIO:TImGuiIO()
	Return TImGuiIO._Create(_ImGui_GetIO())
End Function

Rem
bbdoc:  access the ImGuiPlatformIO structure (mostly hooks/functions to connect to platform/renderer and OS Clipboard, IME etc.)
End Rem
Function ImGui_GetPlatformIO:Byte Ptr()
	Return _ImGui_GetPlatformIO()
End Function

Rem
bbdoc:  access the Style structure (colors, sizes). Always use PushStyleColor(), PushStyleVar() to modify style mid-frame!
End Rem
Function ImGui_GetStyle:TImGuiStyle()
	Return TImGuiStyle._Create(_ImGui_GetStyle())
End Function

Rem
bbdoc:  start a new Dear ImGui frame, you can submit any command from this point until Render()/EndFrame().
End Rem
Function ImGui_NewFrame()
	_ImGui_NewFrame()
End Function

Rem
bbdoc:  ends the Dear ImGui frame. automatically called by Render(). If you don't need to render data (skipping rendering) you may call EndFrame() without Render()... but you'll have wasted CPU already! If you don't need to render, better to not create any windows and not call NewFrame() at all!
End Rem
Function ImGui_EndFrame()
	_ImGui_EndFrame()
End Function

Rem
bbdoc:  ends the Dear ImGui frame, finalize the draw data. You can then get call GetDrawData().
End Rem
Function ImGui_Render()
	_ImGui_Render()
End Function

Rem
bbdoc:  valid after Render() and until the next call to NewFrame(). this is what you have to render.
End Rem
Function ImGui_GetDrawData:Byte Ptr()
	Return _ImGui_GetDrawData()
End Function

Rem
bbdoc:  create Demo window. demonstrate most ImGui features. call this to learn about the library! try to make it always available in your application!
End Rem
Function ImGui_ShowDemoWindow(p_open:Int Var)
	_ImGui_ShowDemoWindow(p_open)
End Function

Rem
bbdoc:  create Metrics/Debugger window. display Dear ImGui internals: windows, draw commands, various internal state, etc.
End Rem
Function ImGui_ShowMetricsWindow(p_open:Int Var)
	_ImGui_ShowMetricsWindow(p_open)
End Function

Rem
bbdoc:  create Debug Log window. display a simplified log of important dear imgui events.
End Rem
Function ImGui_ShowDebugLogWindow(p_open:Int Var)
	_ImGui_ShowDebugLogWindow(p_open)
End Function

Rem
bbdoc:  Implied p_open = NULL
End Rem
Function ImGui_ShowIDStackToolWindow()
	_ImGui_ShowIDStackToolWindow()
End Function

Rem
bbdoc:  create Stack Tool window. hover items with mouse to query information about the source of their unique ID.
End Rem
Function ImGui_ShowIDStackToolWindowEx(p_open:Int Var)
	_ImGui_ShowIDStackToolWindowEx(p_open)
End Function

Rem
bbdoc:  create About window. display Dear ImGui version, credits and build/system information.
End Rem
Function ImGui_ShowAboutWindow(p_open:Int Var)
	_ImGui_ShowAboutWindow(p_open)
End Function

Rem
bbdoc:  add style editor block (not a window). you can pass in a reference ImGuiStyle structure to compare to, revert to and save to (else it uses the default style)
End Rem
Function ImGui_ShowStyleEditor(ref:TImGuiStyle)
	_ImGui_ShowStyleEditor(ref.handle)
End Function

Rem
bbdoc:  add style selector block (not a window), essentially a combo listing the default styles.
End Rem
Function ImGui_ShowStyleSelector:Int(label:String)
	Return _ImGui_ShowStyleSelector(label)
End Function

Rem
bbdoc:  add font selector block (not a window), essentially a combo listing the loaded fonts.
End Rem
Function ImGui_ShowFontSelector(label:String)
	_ImGui_ShowFontSelector(label)
End Function

Rem
bbdoc:  add basic help/info block (not a window): how to manipulate ImGui as an end-user (mouse/keyboard controls).
End Rem
Function ImGui_ShowUserGuide()
	_ImGui_ShowUserGuide()
End Function

Rem
bbdoc:  get the compiled version string e.g. "1.80 WIP" (essentially the value for IMGUI_VERSION from the compiled version of imgui.cpp)
End Rem
Function ImGui_GetVersion:String()
	Return _ImGui_GetVersion()
End Function

Rem
bbdoc: 
End Rem
Function ImGui_Begin:Int(name:String, p_open:Int Var, flags:EImGuiWindowFlags)
	Return _ImGui_Begin(name, p_open, flags)
End Function

Function ImGui_End()
	_ImGui_End()
End Function

Rem
bbdoc: 
End Rem
Function ImGui_BeginChild:Int(str_id:String, size:SImVec2, child_flags:EImGuiChildFlags, window_flags:EImGuiWindowFlags)
	Return _ImGui_BeginChild(str_id, size, child_flags, window_flags)
End Function

Function ImGui_BeginChildID:Int(id:UInt, size:SImVec2, child_flags:EImGuiChildFlags, window_flags:EImGuiWindowFlags)
	Return _ImGui_BeginChildID(id, size, child_flags, window_flags)
End Function

Function ImGui_EndChild()
	_ImGui_EndChild()
End Function

Rem
bbdoc: 
End Rem
Function ImGui_IsWindowAppearing:Int()
	Return _ImGui_IsWindowAppearing()
End Function

Function ImGui_IsWindowCollapsed:Int()
	Return _ImGui_IsWindowCollapsed()
End Function

Rem
bbdoc:  is current window focused? or its root/child, depending on flags. see flags for options.
End Rem
Function ImGui_IsWindowFocused:Int(flags:EImGuiFocusedFlags)
	Return _ImGui_IsWindowFocused(flags)
End Function

Rem
bbdoc:  is current window hovered and hoverable (e.g. not blocked by a popup/modal)? See ImGuiHoveredFlags_ for options. IMPORTANT: If you are trying to check whether your mouse should be dispatched to Dear ImGui or to your underlying app, you should not use this function! Use the 'io.WantCaptureMouse' boolean for that! Refer to FAQ entry "How can I tell whether to dispatch mouse/keyboard to Dear ImGui or my application?" for details.
End Rem
Function ImGui_IsWindowHovered:Int(flags:EImGuiHoveredFlags)
	Return _ImGui_IsWindowHovered(flags)
End Function

Rem
bbdoc:  get draw list associated to the current window, to append your own drawing primitives
End Rem
Function ImGui_GetWindowDrawList:TImDrawList()
	Return TImDrawList._Create(_ImGui_GetWindowDrawList())
End Function

Rem
bbdoc:  get current window position in screen space (IT IS UNLIKELY YOU EVER NEED TO USE THIS. Consider always using GetCursorScreenPos() and GetContentRegionAvail() instead)
End Rem
Function ImGui_GetWindowPos:SImVec2()
	Return _ImGui_GetWindowPos()
End Function

Rem
bbdoc:  get current window size (IT IS UNLIKELY YOU EVER NEED TO USE THIS. Consider always using GetCursorScreenPos() and GetContentRegionAvail() instead)
End Rem
Function ImGui_GetWindowSize:SImVec2()
	Return _ImGui_GetWindowSize()
End Function

Rem
bbdoc:  get current window width (IT IS UNLIKELY YOU EVER NEED TO USE THIS). Shortcut for GetWindowSize().x.
End Rem
Function ImGui_GetWindowWidth:Float()
	Return _ImGui_GetWindowWidth()
End Function

Rem
bbdoc:  get current window height (IT IS UNLIKELY YOU EVER NEED TO USE THIS). Shortcut for GetWindowSize().y.
End Rem
Function ImGui_GetWindowHeight:Float()
	Return _ImGui_GetWindowHeight()
End Function

Rem
bbdoc:  Implied pivot = ImVec2(0, 0)
End Rem
Function ImGui_SetNextWindowPos(pos:SImVec2, cond:EImGuiCond)
	_ImGui_SetNextWindowPos(pos, cond)
End Function

Rem
bbdoc:  set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.
End Rem
Function ImGui_SetNextWindowPosEx(pos:SImVec2, cond:EImGuiCond, pivot:SImVec2)
	_ImGui_SetNextWindowPosEx(pos, cond, pivot)
End Function

Rem
bbdoc:  set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin()
End Rem
Function ImGui_SetNextWindowSize(size:SImVec2, cond:EImGuiCond)
	_ImGui_SetNextWindowSize(size, cond)
End Function

Rem
bbdoc:  set next window size limits. use 0.0f or FLT_MAX if you don't want limits. Use -1 for both min and max of same axis to preserve current size (which itself is a constraint). Use callback to apply non-trivial programmatic constraints.
End Rem
Function ImGui_SetNextWindowSizeConstraints(size_min:SImVec2, size_max:SImVec2, custom_callback:Byte Ptr, custom_callback_data:Byte Ptr)
	_ImGui_SetNextWindowSizeConstraints(size_min, size_max, custom_callback, custom_callback_data)
End Function

Rem
bbdoc:  set next window content size (~ scrollable client area, which enforce the range of scrollbars). Not including window decorations (title bar, menu bar, etc.) nor WindowPadding. set an axis to 0.0f to leave it automatic. call before Begin()
End Rem
Function ImGui_SetNextWindowContentSize(size:SImVec2)
	_ImGui_SetNextWindowContentSize(size)
End Function

Rem
bbdoc:  set next window collapsed state. call before Begin()
End Rem
Function ImGui_SetNextWindowCollapsed(collapsed:Int, cond:EImGuiCond)
	_ImGui_SetNextWindowCollapsed(collapsed, cond)
End Function

Rem
bbdoc:  set next window to be focused / top-most. call before Begin()
End Rem
Function ImGui_SetNextWindowFocus()
	_ImGui_SetNextWindowFocus()
End Function

Rem
bbdoc:  set next window scrolling value (use < 0.0f to not affect a given axis).
End Rem
Function ImGui_SetNextWindowScroll(scroll:SImVec2)
	_ImGui_SetNextWindowScroll(scroll)
End Function

Rem
bbdoc:  set next window background color alpha. helper to easily override the Alpha component of ImGuiCol_WindowBg/ChildBg/PopupBg. you may also use ImGuiWindowFlags_NoBackground.
End Rem
Function ImGui_SetNextWindowBgAlpha(alpha:Float)
	_ImGui_SetNextWindowBgAlpha(alpha)
End Function

Rem
bbdoc:  (not recommended) set current window position - call within Begin()/End(). prefer using SetNextWindowPos(), as this may incur tearing and side-effects.
End Rem
Function ImGui_SetWindowPos(pos:SImVec2, cond:EImGuiCond)
	_ImGui_SetWindowPos(pos, cond)
End Function

Rem
bbdoc:  (not recommended) set current window size - call within Begin()/End(). set to ImVec2(0, 0) to force an auto-fit. prefer using SetNextWindowSize(), as this may incur tearing and minor side-effects.
End Rem
Function ImGui_SetWindowSize(size:SImVec2, cond:EImGuiCond)
	_ImGui_SetWindowSize(size, cond)
End Function

Rem
bbdoc:  (not recommended) set current window collapsed state. prefer using SetNextWindowCollapsed().
End Rem
Function ImGui_SetWindowCollapsed(collapsed:Int, cond:EImGuiCond)
	_ImGui_SetWindowCollapsed(collapsed, cond)
End Function

Rem
bbdoc:  (not recommended) set current window to be focused / top-most. prefer using SetNextWindowFocus().
End Rem
Function ImGui_SetWindowFocus()
	_ImGui_SetWindowFocus()
End Function

Rem
bbdoc:  [OBSOLETE] set font scale. Adjust IO.FontGlobalScale if you want to scale all windows. This is an old API! For correct scaling, prefer to reload font + rebuild ImFontAtlas + call style.ScaleAllSizes().
End Rem
Function ImGui_SetWindowFontScale(scale:Float)
	_ImGui_SetWindowFontScale(scale)
End Function

Rem
bbdoc:  set named window position.
End Rem
Function ImGui_SetWindowPosStr(name:String, pos:SImVec2, cond:EImGuiCond)
	_ImGui_SetWindowPosStr(name, pos, cond)
End Function

Rem
bbdoc:  set named window size. set axis to 0.0f to force an auto-fit on this axis.
End Rem
Function ImGui_SetWindowSizeStr(name:String, size:SImVec2, cond:EImGuiCond)
	_ImGui_SetWindowSizeStr(name, size, cond)
End Function

Rem
bbdoc:  set named window collapsed state
End Rem
Function ImGui_SetWindowCollapsedStr(name:String, collapsed:Int, cond:EImGuiCond)
	_ImGui_SetWindowCollapsedStr(name, collapsed, cond)
End Function

Rem
bbdoc:  set named window to be focused / top-most. use NULL to remove focus.
End Rem
Function ImGui_SetWindowFocusStr(name:String)
	_ImGui_SetWindowFocusStr(name)
End Function

Rem
bbdoc:  get scrolling amount [0 .. GetScrollMaxX()]
End Rem
Function ImGui_GetScrollX:Float()
	Return _ImGui_GetScrollX()
End Function

Rem
bbdoc:  get scrolling amount [0 .. GetScrollMaxY()]
End Rem
Function ImGui_GetScrollY:Float()
	Return _ImGui_GetScrollY()
End Function

Rem
bbdoc:  set scrolling amount [0 .. GetScrollMaxX()]
End Rem
Function ImGui_SetScrollX(scroll_x:Float)
	_ImGui_SetScrollX(scroll_x)
End Function

Rem
bbdoc:  set scrolling amount [0 .. GetScrollMaxY()]
End Rem
Function ImGui_SetScrollY(scroll_y:Float)
	_ImGui_SetScrollY(scroll_y)
End Function

Rem
bbdoc:  get maximum scrolling amount ~~ ContentSize.x - WindowSize.x - DecorationsSize.x
End Rem
Function ImGui_GetScrollMaxX:Float()
	Return _ImGui_GetScrollMaxX()
End Function

Rem
bbdoc:  get maximum scrolling amount ~~ ContentSize.y - WindowSize.y - DecorationsSize.y
End Rem
Function ImGui_GetScrollMaxY:Float()
	Return _ImGui_GetScrollMaxY()
End Function

Rem
bbdoc:  adjust scrolling amount to make current cursor position visible. center_x_ratio=0.0: left, 0.5: center, 1.0: right. When using to make a "default/current item" visible, consider using SetItemDefaultFocus() instead.
End Rem
Function ImGui_SetScrollHereX(center_x_ratio:Float)
	_ImGui_SetScrollHereX(center_x_ratio)
End Function

Rem
bbdoc:  adjust scrolling amount to make current cursor position visible. center_y_ratio=0.0: top, 0.5: center, 1.0: bottom. When using to make a "default/current item" visible, consider using SetItemDefaultFocus() instead.
End Rem
Function ImGui_SetScrollHereY(center_y_ratio:Float)
	_ImGui_SetScrollHereY(center_y_ratio)
End Function

Rem
bbdoc:  adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.
End Rem
Function ImGui_SetScrollFromPosX(local_x:Float, center_x_ratio:Float)
	_ImGui_SetScrollFromPosX(local_x, center_x_ratio)
End Function

Rem
bbdoc:  adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.
End Rem
Function ImGui_SetScrollFromPosY(local_y:Float, center_y_ratio:Float)
	_ImGui_SetScrollFromPosY(local_y, center_y_ratio)
End Function

Rem
bbdoc:  use NULL as a shortcut to push default font
End Rem
Function ImGui_PushFont(font:TImFont)
	_ImGui_PushFont(font.handle)
End Function

Function ImGui_PopFont()
	_ImGui_PopFont()
End Function

Rem
bbdoc:  modify a style color. always use this if you modify the style after NewFrame().
End Rem
Function ImGui_PushStyleColor(idx:EImGuiCol, col:UInt)
	_ImGui_PushStyleColor(idx, col)
End Function

Function ImGui_PushStyleColorImVec4(idx:EImGuiCol, col:SImVec4)
	_ImGui_PushStyleColorImVec4(idx, col)
End Function

Rem
bbdoc:  Implied count = 1
End Rem
Function ImGui_PopStyleColor()
	_ImGui_PopStyleColor()
End Function

Function ImGui_PopStyleColorEx(count:Int)
	_ImGui_PopStyleColorEx(count)
End Function

Rem
bbdoc:  modify a style float variable. always use this if you modify the style after NewFrame()!
End Rem
Function ImGui_PushStyleVar(idx:EImGuiStyleVar, val:Float)
	_ImGui_PushStyleVar(idx, val)
End Function

Rem
bbdoc:  modify a style ImVec2 variable. "
End Rem
Function ImGui_PushStyleVarImVec2(idx:EImGuiStyleVar, val:SImVec2)
	_ImGui_PushStyleVarImVec2(idx, val)
End Function

Rem
bbdoc:  modify X component of a style ImVec2 variable. "
End Rem
Function ImGui_PushStyleVarX(idx:EImGuiStyleVar, val_x:Float)
	_ImGui_PushStyleVarX(idx, val_x)
End Function

Rem
bbdoc:  modify Y component of a style ImVec2 variable. "
End Rem
Function ImGui_PushStyleVarY(idx:EImGuiStyleVar, val_y:Float)
	_ImGui_PushStyleVarY(idx, val_y)
End Function

Rem
bbdoc:  Implied count = 1
End Rem
Function ImGui_PopStyleVar()
	_ImGui_PopStyleVar()
End Function

Function ImGui_PopStyleVarEx(count:Int)
	_ImGui_PopStyleVarEx(count)
End Function

Rem
bbdoc:  modify specified shared item flag, e.g. PushItemFlag(ImGuiItemFlags_NoTabStop, true)
End Rem
Function ImGui_PushItemFlag(option:EImGuiItemFlags, enabled:Int)
	_ImGui_PushItemFlag(option, enabled)
End Function

Function ImGui_PopItemFlag()
	_ImGui_PopItemFlag()
End Function

Rem
bbdoc:  push width of items for common large "item+label" widgets. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -FLT_MIN always align width to the right side).
End Rem
Function ImGui_PushItemWidth(item_width:Float)
	_ImGui_PushItemWidth(item_width)
End Function

Function ImGui_PopItemWidth()
	_ImGui_PopItemWidth()
End Function

Rem
bbdoc:  set width of the _next_ common large "item+label" widget. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -FLT_MIN always align width to the right side)
End Rem
Function ImGui_SetNextItemWidth(item_width:Float)
	_ImGui_SetNextItemWidth(item_width)
End Function

Rem
bbdoc:  width of item given pushed settings and current cursor position. NOT necessarily the width of last item unlike most 'Item' functions.
End Rem
Function ImGui_CalcItemWidth:Float()
	Return _ImGui_CalcItemWidth()
End Function

Rem
bbdoc:  push word-wrapping position for Text*() commands. < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space
End Rem
Function ImGui_PushTextWrapPos(wrap_local_pos_x:Float)
	_ImGui_PushTextWrapPos(wrap_local_pos_x)
End Function

Function ImGui_PopTextWrapPos()
	_ImGui_PopTextWrapPos()
End Function

Rem
bbdoc:  get current font
End Rem
Function ImGui_GetFont:Byte Ptr()
	Return _ImGui_GetFont()
End Function

Rem
bbdoc:  get current font size (= height in pixels) of current font with current scale applied
End Rem
Function ImGui_GetFontSize:Float()
	Return _ImGui_GetFontSize()
End Function

Rem
bbdoc:  get UV coordinate for a white pixel, useful to draw custom shapes via the ImDrawList API
End Rem
Function ImGui_GetFontTexUvWhitePixel:SImVec2()
	Return _ImGui_GetFontTexUvWhitePixel()
End Function

Rem
bbdoc:  Implied alpha_mul = 1.0f
End Rem
Function ImGui_GetColorU32:UInt(idx:EImGuiCol)
	Return _ImGui_GetColorU32(idx)
End Function

Rem
bbdoc:  retrieve given style color with style alpha applied and optional extra alpha multiplier, packed as a 32-bit value suitable for ImDrawList
End Rem
Function ImGui_GetColorU32Ex:UInt(idx:EImGuiCol, alpha_mul:Float)
	Return _ImGui_GetColorU32Ex(idx, alpha_mul)
End Function

Rem
bbdoc:  retrieve given color with style alpha applied, packed as a 32-bit value suitable for ImDrawList
End Rem
Function ImGui_GetColorU32ImVec4:UInt(col:SImVec4)
	Return _ImGui_GetColorU32ImVec4(col)
End Function

Rem
bbdoc:  Implied alpha_mul = 1.0f
End Rem
Function ImGui_GetColorU32ImU32:UInt(col:UInt)
	Return _ImGui_GetColorU32ImU32(col)
End Function

Rem
bbdoc:  retrieve given color with style alpha applied, packed as a 32-bit value suitable for ImDrawList
End Rem
Function ImGui_GetColorU32ImU32Ex:UInt(col:UInt, alpha_mul:Float)
	Return _ImGui_GetColorU32ImU32Ex(col, alpha_mul)
End Function

Rem
bbdoc:  retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor(), otherwise use GetColorU32() to get style color with style alpha baked in.
End Rem
Function ImGui_GetStyleColorVec4:Byte Ptr(idx:EImGuiCol)
	Return _ImGui_GetStyleColorVec4(idx)
End Function

Rem
bbdoc:  cursor position, absolute coordinates. THIS IS YOUR BEST FRIEND (prefer using this rather than GetCursorPos(), also more useful to work with ImDrawList API).
End Rem
Function ImGui_GetCursorScreenPos:SImVec2()
	Return _ImGui_GetCursorScreenPos()
End Function

Rem
bbdoc:  cursor position, absolute coordinates. THIS IS YOUR BEST FRIEND.
End Rem
Function ImGui_SetCursorScreenPos(pos:SImVec2)
	_ImGui_SetCursorScreenPos(pos)
End Function

Rem
bbdoc:  available space from current position. THIS IS YOUR BEST FRIEND.
End Rem
Function ImGui_GetContentRegionAvail:SImVec2()
	Return _ImGui_GetContentRegionAvail()
End Function

Rem
bbdoc:  [window-local] cursor position in window-local coordinates. This is not your best friend.
End Rem
Function ImGui_GetCursorPos:SImVec2()
	Return _ImGui_GetCursorPos()
End Function

Rem
bbdoc:  [window-local] "
End Rem
Function ImGui_GetCursorPosX:Float()
	Return _ImGui_GetCursorPosX()
End Function

Rem
bbdoc:  [window-local] "
End Rem
Function ImGui_GetCursorPosY:Float()
	Return _ImGui_GetCursorPosY()
End Function

Rem
bbdoc:  [window-local] "
End Rem
Function ImGui_SetCursorPos(local_pos:SImVec2)
	_ImGui_SetCursorPos(local_pos)
End Function

Rem
bbdoc:  [window-local] "
End Rem
Function ImGui_SetCursorPosX(local_x:Float)
	_ImGui_SetCursorPosX(local_x)
End Function

Rem
bbdoc:  [window-local] "
End Rem
Function ImGui_SetCursorPosY(local_y:Float)
	_ImGui_SetCursorPosY(local_y)
End Function

Rem
bbdoc:  [window-local] initial cursor position, in window-local coordinates. Call GetCursorScreenPos() after Begin() to get the absolute coordinates version.
End Rem
Function ImGui_GetCursorStartPos:SImVec2()
	Return _ImGui_GetCursorStartPos()
End Function

Rem
bbdoc:  separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.
End Rem
Function ImGui_Separator()
	_ImGui_Separator()
End Function

Rem
bbdoc:  Implied offset_from_start_x = 0.0f, spacing = -1.0f
End Rem
Function ImGui_SameLine()
	_ImGui_SameLine()
End Function

Rem
bbdoc:  call between widgets or groups to layout them horizontally. X position given in window coordinates.
End Rem
Function ImGui_SameLineEx(offset_from_start_x:Float, spacing:Float)
	_ImGui_SameLineEx(offset_from_start_x, spacing)
End Function

Rem
bbdoc:  undo a SameLine() or force a new line when in a horizontal-layout context.
End Rem
Function ImGui_NewLine()
	_ImGui_NewLine()
End Function

Rem
bbdoc:  add vertical spacing.
End Rem
Function ImGui_Spacing()
	_ImGui_Spacing()
End Function

Rem
bbdoc:  add a dummy item of given size. unlike InvisibleButton(), Dummy() won't take the mouse click or be navigable into.
End Rem
Function ImGui_Dummy(size:SImVec2)
	_ImGui_Dummy(size)
End Function

Rem
bbdoc:  Implied indent_w = 0.0f
End Rem
Function ImGui_Indent()
	_ImGui_Indent()
End Function

Rem
bbdoc:  move content position toward the right, by indent_w, or style.IndentSpacing if indent_w <= 0
End Rem
Function ImGui_IndentEx(indent_w:Float)
	_ImGui_IndentEx(indent_w)
End Function

Rem
bbdoc:  Implied indent_w = 0.0f
End Rem
Function ImGui_Unindent()
	_ImGui_Unindent()
End Function

Rem
bbdoc:  move content position back to the left, by indent_w, or style.IndentSpacing if indent_w <= 0
End Rem
Function ImGui_UnindentEx(indent_w:Float)
	_ImGui_UnindentEx(indent_w)
End Function

Rem
bbdoc:  lock horizontal starting position
End Rem
Function ImGui_BeginGroup()
	_ImGui_BeginGroup()
End Function

Rem
bbdoc:  unlock horizontal starting position + capture the whole group bounding box into one "item" (so you can use IsItemHovered() or layout primitives such as SameLine() on whole group, etc.)
End Rem
Function ImGui_EndGroup()
	_ImGui_EndGroup()
End Function

Rem
bbdoc:  vertically align upcoming text baseline to FramePadding.y so that it will align properly to regularly framed items (call if you have text on a line before a framed item)
End Rem
Function ImGui_AlignTextToFramePadding()
	_ImGui_AlignTextToFramePadding()
End Function

Rem
bbdoc:  ~ FontSize
End Rem
Function ImGui_GetTextLineHeight:Float()
	Return _ImGui_GetTextLineHeight()
End Function

Rem
bbdoc:  ~ FontSize + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of text)
End Rem
Function ImGui_GetTextLineHeightWithSpacing:Float()
	Return _ImGui_GetTextLineHeightWithSpacing()
End Function

Rem
bbdoc:  ~ FontSize + style.FramePadding.y * 2
End Rem
Function ImGui_GetFrameHeight:Float()
	Return _ImGui_GetFrameHeight()
End Function

Rem
bbdoc:  ~ FontSize + style.FramePadding.y * 2 + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of framed widgets)
End Rem
Function ImGui_GetFrameHeightWithSpacing:Float()
	Return _ImGui_GetFrameHeightWithSpacing()
End Function

Rem
bbdoc:  push string into the ID stack (will hash string).
End Rem
Function ImGui_PushID(str_id:String)
	_ImGui_PushID(str_id)
End Function

Rem
bbdoc:  push string into the ID stack (will hash string).
End Rem
Function ImGui_PushIDStr(str_id_begin:String, str_id_end:String)
	_ImGui_PushIDStr(str_id_begin, str_id_end)
End Function

Rem
bbdoc:  push pointer into the ID stack (will hash pointer).
End Rem
Function ImGui_PushIDPtr(ptr_id:Byte Ptr)
	_ImGui_PushIDPtr(ptr_id)
End Function

Rem
bbdoc:  push integer into the ID stack (will hash integer).
End Rem
Function ImGui_PushIDInt(int_id:Int)
	_ImGui_PushIDInt(int_id)
End Function

Rem
bbdoc:  pop from the ID stack.
End Rem
Function ImGui_PopID()
	_ImGui_PopID()
End Function

Rem
bbdoc:  calculate unique ID (hash of whole ID stack + given parameter). e.g. if you want to query into ImGuiStorage yourself
End Rem
Function ImGui_GetID:UInt(str_id:String)
	Return _ImGui_GetID(str_id)
End Function

Function ImGui_GetIDStr:UInt(str_id_begin:String, str_id_end:String)
	Return _ImGui_GetIDStr(str_id_begin, str_id_end)
End Function

Function ImGui_GetIDPtr:UInt(ptr_id:Byte Ptr)
	Return _ImGui_GetIDPtr(ptr_id)
End Function

Function ImGui_GetIDInt:UInt(int_id:Int)
	Return _ImGui_GetIDInt(int_id)
End Function

Rem
bbdoc:  Implied text_end = NULL
End Rem
Function ImGui_TextUnformatted(text:String)
	_ImGui_TextUnformatted(text)
End Function

Rem
bbdoc:  raw text without formatting. Roughly equivalent to Text("%s", text) but: A) doesn't require null terminated string if 'text_end' is specified, B) it's faster, no memory copy is done, no buffer size limits, recommended for long chunks of text.
End Rem
Function ImGui_TextUnformattedEx(text:String, text_end:String)
	_ImGui_TextUnformattedEx(text, text_end)
End Function

Rem
bbdoc:  formatted text
End Rem
Function ImGui_Text(fmt:String)
	_ImGui_Text(fmt)
End Function

Function ImGui_TextV(fmt:String)
	_ImGui_TextV(fmt)
End Function

Rem
bbdoc:  shortcut for PushStyleColor(ImGuiCol_Text, col); Text(fmt, ...); PopStyleColor();
End Rem
Function ImGui_TextColored(col:SImVec4, fmt:String)
	_ImGui_TextColored(col, fmt)
End Function

Function ImGui_TextColoredV(col:SImVec4, fmt:String)
	_ImGui_TextColoredV(col, fmt)
End Function

Rem
bbdoc:  shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
End Rem
Function ImGui_TextDisabled(fmt:String)
	_ImGui_TextDisabled(fmt)
End Function

Function ImGui_TextDisabledV(fmt:String)
	_ImGui_TextDisabledV(fmt)
End Function

Rem
bbdoc:  shortcut for PushTextWrapPos(0.0f); Text(fmt, ...); PopTextWrapPos();. Note that this won't work on an auto-resizing window if there's no other widgets to extend the window width, yoy may need to set a size using SetNextWindowSize().
End Rem
Function ImGui_TextWrapped(fmt:String)
	_ImGui_TextWrapped(fmt)
End Function

Function ImGui_TextWrappedV(fmt:String)
	_ImGui_TextWrappedV(fmt)
End Function

Rem
bbdoc:  display text+label aligned the same way as value+label widgets
End Rem
Function ImGui_LabelText(label:String, fmt:String)
	_ImGui_LabelText(label, fmt)
End Function

Function ImGui_LabelTextV(label:String, fmt:String)
	_ImGui_LabelTextV(label, fmt)
End Function

Rem
bbdoc:  shortcut for Bullet()+Text()
End Rem
Function ImGui_BulletText(fmt:String)
	_ImGui_BulletText(fmt)
End Function

Function ImGui_BulletTextV(fmt:String)
	_ImGui_BulletTextV(fmt)
End Function

Rem
bbdoc:  currently: formatted text with a horizontal line
End Rem
Function ImGui_SeparatorText(label:String)
	_ImGui_SeparatorText(label)
End Function

Rem
bbdoc:  Implied size = ImVec2(0, 0)
End Rem
Function ImGui_Button:Int(label:String)
	Return _ImGui_Button(label)
End Function

Rem
bbdoc:  button
End Rem
Function ImGui_ButtonEx:Int(label:String, size:SImVec2)
	Return _ImGui_ButtonEx(label, size)
End Function

Rem
bbdoc:  button with (FramePadding.y == 0) to easily embed within text
End Rem
Function ImGui_SmallButton:Int(label:String)
	Return _ImGui_SmallButton(label)
End Function

Rem
bbdoc:  flexible button behavior without the visuals, frequently useful to build custom behaviors using the public api (along with IsItemActive, IsItemHovered, etc.)
End Rem
Function ImGui_InvisibleButton:Int(str_id:String, size:SImVec2, flags:EImGuiButtonFlags)
	Return _ImGui_InvisibleButton(str_id, size, flags)
End Function

Rem
bbdoc:  square button with an arrow shape
End Rem
Function ImGui_ArrowButton:Int(str_id:String, dir:EImGuiDir)
	Return _ImGui_ArrowButton(str_id, dir)
End Function

Function ImGui_Checkbox:Int(label:String, v:Int Var)
	Return _ImGui_Checkbox(label, v)
End Function

Function ImGui_CheckboxFlagsIntPtr:Int(label:String, flags:Int Var, flags_value:Int)
	Return _ImGui_CheckboxFlagsIntPtr(label, flags, flags_value)
End Function

Function ImGui_CheckboxFlagsUintPtr:Int(label:String, flags:UInt Var, flags_value:UInt)
	Return _ImGui_CheckboxFlagsUintPtr(label, flags, flags_value)
End Function

Rem
bbdoc:  use with e.g. if (RadioButton("one", my_value==1)) { my_value = 1; }
End Rem
Function ImGui_RadioButton:Int(label:String, active:Int)
	Return _ImGui_RadioButton(label, active)
End Function

Rem
bbdoc:  shortcut to handle the above pattern when value is an integer
End Rem
Function ImGui_RadioButtonIntPtr:Int(label:String, v:Int Var, v_button:Int)
	Return _ImGui_RadioButtonIntPtr(label, v, v_button)
End Function

Function ImGui_ProgressBar(fraction:Float, size_arg:SImVec2, overlay:String)
	_ImGui_ProgressBar(fraction, size_arg, overlay)
End Function

Rem
bbdoc:  draw a small circle + keep the cursor on the same line. advance cursor x position by GetTreeNodeToLabelSpacing(), same distance that TreeNode() uses
End Rem
Function ImGui_Bullet()
	_ImGui_Bullet()
End Function

Rem
bbdoc:  hyperlink text button, return true when clicked
End Rem
Function ImGui_TextLink:Int(label:String)
	Return _ImGui_TextLink(label)
End Function

Rem
bbdoc:  Implied url = NULL
End Rem
Function ImGui_TextLinkOpenURL(label:String)
	_ImGui_TextLinkOpenURL(label)
End Function

Rem
bbdoc:  hyperlink text button, automatically open file/url when clicked
End Rem
Function ImGui_TextLinkOpenURLEx(label:String, url:String)
	_ImGui_TextLinkOpenURLEx(label, url)
End Function

Rem
bbdoc:  Implied uv0 = ImVec2(0, 0), uv1 = ImVec2(1, 1)
End Rem
Function ImGui_Image(user_texture_id:ULong, image_size:SImVec2)
	_ImGui_Image(user_texture_id, image_size)
End Function

Function ImGui_ImageEx(user_texture_id:ULong, image_size:SImVec2, uv0:SImVec2, uv1:SImVec2)
	_ImGui_ImageEx(user_texture_id, image_size, uv0, uv1)
End Function

Rem
bbdoc:  Implied uv0 = ImVec2(0, 0), uv1 = ImVec2(1, 1), bg_col = ImVec4(0, 0, 0, 0), tint_col = ImVec4(1, 1, 1, 1)
End Rem
Function ImGui_ImageWithBg(user_texture_id:ULong, image_size:SImVec2)
	_ImGui_ImageWithBg(user_texture_id, image_size)
End Function

Function ImGui_ImageWithBgEx(user_texture_id:ULong, image_size:SImVec2, uv0:SImVec2, uv1:SImVec2, bg_col:SImVec4, tint_col:SImVec4)
	_ImGui_ImageWithBgEx(user_texture_id, image_size, uv0, uv1, bg_col, tint_col)
End Function

Rem
bbdoc:  Implied uv0 = ImVec2(0, 0), uv1 = ImVec2(1, 1), bg_col = ImVec4(0, 0, 0, 0), tint_col = ImVec4(1, 1, 1, 1)
End Rem
Function ImGui_ImageButton:Int(str_id:String, user_texture_id:ULong, image_size:SImVec2)
	Return _ImGui_ImageButton(str_id, user_texture_id, image_size)
End Function

Function ImGui_ImageButtonEx:Int(str_id:String, user_texture_id:ULong, image_size:SImVec2, uv0:SImVec2, uv1:SImVec2, bg_col:SImVec4, tint_col:SImVec4)
	Return _ImGui_ImageButtonEx(str_id, user_texture_id, image_size, uv0, uv1, bg_col, tint_col)
End Function

Rem
bbdoc: 
End Rem
Function ImGui_BeginCombo:Int(label:String, preview_value:String, flags:EImGuiComboFlags)
	Return _ImGui_BeginCombo(label, preview_value, flags)
End Function

Rem
bbdoc:  only call EndCombo() if BeginCombo() returns true!
End Rem
Function ImGui_EndCombo()
	_ImGui_EndCombo()
End Function

Rem
bbdoc:  Implied popup_max_height_in_items = -1
End Rem
Function ImGui_ComboChar:Int(label:String, current_item:Int Var, items:String[], items_count:Int)
	Return _ImGui_ComboChar(label, current_item, items, items_count)
End Function

Function ImGui_ComboCharEx:Int(label:String, current_item:Int Var, items:String[], items_count:Int, popup_max_height_in_items:Int)
	Return _ImGui_ComboCharEx(label, current_item, items, items_count, popup_max_height_in_items)
End Function

Rem
bbdoc:  Implied popup_max_height_in_items = -1
End Rem
Function ImGui_Combo:Int(label:String, current_item:Int Var, items_separated_by_zeros:String)
	Return _ImGui_Combo(label, current_item, items_separated_by_zeros)
End Function

Rem
bbdoc:  Separate items with \0 within a string, end item-list with \0\0. e.g. "One\0Two\0Three\0"
End Rem
Function ImGui_ComboEx:Int(label:String, current_item:Int Var, items_separated_by_zeros:String, popup_max_height_in_items:Int)
	Return _ImGui_ComboEx(label, current_item, items_separated_by_zeros, popup_max_height_in_items)
End Function

Rem
bbdoc:  Implied popup_max_height_in_items = -1
End Rem
Function ImGui_ComboCallback:Int(label:String, current_item:Int Var, getter:Byte Ptr, user_data:Byte Ptr, items_count:Int)
	Return _ImGui_ComboCallback(label, current_item, getter, user_data, items_count)
End Function

Function ImGui_ComboCallbackEx:Int(label:String, current_item:Int Var, getter:Byte Ptr, user_data:Byte Ptr, items_count:Int, popup_max_height_in_items:Int)
	Return _ImGui_ComboCallbackEx(label, current_item, getter, user_data, items_count, popup_max_height_in_items)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, v_min = 0.0f, v_max = 0.0f, format = "%.3f", flags = 0
End Rem
Function ImGui_DragFloat:Int(label:String, v:Float Var)
	Return _ImGui_DragFloat(label, v)
End Function

Rem
bbdoc:  If v_min >= v_max we have no bound
End Rem
Function ImGui_DragFloatEx:Int(label:String, v:Float Var, v_speed:Float, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragFloatEx(label, v, v_speed, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, v_min = 0.0f, v_max = 0.0f, format = "%.3f", flags = 0
End Rem
Function ImGui_DragFloat2:Int(label:String, StaticArray v:float[2])
	Return _ImGui_DragFloat2(label, v)
End Function

Function ImGui_DragFloat2Ex:Int(label:String, StaticArray v:float[2], v_speed:Float, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragFloat2Ex(label, v, v_speed, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, v_min = 0.0f, v_max = 0.0f, format = "%.3f", flags = 0
End Rem
Function ImGui_DragFloat3:Int(label:String, StaticArray v:float[3])
	Return _ImGui_DragFloat3(label, v)
End Function

Function ImGui_DragFloat3Ex:Int(label:String, StaticArray v:float[3], v_speed:Float, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragFloat3Ex(label, v, v_speed, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, v_min = 0.0f, v_max = 0.0f, format = "%.3f", flags = 0
End Rem
Function ImGui_DragFloat4:Int(label:String, StaticArray v:float[4])
	Return _ImGui_DragFloat4(label, v)
End Function

Function ImGui_DragFloat4Ex:Int(label:String, StaticArray v:float[4], v_speed:Float, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragFloat4Ex(label, v, v_speed, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, v_min = 0.0f, v_max = 0.0f, format = "%.3f", format_max = NULL, flags = 0
End Rem
Function ImGui_DragFloatRange2:Int(label:String, v_current_min:Float Var, v_current_max:Float Var)
	Return _ImGui_DragFloatRange2(label, v_current_min, v_current_max)
End Function

Function ImGui_DragFloatRange2Ex:Int(label:String, v_current_min:Float Var, v_current_max:Float Var, v_speed:Float, v_min:Float, v_max:Float, format:String, format_max:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragFloatRange2Ex(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, v_min = 0, v_max = 0, format = "%d", flags = 0
End Rem
Function ImGui_DragInt:Int(label:String, v:Int Var)
	Return _ImGui_DragInt(label, v)
End Function

Rem
bbdoc:  If v_min >= v_max we have no bound
End Rem
Function ImGui_DragIntEx:Int(label:String, v:Int Var, v_speed:Float, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragIntEx(label, v, v_speed, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, v_min = 0, v_max = 0, format = "%d", flags = 0
End Rem
Function ImGui_DragInt2:Int(label:String, StaticArray v:int[2])
	Return _ImGui_DragInt2(label, v)
End Function

Function ImGui_DragInt2Ex:Int(label:String, StaticArray v:int[2], v_speed:Float, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragInt2Ex(label, v, v_speed, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, v_min = 0, v_max = 0, format = "%d", flags = 0
End Rem
Function ImGui_DragInt3:Int(label:String, StaticArray v:int[3])
	Return _ImGui_DragInt3(label, v)
End Function

Function ImGui_DragInt3Ex:Int(label:String, StaticArray v:int[3], v_speed:Float, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragInt3Ex(label, v, v_speed, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, v_min = 0, v_max = 0, format = "%d", flags = 0
End Rem
Function ImGui_DragInt4:Int(label:String, StaticArray v:int[4])
	Return _ImGui_DragInt4(label, v)
End Function

Function ImGui_DragInt4Ex:Int(label:String, StaticArray v:int[4], v_speed:Float, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragInt4Ex(label, v, v_speed, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, v_min = 0, v_max = 0, format = "%d", format_max = NULL, flags = 0
End Rem
Function ImGui_DragIntRange2:Int(label:String, v_current_min:Int Var, v_current_max:Int Var)
	Return _ImGui_DragIntRange2(label, v_current_min, v_current_max)
End Function

Function ImGui_DragIntRange2Ex:Int(label:String, v_current_min:Int Var, v_current_max:Int Var, v_speed:Float, v_min:Int, v_max:Int, format:String, format_max:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragIntRange2Ex(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, p_min = NULL, p_max = NULL, format = NULL, flags = 0
End Rem
Function ImGui_DragScalar:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr)
	Return _ImGui_DragScalar(label, data_type, p_data)
End Function

Function ImGui_DragScalarEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, v_speed:Float, p_min:Byte Ptr, p_max:Byte Ptr, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragScalarEx(label, data_type, p_data, v_speed, p_min, p_max, format, flags)
End Function

Rem
bbdoc:  Implied v_speed = 1.0f, p_min = NULL, p_max = NULL, format = NULL, flags = 0
End Rem
Function ImGui_DragScalarN:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int)
	Return _ImGui_DragScalarN(label, data_type, p_data, components)
End Function

Function ImGui_DragScalarNEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int, v_speed:Float, p_min:Byte Ptr, p_max:Byte Ptr, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_DragScalarNEx(label, data_type, p_data, components, v_speed, p_min, p_max, format, flags)
End Function

Rem
bbdoc:  Implied format = "%.3f", flags = 0
End Rem
Function ImGui_SliderFloat:Int(label:String, v:Float Var, v_min:Float, v_max:Float)
	Return _ImGui_SliderFloat(label, v, v_min, v_max)
End Function

Rem
bbdoc:  adjust format to decorate the value with a prefix or a suffix for in-slider labels or unit display.
End Rem
Function ImGui_SliderFloatEx:Int(label:String, v:Float Var, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderFloatEx(label, v, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied format = "%.3f", flags = 0
End Rem
Function ImGui_SliderFloat2:Int(label:String, StaticArray v:float[2], v_min:Float, v_max:Float)
	Return _ImGui_SliderFloat2(label, v, v_min, v_max)
End Function

Function ImGui_SliderFloat2Ex:Int(label:String, StaticArray v:float[2], v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderFloat2Ex(label, v, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied format = "%.3f", flags = 0
End Rem
Function ImGui_SliderFloat3:Int(label:String, StaticArray v:float[3], v_min:Float, v_max:Float)
	Return _ImGui_SliderFloat3(label, v, v_min, v_max)
End Function

Function ImGui_SliderFloat3Ex:Int(label:String, StaticArray v:float[3], v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderFloat3Ex(label, v, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied format = "%.3f", flags = 0
End Rem
Function ImGui_SliderFloat4:Int(label:String, StaticArray v:float[4], v_min:Float, v_max:Float)
	Return _ImGui_SliderFloat4(label, v, v_min, v_max)
End Function

Function ImGui_SliderFloat4Ex:Int(label:String, StaticArray v:float[4], v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderFloat4Ex(label, v, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied v_degrees_min = -360.0f, v_degrees_max = +360.0f, format = "%.0f deg", flags = 0
End Rem
Function ImGui_SliderAngle:Int(label:String, v_rad:Float Var)
	Return _ImGui_SliderAngle(label, v_rad)
End Function

Function ImGui_SliderAngleEx:Int(label:String, v_rad:Float Var, v_degrees_min:Float, v_degrees_max:Float, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderAngleEx(label, v_rad, v_degrees_min, v_degrees_max, format, flags)
End Function

Rem
bbdoc:  Implied format = "%d", flags = 0
End Rem
Function ImGui_SliderInt:Int(label:String, v:Int Var, v_min:Int, v_max:Int)
	Return _ImGui_SliderInt(label, v, v_min, v_max)
End Function

Function ImGui_SliderIntEx:Int(label:String, v:Int Var, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderIntEx(label, v, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied format = "%d", flags = 0
End Rem
Function ImGui_SliderInt2:Int(label:String, StaticArray v:int[2], v_min:Int, v_max:Int)
	Return _ImGui_SliderInt2(label, v, v_min, v_max)
End Function

Function ImGui_SliderInt2Ex:Int(label:String, StaticArray v:int[2], v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderInt2Ex(label, v, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied format = "%d", flags = 0
End Rem
Function ImGui_SliderInt3:Int(label:String, StaticArray v:int[3], v_min:Int, v_max:Int)
	Return _ImGui_SliderInt3(label, v, v_min, v_max)
End Function

Function ImGui_SliderInt3Ex:Int(label:String, StaticArray v:int[3], v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderInt3Ex(label, v, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied format = "%d", flags = 0
End Rem
Function ImGui_SliderInt4:Int(label:String, StaticArray v:int[4], v_min:Int, v_max:Int)
	Return _ImGui_SliderInt4(label, v, v_min, v_max)
End Function

Function ImGui_SliderInt4Ex:Int(label:String, StaticArray v:int[4], v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderInt4Ex(label, v, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied format = NULL, flags = 0
End Rem
Function ImGui_SliderScalar:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, p_min:Byte Ptr, p_max:Byte Ptr)
	Return _ImGui_SliderScalar(label, data_type, p_data, p_min, p_max)
End Function

Function ImGui_SliderScalarEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, p_min:Byte Ptr, p_max:Byte Ptr, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderScalarEx(label, data_type, p_data, p_min, p_max, format, flags)
End Function

Rem
bbdoc:  Implied format = NULL, flags = 0
End Rem
Function ImGui_SliderScalarN:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int, p_min:Byte Ptr, p_max:Byte Ptr)
	Return _ImGui_SliderScalarN(label, data_type, p_data, components, p_min, p_max)
End Function

Function ImGui_SliderScalarNEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int, p_min:Byte Ptr, p_max:Byte Ptr, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_SliderScalarNEx(label, data_type, p_data, components, p_min, p_max, format, flags)
End Function

Rem
bbdoc:  Implied format = "%.3f", flags = 0
End Rem
Function ImGui_VSliderFloat:Int(label:String, size:SImVec2, v:Float Var, v_min:Float, v_max:Float)
	Return _ImGui_VSliderFloat(label, size, v, v_min, v_max)
End Function

Function ImGui_VSliderFloatEx:Int(label:String, size:SImVec2, v:Float Var, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_VSliderFloatEx(label, size, v, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied format = "%d", flags = 0
End Rem
Function ImGui_VSliderInt:Int(label:String, size:SImVec2, v:Int Var, v_min:Int, v_max:Int)
	Return _ImGui_VSliderInt(label, size, v, v_min, v_max)
End Function

Function ImGui_VSliderIntEx:Int(label:String, size:SImVec2, v:Int Var, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_VSliderIntEx(label, size, v, v_min, v_max, format, flags)
End Function

Rem
bbdoc:  Implied format = NULL, flags = 0
End Rem
Function ImGui_VSliderScalar:Int(label:String, size:SImVec2, data_type:EImGuiDataType, p_data:Byte Ptr, p_min:Byte Ptr, p_max:Byte Ptr)
	Return _ImGui_VSliderScalar(label, size, data_type, p_data, p_min, p_max)
End Function

Function ImGui_VSliderScalarEx:Int(label:String, size:SImVec2, data_type:EImGuiDataType, p_data:Byte Ptr, p_min:Byte Ptr, p_max:Byte Ptr, format:String, flags:EImGuiSliderFlags)
	Return _ImGui_VSliderScalarEx(label, size, data_type, p_data, p_min, p_max, format, flags)
End Function

Function ImGui_InputTextEx:Int(label:String, buf:Byte Ptr, buf_size:size_t, flags:EImGuiInputTextFlags, callback:Byte Ptr, user_data:Byte Ptr)
	Return _ImGui_InputTextEx(label, buf, buf_size, flags, callback, user_data)
End Function

Rem
bbdoc:  Implied size = ImVec2(0, 0), flags = 0, callback = NULL, user_data = NULL
End Rem
Function ImGui_InputTextMultiline:Int(label:String, buf:Byte Ptr, buf_size:size_t)
	Return _ImGui_InputTextMultiline(label, buf, buf_size)
End Function

Function ImGui_InputTextMultilineEx:Int(label:String, buf:Byte Ptr, buf_size:size_t, size:SImVec2, flags:EImGuiInputTextFlags, callback:Byte Ptr, user_data:Byte Ptr)
	Return _ImGui_InputTextMultilineEx(label, buf, buf_size, size, flags, callback, user_data)
End Function

Rem
bbdoc:  Implied callback = NULL, user_data = NULL
End Rem
Function ImGui_InputTextWithHint:Int(label:String, hint:String, buf:Byte Ptr, buf_size:size_t, flags:EImGuiInputTextFlags)
	Return _ImGui_InputTextWithHint(label, hint, buf, buf_size, flags)
End Function

Function ImGui_InputTextWithHintEx:Int(label:String, hint:String, buf:Byte Ptr, buf_size:size_t, flags:EImGuiInputTextFlags, callback:Byte Ptr, user_data:Byte Ptr)
	Return _ImGui_InputTextWithHintEx(label, hint, buf, buf_size, flags, callback, user_data)
End Function

Rem
bbdoc:  Implied step = 0.0f, step_fast = 0.0f, format = "%.3f", flags = 0
End Rem
Function ImGui_InputFloat:Int(label:String, v:Float Var)
	Return _ImGui_InputFloat(label, v)
End Function

Function ImGui_InputFloatEx:Int(label:String, v:Float Var, stp:Float, step_fast:Float, format:String, flags:EImGuiInputTextFlags)
	Return _ImGui_InputFloatEx(label, v, stp, step_fast, format, flags)
End Function

Rem
bbdoc:  Implied format = "%.3f", flags = 0
End Rem
Function ImGui_InputFloat2:Int(label:String, StaticArray v:float[2])
	Return _ImGui_InputFloat2(label, v)
End Function

Function ImGui_InputFloat2Ex:Int(label:String, StaticArray v:float[2], format:String, flags:EImGuiInputTextFlags)
	Return _ImGui_InputFloat2Ex(label, v, format, flags)
End Function

Rem
bbdoc:  Implied format = "%.3f", flags = 0
End Rem
Function ImGui_InputFloat3:Int(label:String, StaticArray v:float[3])
	Return _ImGui_InputFloat3(label, v)
End Function

Function ImGui_InputFloat3Ex:Int(label:String, StaticArray v:float[3], format:String, flags:EImGuiInputTextFlags)
	Return _ImGui_InputFloat3Ex(label, v, format, flags)
End Function

Rem
bbdoc:  Implied format = "%.3f", flags = 0
End Rem
Function ImGui_InputFloat4:Int(label:String, StaticArray v:float[4])
	Return _ImGui_InputFloat4(label, v)
End Function

Function ImGui_InputFloat4Ex:Int(label:String, StaticArray v:float[4], format:String, flags:EImGuiInputTextFlags)
	Return _ImGui_InputFloat4Ex(label, v, format, flags)
End Function

Rem
bbdoc:  Implied step = 1, step_fast = 100, flags = 0
End Rem
Function ImGui_InputInt:Int(label:String, v:Int Var)
	Return _ImGui_InputInt(label, v)
End Function

Function ImGui_InputIntEx:Int(label:String, v:Int Var, stp:Int, step_fast:Int, flags:EImGuiInputTextFlags)
	Return _ImGui_InputIntEx(label, v, stp, step_fast, flags)
End Function

Function ImGui_InputInt2:Int(label:String, StaticArray v:int[2], flags:EImGuiInputTextFlags)
	Return _ImGui_InputInt2(label, v, flags)
End Function

Function ImGui_InputInt3:Int(label:String, StaticArray v:int[3], flags:EImGuiInputTextFlags)
	Return _ImGui_InputInt3(label, v, flags)
End Function

Function ImGui_InputInt4:Int(label:String, StaticArray v:int[4], flags:EImGuiInputTextFlags)
	Return _ImGui_InputInt4(label, v, flags)
End Function

Rem
bbdoc:  Implied step = 0.0, step_fast = 0.0, format = "%.6f", flags = 0
End Rem
Function ImGui_InputDouble:Int(label:String, v:Byte Ptr)
	Return _ImGui_InputDouble(label, v)
End Function

Function ImGui_InputDoubleEx:Int(label:String, v:Byte Ptr, stp:Double, step_fast:Double, format:String, flags:EImGuiInputTextFlags)
	Return _ImGui_InputDoubleEx(label, v, stp, step_fast, format, flags)
End Function

Rem
bbdoc:  Implied p_step = NULL, p_step_fast = NULL, format = NULL, flags = 0
End Rem
Function ImGui_InputScalar:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr)
	Return _ImGui_InputScalar(label, data_type, p_data)
End Function

Function ImGui_InputScalarEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, p_step:Byte Ptr, p_step_fast:Byte Ptr, format:String, flags:EImGuiInputTextFlags)
	Return _ImGui_InputScalarEx(label, data_type, p_data, p_step, p_step_fast, format, flags)
End Function

Rem
bbdoc:  Implied p_step = NULL, p_step_fast = NULL, format = NULL, flags = 0
End Rem
Function ImGui_InputScalarN:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int)
	Return _ImGui_InputScalarN(label, data_type, p_data, components)
End Function

Function ImGui_InputScalarNEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int, p_step:Byte Ptr, p_step_fast:Byte Ptr, format:String, flags:EImGuiInputTextFlags)
	Return _ImGui_InputScalarNEx(label, data_type, p_data, components, p_step, p_step_fast, format, flags)
End Function

Rem
bbdoc: 
End Rem
Function ImGui_ColorEdit3:Int(label:String, StaticArray col:float[3], flags:EImGuiColorEditFlags)
	Return _ImGui_ColorEdit3(label, col, flags)
End Function

Function ImGui_ColorEdit4:Int(label:String, StaticArray col:float[4], flags:EImGuiColorEditFlags)
	Return _ImGui_ColorEdit4(label, col, flags)
End Function

Function ImGui_ColorPicker3:Int(label:String, StaticArray col:float[3], flags:EImGuiColorEditFlags)
	Return _ImGui_ColorPicker3(label, col, flags)
End Function

Function ImGui_ColorPicker4:Int(label:String, StaticArray col:float[4], flags:EImGuiColorEditFlags, ref_col:Byte Ptr)
	Return _ImGui_ColorPicker4(label, col, flags, ref_col)
End Function

Rem
bbdoc:  Implied size = ImVec2(0, 0)
End Rem
Function ImGui_ColorButton:Int(desc_id:String, col:SImVec4, flags:EImGuiColorEditFlags)
	Return _ImGui_ColorButton(desc_id, col, flags)
End Function

Rem
bbdoc:  display a color square/button, hover for details, return true when pressed.
End Rem
Function ImGui_ColorButtonEx:Int(desc_id:String, col:SImVec4, flags:EImGuiColorEditFlags, size:SImVec2)
	Return _ImGui_ColorButtonEx(desc_id, col, flags, size)
End Function

Rem
bbdoc:  initialize current options (generally on application startup) if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls.
End Rem
Function ImGui_SetColorEditOptions(flags:EImGuiColorEditFlags)
	_ImGui_SetColorEditOptions(flags)
End Function

Rem
bbdoc: 
End Rem
Function ImGui_TreeNode:Int(label:String)
	Return _ImGui_TreeNode(label)
End Function

Rem
bbdoc:  helper variation to easily decorelate the id from the displayed string. Read the FAQ about why and how to use ID. to align arbitrary text at the same level as a TreeNode() you can use Bullet().
End Rem
Function ImGui_TreeNodeStr:Int(str_id:String, fmt:String)
	Return _ImGui_TreeNodeStr(str_id, fmt)
End Function

Rem
bbdoc:  "
End Rem
Function ImGui_TreeNodePtr:Int(ptr_id:Byte Ptr, fmt:String)
	Return _ImGui_TreeNodePtr(ptr_id, fmt)
End Function

Function ImGui_TreeNodeV:Int(str_id:String, fmt:String)
	Return _ImGui_TreeNodeV(str_id, fmt)
End Function

Function ImGui_TreeNodeVPtr:Int(ptr_id:Byte Ptr, fmt:String)
	Return _ImGui_TreeNodeVPtr(ptr_id, fmt)
End Function

Function ImGui_TreeNodeEx:Int(label:String, flags:EImGuiTreeNodeFlags)
	Return _ImGui_TreeNodeEx(label, flags)
End Function

Function ImGui_TreeNodeExStr:Int(str_id:String, flags:EImGuiTreeNodeFlags, fmt:String)
	Return _ImGui_TreeNodeExStr(str_id, flags, fmt)
End Function

Function ImGui_TreeNodeExPtr:Int(ptr_id:Byte Ptr, flags:EImGuiTreeNodeFlags, fmt:String)
	Return _ImGui_TreeNodeExPtr(ptr_id, flags, fmt)
End Function

Function ImGui_TreeNodeExV:Int(str_id:String, flags:EImGuiTreeNodeFlags, fmt:String)
	Return _ImGui_TreeNodeExV(str_id, flags, fmt)
End Function

Function ImGui_TreeNodeExVPtr:Int(ptr_id:Byte Ptr, flags:EImGuiTreeNodeFlags, fmt:String)
	Return _ImGui_TreeNodeExVPtr(ptr_id, flags, fmt)
End Function

Rem
bbdoc:  ~ Indent()+PushID(). Already called by TreeNode() when returning true, but you can call TreePush/TreePop yourself if desired.
End Rem
Function ImGui_TreePush(str_id:String)
	_ImGui_TreePush(str_id)
End Function

Rem
bbdoc:  "
End Rem
Function ImGui_TreePushPtr(ptr_id:Byte Ptr)
	_ImGui_TreePushPtr(ptr_id)
End Function

Rem
bbdoc:  ~ Unindent()+PopID()
End Rem
Function ImGui_TreePop()
	_ImGui_TreePop()
End Function

Rem
bbdoc:  horizontal distance preceding label when using TreeNode*() or Bullet() == (g.FontSize + style.FramePadding.x*2) for a regular unframed TreeNode
End Rem
Function ImGui_GetTreeNodeToLabelSpacing:Float()
	Return _ImGui_GetTreeNodeToLabelSpacing()
End Function

Rem
bbdoc:  if returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call TreePop().
End Rem
Function ImGui_CollapsingHeader:Int(label:String, flags:EImGuiTreeNodeFlags)
	Return _ImGui_CollapsingHeader(label, flags)
End Function

Rem
bbdoc:  when 'p_visible != NULL': if '*p_visible==true' display an additional small close button on upper right of the header which will set the bool to false when clicked, if '*p_visible==false' don't display the header.
End Rem
Function ImGui_CollapsingHeaderBoolPtr:Int(label:String, p_visible:Int Var, flags:EImGuiTreeNodeFlags)
	Return _ImGui_CollapsingHeaderBoolPtr(label, p_visible, flags)
End Function

Rem
bbdoc:  set next TreeNode/CollapsingHeader open state.
End Rem
Function ImGui_SetNextItemOpen(is_open:Int, cond:EImGuiCond)
	_ImGui_SetNextItemOpen(is_open, cond)
End Function

Rem
bbdoc:  set id to use for open/close storage (default to same as item id).
End Rem
Function ImGui_SetNextItemStorageID(storage_id:UInt)
	_ImGui_SetNextItemStorageID(storage_id)
End Function

Rem
bbdoc:  Implied selected = false, flags = 0, size = ImVec2(0, 0)
End Rem
Function ImGui_Selectable:Int(label:String)
	Return _ImGui_Selectable(label)
End Function

Rem
bbdoc:  "bool selected" carry the selection state (read-only). Selectable() is clicked is returns true so you can modify your selection state. size.x==0.0: use remaining width, size.x>0.0: specify width. size.y==0.0: use label height, size.y>0.0: specify height
End Rem
Function ImGui_SelectableEx:Int(label:String, selected:Int, flags:EImGuiSelectableFlags, size:SImVec2)
	Return _ImGui_SelectableEx(label, selected, flags, size)
End Function

Rem
bbdoc:  Implied size = ImVec2(0, 0)
End Rem
Function ImGui_SelectableBoolPtr:Int(label:String, p_selected:Int Var, flags:EImGuiSelectableFlags)
	Return _ImGui_SelectableBoolPtr(label, p_selected, flags)
End Function

Rem
bbdoc:  "bool* p_selected" point to the selection state (read-write), as a convenient helper.
End Rem
Function ImGui_SelectableBoolPtrEx:Int(label:String, p_selected:Int Var, flags:EImGuiSelectableFlags, size:SImVec2)
	Return _ImGui_SelectableBoolPtrEx(label, p_selected, flags, size)
End Function

Rem
bbdoc:  Implied selection_size = -1, items_count = -1
End Rem
Function ImGui_BeginMultiSelect:Byte Ptr(flags:EImGuiMultiSelectFlags)
	Return _ImGui_BeginMultiSelect(flags)
End Function

Function ImGui_BeginMultiSelectEx:Byte Ptr(flags:EImGuiMultiSelectFlags, selection_size:Int, items_count:Int)
	Return _ImGui_BeginMultiSelectEx(flags, selection_size, items_count)
End Function

Function ImGui_EndMultiSelect:Byte Ptr()
	Return _ImGui_EndMultiSelect()
End Function

Function ImGui_SetNextItemSelectionUserData(selection_user_data:Long)
	_ImGui_SetNextItemSelectionUserData(selection_user_data)
End Function

Rem
bbdoc:  Was the last item selection state toggled? Useful if you need the per-item information _before_ reaching EndMultiSelect(). We only returns toggle _event_ in order to handle clipping correctly.
End Rem
Function ImGui_IsItemToggledSelection:Int()
	Return _ImGui_IsItemToggledSelection()
End Function

Rem
bbdoc:  open a framed scrolling region
End Rem
Function ImGui_BeginListBox:Int(label:String, size:SImVec2)
	Return _ImGui_BeginListBox(label, size)
End Function

Rem
bbdoc:  only call EndListBox() if BeginListBox() returned true!
End Rem
Function ImGui_EndListBox()
	_ImGui_EndListBox()
End Function

Function ImGui_ListBox:Int(label:String, current_item:Int Var, items:String[], items_count:Int, height_in_items:Int)
	Return _ImGui_ListBox(label, current_item, items, items_count, height_in_items)
End Function

Rem
bbdoc:  Implied height_in_items = -1
End Rem
Function ImGui_ListBoxCallback:Int(label:String, current_item:Int Var, getter:Byte Ptr, user_data:Byte Ptr, items_count:Int)
	Return _ImGui_ListBoxCallback(label, current_item, getter, user_data, items_count)
End Function

Function ImGui_ListBoxCallbackEx:Int(label:String, current_item:Int Var, getter:Byte Ptr, user_data:Byte Ptr, items_count:Int, height_in_items:Int)
	Return _ImGui_ListBoxCallbackEx(label, current_item, getter, user_data, items_count, height_in_items)
End Function

Rem
bbdoc:  Implied values_offset = 0, overlay_text = NULL, scale_min = FLT_MAX, scale_max = FLT_MAX, graph_size = ImVec2(0, 0), stride = sizeof(float)
End Rem
Function ImGui_PlotLines(label:String, values:Byte Ptr, values_count:Int)
	_ImGui_PlotLines(label, values, values_count)
End Function

Function ImGui_PlotLinesEx(label:String, values:Byte Ptr, values_count:Int, values_offset:Int, overlay_text:String, scale_min:Float, scale_max:Float, graph_size:SImVec2, stride:Int)
	_ImGui_PlotLinesEx(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
End Function

Rem
bbdoc:  Implied values_offset = 0, overlay_text = NULL, scale_min = FLT_MAX, scale_max = FLT_MAX, graph_size = ImVec2(0, 0)
End Rem
Function ImGui_PlotLinesCallback(label:String, values_getter:Byte Ptr, data:Byte Ptr, values_count:Int)
	_ImGui_PlotLinesCallback(label, values_getter, data, values_count)
End Function

Function ImGui_PlotLinesCallbackEx(label:String, values_getter:Byte Ptr, data:Byte Ptr, values_count:Int, values_offset:Int, overlay_text:String, scale_min:Float, scale_max:Float, graph_size:SImVec2)
	_ImGui_PlotLinesCallbackEx(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
End Function

Rem
bbdoc:  Implied values_offset = 0, overlay_text = NULL, scale_min = FLT_MAX, scale_max = FLT_MAX, graph_size = ImVec2(0, 0), stride = sizeof(float)
End Rem
Function ImGui_PlotHistogram(label:String, values:Byte Ptr, values_count:Int)
	_ImGui_PlotHistogram(label, values, values_count)
End Function

Function ImGui_PlotHistogramEx(label:String, values:Byte Ptr, values_count:Int, values_offset:Int, overlay_text:String, scale_min:Float, scale_max:Float, graph_size:SImVec2, stride:Int)
	_ImGui_PlotHistogramEx(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
End Function

Rem
bbdoc:  Implied values_offset = 0, overlay_text = NULL, scale_min = FLT_MAX, scale_max = FLT_MAX, graph_size = ImVec2(0, 0)
End Rem
Function ImGui_PlotHistogramCallback(label:String, values_getter:Byte Ptr, data:Byte Ptr, values_count:Int)
	_ImGui_PlotHistogramCallback(label, values_getter, data, values_count)
End Function

Function ImGui_PlotHistogramCallbackEx(label:String, values_getter:Byte Ptr, data:Byte Ptr, values_count:Int, values_offset:Int, overlay_text:String, scale_min:Float, scale_max:Float, graph_size:SImVec2)
	_ImGui_PlotHistogramCallbackEx(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
End Function

Rem
bbdoc:  append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set on parent window).
End Rem
Function ImGui_BeginMenuBar:Int()
	Return _ImGui_BeginMenuBar()
End Function

Rem
bbdoc:  only call EndMenuBar() if BeginMenuBar() returns true!
End Rem
Function ImGui_EndMenuBar()
	_ImGui_EndMenuBar()
End Function

Rem
bbdoc:  create and append to a full screen menu-bar.
End Rem
Function ImGui_BeginMainMenuBar:Int()
	Return _ImGui_BeginMainMenuBar()
End Function

Rem
bbdoc:  only call EndMainMenuBar() if BeginMainMenuBar() returns true!
End Rem
Function ImGui_EndMainMenuBar()
	_ImGui_EndMainMenuBar()
End Function

Rem
bbdoc:  Implied enabled = true
End Rem
Function ImGui_BeginMenu:Int(label:String)
	Return _ImGui_BeginMenu(label)
End Function

Rem
bbdoc:  create a sub-menu entry. only call EndMenu() if this returns true!
End Rem
Function ImGui_BeginMenuEx:Int(label:String, enabled:Int)
	Return _ImGui_BeginMenuEx(label, enabled)
End Function

Rem
bbdoc:  only call EndMenu() if BeginMenu() returns true!
End Rem
Function ImGui_EndMenu()
	_ImGui_EndMenu()
End Function

Rem
bbdoc:  Implied shortcut = NULL, selected = false, enabled = true
End Rem
Function ImGui_MenuItem:Int(label:String)
	Return _ImGui_MenuItem(label)
End Function

Rem
bbdoc:  return true when activated.
End Rem
Function ImGui_MenuItemEx:Int(label:String, shortcut:String, selected:Int, enabled:Int)
	Return _ImGui_MenuItemEx(label, shortcut, selected, enabled)
End Function

Rem
bbdoc:  return true when activated + toggle (*p_selected) if p_selected != NULL
End Rem
Function ImGui_MenuItemBoolPtr:Int(label:String, shortcut:String, p_selected:Int Var, enabled:Int)
	Return _ImGui_MenuItemBoolPtr(label, shortcut, p_selected, enabled)
End Function

Rem
bbdoc:  begin/append a tooltip window.
End Rem
Function ImGui_BeginTooltip:Int()
	Return _ImGui_BeginTooltip()
End Function

Rem
bbdoc:  only call EndTooltip() if BeginTooltip()/BeginItemTooltip() returns true!
End Rem
Function ImGui_EndTooltip()
	_ImGui_EndTooltip()
End Function

Rem
bbdoc:  set a text-only tooltip. Often used after a ImGui::IsItemHovered() check. Override any previous call to SetTooltip().
End Rem
Function ImGui_SetTooltip(fmt:String)
	_ImGui_SetTooltip(fmt)
End Function

Function ImGui_SetTooltipV(fmt:String)
	_ImGui_SetTooltipV(fmt)
End Function

Rem
bbdoc:  begin/append a tooltip window if preceding item was hovered.
End Rem
Function ImGui_BeginItemTooltip:Int()
	Return _ImGui_BeginItemTooltip()
End Function

Rem
bbdoc:  set a text-only tooltip if preceding item was hovered. override any previous call to SetTooltip().
End Rem
Function ImGui_SetItemTooltip(fmt:String)
	_ImGui_SetItemTooltip(fmt)
End Function

Function ImGui_SetItemTooltipV(fmt:String)
	_ImGui_SetItemTooltipV(fmt)
End Function

Rem
bbdoc:  return true if the popup is open, and you can start outputting to it.
End Rem
Function ImGui_BeginPopup:Int(str_id:String, flags:EImGuiWindowFlags)
	Return _ImGui_BeginPopup(str_id, flags)
End Function

Rem
bbdoc:  return true if the modal is open, and you can start outputting to it.
End Rem
Function ImGui_BeginPopupModal:Int(name:String, p_open:Int Var, flags:EImGuiWindowFlags)
	Return _ImGui_BeginPopupModal(name, p_open, flags)
End Function

Rem
bbdoc:  only call EndPopup() if BeginPopupXXX() returns true!
End Rem
Function ImGui_EndPopup()
	_ImGui_EndPopup()
End Function

Rem
bbdoc:  call to mark popup as open (don't call every frame!).
End Rem
Function ImGui_OpenPopup(str_id:String, popup_flags:EImGuiPopupFlags)
	_ImGui_OpenPopup(str_id, popup_flags)
End Function

Rem
bbdoc:  id overload to facilitate calling from nested stacks
End Rem
Function ImGui_OpenPopupID(id:UInt, popup_flags:EImGuiPopupFlags)
	_ImGui_OpenPopupID(id, popup_flags)
End Function

Rem
bbdoc:  helper to open popup when clicked on last item. Default to ImGuiPopupFlags_MouseButtonRight == 1. (note: actually triggers on the mouse _released_ event to be consistent with popup behaviors)
End Rem
Function ImGui_OpenPopupOnItemClick(str_id:String, popup_flags:EImGuiPopupFlags)
	_ImGui_OpenPopupOnItemClick(str_id, popup_flags)
End Function

Rem
bbdoc:  manually close the popup we have begin-ed into.
End Rem
Function ImGui_CloseCurrentPopup()
	_ImGui_CloseCurrentPopup()
End Function

Rem
bbdoc:  Implied str_id = NULL, popup_flags = 1
End Rem
Function ImGui_BeginPopupContextItem:Int()
	Return _ImGui_BeginPopupContextItem()
End Function

Rem
bbdoc:  open+begin popup when clicked on last item. Use str_id==NULL to associate the popup to previous item. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here. read comments in .cpp!
End Rem
Function ImGui_BeginPopupContextItemEx:Int(str_id:String, popup_flags:EImGuiPopupFlags)
	Return _ImGui_BeginPopupContextItemEx(str_id, popup_flags)
End Function

Rem
bbdoc:  Implied str_id = NULL, popup_flags = 1
End Rem
Function ImGui_BeginPopupContextWindow:Int()
	Return _ImGui_BeginPopupContextWindow()
End Function

Rem
bbdoc:  open+begin popup when clicked on current window.
End Rem
Function ImGui_BeginPopupContextWindowEx:Int(str_id:String, popup_flags:EImGuiPopupFlags)
	Return _ImGui_BeginPopupContextWindowEx(str_id, popup_flags)
End Function

Rem
bbdoc:  Implied str_id = NULL, popup_flags = 1
End Rem
Function ImGui_BeginPopupContextVoid:Int()
	Return _ImGui_BeginPopupContextVoid()
End Function

Rem
bbdoc:  open+begin popup when clicked in void (where there are no windows).
End Rem
Function ImGui_BeginPopupContextVoidEx:Int(str_id:String, popup_flags:EImGuiPopupFlags)
	Return _ImGui_BeginPopupContextVoidEx(str_id, popup_flags)
End Function

Rem
bbdoc:  return true if the popup is open.
End Rem
Function ImGui_IsPopupOpen:Int(str_id:String, flags:EImGuiPopupFlags)
	Return _ImGui_IsPopupOpen(str_id, flags)
End Function

Rem
bbdoc:  Implied outer_size = ImVec2(0.0f, 0.0f), inner_width = 0.0f
End Rem
Function ImGui_BeginTable:Int(str_id:String, columns:Int, flags:EImGuiTableFlags)
	Return _ImGui_BeginTable(str_id, columns, flags)
End Function

Function ImGui_BeginTableEx:Int(str_id:String, columns:Int, flags:EImGuiTableFlags, outer_size:SImVec2, inner_width:Float)
	Return _ImGui_BeginTableEx(str_id, columns, flags, outer_size, inner_width)
End Function

Rem
bbdoc:  only call EndTable() if BeginTable() returns true!
End Rem
Function ImGui_EndTable()
	_ImGui_EndTable()
End Function

Rem
bbdoc:  Implied row_flags = 0, min_row_height = 0.0f
End Rem
Function ImGui_TableNextRow()
	_ImGui_TableNextRow()
End Function

Rem
bbdoc:  append into the first cell of a new row.
End Rem
Function ImGui_TableNextRowEx(row_flags:EImGuiTableRowFlags, min_row_height:Float)
	_ImGui_TableNextRowEx(row_flags, min_row_height)
End Function

Rem
bbdoc:  append into the next column (or first column of next row if currently in last column). Return true when column is visible.
End Rem
Function ImGui_TableNextColumn:Int()
	Return _ImGui_TableNextColumn()
End Function

Rem
bbdoc:  append into the specified column. Return true when column is visible.
End Rem
Function ImGui_TableSetColumnIndex:Int(column_n:Int)
	Return _ImGui_TableSetColumnIndex(column_n)
End Function

Rem
bbdoc:  Implied init_width_or_weight = 0.0f, user_id = 0
End Rem
Function ImGui_TableSetupColumn(label:String, flags:EImGuiTableColumnFlags)
	_ImGui_TableSetupColumn(label, flags)
End Function

Function ImGui_TableSetupColumnEx(label:String, flags:EImGuiTableColumnFlags, init_width_or_weight:Float, user_id:UInt)
	_ImGui_TableSetupColumnEx(label, flags, init_width_or_weight, user_id)
End Function

Rem
bbdoc:  lock columns/rows so they stay visible when scrolled.
End Rem
Function ImGui_TableSetupScrollFreeze(cols:Int, rows:Int)
	_ImGui_TableSetupScrollFreeze(cols, rows)
End Function

Rem
bbdoc:  submit one header cell manually (rarely used)
End Rem
Function ImGui_TableHeader(label:String)
	_ImGui_TableHeader(label)
End Function

Rem
bbdoc:  submit a row with headers cells based on data provided to TableSetupColumn() + submit context menu
End Rem
Function ImGui_TableHeadersRow()
	_ImGui_TableHeadersRow()
End Function

Rem
bbdoc:  submit a row with angled headers for every column with the ImGuiTableColumnFlags_AngledHeader flag. MUST BE FIRST ROW.
End Rem
Function ImGui_TableAngledHeadersRow()
	_ImGui_TableAngledHeadersRow()
End Function

Rem
bbdoc:  get latest sort specs for the table (NULL if not sorting).  Lifetime: don't hold on this pointer over multiple frames or past any subsequent call to BeginTable().
End Rem
Function ImGui_TableGetSortSpecs:Byte Ptr()
	Return _ImGui_TableGetSortSpecs()
End Function

Rem
bbdoc:  return number of columns (value passed to BeginTable)
End Rem
Function ImGui_TableGetColumnCount:Int()
	Return _ImGui_TableGetColumnCount()
End Function

Rem
bbdoc:  return current column index.
End Rem
Function ImGui_TableGetColumnIndex:Int()
	Return _ImGui_TableGetColumnIndex()
End Function

Rem
bbdoc:  return current row index.
End Rem
Function ImGui_TableGetRowIndex:Int()
	Return _ImGui_TableGetRowIndex()
End Function

Rem
bbdoc:  return "" if column didn't have a name declared by TableSetupColumn(). Pass -1 to use current column.
End Rem
Function ImGui_TableGetColumnName:String(column_n:Int)
	Return _ImGui_TableGetColumnName(column_n)
End Function

Rem
bbdoc:  return column flags so you can query their Enabled/Visible/Sorted/Hovered status flags. Pass -1 to use current column.
End Rem
Function ImGui_TableGetColumnFlags:EImGuiTableColumnFlags(column_n:Int)
	Return _ImGui_TableGetColumnFlags(column_n)
End Function

Rem
bbdoc:  change user accessible enabled/disabled state of a column. Set to false to hide the column. User can use the context menu to change this themselves (right-click in headers, or right-click in columns body with ImGuiTableFlags_ContextMenuInBody)
End Rem
Function ImGui_TableSetColumnEnabled(column_n:Int, v:Int)
	_ImGui_TableSetColumnEnabled(column_n, v)
End Function

Rem
bbdoc:  return hovered column. return -1 when table is not hovered. return columns_count if the unused space at the right of visible columns is hovered. Can also use (TableGetColumnFlags() & ImGuiTableColumnFlags_IsHovered) instead.
End Rem
Function ImGui_TableGetHoveredColumn:Int()
	Return _ImGui_TableGetHoveredColumn()
End Function

Rem
bbdoc:  change the color of a cell, row, or column. See ImGuiTableBgTarget_ flags for details.
End Rem
Function ImGui_TableSetBgColor(target:EImGuiTableBgTarget, color:UInt, column_n:Int)
	_ImGui_TableSetBgColor(target, color, column_n)
End Function

Rem
bbdoc:  Implied count = 1, id = NULL, borders = true
End Rem
Function ImGui_Columns()
	_ImGui_Columns()
End Function

Function ImGui_ColumnsEx(count:Int, id:String, borders:Int)
	_ImGui_ColumnsEx(count, id, borders)
End Function

Rem
bbdoc:  next column, defaults to current row or next row if the current row is finished
End Rem
Function ImGui_NextColumn()
	_ImGui_NextColumn()
End Function

Rem
bbdoc:  get current column index
End Rem
Function ImGui_GetColumnIndex:Int()
	Return _ImGui_GetColumnIndex()
End Function

Rem
bbdoc:  get column width (in pixels). pass -1 to use current column
End Rem
Function ImGui_GetColumnWidth:Float(column_index:Int)
	Return _ImGui_GetColumnWidth(column_index)
End Function

Rem
bbdoc:  set column width (in pixels). pass -1 to use current column
End Rem
Function ImGui_SetColumnWidth(column_index:Int, width:Float)
	_ImGui_SetColumnWidth(column_index, width)
End Function

Rem
bbdoc:  get position of column line (in pixels, from the left side of the contents region). pass -1 to use current column, otherwise 0..GetColumnsCount() inclusive. column 0 is typically 0.0f
End Rem
Function ImGui_GetColumnOffset:Float(column_index:Int)
	Return _ImGui_GetColumnOffset(column_index)
End Function

Rem
bbdoc:  set position of column line (in pixels, from the left side of the contents region). pass -1 to use current column
End Rem
Function ImGui_SetColumnOffset(column_index:Int, offset_x:Float)
	_ImGui_SetColumnOffset(column_index, offset_x)
End Function

Function ImGui_GetColumnsCount:Int()
	Return _ImGui_GetColumnsCount()
End Function

Rem
bbdoc:  create and append into a TabBar
End Rem
Function ImGui_BeginTabBar:Int(str_id:String, flags:EImGuiTabBarFlags)
	Return _ImGui_BeginTabBar(str_id, flags)
End Function

Rem
bbdoc:  only call EndTabBar() if BeginTabBar() returns true!
End Rem
Function ImGui_EndTabBar()
	_ImGui_EndTabBar()
End Function

Rem
bbdoc:  create a Tab. Returns true if the Tab is selected.
End Rem
Function ImGui_BeginTabItem:Int(label:String, p_open:Int Var, flags:EImGuiTabItemFlags)
	Return _ImGui_BeginTabItem(label, p_open, flags)
End Function

Rem
bbdoc:  only call EndTabItem() if BeginTabItem() returns true!
End Rem
Function ImGui_EndTabItem()
	_ImGui_EndTabItem()
End Function

Rem
bbdoc:  create a Tab behaving like a button. return true when clicked. cannot be selected in the tab bar.
End Rem
Function ImGui_TabItemButton:Int(label:String, flags:EImGuiTabItemFlags)
	Return _ImGui_TabItemButton(label, flags)
End Function

Rem
bbdoc:  notify TabBar or Docking system of a closed tab/window ahead (useful to reduce visual flicker on reorderable tab bars). For tab-bar: call after BeginTabBar() and before Tab submissions. Otherwise call with a window name.
End Rem
Function ImGui_SetTabItemClosed(tab_or_docked_window_label:String)
	_ImGui_SetTabItemClosed(tab_or_docked_window_label)
End Function

Rem
bbdoc:  start logging to tty (stdout)
End Rem
Function ImGui_LogToTTY(auto_open_depth:Int)
	_ImGui_LogToTTY(auto_open_depth)
End Function

Rem
bbdoc:  start logging to file
End Rem
Function ImGui_LogToFile(auto_open_depth:Int, filename:String)
	_ImGui_LogToFile(auto_open_depth, filename)
End Function

Rem
bbdoc:  start logging to OS clipboard
End Rem
Function ImGui_LogToClipboard(auto_open_depth:Int)
	_ImGui_LogToClipboard(auto_open_depth)
End Function

Rem
bbdoc:  stop logging (close file, etc.)
End Rem
Function ImGui_LogFinish()
	_ImGui_LogFinish()
End Function

Rem
bbdoc:  helper to display buttons for logging to tty/file/clipboard
End Rem
Function ImGui_LogButtons()
	_ImGui_LogButtons()
End Function

Rem
bbdoc:  pass text data straight to log (without being displayed)
End Rem
Function ImGui_LogText(fmt:String)
	_ImGui_LogText(fmt)
End Function

Function ImGui_LogTextV(fmt:String)
	_ImGui_LogTextV(fmt)
End Function

Rem
bbdoc:  call after submitting an item which may be dragged. when this return true, you can call SetDragDropPayload() + EndDragDropSource()
End Rem
Function ImGui_BeginDragDropSource:Int(flags:EImGuiDragDropFlags)
	Return _ImGui_BeginDragDropSource(flags)
End Function

Rem
bbdoc:  type is a user defined string of maximum 32 characters. Strings starting with '_' are reserved for dear imgui internal types. Data is copied and held by imgui. Return true when payload has been accepted.
End Rem
Function ImGui_SetDragDropPayload:Int(kind:String, data:Byte Ptr, sz:size_t, cond:EImGuiCond)
	Return _ImGui_SetDragDropPayload(kind, data, sz, cond)
End Function

Rem
bbdoc:  only call EndDragDropSource() if BeginDragDropSource() returns true!
End Rem
Function ImGui_EndDragDropSource()
	_ImGui_EndDragDropSource()
End Function

Rem
bbdoc:  call after submitting an item that may receive a payload. If this returns true, you can call AcceptDragDropPayload() + EndDragDropTarget()
End Rem
Function ImGui_BeginDragDropTarget:Int()
	Return _ImGui_BeginDragDropTarget()
End Function

Rem
bbdoc:  accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released.
End Rem
Function ImGui_AcceptDragDropPayload:Byte Ptr(kind:String, flags:EImGuiDragDropFlags)
	Return _ImGui_AcceptDragDropPayload(kind, flags)
End Function

Rem
bbdoc:  only call EndDragDropTarget() if BeginDragDropTarget() returns true!
End Rem
Function ImGui_EndDragDropTarget()
	_ImGui_EndDragDropTarget()
End Function

Rem
bbdoc:  peek directly into the current payload from anywhere. returns NULL when drag and drop is finished or inactive. use ImGuiPayload::IsDataType() to test for the payload type.
End Rem
Function ImGui_GetDragDropPayload:Byte Ptr()
	Return _ImGui_GetDragDropPayload()
End Function

Rem
bbdoc: 
End Rem
Function ImGui_BeginDisabled(disabled:Int)
	_ImGui_BeginDisabled(disabled)
End Function

Function ImGui_EndDisabled()
	_ImGui_EndDisabled()
End Function

Rem
bbdoc: 
End Rem
Function ImGui_PushClipRect(clip_rect_min:SImVec2, clip_rect_max:SImVec2, intersect_with_current_clip_rect:Int)
	_ImGui_PushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
End Function

Function ImGui_PopClipRect()
	_ImGui_PopClipRect()
End Function

Rem
bbdoc:  make last item the default focused item of a newly appearing window.
End Rem
Function ImGui_SetItemDefaultFocus()
	_ImGui_SetItemDefaultFocus()
End Function

Rem
bbdoc:  Implied offset = 0
End Rem
Function ImGui_SetKeyboardFocusHere()
	_ImGui_SetKeyboardFocusHere()
End Function

Rem
bbdoc:  focus keyboard on the next widget. Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.
End Rem
Function ImGui_SetKeyboardFocusHereEx(offset:Int)
	_ImGui_SetKeyboardFocusHereEx(offset)
End Function

Rem
bbdoc:  alter visibility of keyboard/gamepad cursor. by default: show when using an arrow key, hide when clicking with mouse.
End Rem
Function ImGui_SetNavCursorVisible(visible:Int)
	_ImGui_SetNavCursorVisible(visible)
End Function

Rem
bbdoc:  allow next item to be overlapped by a subsequent item. Useful with invisible buttons, selectable, treenode covering an area where subsequent items may need to be added. Note that both Selectable() and TreeNode() have dedicated flags doing this.
End Rem
Function ImGui_SetNextItemAllowOverlap()
	_ImGui_SetNextItemAllowOverlap()
End Function

Rem
bbdoc:  is the last item hovered? (and usable, aka not blocked by a popup, etc.). See ImGuiHoveredFlags for more options.
End Rem
Function ImGui_IsItemHovered:Int(flags:EImGuiHoveredFlags)
	Return _ImGui_IsItemHovered(flags)
End Function

Rem
bbdoc:  is the last item active? (e.g. button being held, text field being edited. This will continuously return true while holding mouse button on an item. Items that don't interact will always return false)
End Rem
Function ImGui_IsItemActive:Int()
	Return _ImGui_IsItemActive()
End Function

Rem
bbdoc:  is the last item focused for keyboard/gamepad navigation?
End Rem
Function ImGui_IsItemFocused:Int()
	Return _ImGui_IsItemFocused()
End Function

Rem
bbdoc:  Implied mouse_button = 0
End Rem
Function ImGui_IsItemClicked:Int()
	Return _ImGui_IsItemClicked()
End Function

Rem
bbdoc:  is the last item hovered and mouse clicked on? (**)  == IsMouseClicked(mouse_button) && IsItemHovered()Important. (**) this is NOT equivalent to the behavior of e.g. Button(). Read comments in function definition.
End Rem
Function ImGui_IsItemClickedEx:Int(mouse_button:EImGuiMouseButton)
	Return _ImGui_IsItemClickedEx(mouse_button)
End Function

Rem
bbdoc:  is the last item visible? (items may be out of sight because of clipping/scrolling)
End Rem
Function ImGui_IsItemVisible:Int()
	Return _ImGui_IsItemVisible()
End Function

Rem
bbdoc:  did the last item modify its underlying value this frame? or was pressed? This is generally the same as the "bool" return value of many widgets.
End Rem
Function ImGui_IsItemEdited:Int()
	Return _ImGui_IsItemEdited()
End Function

Rem
bbdoc:  was the last item just made active (item was previously inactive).
End Rem
Function ImGui_IsItemActivated:Int()
	Return _ImGui_IsItemActivated()
End Function

Rem
bbdoc:  was the last item just made inactive (item was previously active). Useful for Undo/Redo patterns with widgets that require continuous editing.
End Rem
Function ImGui_IsItemDeactivated:Int()
	Return _ImGui_IsItemDeactivated()
End Function

Rem
bbdoc:  was the last item just made inactive and made a value change when it was active? (e.g. Slider/Drag moved). Useful for Undo/Redo patterns with widgets that require continuous editing. Note that you may get false positives (some widgets such as Combo()/ListBox()/Selectable() will return true even when clicking an already selected item).
End Rem
Function ImGui_IsItemDeactivatedAfterEdit:Int()
	Return _ImGui_IsItemDeactivatedAfterEdit()
End Function

Rem
bbdoc:  was the last item open state toggled? set by TreeNode().
End Rem
Function ImGui_IsItemToggledOpen:Int()
	Return _ImGui_IsItemToggledOpen()
End Function

Rem
bbdoc:  is any item hovered?
End Rem
Function ImGui_IsAnyItemHovered:Int()
	Return _ImGui_IsAnyItemHovered()
End Function

Rem
bbdoc:  is any item active?
End Rem
Function ImGui_IsAnyItemActive:Int()
	Return _ImGui_IsAnyItemActive()
End Function

Rem
bbdoc:  is any item focused?
End Rem
Function ImGui_IsAnyItemFocused:Int()
	Return _ImGui_IsAnyItemFocused()
End Function

Rem
bbdoc:  get ID of last item (~~ often same ImGui::GetID(label) beforehand)
End Rem
Function ImGui_GetItemID:UInt()
	Return _ImGui_GetItemID()
End Function

Rem
bbdoc:  get upper-left bounding rectangle of the last item (screen space)
End Rem
Function ImGui_GetItemRectMin:SImVec2()
	Return _ImGui_GetItemRectMin()
End Function

Rem
bbdoc:  get lower-right bounding rectangle of the last item (screen space)
End Rem
Function ImGui_GetItemRectMax:SImVec2()
	Return _ImGui_GetItemRectMax()
End Function

Rem
bbdoc:  get size of last item
End Rem
Function ImGui_GetItemRectSize:SImVec2()
	Return _ImGui_GetItemRectSize()
End Function

Rem
bbdoc:  return primary/default viewport. This can never be NULL.
End Rem
Function ImGui_GetMainViewport:Byte Ptr()
	Return _ImGui_GetMainViewport()
End Function

Rem
bbdoc:  this draw list will be the first rendered one. Useful to quickly draw shapes/text behind dear imgui contents.
End Rem
Function ImGui_GetBackgroundDrawList:TImDrawList()
	Return TImDrawList._Create(_ImGui_GetBackgroundDrawList())
End Function

Rem
bbdoc:  this draw list will be the last rendered one. Useful to quickly draw shapes/text over dear imgui contents.
End Rem
Function ImGui_GetForegroundDrawList:TImDrawList()
	Return TImDrawList._Create(_ImGui_GetForegroundDrawList())
End Function

Rem
bbdoc:  test if rectangle (of given size, starting from cursor position) is visible / not clipped.
End Rem
Function ImGui_IsRectVisibleBySize:Int(size:SImVec2)
	Return _ImGui_IsRectVisibleBySize(size)
End Function

Rem
bbdoc:  test if rectangle (in screen space) is visible / not clipped. to perform coarse clipping on user's side.
End Rem
Function ImGui_IsRectVisible:Int(rect_min:SImVec2, rect_max:SImVec2)
	Return _ImGui_IsRectVisible(rect_min, rect_max)
End Function

Rem
bbdoc:  get global imgui time. incremented by io.DeltaTime every frame.
End Rem
Function ImGui_GetTime:Double()
	Return _ImGui_GetTime()
End Function

Rem
bbdoc:  get global imgui frame count. incremented by 1 every frame.
End Rem
Function ImGui_GetFrameCount:Int()
	Return _ImGui_GetFrameCount()
End Function

Rem
bbdoc:  you may use this when creating your own ImDrawList instances.
End Rem
Function ImGui_GetDrawListSharedData:Byte Ptr()
	Return _ImGui_GetDrawListSharedData()
End Function

Rem
bbdoc:  get a string corresponding to the enum value (for display, saving, etc.).
End Rem
Function ImGui_GetStyleColorName:String(idx:EImGuiCol)
	Return _ImGui_GetStyleColorName(idx)
End Function

Rem
bbdoc:  replace current window storage with our own (if you want to manipulate it yourself, typically clear subsection of it)
End Rem
Function ImGui_SetStateStorage(storage:Byte Ptr)
	_ImGui_SetStateStorage(storage)
End Function

Function ImGui_GetStateStorage:Byte Ptr()
	Return _ImGui_GetStateStorage()
End Function

Rem
bbdoc:  Implied text_end = NULL, hide_text_after_double_hash = false, wrap_width = -1.0f
End Rem
Function ImGui_CalcTextSize:SImVec2(text:String)
	Return _ImGui_CalcTextSize(text)
End Function

Function ImGui_CalcTextSizeEx:SImVec2(text:String, text_end:String, hide_text_after_double_hash:Int, wrap_width:Float)
	Return _ImGui_CalcTextSizeEx(text, text_end, hide_text_after_double_hash, wrap_width)
End Function

Rem
bbdoc: 
End Rem
Function ImGui_ColorConvertU32ToFloat4:SImVec4(in:UInt)
	Return _ImGui_ColorConvertU32ToFloat4(in)
End Function

Function ImGui_ColorConvertFloat4ToU32:UInt(in:SImVec4)
	Return _ImGui_ColorConvertFloat4ToU32(in)
End Function

Function ImGui_ColorConvertRGBtoHSV(r:Float, g:Float, b:Float, out_h:Float Var, out_s:Float Var, out_v:Float Var)
	_ImGui_ColorConvertRGBtoHSV(r, g, b, out_h, out_s, out_v)
End Function

Function ImGui_ColorConvertHSVtoRGB(h:Float, s:Float, v:Float, out_r:Float Var, out_g:Float Var, out_b:Float Var)
	_ImGui_ColorConvertHSVtoRGB(h, s, v, out_r, out_g, out_b)
End Function

Rem
bbdoc:  is key being held.
End Rem
Function ImGui_IsKeyDown:Int(key:EImGuiKey)
	Return _ImGui_IsKeyDown(key)
End Function

Rem
bbdoc:  Implied repeat = true
End Rem
Function ImGui_IsKeyPressed:Int(key:EImGuiKey)
	Return _ImGui_IsKeyPressed(key)
End Function

Rem
bbdoc:  was key pressed (went from !Down to Down)? if repeat=true, uses io.KeyRepeatDelay / KeyRepeatRate
End Rem
Function ImGui_IsKeyPressedEx:Int(key:EImGuiKey, rep:Int)
	Return _ImGui_IsKeyPressedEx(key, rep)
End Function

Rem
bbdoc:  was key released (went from Down to !Down)?
End Rem
Function ImGui_IsKeyReleased:Int(key:EImGuiKey)
	Return _ImGui_IsKeyReleased(key)
End Function

Rem
bbdoc:  was key chord (mods + key) pressed, e.g. you can pass 'ImGuiMod_Ctrl | ImGuiKey_S' as a key-chord. This doesn't do any routing or focus check, please consider using Shortcut() function instead.
End Rem
Function ImGui_IsKeyChordPressed:Int(key_chord:Int)
	Return _ImGui_IsKeyChordPressed(key_chord)
End Function

Rem
bbdoc:  uses provided repeat rate/delay. return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate
End Rem
Function ImGui_GetKeyPressedAmount:Int(key:EImGuiKey, repeat_delay:Float, rate:Float)
	Return _ImGui_GetKeyPressedAmount(key, repeat_delay, rate)
End Function

Rem
bbdoc:  [DEBUG] returns English name of the key. Those names are provided for debugging purpose and are not meant to be saved persistently nor compared.
End Rem
Function ImGui_GetKeyName:String(key:EImGuiKey)
	Return _ImGui_GetKeyName(key)
End Function

Rem
bbdoc:  Override io.WantCaptureKeyboard flag next frame (said flag is left for your application to handle, typically when true it instructs your app to ignore inputs). e.g. force capture keyboard when your widget is being hovered. This is equivalent to setting "io.WantCaptureKeyboard = want_capture_keyboard"; after the next NewFrame() call.
End Rem
Function ImGui_SetNextFrameWantCaptureKeyboard(want_capture_keyboard:Int)
	_ImGui_SetNextFrameWantCaptureKeyboard(want_capture_keyboard)
End Function

Rem
bbdoc: 
End Rem
Function ImGui_Shortcut:Int(key_chord:Int, flags:EImGuiInputFlags)
	Return _ImGui_Shortcut(key_chord, flags)
End Function

Function ImGui_SetNextItemShortcut(key_chord:Int, flags:EImGuiInputFlags)
	_ImGui_SetNextItemShortcut(key_chord, flags)
End Function

Rem
bbdoc:  Set key owner to last item ID if it is hovered or active. Equivalent to 'if (IsItemHovered() || IsItemActive()) { SetKeyOwner(key, GetItemID());'.
End Rem
Function ImGui_SetItemKeyOwner(key:EImGuiKey)
	_ImGui_SetItemKeyOwner(key)
End Function

Rem
bbdoc:  is mouse button held?
End Rem
Function ImGui_IsMouseDown:Int(button:EImGuiMouseButton)
	Return _ImGui_IsMouseDown(button)
End Function

Rem
bbdoc:  Implied repeat = false
End Rem
Function ImGui_IsMouseClicked:Int(button:EImGuiMouseButton)
	Return _ImGui_IsMouseClicked(button)
End Function

Rem
bbdoc:  did mouse button clicked? (went from !Down to Down). Same as GetMouseClickedCount() == 1.
End Rem
Function ImGui_IsMouseClickedEx:Int(button:EImGuiMouseButton, rep:Int)
	Return _ImGui_IsMouseClickedEx(button, rep)
End Function

Rem
bbdoc:  did mouse button released? (went from Down to !Down)
End Rem
Function ImGui_IsMouseReleased:Int(button:EImGuiMouseButton)
	Return _ImGui_IsMouseReleased(button)
End Function

Rem
bbdoc:  did mouse button double-clicked? Same as GetMouseClickedCount() == 2. (note that a double-click will also report IsMouseClicked() == true)
End Rem
Function ImGui_IsMouseDoubleClicked:Int(button:EImGuiMouseButton)
	Return _ImGui_IsMouseDoubleClicked(button)
End Function

Rem
bbdoc:  delayed mouse release (use very sparingly!). Generally used with 'delay >= io.MouseDoubleClickTime' + combined with a 'io.MouseClickedLastCount==1' test. This is a very rarely used UI idiom, but some apps use this: e.g. MS Explorer single click on an icon to rename.
End Rem
Function ImGui_IsMouseReleasedWithDelay:Int(button:EImGuiMouseButton, delay:Float)
	Return _ImGui_IsMouseReleasedWithDelay(button, delay)
End Function

Rem
bbdoc:  return the number of successive mouse-clicks at the time where a click happen (otherwise 0).
End Rem
Function ImGui_GetMouseClickedCount:Int(button:EImGuiMouseButton)
	Return _ImGui_GetMouseClickedCount(button)
End Function

Rem
bbdoc:  Implied clip = true
End Rem
Function ImGui_IsMouseHoveringRect:Int(r_min:SImVec2, r_max:SImVec2)
	Return _ImGui_IsMouseHoveringRect(r_min, r_max)
End Function

Rem
bbdoc:  is mouse hovering given bounding rect (in screen space). clipped by current clipping settings, but disregarding of other consideration of focus/window ordering/popup-block.
End Rem
Function ImGui_IsMouseHoveringRectEx:Int(r_min:SImVec2, r_max:SImVec2, clip:Int)
	Return _ImGui_IsMouseHoveringRectEx(r_min, r_max, clip)
End Function

Rem
bbdoc:  by convention we use (-FLT_MAX,-FLT_MAX) to denote that there is no mouse available
End Rem
Function ImGui_IsMousePosValid:Int(mouse_pos:Byte Ptr)
	Return _ImGui_IsMousePosValid(mouse_pos)
End Function

Rem
bbdoc:  [WILL OBSOLETE] is any mouse button held? This was designed for backends, but prefer having backend maintain a mask of held mouse buttons, because upcoming input queue system will make this invalid.
End Rem
Function ImGui_IsAnyMouseDown:Int()
	Return _ImGui_IsAnyMouseDown()
End Function

Rem
bbdoc:  shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls
End Rem
Function ImGui_GetMousePos:SImVec2()
	Return _ImGui_GetMousePos()
End Function

Rem
bbdoc:  retrieve mouse position at the time of opening popup we have BeginPopup() into (helper to avoid user backing that value themselves)
End Rem
Function ImGui_GetMousePosOnOpeningCurrentPopup:SImVec2()
	Return _ImGui_GetMousePosOnOpeningCurrentPopup()
End Function

Rem
bbdoc:  is mouse dragging? (uses io.MouseDraggingThreshold if lock_threshold < 0.0f)
End Rem
Function ImGui_IsMouseDragging:Int(button:EImGuiMouseButton, lock_threshold:Float)
	Return _ImGui_IsMouseDragging(button, lock_threshold)
End Function

Rem
bbdoc:  return the delta from the initial clicking position while the mouse button is pressed or was just released. This is locked and return 0.0f until the mouse moves past a distance threshold at least once (uses io.MouseDraggingThreshold if lock_threshold < 0.0f)
End Rem
Function ImGui_GetMouseDragDelta:SImVec2(button:EImGuiMouseButton, lock_threshold:Float)
	Return _ImGui_GetMouseDragDelta(button, lock_threshold)
End Function

Rem
bbdoc:  Implied button = 0
End Rem
Function ImGui_ResetMouseDragDelta()
	_ImGui_ResetMouseDragDelta()
End Function

Rem
bbdoc: 
End Rem
Function ImGui_ResetMouseDragDeltaEx(button:EImGuiMouseButton)
	_ImGui_ResetMouseDragDeltaEx(button)
End Function

Rem
bbdoc:  get desired mouse cursor shape. Important: reset in ImGui::NewFrame(), this is updated during the frame. valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you
End Rem
Function ImGui_GetMouseCursor:EImGuiMouseCursor()
	Return _ImGui_GetMouseCursor()
End Function

Rem
bbdoc:  set desired mouse cursor shape
End Rem
Function ImGui_SetMouseCursor(cursor_type:EImGuiMouseCursor)
	_ImGui_SetMouseCursor(cursor_type)
End Function

Rem
bbdoc:  Override io.WantCaptureMouse flag next frame (said flag is left for your application to handle, typical when true it instucts your app to ignore inputs). This is equivalent to setting "io.WantCaptureMouse = want_capture_mouse;" after the next NewFrame() call.
End Rem
Function ImGui_SetNextFrameWantCaptureMouse(want_capture_mouse:Int)
	_ImGui_SetNextFrameWantCaptureMouse(want_capture_mouse)
End Function

Rem
bbdoc: 
End Rem
Function ImGui_GetClipboardText:String()
	Return _ImGui_GetClipboardText()
End Function

Function ImGui_SetClipboardText(text:String)
	_ImGui_SetClipboardText(text)
End Function

Rem
bbdoc:  call after CreateContext() and before the first call to NewFrame(). NewFrame() automatically calls LoadIniSettingsFromDisk(io.IniFilename).
End Rem
Function ImGui_LoadIniSettingsFromDisk(ini_filename:String)
	_ImGui_LoadIniSettingsFromDisk(ini_filename)
End Function

Rem
bbdoc:  call after CreateContext() and before the first call to NewFrame() to provide .ini data from your own data source.
End Rem
Function ImGui_LoadIniSettingsFromMemory(ini_data:String, ini_size:size_t)
	_ImGui_LoadIniSettingsFromMemory(ini_data, ini_size)
End Function

Rem
bbdoc:  this is automatically called (if io.IniFilename is not empty) a few seconds after any modification that should be reflected in the .ini file (and also by DestroyContext).
End Rem
Function ImGui_SaveIniSettingsToDisk(ini_filename:String)
	_ImGui_SaveIniSettingsToDisk(ini_filename)
End Function

Rem
bbdoc:  return a zero-terminated string with the .ini data which you can save by your own mean. call when io.WantSaveIniSettings is set, then save data by your own mean and clear io.WantSaveIniSettings.
End Rem
Function ImGui_SaveIniSettingsToMemory:String(out_ini_size:Byte Ptr)
	Return _ImGui_SaveIniSettingsToMemory(out_ini_size)
End Function

Rem
bbdoc: 
End Rem
Function ImGui_DebugTextEncoding(text:String)
	_ImGui_DebugTextEncoding(text)
End Function

Function ImGui_DebugFlashStyleColor(idx:EImGuiCol)
	_ImGui_DebugFlashStyleColor(idx)
End Function

Function ImGui_DebugStartItemPicker()
	_ImGui_DebugStartItemPicker()
End Function

Rem
bbdoc:  This is called by IMGUI_CHECKVERSION() macro.
End Rem
Function ImGui_DebugCheckVersionAndDataLayout:Int(version_str:String, sz_io:size_t, sz_style:size_t, sz_vec2:size_t, sz_vec4:size_t, sz_drawvert:size_t, sz_drawidx:size_t)
	Return _ImGui_DebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx)
End Function

Rem
bbdoc:  Call via IMGUI_DEBUG_LOG() for maximum stripping in caller code!
End Rem
Function ImGui_DebugLog(fmt:String)
	_ImGui_DebugLog(fmt)
End Function

Function ImGui_DebugLogV(fmt:String)
	_ImGui_DebugLogV(fmt)
End Function

Rem
bbdoc: 
End Rem
Function ImGui_SetAllocatorFunctions(alloc_func:Byte Ptr, free_func:Byte Ptr, user_data:Byte Ptr)
	_ImGui_SetAllocatorFunctions(alloc_func, free_func, user_data)
End Function

Function ImGui_GetAllocatorFunctions(p_alloc_func:Byte Ptr, p_free_func:Byte Ptr, p_user_data:Byte Ptr)
	_ImGui_GetAllocatorFunctions(p_alloc_func, p_free_func, p_user_data)
End Function

Function ImGui_MemAlloc:Byte Ptr(size:size_t)
	Return _ImGui_MemAlloc(size)
End Function

Function ImGui_MemFree(handle:Byte Ptr)
	_ImGui_MemFree(handle)
End Function

Rem
bbdoc:  Construct a zero-size ImVector<> (of any type). This is primarily useful when calling ImFontGlyphRangesBuilder_BuildRanges()
End Rem
Function ImVector_Construct(vector:Byte Ptr)
	_ImVector_Construct(vector)
End Function

Rem
bbdoc:  Destruct an ImVector<> (of any type). Important: Frees the vector memory but does not call destructors on contained objects (if they have them)
End Rem
Function ImVector_Destruct(vector:Byte Ptr)
	_ImVector_Destruct(vector)
End Function

Function ImGuiStyle_ScaleAllSizes(this:TImGuiStyle, scale_factor:Float)
	_ImGuiStyle_ScaleAllSizes(this.handle, scale_factor)
End Function

Rem
bbdoc:  Queue a new key down/up event. Key should be "translated" (as in, generally ImGuiKey_A matches the key end-user would use to emit an 'A' character)
End Rem
Function ImGuiIO_AddKeyEvent(this:TImGuiIO, key:EImGuiKey, down:Int)
	_ImGuiIO_AddKeyEvent(this.handle, key, down)
End Function

Rem
bbdoc:  Queue a new key down/up event for analog values (e.g. ImGuiKey_Gamepad_ values). Dead-zones should be handled by the backend.
End Rem
Function ImGuiIO_AddKeyAnalogEvent(this:TImGuiIO, key:EImGuiKey, down:Int, v:Float)
	_ImGuiIO_AddKeyAnalogEvent(this.handle, key, down, v)
End Function

Rem
bbdoc:  Queue a mouse position update. Use -FLT_MAX,-FLT_MAX to signify no mouse (e.g. app not focused and not hovered)
End Rem
Function ImGuiIO_AddMousePosEvent(this:TImGuiIO, x:Float, y:Float)
	_ImGuiIO_AddMousePosEvent(this.handle, x, y)
End Function

Rem
bbdoc:  Queue a mouse button change
End Rem
Function ImGuiIO_AddMouseButtonEvent(this:TImGuiIO, button:Int, down:Int)
	_ImGuiIO_AddMouseButtonEvent(this.handle, button, down)
End Function

Rem
bbdoc:  Queue a mouse wheel update. wheel_y<0: scroll down, wheel_y>0: scroll up, wheel_x<0: scroll right, wheel_x>0: scroll left.
End Rem
Function ImGuiIO_AddMouseWheelEvent(this:TImGuiIO, wheel_x:Float, wheel_y:Float)
	_ImGuiIO_AddMouseWheelEvent(this.handle, wheel_x, wheel_y)
End Function

Rem
bbdoc:  Queue a mouse source change (Mouse/TouchScreen/Pen)
End Rem
Function ImGuiIO_AddMouseSourceEvent(this:TImGuiIO, source:EImGuiMouseSource)
	_ImGuiIO_AddMouseSourceEvent(this.handle, source)
End Function

Rem
bbdoc:  Queue a gain/loss of focus for the application (generally based on OS/platform focus of your window)
End Rem
Function ImGuiIO_AddFocusEvent(this:TImGuiIO, focused:Int)
	_ImGuiIO_AddFocusEvent(this.handle, focused)
End Function

Rem
bbdoc:  Queue a new character input
End Rem
Function ImGuiIO_AddInputCharacter(this:TImGuiIO, c:UInt)
	_ImGuiIO_AddInputCharacter(this.handle, c)
End Function

Rem
bbdoc:  Queue a new character input from a UTF-16 character, it can be a surrogate
End Rem
Function ImGuiIO_AddInputCharacterUTF16(this:TImGuiIO, c:Short)
	_ImGuiIO_AddInputCharacterUTF16(this.handle, c)
End Function

Rem
bbdoc:  Queue a new characters input from a UTF-8 string
End Rem
Function ImGuiIO_AddInputCharactersUTF8(this:TImGuiIO, str:String)
	_ImGuiIO_AddInputCharactersUTF8(this.handle, str)
End Function

Rem
bbdoc:  Implied native_legacy_index = -1
End Rem
Function ImGuiIO_SetKeyEventNativeData(this:TImGuiIO, key:EImGuiKey, native_keycode:Int, native_scancode:Int)
	_ImGuiIO_SetKeyEventNativeData(this.handle, key, native_keycode, native_scancode)
End Function

Rem
bbdoc:  [Optional] Specify index for legacy <1.87 IsKeyXXX() functions with native indices + specify native keycode, scancode.
End Rem
Function ImGuiIO_SetKeyEventNativeDataEx(this:TImGuiIO, key:EImGuiKey, native_keycode:Int, native_scancode:Int, native_legacy_index:Int)
	_ImGuiIO_SetKeyEventNativeDataEx(this.handle, key, native_keycode, native_scancode, native_legacy_index)
End Function

Rem
bbdoc:  Set master flag for accepting key/mouse/text events (default to true). Useful if you have native dialog boxes that are interrupting your application loop/refresh, and you want to disable events being queued while your app is frozen.
End Rem
Function ImGuiIO_SetAppAcceptingEvents(this:TImGuiIO, accepting_events:Int)
	_ImGuiIO_SetAppAcceptingEvents(this.handle, accepting_events)
End Function

Rem
bbdoc:  Clear all incoming events.
End Rem
Function ImGuiIO_ClearEventsQueue(this:TImGuiIO)
	_ImGuiIO_ClearEventsQueue(this.handle)
End Function

Rem
bbdoc:  Clear current keyboard/gamepad state + current frame text input buffer. Equivalent to releasing all keys/buttons.
End Rem
Function ImGuiIO_ClearInputKeys(this:TImGuiIO)
	_ImGuiIO_ClearInputKeys(this.handle)
End Function

Rem
bbdoc:  Clear current mouse state.
End Rem
Function ImGuiIO_ClearInputMouse(this:TImGuiIO)
	_ImGuiIO_ClearInputMouse(this.handle)
End Function

Function ImGuiInputTextCallbackData_DeleteChars(this:Byte Ptr, pos:Int, bytes_count:Int)
	_ImGuiInputTextCallbackData_DeleteChars(this, pos, bytes_count)
End Function

Function ImGuiInputTextCallbackData_InsertChars(this:Byte Ptr, pos:Int, text:String, text_end:String)
	_ImGuiInputTextCallbackData_InsertChars(this, pos, text, text_end)
End Function

Function ImGuiInputTextCallbackData_SelectAll(this:Byte Ptr)
	_ImGuiInputTextCallbackData_SelectAll(this)
End Function

Function ImGuiInputTextCallbackData_ClearSelection(this:Byte Ptr)
	_ImGuiInputTextCallbackData_ClearSelection(this)
End Function

Function ImGuiInputTextCallbackData_HasSelection:Int(this:Byte Ptr)
	Return _ImGuiInputTextCallbackData_HasSelection(this)
End Function

Function ImGuiPayload_Clear(this:Byte Ptr)
	_ImGuiPayload_Clear(this)
End Function

Function ImGuiPayload_IsDataType:Int(this:Byte Ptr, kind:String)
	Return _ImGuiPayload_IsDataType(this, kind)
End Function

Function ImGuiPayload_IsPreview:Int(this:Byte Ptr)
	Return _ImGuiPayload_IsPreview(this)
End Function

Function ImGuiPayload_IsDelivery:Int(this:Byte Ptr)
	Return _ImGuiPayload_IsDelivery(this)
End Function

Function ImGuiTextFilter_ImGuiTextRange_empty:Int(this:Byte Ptr)
	Return _ImGuiTextFilter_ImGuiTextRange_empty(this)
End Function

Function ImGuiTextFilter_ImGuiTextRange_split(this:Byte Ptr, separator:Byte, out:Byte Ptr)
	_ImGuiTextFilter_ImGuiTextRange_split(this, separator, out)
End Function

Rem
bbdoc:  Helper calling InputText+Build
End Rem
Function ImGuiTextFilter_Draw:Int(this:TImGuiTextFilter, label:String, width:Float)
	Return _ImGuiTextFilter_Draw(this.handle, label, width)
End Function

Function ImGuiTextFilter_PassFilter:Int(this:TImGuiTextFilter, text:String, text_end:String)
	Return _ImGuiTextFilter_PassFilter(this.handle, text, text_end)
End Function

Function ImGuiTextFilter_Build(this:TImGuiTextFilter)
	_ImGuiTextFilter_Build(this.handle)
End Function

Function ImGuiTextFilter_Clear(this:TImGuiTextFilter)
	_ImGuiTextFilter_Clear(this.handle)
End Function

Function ImGuiTextFilter_IsActive:Int(this:TImGuiTextFilter)
	Return _ImGuiTextFilter_IsActive(this.handle)
End Function

Function ImGuiTextBuffer_begin:String(this:TImGuiTextBuffer)
	Return _ImGuiTextBuffer_begin(this.handle)
End Function

Rem
bbdoc:  Buf is zero-terminated, so end() will point on the zero-terminator
End Rem
Function ImGuiTextBuffer_end:String(this:TImGuiTextBuffer)
	Return _ImGuiTextBuffer_end(this.handle)
End Function

Function ImGuiTextBuffer_size:Int(this:TImGuiTextBuffer)
	Return _ImGuiTextBuffer_size(this.handle)
End Function

Function ImGuiTextBuffer_empty:Int(this:TImGuiTextBuffer)
	Return _ImGuiTextBuffer_empty(this.handle)
End Function

Function ImGuiTextBuffer_clear(this:TImGuiTextBuffer)
	_ImGuiTextBuffer_clear(this.handle)
End Function

Rem
bbdoc:  Similar to resize(0) on ImVector: empty string but don't free buffer.
End Rem
Function ImGuiTextBuffer_resize(this:TImGuiTextBuffer, size:Int)
	_ImGuiTextBuffer_resize(this.handle, size)
End Function

Function ImGuiTextBuffer_reserve(this:TImGuiTextBuffer, capacity:Int)
	_ImGuiTextBuffer_reserve(this.handle, capacity)
End Function

Function ImGuiTextBuffer_c_str:String(this:TImGuiTextBuffer)
	Return _ImGuiTextBuffer_c_str(this.handle)
End Function

Function ImGuiTextBuffer_append(this:TImGuiTextBuffer, str:String, str_end:String)
	_ImGuiTextBuffer_append(this.handle, str, str_end)
End Function

Function ImGuiTextBuffer_appendf(this:TImGuiTextBuffer, fmt:String)
	_ImGuiTextBuffer_appendf(this.handle, fmt)
End Function

Function ImGuiTextBuffer_appendfv(this:TImGuiTextBuffer, fmt:String)
	_ImGuiTextBuffer_appendfv(this.handle, fmt)
End Function

Rem
bbdoc: 
End Rem
Function ImGuiStorage_Clear(this:Byte Ptr)
	_ImGuiStorage_Clear(this)
End Function

Function ImGuiStorage_GetInt:Int(this:Byte Ptr, key:UInt, default_val:Int)
	Return _ImGuiStorage_GetInt(this, key, default_val)
End Function

Function ImGuiStorage_SetInt(this:Byte Ptr, key:UInt, val:Int)
	_ImGuiStorage_SetInt(this, key, val)
End Function

Function ImGuiStorage_GetBool:Int(this:Byte Ptr, key:UInt, default_val:Int)
	Return _ImGuiStorage_GetBool(this, key, default_val)
End Function

Function ImGuiStorage_SetBool(this:Byte Ptr, key:UInt, val:Int)
	_ImGuiStorage_SetBool(this, key, val)
End Function

Function ImGuiStorage_GetFloat:Float(this:Byte Ptr, key:UInt, default_val:Float)
	Return _ImGuiStorage_GetFloat(this, key, default_val)
End Function

Function ImGuiStorage_SetFloat(this:Byte Ptr, key:UInt, val:Float)
	_ImGuiStorage_SetFloat(this, key, val)
End Function

Rem
bbdoc:  default_val is NULL
End Rem
Function ImGuiStorage_GetVoidPtr:Byte Ptr(this:Byte Ptr, key:UInt)
	Return _ImGuiStorage_GetVoidPtr(this, key)
End Function

Function ImGuiStorage_SetVoidPtr(this:Byte Ptr, key:UInt, val:Byte Ptr)
	_ImGuiStorage_SetVoidPtr(this, key, val)
End Function

Rem
bbdoc: 
End Rem
Function ImGuiStorage_GetIntRef:Byte Ptr(this:Byte Ptr, key:UInt, default_val:Int)
	Return _ImGuiStorage_GetIntRef(this, key, default_val)
End Function

Function ImGuiStorage_GetBoolRef:Byte Ptr(this:Byte Ptr, key:UInt, default_val:Int)
	Return _ImGuiStorage_GetBoolRef(this, key, default_val)
End Function

Function ImGuiStorage_GetFloatRef:Byte Ptr(this:Byte Ptr, key:UInt, default_val:Float)
	Return _ImGuiStorage_GetFloatRef(this, key, default_val)
End Function

Function ImGuiStorage_GetVoidPtrRef:Byte Ptr(this:Byte Ptr, key:UInt, default_val:Byte Ptr)
	Return _ImGuiStorage_GetVoidPtrRef(this, key, default_val)
End Function

Rem
bbdoc: 
End Rem
Function ImGuiStorage_BuildSortByKey(this:Byte Ptr)
	_ImGuiStorage_BuildSortByKey(this)
End Function

Rem
bbdoc: 
End Rem
Function ImGuiStorage_SetAllInt(this:Byte Ptr, val:Int)
	_ImGuiStorage_SetAllInt(this, val)
End Function

Function ImGuiListClipper_Begin(this:Byte Ptr, items_count:Int, items_height:Float)
	_ImGuiListClipper_Begin(this, items_count, items_height)
End Function

Rem
bbdoc:  Automatically called on the last call of Step() that returns false.
End Rem
Function ImGuiListClipper_End(this:Byte Ptr)
	_ImGuiListClipper_End(this)
End Function

Rem
bbdoc:  Call until it returns false. The DisplayStart/DisplayEnd fields will be set and you can process/draw those items.
End Rem
Function ImGuiListClipper_Step:Int(this:Byte Ptr)
	Return _ImGuiListClipper_Step(this)
End Function

Rem
bbdoc: 
End Rem
Function ImGuiListClipper_IncludeItemByIndex(this:Byte Ptr, item_index:Int)
	_ImGuiListClipper_IncludeItemByIndex(this, item_index)
End Function

Rem
bbdoc:  item_end is exclusive e.g. use (42, 42+1) to make item 42 never clipped.
End Rem
Function ImGuiListClipper_IncludeItemsByIndex(this:Byte Ptr, item_begin:Int, item_end:Int)
	_ImGuiListClipper_IncludeItemsByIndex(this, item_begin, item_end)
End Function

Rem
bbdoc: 
End Rem
Function ImGuiListClipper_SeekCursorForItem(this:Byte Ptr, item_index:Int)
	_ImGuiListClipper_SeekCursorForItem(this, item_index)
End Function

Rem
bbdoc: 
End Rem
Function ImColor_SetHSV(this:Byte Ptr, h:Float, s:Float, v:Float, a:Float)
	_ImColor_SetHSV(this, h, s, v, a)
End Function

Function ImColor_HSV:UInt(h:Float, s:Float, v:Float, a:Float)
	Return _ImColor_HSV(h, s, v, a)
End Function

Rem
bbdoc:  Apply selection requests coming from BeginMultiSelect() and EndMultiSelect() functions. It uses 'items_count' passed to BeginMultiSelect()
End Rem
Function ImGuiSelectionBasicStorage_ApplyRequests(this:Byte Ptr, ms_io:Byte Ptr)
	_ImGuiSelectionBasicStorage_ApplyRequests(this, ms_io)
End Function

Rem
bbdoc:  Query if an item id is in selection.
End Rem
Function ImGuiSelectionBasicStorage_Contains:Int(this:Byte Ptr, id:UInt)
	Return _ImGuiSelectionBasicStorage_Contains(this, id)
End Function

Rem
bbdoc:  Clear selection
End Rem
Function ImGuiSelectionBasicStorage_Clear(this:Byte Ptr)
	_ImGuiSelectionBasicStorage_Clear(this)
End Function

Rem
bbdoc:  Swap two selections
End Rem
Function ImGuiSelectionBasicStorage_Swap(this:Byte Ptr, r:Byte Ptr)
	_ImGuiSelectionBasicStorage_Swap(this, r)
End Function

Rem
bbdoc:  Add/remove an item from selection (generally done by ApplyRequests() function)
End Rem
Function ImGuiSelectionBasicStorage_SetItemSelected(this:Byte Ptr, id:UInt, selected:Int)
	_ImGuiSelectionBasicStorage_SetItemSelected(this, id, selected)
End Function

Rem
bbdoc:  Iterate selection with 'void* it = NULL; ImGuiID id; while (selection.GetNextSelectedItem(&it, &id)) { ... }'
End Rem
Function ImGuiSelectionBasicStorage_GetNextSelectedItem:Int(this:Byte Ptr, opaque_it:Byte Ptr, out_id:Byte Ptr)
	Return _ImGuiSelectionBasicStorage_GetNextSelectedItem(this, opaque_it, out_id)
End Function

Rem
bbdoc:  Convert index to item id based on provided adapter.
End Rem
Function ImGuiSelectionBasicStorage_GetStorageIdFromIndex:UInt(this:Byte Ptr, idx:Int)
	Return _ImGuiSelectionBasicStorage_GetStorageIdFromIndex(this, idx)
End Function

Rem
bbdoc:  Apply selection requests by using AdapterSetItemSelected() calls
End Rem
Function ImGuiSelectionExternalStorage_ApplyRequests(this:Byte Ptr, ms_io:Byte Ptr)
	_ImGuiSelectionExternalStorage_ApplyRequests(this, ms_io)
End Function

Rem
bbdoc: 
End Rem
Function ImDrawCmd_GetTexID:ULong(this:Byte Ptr)
	Return _ImDrawCmd_GetTexID(this)
End Function

Rem
bbdoc:  Do not clear Channels[] so our allocations are reused next frame
End Rem
Function ImDrawListSplitter_Clear(this:Byte Ptr)
	_ImDrawListSplitter_Clear(this)
End Function

Function ImDrawListSplitter_ClearFreeMemory(this:Byte Ptr)
	_ImDrawListSplitter_ClearFreeMemory(this)
End Function

Function ImDrawListSplitter_Split(this:Byte Ptr, draw_list:TImDrawList, count:Int)
	_ImDrawListSplitter_Split(this, draw_list.handle, count)
End Function

Function ImDrawListSplitter_Merge(this:Byte Ptr, draw_list:TImDrawList)
	_ImDrawListSplitter_Merge(this, draw_list.handle)
End Function

Function ImDrawListSplitter_SetCurrentChannel(this:Byte Ptr, draw_list:TImDrawList, channel_idx:Int)
	_ImDrawListSplitter_SetCurrentChannel(this, draw_list.handle, channel_idx)
End Function

Rem
bbdoc:  Render-level scissoring. This is passed down to your render function but not used for CPU-side coarse clipping. Prefer using higher-level ImGui::PushClipRect() to affect logic (hit-testing and widget culling)
End Rem
Function ImDrawList_PushClipRect(this:TImDrawList, clip_rect_min:SImVec2, clip_rect_max:SImVec2, intersect_with_current_clip_rect:Int)
	_ImDrawList_PushClipRect(this.handle, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
End Function

Function ImDrawList_PushClipRectFullScreen(this:TImDrawList)
	_ImDrawList_PushClipRectFullScreen(this.handle)
End Function

Function ImDrawList_PopClipRect(this:TImDrawList)
	_ImDrawList_PopClipRect(this.handle)
End Function

Function ImDrawList_PushTextureID(this:TImDrawList, texture_id:ULong)
	_ImDrawList_PushTextureID(this.handle, texture_id)
End Function

Function ImDrawList_PopTextureID(this:TImDrawList)
	_ImDrawList_PopTextureID(this.handle)
End Function

Function ImDrawList_GetClipRectMin:SImVec2(this:Byte Ptr)
	Return _ImDrawList_GetClipRectMin(this)
End Function

Function ImDrawList_GetClipRectMax:SImVec2(this:Byte Ptr)
	Return _ImDrawList_GetClipRectMax(this)
End Function

Rem
bbdoc:  Implied thickness = 1.0f
End Rem
Function ImDrawList_AddLine(this:TImDrawList, p1:SImVec2, p2:SImVec2, col:UInt)
	_ImDrawList_AddLine(this.handle, p1, p2, col)
End Function

Function ImDrawList_AddLineEx(this:TImDrawList, p1:SImVec2, p2:SImVec2, col:UInt, thickness:Float)
	_ImDrawList_AddLineEx(this.handle, p1, p2, col, thickness)
End Function

Rem
bbdoc:  Implied rounding = 0.0f, flags = 0, thickness = 1.0f
End Rem
Function ImDrawList_AddRect(this:TImDrawList, p_min:SImVec2, p_max:SImVec2, col:UInt)
	_ImDrawList_AddRect(this.handle, p_min, p_max, col)
End Function

Rem
bbdoc:  a: upper-left, b: lower-right (== upper-left + size)
End Rem
Function ImDrawList_AddRectEx(this:TImDrawList, p_min:SImVec2, p_max:SImVec2, col:UInt, rounding:Float, flags:EImDrawFlags, thickness:Float)
	_ImDrawList_AddRectEx(this.handle, p_min, p_max, col, rounding, flags, thickness)
End Function

Rem
bbdoc:  Implied rounding = 0.0f, flags = 0
End Rem
Function ImDrawList_AddRectFilled(this:TImDrawList, p_min:SImVec2, p_max:SImVec2, col:UInt)
	_ImDrawList_AddRectFilled(this.handle, p_min, p_max, col)
End Function

Rem
bbdoc:  a: upper-left, b: lower-right (== upper-left + size)
End Rem
Function ImDrawList_AddRectFilledEx(this:TImDrawList, p_min:SImVec2, p_max:SImVec2, col:UInt, rounding:Float, flags:EImDrawFlags)
	_ImDrawList_AddRectFilledEx(this.handle, p_min, p_max, col, rounding, flags)
End Function

Function ImDrawList_AddRectFilledMultiColor(this:TImDrawList, p_min:SImVec2, p_max:SImVec2, col_upr_left:UInt, col_upr_right:UInt, col_bot_right:UInt, col_bot_left:UInt)
	_ImDrawList_AddRectFilledMultiColor(this.handle, p_min, p_max, col_upr_left, col_upr_right, col_bot_right, col_bot_left)
End Function

Rem
bbdoc:  Implied thickness = 1.0f
End Rem
Function ImDrawList_AddQuad(this:TImDrawList, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2, col:UInt)
	_ImDrawList_AddQuad(this.handle, p1, p2, p3, p4, col)
End Function

Function ImDrawList_AddQuadEx(this:TImDrawList, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2, col:UInt, thickness:Float)
	_ImDrawList_AddQuadEx(this.handle, p1, p2, p3, p4, col, thickness)
End Function

Function ImDrawList_AddQuadFilled(this:TImDrawList, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2, col:UInt)
	_ImDrawList_AddQuadFilled(this.handle, p1, p2, p3, p4, col)
End Function

Rem
bbdoc:  Implied thickness = 1.0f
End Rem
Function ImDrawList_AddTriangle(this:TImDrawList, p1:SImVec2, p2:SImVec2, p3:SImVec2, col:UInt)
	_ImDrawList_AddTriangle(this.handle, p1, p2, p3, col)
End Function

Function ImDrawList_AddTriangleEx(this:TImDrawList, p1:SImVec2, p2:SImVec2, p3:SImVec2, col:UInt, thickness:Float)
	_ImDrawList_AddTriangleEx(this.handle, p1, p2, p3, col, thickness)
End Function

Function ImDrawList_AddTriangleFilled(this:TImDrawList, p1:SImVec2, p2:SImVec2, p3:SImVec2, col:UInt)
	_ImDrawList_AddTriangleFilled(this.handle, p1, p2, p3, col)
End Function

Rem
bbdoc:  Implied num_segments = 0, thickness = 1.0f
End Rem
Function ImDrawList_AddCircle(this:TImDrawList, center:SImVec2, radius:Float, col:UInt)
	_ImDrawList_AddCircle(this.handle, center, radius, col)
End Function

Function ImDrawList_AddCircleEx(this:TImDrawList, center:SImVec2, radius:Float, col:UInt, num_segments:Int, thickness:Float)
	_ImDrawList_AddCircleEx(this.handle, center, radius, col, num_segments, thickness)
End Function

Function ImDrawList_AddCircleFilled(this:TImDrawList, center:SImVec2, radius:Float, col:UInt, num_segments:Int)
	_ImDrawList_AddCircleFilled(this.handle, center, radius, col, num_segments)
End Function

Rem
bbdoc:  Implied thickness = 1.0f
End Rem
Function ImDrawList_AddNgon(this:TImDrawList, center:SImVec2, radius:Float, col:UInt, num_segments:Int)
	_ImDrawList_AddNgon(this.handle, center, radius, col, num_segments)
End Function

Function ImDrawList_AddNgonEx(this:TImDrawList, center:SImVec2, radius:Float, col:UInt, num_segments:Int, thickness:Float)
	_ImDrawList_AddNgonEx(this.handle, center, radius, col, num_segments, thickness)
End Function

Function ImDrawList_AddNgonFilled(this:TImDrawList, center:SImVec2, radius:Float, col:UInt, num_segments:Int)
	_ImDrawList_AddNgonFilled(this.handle, center, radius, col, num_segments)
End Function

Rem
bbdoc:  Implied rot = 0.0f, num_segments = 0, thickness = 1.0f
End Rem
Function ImDrawList_AddEllipse(this:TImDrawList, center:SImVec2, radius:SImVec2, col:UInt)
	_ImDrawList_AddEllipse(this.handle, center, radius, col)
End Function

Function ImDrawList_AddEllipseEx(this:TImDrawList, center:SImVec2, radius:SImVec2, col:UInt, rot:Float, num_segments:Int, thickness:Float)
	_ImDrawList_AddEllipseEx(this.handle, center, radius, col, rot, num_segments, thickness)
End Function

Rem
bbdoc:  Implied rot = 0.0f, num_segments = 0
End Rem
Function ImDrawList_AddEllipseFilled(this:TImDrawList, center:SImVec2, radius:SImVec2, col:UInt)
	_ImDrawList_AddEllipseFilled(this.handle, center, radius, col)
End Function

Function ImDrawList_AddEllipseFilledEx(this:TImDrawList, center:SImVec2, radius:SImVec2, col:UInt, rot:Float, num_segments:Int)
	_ImDrawList_AddEllipseFilledEx(this.handle, center, radius, col, rot, num_segments)
End Function

Rem
bbdoc:  Implied text_end = NULL
End Rem
Function ImDrawList_AddText(this:TImDrawList, pos:SImVec2, col:UInt, text_begin:String)
	_ImDrawList_AddText(this.handle, pos, col, text_begin)
End Function

Function ImDrawList_AddTextEx(this:TImDrawList, pos:SImVec2, col:UInt, text_begin:String, text_end:String)
	_ImDrawList_AddTextEx(this.handle, pos, col, text_begin, text_end)
End Function

Rem
bbdoc:  Implied text_end = NULL, wrap_width = 0.0f, cpu_fine_clip_rect = NULL
End Rem
Function ImDrawList_AddTextImFontPtr(this:TImDrawList, font:TImFont, font_size:Float, pos:SImVec2, col:UInt, text_begin:String)
	_ImDrawList_AddTextImFontPtr(this.handle, font.handle, font_size, pos, col, text_begin)
End Function

Function ImDrawList_AddTextImFontPtrEx(this:TImDrawList, font:TImFont, font_size:Float, pos:SImVec2, col:UInt, text_begin:String, text_end:String, wrap_width:Float, cpu_fine_clip_rect:Byte Ptr)
	_ImDrawList_AddTextImFontPtrEx(this.handle, font.handle, font_size, pos, col, text_begin, text_end, wrap_width, cpu_fine_clip_rect)
End Function

Rem
bbdoc:  Cubic Bezier (4 control points)
End Rem
Function ImDrawList_AddBezierCubic(this:TImDrawList, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2, col:UInt, thickness:Float, num_segments:Int)
	_ImDrawList_AddBezierCubic(this.handle, p1, p2, p3, p4, col, thickness, num_segments)
End Function

Rem
bbdoc:  Quadratic Bezier (3 control points)
End Rem
Function ImDrawList_AddBezierQuadratic(this:TImDrawList, p1:SImVec2, p2:SImVec2, p3:SImVec2, col:UInt, thickness:Float, num_segments:Int)
	_ImDrawList_AddBezierQuadratic(this.handle, p1, p2, p3, col, thickness, num_segments)
End Function

Rem
bbdoc: 
End Rem
Function ImDrawList_AddPolyline(this:TImDrawList, points:Byte Ptr, num_points:Int, col:UInt, flags:EImDrawFlags, thickness:Float)
	_ImDrawList_AddPolyline(this.handle, points, num_points, col, flags, thickness)
End Function

Function ImDrawList_AddConvexPolyFilled(this:TImDrawList, points:Byte Ptr, num_points:Int, col:UInt)
	_ImDrawList_AddConvexPolyFilled(this.handle, points, num_points, col)
End Function

Function ImDrawList_AddConcavePolyFilled(this:TImDrawList, points:Byte Ptr, num_points:Int, col:UInt)
	_ImDrawList_AddConcavePolyFilled(this.handle, points, num_points, col)
End Function

Rem
bbdoc:  Implied uv_min = ImVec2(0, 0), uv_max = ImVec2(1, 1), col = IM_COL32_WHITE
End Rem
Function ImDrawList_AddImage(this:TImDrawList, user_texture_id:ULong, p_min:SImVec2, p_max:SImVec2)
	_ImDrawList_AddImage(this.handle, user_texture_id, p_min, p_max)
End Function

Function ImDrawList_AddImageEx(this:TImDrawList, user_texture_id:ULong, p_min:SImVec2, p_max:SImVec2, uv_min:SImVec2, uv_max:SImVec2, col:UInt)
	_ImDrawList_AddImageEx(this.handle, user_texture_id, p_min, p_max, uv_min, uv_max, col)
End Function

Rem
bbdoc:  Implied uv1 = ImVec2(0, 0), uv2 = ImVec2(1, 0), uv3 = ImVec2(1, 1), uv4 = ImVec2(0, 1), col = IM_COL32_WHITE
End Rem
Function ImDrawList_AddImageQuad(this:TImDrawList, user_texture_id:ULong, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2)
	_ImDrawList_AddImageQuad(this.handle, user_texture_id, p1, p2, p3, p4)
End Function

Function ImDrawList_AddImageQuadEx(this:TImDrawList, user_texture_id:ULong, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2, uv1:SImVec2, uv2:SImVec2, uv3:SImVec2, uv4:SImVec2, col:UInt)
	_ImDrawList_AddImageQuadEx(this.handle, user_texture_id, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col)
End Function

Function ImDrawList_AddImageRounded(this:TImDrawList, user_texture_id:ULong, p_min:SImVec2, p_max:SImVec2, uv_min:SImVec2, uv_max:SImVec2, col:UInt, rounding:Float, flags:EImDrawFlags)
	_ImDrawList_AddImageRounded(this.handle, user_texture_id, p_min, p_max, uv_min, uv_max, col, rounding, flags)
End Function

Rem
bbdoc: 
End Rem
Function ImDrawList_PathClear(this:TImDrawList)
	_ImDrawList_PathClear(this.handle)
End Function

Function ImDrawList_PathLineTo(this:TImDrawList, pos:SImVec2)
	_ImDrawList_PathLineTo(this.handle, pos)
End Function

Function ImDrawList_PathLineToMergeDuplicate(this:TImDrawList, pos:SImVec2)
	_ImDrawList_PathLineToMergeDuplicate(this.handle, pos)
End Function

Function ImDrawList_PathFillConvex(this:TImDrawList, col:UInt)
	_ImDrawList_PathFillConvex(this.handle, col)
End Function

Function ImDrawList_PathFillConcave(this:TImDrawList, col:UInt)
	_ImDrawList_PathFillConcave(this.handle, col)
End Function

Function ImDrawList_PathStroke(this:TImDrawList, col:UInt, flags:EImDrawFlags, thickness:Float)
	_ImDrawList_PathStroke(this.handle, col, flags, thickness)
End Function

Function ImDrawList_PathArcTo(this:TImDrawList, center:SImVec2, radius:Float, a_min:Float, a_max:Float, num_segments:Int)
	_ImDrawList_PathArcTo(this.handle, center, radius, a_min, a_max, num_segments)
End Function

Rem
bbdoc:  Use precomputed angles for a 12 steps circle
End Rem
Function ImDrawList_PathArcToFast(this:TImDrawList, center:SImVec2, radius:Float, a_min_of_12:Int, a_max_of_12:Int)
	_ImDrawList_PathArcToFast(this.handle, center, radius, a_min_of_12, a_max_of_12)
End Function

Rem
bbdoc:  Implied num_segments = 0
End Rem
Function ImDrawList_PathEllipticalArcTo(this:TImDrawList, center:SImVec2, radius:SImVec2, rot:Float, a_min:Float, a_max:Float)
	_ImDrawList_PathEllipticalArcTo(this.handle, center, radius, rot, a_min, a_max)
End Function

Rem
bbdoc:  Ellipse
End Rem
Function ImDrawList_PathEllipticalArcToEx(this:TImDrawList, center:SImVec2, radius:SImVec2, rot:Float, a_min:Float, a_max:Float, num_segments:Int)
	_ImDrawList_PathEllipticalArcToEx(this.handle, center, radius, rot, a_min, a_max, num_segments)
End Function

Rem
bbdoc:  Cubic Bezier (4 control points)
End Rem
Function ImDrawList_PathBezierCubicCurveTo(this:TImDrawList, p2:SImVec2, p3:SImVec2, p4:SImVec2, num_segments:Int)
	_ImDrawList_PathBezierCubicCurveTo(this.handle, p2, p3, p4, num_segments)
End Function

Rem
bbdoc:  Quadratic Bezier (3 control points)
End Rem
Function ImDrawList_PathBezierQuadraticCurveTo(this:TImDrawList, p2:SImVec2, p3:SImVec2, num_segments:Int)
	_ImDrawList_PathBezierQuadraticCurveTo(this.handle, p2, p3, num_segments)
End Function

Function ImDrawList_PathRect(this:TImDrawList, rect_min:SImVec2, rect_max:SImVec2, rounding:Float, flags:EImDrawFlags)
	_ImDrawList_PathRect(this.handle, rect_min, rect_max, rounding, flags)
End Function

Rem
bbdoc:  Implied userdata_size = 0
End Rem
Function ImDrawList_AddCallback(this:TImDrawList, callback:Byte Ptr, userdata:Byte Ptr)
	_ImDrawList_AddCallback(this.handle, callback, userdata)
End Function

Function ImDrawList_AddCallbackEx(this:TImDrawList, callback:Byte Ptr, userdata:Byte Ptr, userdata_size:size_t)
	_ImDrawList_AddCallbackEx(this.handle, callback, userdata, userdata_size)
End Function

Rem
bbdoc:  This is useful if you need to forcefully create a new draw call (to allow for dependent rendering / blending). Otherwise primitives are merged into the same draw-call as much as possible
End Rem
Function ImDrawList_AddDrawCmd(this:TImDrawList)
	_ImDrawList_AddDrawCmd(this.handle)
End Function

Rem
bbdoc:  Create a clone of the CmdBuffer/IdxBuffer/VtxBuffer.
End Rem
Function ImDrawList_CloneOutput:TImDrawList(this:Byte Ptr)
	Return TImDrawList._Create(_ImDrawList_CloneOutput(this))
End Function

Rem
bbdoc: 
End Rem
Function ImDrawList_ChannelsSplit(this:TImDrawList, count:Int)
	_ImDrawList_ChannelsSplit(this.handle, count)
End Function

Function ImDrawList_ChannelsMerge(this:TImDrawList)
	_ImDrawList_ChannelsMerge(this.handle)
End Function

Function ImDrawList_ChannelsSetCurrent(this:TImDrawList, n:Int)
	_ImDrawList_ChannelsSetCurrent(this.handle, n)
End Function

Rem
bbdoc: 
End Rem
Function ImDrawList_PrimReserve(this:TImDrawList, idx_count:Int, vtx_count:Int)
	_ImDrawList_PrimReserve(this.handle, idx_count, vtx_count)
End Function

Function ImDrawList_PrimUnreserve(this:TImDrawList, idx_count:Int, vtx_count:Int)
	_ImDrawList_PrimUnreserve(this.handle, idx_count, vtx_count)
End Function

Rem
bbdoc:  Axis aligned rectangle (composed of two triangles)
End Rem
Function ImDrawList_PrimRect(this:TImDrawList, a:SImVec2, b:SImVec2, col:UInt)
	_ImDrawList_PrimRect(this.handle, a, b, col)
End Function

Function ImDrawList_PrimRectUV(this:TImDrawList, a:SImVec2, b:SImVec2, uv_a:SImVec2, uv_b:SImVec2, col:UInt)
	_ImDrawList_PrimRectUV(this.handle, a, b, uv_a, uv_b, col)
End Function

Function ImDrawList_PrimQuadUV(this:TImDrawList, a:SImVec2, b:SImVec2, c:SImVec2, d:SImVec2, uv_a:SImVec2, uv_b:SImVec2, uv_c:SImVec2, uv_d:SImVec2, col:UInt)
	_ImDrawList_PrimQuadUV(this.handle, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col)
End Function

Function ImDrawList_PrimWriteVtx(this:TImDrawList, pos:SImVec2, uv:SImVec2, col:UInt)
	_ImDrawList_PrimWriteVtx(this.handle, pos, uv, col)
End Function

Function ImDrawList_PrimWriteIdx(this:TImDrawList, idx:Short)
	_ImDrawList_PrimWriteIdx(this.handle, idx)
End Function

Rem
bbdoc:  Write vertex with unique index
End Rem
Function ImDrawList_PrimVtx(this:TImDrawList, pos:SImVec2, uv:SImVec2, col:UInt)
	_ImDrawList_PrimVtx(this.handle, pos, uv, col)
End Function

Rem
bbdoc: 
End Rem
Function ImDrawList__ResetForNewFrame(this:TImDrawList)
	_ImDrawList__ResetForNewFrame(this.handle)
End Function

Function ImDrawList__ClearFreeMemory(this:TImDrawList)
	_ImDrawList__ClearFreeMemory(this.handle)
End Function

Function ImDrawList__PopUnusedDrawCmd(this:TImDrawList)
	_ImDrawList__PopUnusedDrawCmd(this.handle)
End Function

Function ImDrawList__TryMergeDrawCmds(this:TImDrawList)
	_ImDrawList__TryMergeDrawCmds(this.handle)
End Function

Function ImDrawList__OnChangedClipRect(this:TImDrawList)
	_ImDrawList__OnChangedClipRect(this.handle)
End Function

Function ImDrawList__OnChangedTextureID(this:TImDrawList)
	_ImDrawList__OnChangedTextureID(this.handle)
End Function

Function ImDrawList__OnChangedVtxOffset(this:TImDrawList)
	_ImDrawList__OnChangedVtxOffset(this.handle)
End Function

Function ImDrawList__SetTextureID(this:TImDrawList, texture_id:ULong)
	_ImDrawList__SetTextureID(this.handle, texture_id)
End Function

Function ImDrawList__CalcCircleAutoSegmentCount:Int(this:Byte Ptr, radius:Float)
	Return _ImDrawList__CalcCircleAutoSegmentCount(this, radius)
End Function

Function ImDrawList__PathArcToFastEx(this:TImDrawList, center:SImVec2, radius:Float, a_min_sample:Int, a_max_sample:Int, a_step:Int)
	_ImDrawList__PathArcToFastEx(this.handle, center, radius, a_min_sample, a_max_sample, a_step)
End Function

Function ImDrawList__PathArcToN(this:TImDrawList, center:SImVec2, radius:Float, a_min:Float, a_max:Float, num_segments:Int)
	_ImDrawList__PathArcToN(this.handle, center, radius, a_min, a_max, num_segments)
End Function

Function ImDrawData_Clear(this:Byte Ptr)
	_ImDrawData_Clear(this)
End Function

Rem
bbdoc:  Helper to add an external draw list into an existing ImDrawData.
End Rem
Function ImDrawData_AddDrawList(this:Byte Ptr, draw_list:TImDrawList)
	_ImDrawData_AddDrawList(this, draw_list.handle)
End Function

Rem
bbdoc:  Helper to convert all buffers from indexed to non-indexed, in case you cannot render indexed. Note: this is slow and most likely a waste of resources. Always prefer indexed rendering!
End Rem
Function ImDrawData_DeIndexAllBuffers(this:Byte Ptr)
	_ImDrawData_DeIndexAllBuffers(this)
End Function

Rem
bbdoc:  Helper to scale the ClipRect field of each ImDrawCmd. Use if your final output buffer is at a different scale than Dear ImGui expects, or if there is a difference between your window resolution and framebuffer resolution.
End Rem
Function ImDrawData_ScaleClipRects(this:Byte Ptr, fb_scale:SImVec2)
	_ImDrawData_ScaleClipRects(this, fb_scale)
End Function

Function ImFontGlyphRangesBuilder_Clear(this:Byte Ptr)
	_ImFontGlyphRangesBuilder_Clear(this)
End Function

Rem
bbdoc:  Get bit n in the array
End Rem
Function ImFontGlyphRangesBuilder_GetBit:Int(this:Byte Ptr, n:size_t)
	Return _ImFontGlyphRangesBuilder_GetBit(this, n)
End Function

Rem
bbdoc:  Set bit n in the array
End Rem
Function ImFontGlyphRangesBuilder_SetBit(this:Byte Ptr, n:size_t)
	_ImFontGlyphRangesBuilder_SetBit(this, n)
End Function

Rem
bbdoc:  Add character
End Rem
Function ImFontGlyphRangesBuilder_AddChar(this:Byte Ptr, c:Short)
	_ImFontGlyphRangesBuilder_AddChar(this, c)
End Function

Rem
bbdoc:  Add string (each character of the UTF-8 string are added)
End Rem
Function ImFontGlyphRangesBuilder_AddText(this:Byte Ptr, text:String, text_end:String)
	_ImFontGlyphRangesBuilder_AddText(this, text, text_end)
End Function

Rem
bbdoc:  Add ranges, e.g. builder.AddRanges(ImFontAtlas::GetGlyphRangesDefault()) to force add all of ASCII/Latin+Ext
End Rem
Function ImFontGlyphRangesBuilder_AddRanges(this:Byte Ptr, ranges:Byte Ptr)
	_ImFontGlyphRangesBuilder_AddRanges(this, ranges)
End Function

Rem
bbdoc:  Output new ranges (ImVector_Construct()/ImVector_Destruct() can be used to safely construct out_ranges)
End Rem
Function ImFontGlyphRangesBuilder_BuildRanges(this:Byte Ptr, out_ranges:Byte Ptr)
	_ImFontGlyphRangesBuilder_BuildRanges(this, out_ranges)
End Function

Function ImFontAtlas_AddFont:Byte Ptr(this:TImFontAtlas, font_cfg:Byte Ptr)
	Return _ImFontAtlas_AddFont(this.handle, font_cfg)
End Function

Function ImFontAtlas_AddFontDefault:Byte Ptr(this:TImFontAtlas, font_cfg:Byte Ptr)
	Return _ImFontAtlas_AddFontDefault(this.handle, font_cfg)
End Function

Function ImFontAtlas_AddFontFromFileTTF:Byte Ptr(this:TImFontAtlas, filename:String, size_pixels:Float, font_cfg:Byte Ptr, glyph_ranges:Byte Ptr)
	Return _ImFontAtlas_AddFontFromFileTTF(this.handle, filename, size_pixels, font_cfg, glyph_ranges)
End Function

Rem
bbdoc:  Note: Transfer ownership of 'ttf_data' to ImFontAtlas! Will be deleted after destruction of the atlas. Set font_cfg->FontDataOwnedByAtlas=false to keep ownership of your data and it won't be freed.
End Rem
Function ImFontAtlas_AddFontFromMemoryTTF:Byte Ptr(this:TImFontAtlas, font_data:Byte Ptr, font_data_size:Int, size_pixels:Float, font_cfg:Byte Ptr, glyph_ranges:Byte Ptr)
	Return _ImFontAtlas_AddFontFromMemoryTTF(this.handle, font_data, font_data_size, size_pixels, font_cfg, glyph_ranges)
End Function

Rem
bbdoc:  'compressed_font_data' still owned by caller. Compress with binary_to_compressed_c.cpp.
End Rem
Function ImFontAtlas_AddFontFromMemoryCompressedTTF:Byte Ptr(this:TImFontAtlas, compressed_font_data:Byte Ptr, compressed_font_data_size:Int, size_pixels:Float, font_cfg:Byte Ptr, glyph_ranges:Byte Ptr)
	Return _ImFontAtlas_AddFontFromMemoryCompressedTTF(this.handle, compressed_font_data, compressed_font_data_size, size_pixels, font_cfg, glyph_ranges)
End Function

Rem
bbdoc:  'compressed_font_data_base85' still owned by caller. Compress with binary_to_compressed_c.cpp with -base85 parameter.
End Rem
Function ImFontAtlas_AddFontFromMemoryCompressedBase85TTF:Byte Ptr(this:TImFontAtlas, compressed_font_data_base85:String, size_pixels:Float, font_cfg:Byte Ptr, glyph_ranges:Byte Ptr)
	Return _ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(this.handle, compressed_font_data_base85, size_pixels, font_cfg, glyph_ranges)
End Function

Rem
bbdoc:  Clear input data (all ImFontConfig structures including sizes, TTF data, glyph ranges, etc.) = all the data used to build the texture and fonts.
End Rem
Function ImFontAtlas_ClearInputData(this:TImFontAtlas)
	_ImFontAtlas_ClearInputData(this.handle)
End Function

Rem
bbdoc:  Clear input+output font data (same as ClearInputData() + glyphs storage, UV coordinates).
End Rem
Function ImFontAtlas_ClearFonts(this:TImFontAtlas)
	_ImFontAtlas_ClearFonts(this.handle)
End Function

Rem
bbdoc:  Clear output texture data (CPU side). Saves RAM once the texture has been copied to graphics memory.
End Rem
Function ImFontAtlas_ClearTexData(this:TImFontAtlas)
	_ImFontAtlas_ClearTexData(this.handle)
End Function

Rem
bbdoc:  Clear all input and output.
End Rem
Function ImFontAtlas_Clear(this:TImFontAtlas)
	_ImFontAtlas_Clear(this.handle)
End Function

Rem
bbdoc:  Build pixels data. This is called automatically for you by the GetTexData*** functions.
End Rem
Function ImFontAtlas_Build:Int(this:TImFontAtlas)
	Return _ImFontAtlas_Build(this.handle)
End Function

Rem
bbdoc:  1 byte per-pixel
End Rem
Function ImFontAtlas_GetTexDataAsAlpha8(this:TImFontAtlas, out_pixels:Byte Ptr, out_width:Int Var, out_height:Int Var, out_bytes_per_pixel:Int Var)
	_ImFontAtlas_GetTexDataAsAlpha8(this.handle, out_pixels, out_width, out_height, out_bytes_per_pixel)
End Function

Rem
bbdoc:  4 bytes-per-pixel
End Rem
Function ImFontAtlas_GetTexDataAsRGBA32(this:TImFontAtlas, out_pixels:Byte Ptr, out_width:Int Var, out_height:Int Var, out_bytes_per_pixel:Int Var)
	_ImFontAtlas_GetTexDataAsRGBA32(this.handle, out_pixels, out_width, out_height, out_bytes_per_pixel)
End Function

Rem
bbdoc:  Bit ambiguous: used to detect when user didn't build texture but effectively we should check TexID != 0 except that would be backend dependent...
End Rem
Function ImFontAtlas_IsBuilt:Int(this:Byte Ptr)
	Return _ImFontAtlas_IsBuilt(this)
End Function

Function ImFontAtlas_SetTexID(this:TImFontAtlas, id:ULong)
	_ImFontAtlas_SetTexID(this.handle, id)
End Function

Rem
bbdoc:  Basic Latin, Extended Latin
End Rem
Function ImFontAtlas_GetGlyphRangesDefault:Byte Ptr(this:TImFontAtlas)
	Return _ImFontAtlas_GetGlyphRangesDefault(this.handle)
End Function

Rem
bbdoc:  Default + Greek and Coptic
End Rem
Function ImFontAtlas_GetGlyphRangesGreek:Byte Ptr(this:TImFontAtlas)
	Return _ImFontAtlas_GetGlyphRangesGreek(this.handle)
End Function

Rem
bbdoc:  Default + Korean characters
End Rem
Function ImFontAtlas_GetGlyphRangesKorean:Byte Ptr(this:TImFontAtlas)
	Return _ImFontAtlas_GetGlyphRangesKorean(this.handle)
End Function

Rem
bbdoc:  Default + Hiragana, Katakana, Half-Width, Selection of 2999 Ideographs
End Rem
Function ImFontAtlas_GetGlyphRangesJapanese:Byte Ptr(this:TImFontAtlas)
	Return _ImFontAtlas_GetGlyphRangesJapanese(this.handle)
End Function

Rem
bbdoc:  Default + Half-Width + Japanese Hiragana/Katakana + full set of about 21000 CJK Unified Ideographs
End Rem
Function ImFontAtlas_GetGlyphRangesChineseFull:Byte Ptr(this:TImFontAtlas)
	Return _ImFontAtlas_GetGlyphRangesChineseFull(this.handle)
End Function

Rem
bbdoc:  Default + Half-Width + Japanese Hiragana/Katakana + set of 2500 CJK Unified Ideographs for common simplified Chinese
End Rem
Function ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon:Byte Ptr(this:TImFontAtlas)
	Return _ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(this.handle)
End Function

Rem
bbdoc:  Default + about 400 Cyrillic characters
End Rem
Function ImFontAtlas_GetGlyphRangesCyrillic:Byte Ptr(this:TImFontAtlas)
	Return _ImFontAtlas_GetGlyphRangesCyrillic(this.handle)
End Function

Rem
bbdoc:  Default + Thai characters
End Rem
Function ImFontAtlas_GetGlyphRangesThai:Byte Ptr(this:TImFontAtlas)
	Return _ImFontAtlas_GetGlyphRangesThai(this.handle)
End Function

Rem
bbdoc:  Default + Vietnamese characters
End Rem
Function ImFontAtlas_GetGlyphRangesVietnamese:Byte Ptr(this:TImFontAtlas)
	Return _ImFontAtlas_GetGlyphRangesVietnamese(this.handle)
End Function

Rem
bbdoc: 
End Rem
Function ImFontAtlas_AddCustomRectRegular:Int(this:TImFontAtlas, width:Int, height:Int)
	Return _ImFontAtlas_AddCustomRectRegular(this.handle, width, height)
End Function

Function ImFontAtlas_AddCustomRectFontGlyph:Int(this:TImFontAtlas, font:TImFont, id:Short, width:Int, height:Int, advance_x:Float, offset:SImVec2)
	Return _ImFontAtlas_AddCustomRectFontGlyph(this.handle, font.handle, id, width, height, advance_x, offset)
End Function

Function ImFontAtlas_GetCustomRectByIndex:Byte Ptr(this:TImFontAtlas, index:Int)
	Return _ImFontAtlas_GetCustomRectByIndex(this.handle, index)
End Function

Function ImFont_FindGlyph:Byte Ptr(this:TImFont, c:Short)
	Return _ImFont_FindGlyph(this.handle, c)
End Function

Function ImFont_FindGlyphNoFallback:Byte Ptr(this:TImFont, c:Short)
	Return _ImFont_FindGlyphNoFallback(this.handle, c)
End Function

Function ImFont_GetCharAdvance:Float(this:TImFont, c:Short)
	Return _ImFont_GetCharAdvance(this.handle, c)
End Function

Function ImFont_IsLoaded:Int(this:Byte Ptr)
	Return _ImFont_IsLoaded(this)
End Function

Function ImFont_GetDebugName:String(this:Byte Ptr)
	Return _ImFont_GetDebugName(this)
End Function

Rem
bbdoc: 
End Rem
Function ImGuiViewport_GetCenter:SImVec2(this:Byte Ptr)
	Return _ImGuiViewport_GetCenter(this)
End Function

Function ImGuiViewport_GetWorkCenter:SImVec2(this:Byte Ptr)
	Return _ImGuiViewport_GetWorkCenter(this)
End Function


Private
Extern
	Function _ImGui_InputText:Int(label:String, buf:String Var, buf_size:size_t, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputText"

	Function bmx_imgui_io_get_display_size:SImVec2(handle:Byte Ptr)
	Function bmx_imgui_io_get_delta_time:Float(handle:Byte Ptr)
	Function bmx_imgui_io_get_ini_saving_rate:Float(handle:Byte Ptr)
	Function bmx_imgui_io_get_ini_filename:String(handle:Byte Ptr)
	Function bmx_imgui_io_set_ini_filename(handle:Byte Ptr, filename:String)
	Function bmx_imgui_io_get_log_filename:String(handle:Byte Ptr)
	Function bmx_imgui_io_set_log_filename(handle:Byte Ptr, filename:String)
	Function bmx_imgui_io_get_want_capture_mouse:Int(handle:Byte Ptr)
	Function bmx_imgui_io_get_want_capture_keyboard:Int(handle:Byte Ptr)
	Function bmx_imgui_io_get_want_text_input:Int(handle:Byte Ptr)
	Function bmx_imgui_io_get_want_set_mouse_pos:Int(handle:Byte Ptr)
	Function bmx_imgui_io_get_want_save_ini_settings:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_want_save_ini_settings(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_nav_active:Int(handle:Byte Ptr)
	Function bmx_imgui_io_get_nav_visible:Int(handle:Byte Ptr)
	Function bmx_imgui_io_get_framerate:Float(handle:Byte Ptr)
	Function bmx_imgui_io_get_metrics_render_vertices:Int(handle:Byte Ptr)
	Function bmx_imgui_io_get_metrics_render_indices:Int(handle:Byte Ptr)
	Function bmx_imgui_io_get_metrics_render_windows:Int(handle:Byte Ptr)
	Function bmx_imgui_io_get_metrics_active_windows:Int(handle:Byte Ptr)
	Function bmx_imgui_io_get_mouse_delta:SImVec2(handle:Byte Ptr)
	Function bmx_imgui_io_get_font_global_scale:Float(handle:Byte Ptr)
	Function bmx_imgui_io_set_font_global_scale(handle:Byte Ptr, scale:Float)
	Function bmx_imgui_io_get_display_framebuffer_scale:SImVec2(handle:Byte Ptr)
	Function bmx_imgui_io_set_display_framebuffer_scale(handle:Byte Ptr, scale:SImVec2)
	Function bmx_imgui_io_get_config_nav_swap_gamepad_buttons:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_nav_swap_gamepad_buttons(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_nav_move_set_mouse_pos:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_nav_move_set_mouse_pos(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_nav_capture_keyboard:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_nav_capture_keyboard(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_nav_escape_clear_focus_item:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_nav_escape_clear_focus_item(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_nav_escape_clear_focus_window:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_nav_escape_clear_focus_window(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_nav_cursor_visible_auto:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_nav_cursor_visible_auto(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_nav_cursor_visible_always:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_nav_cursor_visible_always(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_mouse_draw_cursor:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_mouse_draw_cursor(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_macosx_behaviors:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_macosx_behaviors(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_input_trickle_event_queue:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_input_trickle_event_queue(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_input_text_cursor_blink:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_input_text_cursor_blink(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_input_text_enter_keep_active:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_input_text_enter_keep_active(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_drag_click_to_input_text:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_drag_click_to_input_text(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_windows_resize_from_edges:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_windows_resize_from_edges(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_windows_move_from_title_bar_only:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_windows_move_from_title_bar_only(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_windows_copy_contents_with_ctrlc:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_windows_copy_contents_with_ctrlc(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_scrollbar_scroll_by_page:Int(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_scrollbar_scroll_by_page(handle:Byte Ptr, value:Int)
	Function bmx_imgui_io_get_config_memory_compact_timer:Float(handle:Byte Ptr)
	Function bmx_imgui_io_set_config_memory_compact_timer(handle:Byte Ptr, value:Float)
	Function bmx_imgui_io_get_mouse_double_click_time:Float(handle:Byte Ptr)
	Function bmx_imgui_io_set_mouse_double_click_time(handle:Byte Ptr, value:Float)
	Function bmx_imgui_io_get_mouse_double_click_max_dist:Float(handle:Byte Ptr)
	Function bmx_imgui_io_set_mouse_double_click_max_dist(handle:Byte Ptr, value:Float)
	Function bmx_imgui_io_get_mouse_drag_threshold:Float(handle:Byte Ptr)
	Function bmx_imgui_io_set_mouse_drag_threshold(handle:Byte Ptr, value:Float)
	Function bmx_imgui_io_get_key_repeat_delay:Float(handle:Byte Ptr)
	Function bmx_imgui_io_set_key_repeat_delay(handle:Byte Ptr, value:Float)
	Function bmx_imgui_io_get_key_repeat_rate:Float(handle:Byte Ptr)
	Function bmx_imgui_io_set_key_repeat_rate(handle:Byte Ptr, value:Float)

	Function _ImGui_CreateContext:Byte Ptr(shared_font_atlas:Byte Ptr) = "ImGui_CreateContext"
	Function _ImGui_DestroyContext(ctx:Byte Ptr) = "ImGui_DestroyContext"
	Function _ImGui_GetCurrentContext:Byte Ptr() = "ImGui_GetCurrentContext"
	Function _ImGui_SetCurrentContext(ctx:Byte Ptr) = "ImGui_SetCurrentContext"
	Function _ImGui_GetIO:Byte Ptr() = "ImGui_GetIO"
	Function _ImGui_GetPlatformIO:Byte Ptr() = "ImGui_GetPlatformIO"
	Function _ImGui_GetStyle:Byte Ptr() = "ImGui_GetStyle"
	Function _ImGui_NewFrame() = "ImGui_NewFrame"
	Function _ImGui_EndFrame() = "ImGui_EndFrame"
	Function _ImGui_Render() = "ImGui_Render"
	Function _ImGui_GetDrawData:Byte Ptr() = "ImGui_GetDrawData"
	Function _ImGui_ShowDemoWindow(p_open:Int Var) = "ImGui_ShowDemoWindow"
	Function _ImGui_ShowMetricsWindow(p_open:Int Var) = "ImGui_ShowMetricsWindow"
	Function _ImGui_ShowDebugLogWindow(p_open:Int Var) = "ImGui_ShowDebugLogWindow"
	Function _ImGui_ShowIDStackToolWindow() = "ImGui_ShowIDStackToolWindow"
	Function _ImGui_ShowIDStackToolWindowEx(p_open:Int Var) = "ImGui_ShowIDStackToolWindowEx"
	Function _ImGui_ShowAboutWindow(p_open:Int Var) = "ImGui_ShowAboutWindow"
	Function _ImGui_ShowStyleEditor(ref:Byte Ptr) = "ImGui_ShowStyleEditor"
	Function _ImGui_ShowStyleSelector:Int(label:String) = "bmx_ImGui_ShowStyleSelector"
	Function _ImGui_ShowFontSelector(label:String) = "bmx_ImGui_ShowFontSelector"
	Function _ImGui_ShowUserGuide() = "ImGui_ShowUserGuide"
	Function _ImGui_GetVersion:String() = "bmx_ImGui_GetVersion"
	Function _ImGui_StyleColorsDark(dst:Byte Ptr) = "ImGui_StyleColorsDark"
	Function _ImGui_StyleColorsLight(dst:Byte Ptr) = "ImGui_StyleColorsLight"
	Function _ImGui_StyleColorsClassic(dst:Byte Ptr) = "ImGui_StyleColorsClassic"
	Function _ImGui_Begin:Int(name:String, p_open:Int Var, flags:EImGuiWindowFlags) = "bmx_ImGui_Begin"
	Function _ImGui_End() = "ImGui_End"
	Function _ImGui_BeginChild:Int(str_id:String, size:SImVec2, child_flags:EImGuiChildFlags, window_flags:EImGuiWindowFlags) = "bmx_ImGui_BeginChild"
	Function _ImGui_BeginChildID:Int(id:UInt, size:SImVec2, child_flags:EImGuiChildFlags, window_flags:EImGuiWindowFlags) = "ImGui_BeginChildID"
	Function _ImGui_EndChild() = "ImGui_EndChild"
	Function _ImGui_IsWindowAppearing:Int() = "ImGui_IsWindowAppearing"
	Function _ImGui_IsWindowCollapsed:Int() = "ImGui_IsWindowCollapsed"
	Function _ImGui_IsWindowFocused:Int(flags:EImGuiFocusedFlags) = "ImGui_IsWindowFocused"
	Function _ImGui_IsWindowHovered:Int(flags:EImGuiHoveredFlags) = "ImGui_IsWindowHovered"
	Function _ImGui_GetWindowDrawList:Byte Ptr() = "ImGui_GetWindowDrawList"
	Function _ImGui_GetWindowPos:SImVec2() = "ImGui_GetWindowPos"
	Function _ImGui_GetWindowSize:SImVec2() = "ImGui_GetWindowSize"
	Function _ImGui_GetWindowWidth:Float() = "ImGui_GetWindowWidth"
	Function _ImGui_GetWindowHeight:Float() = "ImGui_GetWindowHeight"
	Function _ImGui_SetNextWindowPos(pos:SImVec2, cond:EImGuiCond) = "ImGui_SetNextWindowPos"
	Function _ImGui_SetNextWindowPosEx(pos:SImVec2, cond:EImGuiCond, pivot:SImVec2) = "ImGui_SetNextWindowPosEx"
	Function _ImGui_SetNextWindowSize(size:SImVec2, cond:EImGuiCond) = "ImGui_SetNextWindowSize"
	Function _ImGui_SetNextWindowSizeConstraints(size_min:SImVec2, size_max:SImVec2, custom_callback:Byte Ptr, custom_callback_data:Byte Ptr) = "ImGui_SetNextWindowSizeConstraints"
	Function _ImGui_SetNextWindowContentSize(size:SImVec2) = "ImGui_SetNextWindowContentSize"
	Function _ImGui_SetNextWindowCollapsed(collapsed:Int, cond:EImGuiCond) = "ImGui_SetNextWindowCollapsed"
	Function _ImGui_SetNextWindowFocus() = "ImGui_SetNextWindowFocus"
	Function _ImGui_SetNextWindowScroll(scroll:SImVec2) = "ImGui_SetNextWindowScroll"
	Function _ImGui_SetNextWindowBgAlpha(alpha:Float) = "ImGui_SetNextWindowBgAlpha"
	Function _ImGui_SetWindowPos(pos:SImVec2, cond:EImGuiCond) = "ImGui_SetWindowPos"
	Function _ImGui_SetWindowSize(size:SImVec2, cond:EImGuiCond) = "ImGui_SetWindowSize"
	Function _ImGui_SetWindowCollapsed(collapsed:Int, cond:EImGuiCond) = "ImGui_SetWindowCollapsed"
	Function _ImGui_SetWindowFocus() = "ImGui_SetWindowFocus"
	Function _ImGui_SetWindowFontScale(scale:Float) = "ImGui_SetWindowFontScale"
	Function _ImGui_SetWindowPosStr(name:String, pos:SImVec2, cond:EImGuiCond) = "bmx_ImGui_SetWindowPosStr"
	Function _ImGui_SetWindowSizeStr(name:String, size:SImVec2, cond:EImGuiCond) = "bmx_ImGui_SetWindowSizeStr"
	Function _ImGui_SetWindowCollapsedStr(name:String, collapsed:Int, cond:EImGuiCond) = "bmx_ImGui_SetWindowCollapsedStr"
	Function _ImGui_SetWindowFocusStr(name:String) = "bmx_ImGui_SetWindowFocusStr"
	Function _ImGui_GetScrollX:Float() = "ImGui_GetScrollX"
	Function _ImGui_GetScrollY:Float() = "ImGui_GetScrollY"
	Function _ImGui_SetScrollX(scroll_x:Float) = "ImGui_SetScrollX"
	Function _ImGui_SetScrollY(scroll_y:Float) = "ImGui_SetScrollY"
	Function _ImGui_GetScrollMaxX:Float() = "ImGui_GetScrollMaxX"
	Function _ImGui_GetScrollMaxY:Float() = "ImGui_GetScrollMaxY"
	Function _ImGui_SetScrollHereX(center_x_ratio:Float) = "ImGui_SetScrollHereX"
	Function _ImGui_SetScrollHereY(center_y_ratio:Float) = "ImGui_SetScrollHereY"
	Function _ImGui_SetScrollFromPosX(local_x:Float, center_x_ratio:Float) = "ImGui_SetScrollFromPosX"
	Function _ImGui_SetScrollFromPosY(local_y:Float, center_y_ratio:Float) = "ImGui_SetScrollFromPosY"
	Function _ImGui_PushFont(font:Byte Ptr) = "ImGui_PushFont"
	Function _ImGui_PopFont() = "ImGui_PopFont"
	Function _ImGui_PushStyleColor(idx:EImGuiCol, col:UInt) = "ImGui_PushStyleColor"
	Function _ImGui_PushStyleColorImVec4(idx:EImGuiCol, col:SImVec4) = "ImGui_PushStyleColorImVec4"
	Function _ImGui_PopStyleColor() = "ImGui_PopStyleColor"
	Function _ImGui_PopStyleColorEx(count:Int) = "ImGui_PopStyleColorEx"
	Function _ImGui_PushStyleVar(idx:EImGuiStyleVar, val:Float) = "ImGui_PushStyleVar"
	Function _ImGui_PushStyleVarImVec2(idx:EImGuiStyleVar, val:SImVec2) = "ImGui_PushStyleVarImVec2"
	Function _ImGui_PushStyleVarX(idx:EImGuiStyleVar, val_x:Float) = "ImGui_PushStyleVarX"
	Function _ImGui_PushStyleVarY(idx:EImGuiStyleVar, val_y:Float) = "ImGui_PushStyleVarY"
	Function _ImGui_PopStyleVar() = "ImGui_PopStyleVar"
	Function _ImGui_PopStyleVarEx(count:Int) = "ImGui_PopStyleVarEx"
	Function _ImGui_PushItemFlag(option:EImGuiItemFlags, enabled:Int) = "ImGui_PushItemFlag"
	Function _ImGui_PopItemFlag() = "ImGui_PopItemFlag"
	Function _ImGui_PushItemWidth(item_width:Float) = "ImGui_PushItemWidth"
	Function _ImGui_PopItemWidth() = "ImGui_PopItemWidth"
	Function _ImGui_SetNextItemWidth(item_width:Float) = "ImGui_SetNextItemWidth"
	Function _ImGui_CalcItemWidth:Float() = "ImGui_CalcItemWidth"
	Function _ImGui_PushTextWrapPos(wrap_local_pos_x:Float) = "ImGui_PushTextWrapPos"
	Function _ImGui_PopTextWrapPos() = "ImGui_PopTextWrapPos"
	Function _ImGui_GetFont:Byte Ptr() = "ImGui_GetFont"
	Function _ImGui_GetFontSize:Float() = "ImGui_GetFontSize"
	Function _ImGui_GetFontTexUvWhitePixel:SImVec2() = "ImGui_GetFontTexUvWhitePixel"
	Function _ImGui_GetColorU32:UInt(idx:EImGuiCol) = "ImGui_GetColorU32"
	Function _ImGui_GetColorU32Ex:UInt(idx:EImGuiCol, alpha_mul:Float) = "ImGui_GetColorU32Ex"
	Function _ImGui_GetColorU32ImVec4:UInt(col:SImVec4) = "ImGui_GetColorU32ImVec4"
	Function _ImGui_GetColorU32ImU32:UInt(col:UInt) = "ImGui_GetColorU32ImU32"
	Function _ImGui_GetColorU32ImU32Ex:UInt(col:UInt, alpha_mul:Float) = "ImGui_GetColorU32ImU32Ex"
	Function _ImGui_GetStyleColorVec4:Byte Ptr(idx:EImGuiCol) = "ImGui_GetStyleColorVec4"
	Function _ImGui_GetCursorScreenPos:SImVec2() = "ImGui_GetCursorScreenPos"
	Function _ImGui_SetCursorScreenPos(pos:SImVec2) = "ImGui_SetCursorScreenPos"
	Function _ImGui_GetContentRegionAvail:SImVec2() = "ImGui_GetContentRegionAvail"
	Function _ImGui_GetCursorPos:SImVec2() = "ImGui_GetCursorPos"
	Function _ImGui_GetCursorPosX:Float() = "ImGui_GetCursorPosX"
	Function _ImGui_GetCursorPosY:Float() = "ImGui_GetCursorPosY"
	Function _ImGui_SetCursorPos(local_pos:SImVec2) = "ImGui_SetCursorPos"
	Function _ImGui_SetCursorPosX(local_x:Float) = "ImGui_SetCursorPosX"
	Function _ImGui_SetCursorPosY(local_y:Float) = "ImGui_SetCursorPosY"
	Function _ImGui_GetCursorStartPos:SImVec2() = "ImGui_GetCursorStartPos"
	Function _ImGui_Separator() = "ImGui_Separator"
	Function _ImGui_SameLine() = "ImGui_SameLine"
	Function _ImGui_SameLineEx(offset_from_start_x:Float, spacing:Float) = "ImGui_SameLineEx"
	Function _ImGui_NewLine() = "ImGui_NewLine"
	Function _ImGui_Spacing() = "ImGui_Spacing"
	Function _ImGui_Dummy(size:SImVec2) = "ImGui_Dummy"
	Function _ImGui_Indent() = "ImGui_Indent"
	Function _ImGui_IndentEx(indent_w:Float) = "ImGui_IndentEx"
	Function _ImGui_Unindent() = "ImGui_Unindent"
	Function _ImGui_UnindentEx(indent_w:Float) = "ImGui_UnindentEx"
	Function _ImGui_BeginGroup() = "ImGui_BeginGroup"
	Function _ImGui_EndGroup() = "ImGui_EndGroup"
	Function _ImGui_AlignTextToFramePadding() = "ImGui_AlignTextToFramePadding"
	Function _ImGui_GetTextLineHeight:Float() = "ImGui_GetTextLineHeight"
	Function _ImGui_GetTextLineHeightWithSpacing:Float() = "ImGui_GetTextLineHeightWithSpacing"
	Function _ImGui_GetFrameHeight:Float() = "ImGui_GetFrameHeight"
	Function _ImGui_GetFrameHeightWithSpacing:Float() = "ImGui_GetFrameHeightWithSpacing"
	Function _ImGui_PushID(str_id:String) = "bmx_ImGui_PushID"
	Function _ImGui_PushIDStr(str_id_begin:String, str_id_end:String) = "bmx_ImGui_PushIDStr"
	Function _ImGui_PushIDPtr(ptr_id:Byte Ptr) = "ImGui_PushIDPtr"
	Function _ImGui_PushIDInt(int_id:Int) = "ImGui_PushIDInt"
	Function _ImGui_PopID() = "ImGui_PopID"
	Function _ImGui_GetID:UInt(str_id:String) = "bmx_ImGui_GetID"
	Function _ImGui_GetIDStr:UInt(str_id_begin:String, str_id_end:String) = "bmx_ImGui_GetIDStr"
	Function _ImGui_GetIDPtr:UInt(ptr_id:Byte Ptr) = "ImGui_GetIDPtr"
	Function _ImGui_GetIDInt:UInt(int_id:Int) = "ImGui_GetIDInt"
	Function _ImGui_TextUnformatted(text:String) = "bmx_ImGui_TextUnformatted"
	Function _ImGui_TextUnformattedEx(text:String, text_end:String) = "bmx_ImGui_TextUnformattedEx"
	Function _ImGui_Text(fmt:String) = "bmx_ImGui_Text"
	Function _ImGui_TextV(fmt:String) = "bmx_ImGui_TextV"
	Function _ImGui_TextColored(col:SImVec4, fmt:String) = "bmx_ImGui_TextColored"
	Function _ImGui_TextColoredV(col:SImVec4, fmt:String) = "bmx_ImGui_TextColoredV"
	Function _ImGui_TextDisabled(fmt:String) = "bmx_ImGui_TextDisabled"
	Function _ImGui_TextDisabledV(fmt:String) = "bmx_ImGui_TextDisabledV"
	Function _ImGui_TextWrapped(fmt:String) = "bmx_ImGui_TextWrapped"
	Function _ImGui_TextWrappedV(fmt:String) = "bmx_ImGui_TextWrappedV"
	Function _ImGui_LabelText(label:String, fmt:String) = "bmx_ImGui_LabelText"
	Function _ImGui_LabelTextV(label:String, fmt:String) = "bmx_ImGui_LabelTextV"
	Function _ImGui_BulletText(fmt:String) = "bmx_ImGui_BulletText"
	Function _ImGui_BulletTextV(fmt:String) = "bmx_ImGui_BulletTextV"
	Function _ImGui_SeparatorText(label:String) = "bmx_ImGui_SeparatorText"
	Function _ImGui_Button:Int(label:String) = "bmx_ImGui_Button"
	Function _ImGui_ButtonEx:Int(label:String, size:SImVec2) = "bmx_ImGui_ButtonEx"
	Function _ImGui_SmallButton:Int(label:String) = "bmx_ImGui_SmallButton"
	Function _ImGui_InvisibleButton:Int(str_id:String, size:SImVec2, flags:EImGuiButtonFlags) = "bmx_ImGui_InvisibleButton"
	Function _ImGui_ArrowButton:Int(str_id:String, dir:EImGuiDir) = "bmx_ImGui_ArrowButton"
	Function _ImGui_Checkbox:Int(label:String, v:Int Var) = "bmx_ImGui_Checkbox"
	Function _ImGui_CheckboxFlagsIntPtr:Int(label:String, flags:Int Var, flags_value:Int) = "bmx_ImGui_CheckboxFlagsIntPtr"
	Function _ImGui_CheckboxFlagsUintPtr:Int(label:String, flags:UInt Var, flags_value:UInt) = "bmx_ImGui_CheckboxFlagsUintPtr"
	Function _ImGui_RadioButton:Int(label:String, active:Int) = "bmx_ImGui_RadioButton"
	Function _ImGui_RadioButtonIntPtr:Int(label:String, v:Int Var, v_button:Int) = "bmx_ImGui_RadioButtonIntPtr"
	Function _ImGui_ProgressBar(fraction:Float, size_arg:SImVec2, overlay:String) = "bmx_ImGui_ProgressBar"
	Function _ImGui_Bullet() = "ImGui_Bullet"
	Function _ImGui_TextLink:Int(label:String) = "bmx_ImGui_TextLink"
	Function _ImGui_TextLinkOpenURL(label:String) = "bmx_ImGui_TextLinkOpenURL"
	Function _ImGui_TextLinkOpenURLEx(label:String, url:String) = "bmx_ImGui_TextLinkOpenURLEx"
	Function _ImGui_Image(user_texture_id:ULong, image_size:SImVec2) = "ImGui_Image"
	Function _ImGui_ImageEx(user_texture_id:ULong, image_size:SImVec2, uv0:SImVec2, uv1:SImVec2) = "ImGui_ImageEx"
	Function _ImGui_ImageWithBg(user_texture_id:ULong, image_size:SImVec2) = "ImGui_ImageWithBg"
	Function _ImGui_ImageWithBgEx(user_texture_id:ULong, image_size:SImVec2, uv0:SImVec2, uv1:SImVec2, bg_col:SImVec4, tint_col:SImVec4) = "ImGui_ImageWithBgEx"
	Function _ImGui_ImageButton:Int(str_id:String, user_texture_id:ULong, image_size:SImVec2) = "bmx_ImGui_ImageButton"
	Function _ImGui_ImageButtonEx:Int(str_id:String, user_texture_id:ULong, image_size:SImVec2, uv0:SImVec2, uv1:SImVec2, bg_col:SImVec4, tint_col:SImVec4) = "bmx_ImGui_ImageButtonEx"
	Function _ImGui_BeginCombo:Int(label:String, preview_value:String, flags:EImGuiComboFlags) = "bmx_ImGui_BeginCombo"
	Function _ImGui_EndCombo() = "ImGui_EndCombo"
	Function _ImGui_ComboChar:Int(label:String, current_item:Int Var, items:String[], items_count:Int) = "bmx_ImGui_ComboChar"
	Function _ImGui_ComboCharEx:Int(label:String, current_item:Int Var, items:String[], items_count:Int, popup_max_height_in_items:Int) = "bmx_ImGui_ComboCharEx"
	Function _ImGui_Combo:Int(label:String, current_item:Int Var, items_separated_by_zeros:String) = "bmx_ImGui_Combo"
	Function _ImGui_ComboEx:Int(label:String, current_item:Int Var, items_separated_by_zeros:String, popup_max_height_in_items:Int) = "bmx_ImGui_ComboEx"
	Function _ImGui_ComboCallback:Int(label:String, current_item:Int Var, getter:Byte Ptr, user_data:Byte Ptr, items_count:Int) = "bmx_ImGui_ComboCallback"
	Function _ImGui_ComboCallbackEx:Int(label:String, current_item:Int Var, getter:Byte Ptr, user_data:Byte Ptr, items_count:Int, popup_max_height_in_items:Int) = "bmx_ImGui_ComboCallbackEx"
	Function _ImGui_DragFloat:Int(label:String, v:Float Var) = "bmx_ImGui_DragFloat"
	Function _ImGui_DragFloatEx:Int(label:String, v:Float Var, v_speed:Float, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragFloatEx"
	Function _ImGui_DragFloat2:Int(label:String, StaticArray v:float[2]) = "bmx_ImGui_DragFloat2"
	Function _ImGui_DragFloat2Ex:Int(label:String, StaticArray v:float[2], v_speed:Float, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragFloat2Ex"
	Function _ImGui_DragFloat3:Int(label:String, StaticArray v:float[3]) = "bmx_ImGui_DragFloat3"
	Function _ImGui_DragFloat3Ex:Int(label:String, StaticArray v:float[3], v_speed:Float, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragFloat3Ex"
	Function _ImGui_DragFloat4:Int(label:String, StaticArray v:float[4]) = "bmx_ImGui_DragFloat4"
	Function _ImGui_DragFloat4Ex:Int(label:String, StaticArray v:float[4], v_speed:Float, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragFloat4Ex"
	Function _ImGui_DragFloatRange2:Int(label:String, v_current_min:Float Var, v_current_max:Float Var) = "bmx_ImGui_DragFloatRange2"
	Function _ImGui_DragFloatRange2Ex:Int(label:String, v_current_min:Float Var, v_current_max:Float Var, v_speed:Float, v_min:Float, v_max:Float, format:String, format_max:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragFloatRange2Ex"
	Function _ImGui_DragInt:Int(label:String, v:Int Var) = "bmx_ImGui_DragInt"
	Function _ImGui_DragIntEx:Int(label:String, v:Int Var, v_speed:Float, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragIntEx"
	Function _ImGui_DragInt2:Int(label:String, StaticArray v:int[2]) = "bmx_ImGui_DragInt2"
	Function _ImGui_DragInt2Ex:Int(label:String, StaticArray v:int[2], v_speed:Float, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragInt2Ex"
	Function _ImGui_DragInt3:Int(label:String, StaticArray v:int[3]) = "bmx_ImGui_DragInt3"
	Function _ImGui_DragInt3Ex:Int(label:String, StaticArray v:int[3], v_speed:Float, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragInt3Ex"
	Function _ImGui_DragInt4:Int(label:String, StaticArray v:int[4]) = "bmx_ImGui_DragInt4"
	Function _ImGui_DragInt4Ex:Int(label:String, StaticArray v:int[4], v_speed:Float, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragInt4Ex"
	Function _ImGui_DragIntRange2:Int(label:String, v_current_min:Int Var, v_current_max:Int Var) = "bmx_ImGui_DragIntRange2"
	Function _ImGui_DragIntRange2Ex:Int(label:String, v_current_min:Int Var, v_current_max:Int Var, v_speed:Float, v_min:Int, v_max:Int, format:String, format_max:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragIntRange2Ex"
	Function _ImGui_DragScalar:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr) = "bmx_ImGui_DragScalar"
	Function _ImGui_DragScalarEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, v_speed:Float, p_min:Byte Ptr, p_max:Byte Ptr, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragScalarEx"
	Function _ImGui_DragScalarN:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int) = "bmx_ImGui_DragScalarN"
	Function _ImGui_DragScalarNEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int, v_speed:Float, p_min:Byte Ptr, p_max:Byte Ptr, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_DragScalarNEx"
	Function _ImGui_SliderFloat:Int(label:String, v:Float Var, v_min:Float, v_max:Float) = "bmx_ImGui_SliderFloat"
	Function _ImGui_SliderFloatEx:Int(label:String, v:Float Var, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderFloatEx"
	Function _ImGui_SliderFloat2:Int(label:String, StaticArray v:float[2], v_min:Float, v_max:Float) = "bmx_ImGui_SliderFloat2"
	Function _ImGui_SliderFloat2Ex:Int(label:String, StaticArray v:float[2], v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderFloat2Ex"
	Function _ImGui_SliderFloat3:Int(label:String, StaticArray v:float[3], v_min:Float, v_max:Float) = "bmx_ImGui_SliderFloat3"
	Function _ImGui_SliderFloat3Ex:Int(label:String, StaticArray v:float[3], v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderFloat3Ex"
	Function _ImGui_SliderFloat4:Int(label:String, StaticArray v:float[4], v_min:Float, v_max:Float) = "bmx_ImGui_SliderFloat4"
	Function _ImGui_SliderFloat4Ex:Int(label:String, StaticArray v:float[4], v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderFloat4Ex"
	Function _ImGui_SliderAngle:Int(label:String, v_rad:Float Var) = "bmx_ImGui_SliderAngle"
	Function _ImGui_SliderAngleEx:Int(label:String, v_rad:Float Var, v_degrees_min:Float, v_degrees_max:Float, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderAngleEx"
	Function _ImGui_SliderInt:Int(label:String, v:Int Var, v_min:Int, v_max:Int) = "bmx_ImGui_SliderInt"
	Function _ImGui_SliderIntEx:Int(label:String, v:Int Var, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderIntEx"
	Function _ImGui_SliderInt2:Int(label:String, StaticArray v:int[2], v_min:Int, v_max:Int) = "bmx_ImGui_SliderInt2"
	Function _ImGui_SliderInt2Ex:Int(label:String, StaticArray v:int[2], v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderInt2Ex"
	Function _ImGui_SliderInt3:Int(label:String, StaticArray v:int[3], v_min:Int, v_max:Int) = "bmx_ImGui_SliderInt3"
	Function _ImGui_SliderInt3Ex:Int(label:String, StaticArray v:int[3], v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderInt3Ex"
	Function _ImGui_SliderInt4:Int(label:String, StaticArray v:int[4], v_min:Int, v_max:Int) = "bmx_ImGui_SliderInt4"
	Function _ImGui_SliderInt4Ex:Int(label:String, StaticArray v:int[4], v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderInt4Ex"
	Function _ImGui_SliderScalar:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, p_min:Byte Ptr, p_max:Byte Ptr) = "bmx_ImGui_SliderScalar"
	Function _ImGui_SliderScalarEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, p_min:Byte Ptr, p_max:Byte Ptr, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderScalarEx"
	Function _ImGui_SliderScalarN:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int, p_min:Byte Ptr, p_max:Byte Ptr) = "bmx_ImGui_SliderScalarN"
	Function _ImGui_SliderScalarNEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int, p_min:Byte Ptr, p_max:Byte Ptr, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_SliderScalarNEx"
	Function _ImGui_VSliderFloat:Int(label:String, size:SImVec2, v:Float Var, v_min:Float, v_max:Float) = "bmx_ImGui_VSliderFloat"
	Function _ImGui_VSliderFloatEx:Int(label:String, size:SImVec2, v:Float Var, v_min:Float, v_max:Float, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_VSliderFloatEx"
	Function _ImGui_VSliderInt:Int(label:String, size:SImVec2, v:Int Var, v_min:Int, v_max:Int) = "bmx_ImGui_VSliderInt"
	Function _ImGui_VSliderIntEx:Int(label:String, size:SImVec2, v:Int Var, v_min:Int, v_max:Int, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_VSliderIntEx"
	Function _ImGui_VSliderScalar:Int(label:String, size:SImVec2, data_type:EImGuiDataType, p_data:Byte Ptr, p_min:Byte Ptr, p_max:Byte Ptr) = "bmx_ImGui_VSliderScalar"
	Function _ImGui_VSliderScalarEx:Int(label:String, size:SImVec2, data_type:EImGuiDataType, p_data:Byte Ptr, p_min:Byte Ptr, p_max:Byte Ptr, format:String, flags:EImGuiSliderFlags) = "bmx_ImGui_VSliderScalarEx"
	Function _ImGui_InputTextEx:Int(label:String, buf:Byte Ptr, buf_size:size_t, flags:EImGuiInputTextFlags, callback:Byte Ptr, user_data:Byte Ptr) = "bmx_ImGui_InputTextEx"
	Function _ImGui_InputTextMultiline:Int(label:String, buf:Byte Ptr, buf_size:size_t) = "bmx_ImGui_InputTextMultiline"
	Function _ImGui_InputTextMultilineEx:Int(label:String, buf:Byte Ptr, buf_size:size_t, size:SImVec2, flags:EImGuiInputTextFlags, callback:Byte Ptr, user_data:Byte Ptr) = "bmx_ImGui_InputTextMultilineEx"
	Function _ImGui_InputTextWithHint:Int(label:String, hint:String, buf:Byte Ptr, buf_size:size_t, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputTextWithHint"
	Function _ImGui_InputTextWithHintEx:Int(label:String, hint:String, buf:Byte Ptr, buf_size:size_t, flags:EImGuiInputTextFlags, callback:Byte Ptr, user_data:Byte Ptr) = "bmx_ImGui_InputTextWithHintEx"
	Function _ImGui_InputFloat:Int(label:String, v:Float Var) = "bmx_ImGui_InputFloat"
	Function _ImGui_InputFloatEx:Int(label:String, v:Float Var, stp:Float, step_fast:Float, format:String, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputFloatEx"
	Function _ImGui_InputFloat2:Int(label:String, StaticArray v:float[2]) = "bmx_ImGui_InputFloat2"
	Function _ImGui_InputFloat2Ex:Int(label:String, StaticArray v:float[2], format:String, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputFloat2Ex"
	Function _ImGui_InputFloat3:Int(label:String, StaticArray v:float[3]) = "bmx_ImGui_InputFloat3"
	Function _ImGui_InputFloat3Ex:Int(label:String, StaticArray v:float[3], format:String, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputFloat3Ex"
	Function _ImGui_InputFloat4:Int(label:String, StaticArray v:float[4]) = "bmx_ImGui_InputFloat4"
	Function _ImGui_InputFloat4Ex:Int(label:String, StaticArray v:float[4], format:String, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputFloat4Ex"
	Function _ImGui_InputInt:Int(label:String, v:Int Var) = "bmx_ImGui_InputInt"
	Function _ImGui_InputIntEx:Int(label:String, v:Int Var, stp:Int, step_fast:Int, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputIntEx"
	Function _ImGui_InputInt2:Int(label:String, StaticArray v:int[2], flags:EImGuiInputTextFlags) = "bmx_ImGui_InputInt2"
	Function _ImGui_InputInt3:Int(label:String, StaticArray v:int[3], flags:EImGuiInputTextFlags) = "bmx_ImGui_InputInt3"
	Function _ImGui_InputInt4:Int(label:String, StaticArray v:int[4], flags:EImGuiInputTextFlags) = "bmx_ImGui_InputInt4"
	Function _ImGui_InputDouble:Int(label:String, v:Byte Ptr) = "bmx_ImGui_InputDouble"
	Function _ImGui_InputDoubleEx:Int(label:String, v:Byte Ptr, stp:Double, step_fast:Double, format:String, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputDoubleEx"
	Function _ImGui_InputScalar:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr) = "bmx_ImGui_InputScalar"
	Function _ImGui_InputScalarEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, p_step:Byte Ptr, p_step_fast:Byte Ptr, format:String, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputScalarEx"
	Function _ImGui_InputScalarN:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int) = "bmx_ImGui_InputScalarN"
	Function _ImGui_InputScalarNEx:Int(label:String, data_type:EImGuiDataType, p_data:Byte Ptr, components:Int, p_step:Byte Ptr, p_step_fast:Byte Ptr, format:String, flags:EImGuiInputTextFlags) = "bmx_ImGui_InputScalarNEx"
	Function _ImGui_ColorEdit3:Int(label:String, StaticArray col:float[3], flags:EImGuiColorEditFlags) = "bmx_ImGui_ColorEdit3"
	Function _ImGui_ColorEdit4:Int(label:String, StaticArray col:float[4], flags:EImGuiColorEditFlags) = "bmx_ImGui_ColorEdit4"
	Function _ImGui_ColorPicker3:Int(label:String, StaticArray col:float[3], flags:EImGuiColorEditFlags) = "bmx_ImGui_ColorPicker3"
	Function _ImGui_ColorPicker4:Int(label:String, StaticArray col:float[4], flags:EImGuiColorEditFlags, ref_col:Byte Ptr) = "bmx_ImGui_ColorPicker4"
	Function _ImGui_ColorButton:Int(desc_id:String, col:SImVec4, flags:EImGuiColorEditFlags) = "bmx_ImGui_ColorButton"
	Function _ImGui_ColorButtonEx:Int(desc_id:String, col:SImVec4, flags:EImGuiColorEditFlags, size:SImVec2) = "bmx_ImGui_ColorButtonEx"
	Function _ImGui_SetColorEditOptions(flags:EImGuiColorEditFlags) = "ImGui_SetColorEditOptions"
	Function _ImGui_TreeNode:Int(label:String) = "bmx_ImGui_TreeNode"
	Function _ImGui_TreeNodeStr:Int(str_id:String, fmt:String) = "bmx_ImGui_TreeNodeStr"
	Function _ImGui_TreeNodePtr:Int(ptr_id:Byte Ptr, fmt:String) = "bmx_ImGui_TreeNodePtr"
	Function _ImGui_TreeNodeV:Int(str_id:String, fmt:String) = "bmx_ImGui_TreeNodeV"
	Function _ImGui_TreeNodeVPtr:Int(ptr_id:Byte Ptr, fmt:String) = "bmx_ImGui_TreeNodeVPtr"
	Function _ImGui_TreeNodeEx:Int(label:String, flags:EImGuiTreeNodeFlags) = "bmx_ImGui_TreeNodeEx"
	Function _ImGui_TreeNodeExStr:Int(str_id:String, flags:EImGuiTreeNodeFlags, fmt:String) = "bmx_ImGui_TreeNodeExStr"
	Function _ImGui_TreeNodeExPtr:Int(ptr_id:Byte Ptr, flags:EImGuiTreeNodeFlags, fmt:String) = "bmx_ImGui_TreeNodeExPtr"
	Function _ImGui_TreeNodeExV:Int(str_id:String, flags:EImGuiTreeNodeFlags, fmt:String) = "bmx_ImGui_TreeNodeExV"
	Function _ImGui_TreeNodeExVPtr:Int(ptr_id:Byte Ptr, flags:EImGuiTreeNodeFlags, fmt:String) = "bmx_ImGui_TreeNodeExVPtr"
	Function _ImGui_TreePush(str_id:String) = "bmx_ImGui_TreePush"
	Function _ImGui_TreePushPtr(ptr_id:Byte Ptr) = "ImGui_TreePushPtr"
	Function _ImGui_TreePop() = "ImGui_TreePop"
	Function _ImGui_GetTreeNodeToLabelSpacing:Float() = "ImGui_GetTreeNodeToLabelSpacing"
	Function _ImGui_CollapsingHeader:Int(label:String, flags:EImGuiTreeNodeFlags) = "bmx_ImGui_CollapsingHeader"
	Function _ImGui_CollapsingHeaderBoolPtr:Int(label:String, p_visible:Int Var, flags:EImGuiTreeNodeFlags) = "bmx_ImGui_CollapsingHeaderBoolPtr"
	Function _ImGui_SetNextItemOpen(is_open:Int, cond:EImGuiCond) = "ImGui_SetNextItemOpen"
	Function _ImGui_SetNextItemStorageID(storage_id:UInt) = "ImGui_SetNextItemStorageID"
	Function _ImGui_Selectable:Int(label:String) = "bmx_ImGui_Selectable"
	Function _ImGui_SelectableEx:Int(label:String, selected:Int, flags:EImGuiSelectableFlags, size:SImVec2) = "bmx_ImGui_SelectableEx"
	Function _ImGui_SelectableBoolPtr:Int(label:String, p_selected:Int Var, flags:EImGuiSelectableFlags) = "bmx_ImGui_SelectableBoolPtr"
	Function _ImGui_SelectableBoolPtrEx:Int(label:String, p_selected:Int Var, flags:EImGuiSelectableFlags, size:SImVec2) = "bmx_ImGui_SelectableBoolPtrEx"
	Function _ImGui_BeginMultiSelect:Byte Ptr(flags:EImGuiMultiSelectFlags) = "ImGui_BeginMultiSelect"
	Function _ImGui_BeginMultiSelectEx:Byte Ptr(flags:EImGuiMultiSelectFlags, selection_size:Int, items_count:Int) = "ImGui_BeginMultiSelectEx"
	Function _ImGui_EndMultiSelect:Byte Ptr() = "ImGui_EndMultiSelect"
	Function _ImGui_SetNextItemSelectionUserData(selection_user_data:Long) = "ImGui_SetNextItemSelectionUserData"
	Function _ImGui_IsItemToggledSelection:Int() = "ImGui_IsItemToggledSelection"
	Function _ImGui_BeginListBox:Int(label:String, size:SImVec2) = "bmx_ImGui_BeginListBox"
	Function _ImGui_EndListBox() = "ImGui_EndListBox"
	Function _ImGui_ListBox:Int(label:String, current_item:Int Var, items:String[], items_count:Int, height_in_items:Int) = "bmx_ImGui_ListBox"
	Function _ImGui_ListBoxCallback:Int(label:String, current_item:Int Var, getter:Byte Ptr, user_data:Byte Ptr, items_count:Int) = "bmx_ImGui_ListBoxCallback"
	Function _ImGui_ListBoxCallbackEx:Int(label:String, current_item:Int Var, getter:Byte Ptr, user_data:Byte Ptr, items_count:Int, height_in_items:Int) = "bmx_ImGui_ListBoxCallbackEx"
	Function _ImGui_PlotLines(label:String, values:Byte Ptr, values_count:Int) = "bmx_ImGui_PlotLines"
	Function _ImGui_PlotLinesEx(label:String, values:Byte Ptr, values_count:Int, values_offset:Int, overlay_text:String, scale_min:Float, scale_max:Float, graph_size:SImVec2, stride:Int) = "bmx_ImGui_PlotLinesEx"
	Function _ImGui_PlotLinesCallback(label:String, values_getter:Byte Ptr, data:Byte Ptr, values_count:Int) = "bmx_ImGui_PlotLinesCallback"
	Function _ImGui_PlotLinesCallbackEx(label:String, values_getter:Byte Ptr, data:Byte Ptr, values_count:Int, values_offset:Int, overlay_text:String, scale_min:Float, scale_max:Float, graph_size:SImVec2) = "bmx_ImGui_PlotLinesCallbackEx"
	Function _ImGui_PlotHistogram(label:String, values:Byte Ptr, values_count:Int) = "bmx_ImGui_PlotHistogram"
	Function _ImGui_PlotHistogramEx(label:String, values:Byte Ptr, values_count:Int, values_offset:Int, overlay_text:String, scale_min:Float, scale_max:Float, graph_size:SImVec2, stride:Int) = "bmx_ImGui_PlotHistogramEx"
	Function _ImGui_PlotHistogramCallback(label:String, values_getter:Byte Ptr, data:Byte Ptr, values_count:Int) = "bmx_ImGui_PlotHistogramCallback"
	Function _ImGui_PlotHistogramCallbackEx(label:String, values_getter:Byte Ptr, data:Byte Ptr, values_count:Int, values_offset:Int, overlay_text:String, scale_min:Float, scale_max:Float, graph_size:SImVec2) = "bmx_ImGui_PlotHistogramCallbackEx"
	Function _ImGui_BeginMenuBar:Int() = "ImGui_BeginMenuBar"
	Function _ImGui_EndMenuBar() = "ImGui_EndMenuBar"
	Function _ImGui_BeginMainMenuBar:Int() = "ImGui_BeginMainMenuBar"
	Function _ImGui_EndMainMenuBar() = "ImGui_EndMainMenuBar"
	Function _ImGui_BeginMenu:Int(label:String) = "bmx_ImGui_BeginMenu"
	Function _ImGui_BeginMenuEx:Int(label:String, enabled:Int) = "bmx_ImGui_BeginMenuEx"
	Function _ImGui_EndMenu() = "ImGui_EndMenu"
	Function _ImGui_MenuItem:Int(label:String) = "bmx_ImGui_MenuItem"
	Function _ImGui_MenuItemEx:Int(label:String, shortcut:String, selected:Int, enabled:Int) = "bmx_ImGui_MenuItemEx"
	Function _ImGui_MenuItemBoolPtr:Int(label:String, shortcut:String, p_selected:Int Var, enabled:Int) = "bmx_ImGui_MenuItemBoolPtr"
	Function _ImGui_BeginTooltip:Int() = "ImGui_BeginTooltip"
	Function _ImGui_EndTooltip() = "ImGui_EndTooltip"
	Function _ImGui_SetTooltip(fmt:String) = "bmx_ImGui_SetTooltip"
	Function _ImGui_SetTooltipV(fmt:String) = "bmx_ImGui_SetTooltipV"
	Function _ImGui_BeginItemTooltip:Int() = "ImGui_BeginItemTooltip"
	Function _ImGui_SetItemTooltip(fmt:String) = "bmx_ImGui_SetItemTooltip"
	Function _ImGui_SetItemTooltipV(fmt:String) = "bmx_ImGui_SetItemTooltipV"
	Function _ImGui_BeginPopup:Int(str_id:String, flags:EImGuiWindowFlags) = "bmx_ImGui_BeginPopup"
	Function _ImGui_BeginPopupModal:Int(name:String, p_open:Int Var, flags:EImGuiWindowFlags) = "bmx_ImGui_BeginPopupModal"
	Function _ImGui_EndPopup() = "ImGui_EndPopup"
	Function _ImGui_OpenPopup(str_id:String, popup_flags:EImGuiPopupFlags) = "bmx_ImGui_OpenPopup"
	Function _ImGui_OpenPopupID(id:UInt, popup_flags:EImGuiPopupFlags) = "ImGui_OpenPopupID"
	Function _ImGui_OpenPopupOnItemClick(str_id:String, popup_flags:EImGuiPopupFlags) = "bmx_ImGui_OpenPopupOnItemClick"
	Function _ImGui_CloseCurrentPopup() = "ImGui_CloseCurrentPopup"
	Function _ImGui_BeginPopupContextItem:Int() = "ImGui_BeginPopupContextItem"
	Function _ImGui_BeginPopupContextItemEx:Int(str_id:String, popup_flags:EImGuiPopupFlags) = "bmx_ImGui_BeginPopupContextItemEx"
	Function _ImGui_BeginPopupContextWindow:Int() = "ImGui_BeginPopupContextWindow"
	Function _ImGui_BeginPopupContextWindowEx:Int(str_id:String, popup_flags:EImGuiPopupFlags) = "bmx_ImGui_BeginPopupContextWindowEx"
	Function _ImGui_BeginPopupContextVoid:Int() = "ImGui_BeginPopupContextVoid"
	Function _ImGui_BeginPopupContextVoidEx:Int(str_id:String, popup_flags:EImGuiPopupFlags) = "bmx_ImGui_BeginPopupContextVoidEx"
	Function _ImGui_IsPopupOpen:Int(str_id:String, flags:EImGuiPopupFlags) = "bmx_ImGui_IsPopupOpen"
	Function _ImGui_BeginTable:Int(str_id:String, columns:Int, flags:EImGuiTableFlags) = "bmx_ImGui_BeginTable"
	Function _ImGui_BeginTableEx:Int(str_id:String, columns:Int, flags:EImGuiTableFlags, outer_size:SImVec2, inner_width:Float) = "bmx_ImGui_BeginTableEx"
	Function _ImGui_EndTable() = "ImGui_EndTable"
	Function _ImGui_TableNextRow() = "ImGui_TableNextRow"
	Function _ImGui_TableNextRowEx(row_flags:EImGuiTableRowFlags, min_row_height:Float) = "ImGui_TableNextRowEx"
	Function _ImGui_TableNextColumn:Int() = "ImGui_TableNextColumn"
	Function _ImGui_TableSetColumnIndex:Int(column_n:Int) = "ImGui_TableSetColumnIndex"
	Function _ImGui_TableSetupColumn(label:String, flags:EImGuiTableColumnFlags) = "bmx_ImGui_TableSetupColumn"
	Function _ImGui_TableSetupColumnEx(label:String, flags:EImGuiTableColumnFlags, init_width_or_weight:Float, user_id:UInt) = "bmx_ImGui_TableSetupColumnEx"
	Function _ImGui_TableSetupScrollFreeze(cols:Int, rows:Int) = "ImGui_TableSetupScrollFreeze"
	Function _ImGui_TableHeader(label:String) = "bmx_ImGui_TableHeader"
	Function _ImGui_TableHeadersRow() = "ImGui_TableHeadersRow"
	Function _ImGui_TableAngledHeadersRow() = "ImGui_TableAngledHeadersRow"
	Function _ImGui_TableGetSortSpecs:Byte Ptr() = "ImGui_TableGetSortSpecs"
	Function _ImGui_TableGetColumnCount:Int() = "ImGui_TableGetColumnCount"
	Function _ImGui_TableGetColumnIndex:Int() = "ImGui_TableGetColumnIndex"
	Function _ImGui_TableGetRowIndex:Int() = "ImGui_TableGetRowIndex"
	Function _ImGui_TableGetColumnName:String(column_n:Int) = "bmx_ImGui_TableGetColumnName"
	Function _ImGui_TableGetColumnFlags:EImGuiTableColumnFlags(column_n:Int) = "ImGui_TableGetColumnFlags"
	Function _ImGui_TableSetColumnEnabled(column_n:Int, v:Int) = "ImGui_TableSetColumnEnabled"
	Function _ImGui_TableGetHoveredColumn:Int() = "ImGui_TableGetHoveredColumn"
	Function _ImGui_TableSetBgColor(target:EImGuiTableBgTarget, color:UInt, column_n:Int) = "ImGui_TableSetBgColor"
	Function _ImGui_Columns() = "ImGui_Columns"
	Function _ImGui_ColumnsEx(count:Int, id:String, borders:Int) = "bmx_ImGui_ColumnsEx"
	Function _ImGui_NextColumn() = "ImGui_NextColumn"
	Function _ImGui_GetColumnIndex:Int() = "ImGui_GetColumnIndex"
	Function _ImGui_GetColumnWidth:Float(column_index:Int) = "ImGui_GetColumnWidth"
	Function _ImGui_SetColumnWidth(column_index:Int, width:Float) = "ImGui_SetColumnWidth"
	Function _ImGui_GetColumnOffset:Float(column_index:Int) = "ImGui_GetColumnOffset"
	Function _ImGui_SetColumnOffset(column_index:Int, offset_x:Float) = "ImGui_SetColumnOffset"
	Function _ImGui_GetColumnsCount:Int() = "ImGui_GetColumnsCount"
	Function _ImGui_BeginTabBar:Int(str_id:String, flags:EImGuiTabBarFlags) = "bmx_ImGui_BeginTabBar"
	Function _ImGui_EndTabBar() = "ImGui_EndTabBar"
	Function _ImGui_BeginTabItem:Int(label:String, p_open:Int Var, flags:EImGuiTabItemFlags) = "bmx_ImGui_BeginTabItem"
	Function _ImGui_EndTabItem() = "ImGui_EndTabItem"
	Function _ImGui_TabItemButton:Int(label:String, flags:EImGuiTabItemFlags) = "bmx_ImGui_TabItemButton"
	Function _ImGui_SetTabItemClosed(tab_or_docked_window_label:String) = "bmx_ImGui_SetTabItemClosed"
	Function _ImGui_LogToTTY(auto_open_depth:Int) = "ImGui_LogToTTY"
	Function _ImGui_LogToFile(auto_open_depth:Int, filename:String) = "bmx_ImGui_LogToFile"
	Function _ImGui_LogToClipboard(auto_open_depth:Int) = "ImGui_LogToClipboard"
	Function _ImGui_LogFinish() = "ImGui_LogFinish"
	Function _ImGui_LogButtons() = "ImGui_LogButtons"
	Function _ImGui_LogText(fmt:String) = "bmx_ImGui_LogText"
	Function _ImGui_LogTextV(fmt:String) = "bmx_ImGui_LogTextV"
	Function _ImGui_BeginDragDropSource:Int(flags:EImGuiDragDropFlags) = "ImGui_BeginDragDropSource"
	Function _ImGui_SetDragDropPayload:Int(kind:String, data:Byte Ptr, sz:size_t, cond:EImGuiCond) = "bmx_ImGui_SetDragDropPayload"
	Function _ImGui_EndDragDropSource() = "ImGui_EndDragDropSource"
	Function _ImGui_BeginDragDropTarget:Int() = "ImGui_BeginDragDropTarget"
	Function _ImGui_AcceptDragDropPayload:Byte Ptr(kind:String, flags:EImGuiDragDropFlags) = "bmx_ImGui_AcceptDragDropPayload"
	Function _ImGui_EndDragDropTarget() = "ImGui_EndDragDropTarget"
	Function _ImGui_GetDragDropPayload:Byte Ptr() = "ImGui_GetDragDropPayload"
	Function _ImGui_BeginDisabled(disabled:Int) = "ImGui_BeginDisabled"
	Function _ImGui_EndDisabled() = "ImGui_EndDisabled"
	Function _ImGui_PushClipRect(clip_rect_min:SImVec2, clip_rect_max:SImVec2, intersect_with_current_clip_rect:Int) = "ImGui_PushClipRect"
	Function _ImGui_PopClipRect() = "ImGui_PopClipRect"
	Function _ImGui_SetItemDefaultFocus() = "ImGui_SetItemDefaultFocus"
	Function _ImGui_SetKeyboardFocusHere() = "ImGui_SetKeyboardFocusHere"
	Function _ImGui_SetKeyboardFocusHereEx(offset:Int) = "ImGui_SetKeyboardFocusHereEx"
	Function _ImGui_SetNavCursorVisible(visible:Int) = "ImGui_SetNavCursorVisible"
	Function _ImGui_SetNextItemAllowOverlap() = "ImGui_SetNextItemAllowOverlap"
	Function _ImGui_IsItemHovered:Int(flags:EImGuiHoveredFlags) = "ImGui_IsItemHovered"
	Function _ImGui_IsItemActive:Int() = "ImGui_IsItemActive"
	Function _ImGui_IsItemFocused:Int() = "ImGui_IsItemFocused"
	Function _ImGui_IsItemClicked:Int() = "ImGui_IsItemClicked"
	Function _ImGui_IsItemClickedEx:Int(mouse_button:EImGuiMouseButton) = "ImGui_IsItemClickedEx"
	Function _ImGui_IsItemVisible:Int() = "ImGui_IsItemVisible"
	Function _ImGui_IsItemEdited:Int() = "ImGui_IsItemEdited"
	Function _ImGui_IsItemActivated:Int() = "ImGui_IsItemActivated"
	Function _ImGui_IsItemDeactivated:Int() = "ImGui_IsItemDeactivated"
	Function _ImGui_IsItemDeactivatedAfterEdit:Int() = "ImGui_IsItemDeactivatedAfterEdit"
	Function _ImGui_IsItemToggledOpen:Int() = "ImGui_IsItemToggledOpen"
	Function _ImGui_IsAnyItemHovered:Int() = "ImGui_IsAnyItemHovered"
	Function _ImGui_IsAnyItemActive:Int() = "ImGui_IsAnyItemActive"
	Function _ImGui_IsAnyItemFocused:Int() = "ImGui_IsAnyItemFocused"
	Function _ImGui_GetItemID:UInt() = "ImGui_GetItemID"
	Function _ImGui_GetItemRectMin:SImVec2() = "ImGui_GetItemRectMin"
	Function _ImGui_GetItemRectMax:SImVec2() = "ImGui_GetItemRectMax"
	Function _ImGui_GetItemRectSize:SImVec2() = "ImGui_GetItemRectSize"
	Function _ImGui_GetMainViewport:Byte Ptr() = "ImGui_GetMainViewport"
	Function _ImGui_GetBackgroundDrawList:Byte Ptr() = "ImGui_GetBackgroundDrawList"
	Function _ImGui_GetForegroundDrawList:Byte Ptr() = "ImGui_GetForegroundDrawList"
	Function _ImGui_IsRectVisibleBySize:Int(size:SImVec2) = "ImGui_IsRectVisibleBySize"
	Function _ImGui_IsRectVisible:Int(rect_min:SImVec2, rect_max:SImVec2) = "ImGui_IsRectVisible"
	Function _ImGui_GetTime:Double() = "ImGui_GetTime"
	Function _ImGui_GetFrameCount:Int() = "ImGui_GetFrameCount"
	Function _ImGui_GetDrawListSharedData:Byte Ptr() = "ImGui_GetDrawListSharedData"
	Function _ImGui_GetStyleColorName:String(idx:EImGuiCol) = "bmx_ImGui_GetStyleColorName"
	Function _ImGui_SetStateStorage(storage:Byte Ptr) = "ImGui_SetStateStorage"
	Function _ImGui_GetStateStorage:Byte Ptr() = "ImGui_GetStateStorage"
	Function _ImGui_CalcTextSize:SImVec2(text:String) = "bmx_ImGui_CalcTextSize"
	Function _ImGui_CalcTextSizeEx:SImVec2(text:String, text_end:String, hide_text_after_double_hash:Int, wrap_width:Float) = "bmx_ImGui_CalcTextSizeEx"
	Function _ImGui_ColorConvertU32ToFloat4:SImVec4(in:UInt) = "ImGui_ColorConvertU32ToFloat4"
	Function _ImGui_ColorConvertFloat4ToU32:UInt(in:SImVec4) = "ImGui_ColorConvertFloat4ToU32"
	Function _ImGui_ColorConvertRGBtoHSV(r:Float, g:Float, b:Float, out_h:Float Var, out_s:Float Var, out_v:Float Var) = "ImGui_ColorConvertRGBtoHSV"
	Function _ImGui_ColorConvertHSVtoRGB(h:Float, s:Float, v:Float, out_r:Float Var, out_g:Float Var, out_b:Float Var) = "ImGui_ColorConvertHSVtoRGB"
	Function _ImGui_IsKeyDown:Int(key:EImGuiKey) = "ImGui_IsKeyDown"
	Function _ImGui_IsKeyPressed:Int(key:EImGuiKey) = "ImGui_IsKeyPressed"
	Function _ImGui_IsKeyPressedEx:Int(key:EImGuiKey, rep:Int) = "ImGui_IsKeyPressedEx"
	Function _ImGui_IsKeyReleased:Int(key:EImGuiKey) = "ImGui_IsKeyReleased"
	Function _ImGui_IsKeyChordPressed:Int(key_chord:Int) = "ImGui_IsKeyChordPressed"
	Function _ImGui_GetKeyPressedAmount:Int(key:EImGuiKey, repeat_delay:Float, rate:Float) = "ImGui_GetKeyPressedAmount"
	Function _ImGui_GetKeyName:String(key:EImGuiKey) = "bmx_ImGui_GetKeyName"
	Function _ImGui_SetNextFrameWantCaptureKeyboard(want_capture_keyboard:Int) = "ImGui_SetNextFrameWantCaptureKeyboard"
	Function _ImGui_Shortcut:Int(key_chord:Int, flags:EImGuiInputFlags) = "ImGui_Shortcut"
	Function _ImGui_SetNextItemShortcut(key_chord:Int, flags:EImGuiInputFlags) = "ImGui_SetNextItemShortcut"
	Function _ImGui_SetItemKeyOwner(key:EImGuiKey) = "ImGui_SetItemKeyOwner"
	Function _ImGui_IsMouseDown:Int(button:EImGuiMouseButton) = "ImGui_IsMouseDown"
	Function _ImGui_IsMouseClicked:Int(button:EImGuiMouseButton) = "ImGui_IsMouseClicked"
	Function _ImGui_IsMouseClickedEx:Int(button:EImGuiMouseButton, rep:Int) = "ImGui_IsMouseClickedEx"
	Function _ImGui_IsMouseReleased:Int(button:EImGuiMouseButton) = "ImGui_IsMouseReleased"
	Function _ImGui_IsMouseDoubleClicked:Int(button:EImGuiMouseButton) = "ImGui_IsMouseDoubleClicked"
	Function _ImGui_IsMouseReleasedWithDelay:Int(button:EImGuiMouseButton, delay:Float) = "ImGui_IsMouseReleasedWithDelay"
	Function _ImGui_GetMouseClickedCount:Int(button:EImGuiMouseButton) = "ImGui_GetMouseClickedCount"
	Function _ImGui_IsMouseHoveringRect:Int(r_min:SImVec2, r_max:SImVec2) = "ImGui_IsMouseHoveringRect"
	Function _ImGui_IsMouseHoveringRectEx:Int(r_min:SImVec2, r_max:SImVec2, clip:Int) = "ImGui_IsMouseHoveringRectEx"
	Function _ImGui_IsMousePosValid:Int(mouse_pos:Byte Ptr) = "ImGui_IsMousePosValid"
	Function _ImGui_IsAnyMouseDown:Int() = "ImGui_IsAnyMouseDown"
	Function _ImGui_GetMousePos:SImVec2() = "ImGui_GetMousePos"
	Function _ImGui_GetMousePosOnOpeningCurrentPopup:SImVec2() = "ImGui_GetMousePosOnOpeningCurrentPopup"
	Function _ImGui_IsMouseDragging:Int(button:EImGuiMouseButton, lock_threshold:Float) = "ImGui_IsMouseDragging"
	Function _ImGui_GetMouseDragDelta:SImVec2(button:EImGuiMouseButton, lock_threshold:Float) = "ImGui_GetMouseDragDelta"
	Function _ImGui_ResetMouseDragDelta() = "ImGui_ResetMouseDragDelta"
	Function _ImGui_ResetMouseDragDeltaEx(button:EImGuiMouseButton) = "ImGui_ResetMouseDragDeltaEx"
	Function _ImGui_GetMouseCursor:EImGuiMouseCursor() = "ImGui_GetMouseCursor"
	Function _ImGui_SetMouseCursor(cursor_type:EImGuiMouseCursor) = "ImGui_SetMouseCursor"
	Function _ImGui_SetNextFrameWantCaptureMouse(want_capture_mouse:Int) = "ImGui_SetNextFrameWantCaptureMouse"
	Function _ImGui_GetClipboardText:String() = "bmx_ImGui_GetClipboardText"
	Function _ImGui_SetClipboardText(text:String) = "bmx_ImGui_SetClipboardText"
	Function _ImGui_LoadIniSettingsFromDisk(ini_filename:String) = "bmx_ImGui_LoadIniSettingsFromDisk"
	Function _ImGui_LoadIniSettingsFromMemory(ini_data:String, ini_size:size_t) = "bmx_ImGui_LoadIniSettingsFromMemory"
	Function _ImGui_SaveIniSettingsToDisk(ini_filename:String) = "bmx_ImGui_SaveIniSettingsToDisk"
	Function _ImGui_SaveIniSettingsToMemory:String(out_ini_size:Byte Ptr) = "bmx_ImGui_SaveIniSettingsToMemory"
	Function _ImGui_DebugTextEncoding(text:String) = "bmx_ImGui_DebugTextEncoding"
	Function _ImGui_DebugFlashStyleColor(idx:EImGuiCol) = "ImGui_DebugFlashStyleColor"
	Function _ImGui_DebugStartItemPicker() = "ImGui_DebugStartItemPicker"
	Function _ImGui_DebugCheckVersionAndDataLayout:Int(version_str:String, sz_io:size_t, sz_style:size_t, sz_vec2:size_t, sz_vec4:size_t, sz_drawvert:size_t, sz_drawidx:size_t) = "bmx_ImGui_DebugCheckVersionAndDataLayout"
	Function _ImGui_DebugLog(fmt:String) = "bmx_ImGui_DebugLog"
	Function _ImGui_DebugLogV(fmt:String) = "bmx_ImGui_DebugLogV"
	Function _ImGui_SetAllocatorFunctions(alloc_func:Byte Ptr, free_func:Byte Ptr, user_data:Byte Ptr) = "ImGui_SetAllocatorFunctions"
	Function _ImGui_GetAllocatorFunctions(p_alloc_func:Byte Ptr, p_free_func:Byte Ptr, p_user_data:Byte Ptr) = "ImGui_GetAllocatorFunctions"
	Function _ImGui_MemAlloc:Byte Ptr(size:size_t) = "ImGui_MemAlloc"
	Function _ImGui_MemFree(handle:Byte Ptr) = "ImGui_MemFree"
	Function _ImVector_Construct(vector:Byte Ptr) = "ImVector_Construct"
	Function _ImVector_Destruct(vector:Byte Ptr) = "ImVector_Destruct"
	Function _ImGuiStyle_ScaleAllSizes(this:Byte Ptr, scale_factor:Float) = "ImGuiStyle_ScaleAllSizes"
	Function _ImGuiIO_AddKeyEvent(this:Byte Ptr, key:EImGuiKey, down:Int) = "ImGuiIO_AddKeyEvent"
	Function _ImGuiIO_AddKeyAnalogEvent(this:Byte Ptr, key:EImGuiKey, down:Int, v:Float) = "ImGuiIO_AddKeyAnalogEvent"
	Function _ImGuiIO_AddMousePosEvent(this:Byte Ptr, x:Float, y:Float) = "ImGuiIO_AddMousePosEvent"
	Function _ImGuiIO_AddMouseButtonEvent(this:Byte Ptr, button:Int, down:Int) = "ImGuiIO_AddMouseButtonEvent"
	Function _ImGuiIO_AddMouseWheelEvent(this:Byte Ptr, wheel_x:Float, wheel_y:Float) = "ImGuiIO_AddMouseWheelEvent"
	Function _ImGuiIO_AddMouseSourceEvent(this:Byte Ptr, source:EImGuiMouseSource) = "ImGuiIO_AddMouseSourceEvent"
	Function _ImGuiIO_AddFocusEvent(this:Byte Ptr, focused:Int) = "ImGuiIO_AddFocusEvent"
	Function _ImGuiIO_AddInputCharacter(this:Byte Ptr, c:UInt) = "ImGuiIO_AddInputCharacter"
	Function _ImGuiIO_AddInputCharacterUTF16(this:Byte Ptr, c:Short) = "ImGuiIO_AddInputCharacterUTF16"
	Function _ImGuiIO_AddInputCharactersUTF8(this:Byte Ptr, str:String) = "bmx_ImGuiIO_AddInputCharactersUTF8"
	Function _ImGuiIO_SetKeyEventNativeData(this:Byte Ptr, key:EImGuiKey, native_keycode:Int, native_scancode:Int) = "ImGuiIO_SetKeyEventNativeData"
	Function _ImGuiIO_SetKeyEventNativeDataEx(this:Byte Ptr, key:EImGuiKey, native_keycode:Int, native_scancode:Int, native_legacy_index:Int) = "ImGuiIO_SetKeyEventNativeDataEx"
	Function _ImGuiIO_SetAppAcceptingEvents(this:Byte Ptr, accepting_events:Int) = "ImGuiIO_SetAppAcceptingEvents"
	Function _ImGuiIO_ClearEventsQueue(this:Byte Ptr) = "ImGuiIO_ClearEventsQueue"
	Function _ImGuiIO_ClearInputKeys(this:Byte Ptr) = "ImGuiIO_ClearInputKeys"
	Function _ImGuiIO_ClearInputMouse(this:Byte Ptr) = "ImGuiIO_ClearInputMouse"
	Function _ImGuiInputTextCallbackData_DeleteChars(this:Byte Ptr, pos:Int, bytes_count:Int) = "ImGuiInputTextCallbackData_DeleteChars"
	Function _ImGuiInputTextCallbackData_InsertChars(this:Byte Ptr, pos:Int, text:String, text_end:String) = "bmx_ImGuiInputTextCallbackData_InsertChars"
	Function _ImGuiInputTextCallbackData_SelectAll(this:Byte Ptr) = "ImGuiInputTextCallbackData_SelectAll"
	Function _ImGuiInputTextCallbackData_ClearSelection(this:Byte Ptr) = "ImGuiInputTextCallbackData_ClearSelection"
	Function _ImGuiInputTextCallbackData_HasSelection:Int(this:Byte Ptr) = "ImGuiInputTextCallbackData_HasSelection"
	Function _ImGuiPayload_Clear(this:Byte Ptr) = "ImGuiPayload_Clear"
	Function _ImGuiPayload_IsDataType:Int(this:Byte Ptr, kind:String) = "bmx_ImGuiPayload_IsDataType"
	Function _ImGuiPayload_IsPreview:Int(this:Byte Ptr) = "ImGuiPayload_IsPreview"
	Function _ImGuiPayload_IsDelivery:Int(this:Byte Ptr) = "ImGuiPayload_IsDelivery"
	Function _ImGuiTextFilter_ImGuiTextRange_empty:Int(this:Byte Ptr) = "ImGuiTextFilter_ImGuiTextRange_empty"
	Function _ImGuiTextFilter_ImGuiTextRange_split(this:Byte Ptr, separator:Byte, out:Byte Ptr) = "ImGuiTextFilter_ImGuiTextRange_split"
	Function _ImGuiTextFilter_Draw:Int(this:Byte Ptr, label:String, width:Float) = "bmx_ImGuiTextFilter_Draw"
	Function _ImGuiTextFilter_PassFilter:Int(this:Byte Ptr, text:String, text_end:String) = "bmx_ImGuiTextFilter_PassFilter"
	Function _ImGuiTextFilter_Build(this:Byte Ptr) = "ImGuiTextFilter_Build"
	Function _ImGuiTextFilter_Clear(this:Byte Ptr) = "ImGuiTextFilter_Clear"
	Function _ImGuiTextFilter_IsActive:Int(this:Byte Ptr) = "ImGuiTextFilter_IsActive"
	Function _ImGuiTextBuffer_begin:String(this:Byte Ptr) = "bmx_ImGuiTextBuffer_begin"
	Function _ImGuiTextBuffer_end:String(this:Byte Ptr) = "bmx_ImGuiTextBuffer_end"
	Function _ImGuiTextBuffer_size:Int(this:Byte Ptr) = "ImGuiTextBuffer_size"
	Function _ImGuiTextBuffer_empty:Int(this:Byte Ptr) = "ImGuiTextBuffer_empty"
	Function _ImGuiTextBuffer_clear(this:Byte Ptr) = "ImGuiTextBuffer_clear"
	Function _ImGuiTextBuffer_resize(this:Byte Ptr, size:Int) = "ImGuiTextBuffer_resize"
	Function _ImGuiTextBuffer_reserve(this:Byte Ptr, capacity:Int) = "ImGuiTextBuffer_reserve"
	Function _ImGuiTextBuffer_c_str:String(this:Byte Ptr) = "bmx_ImGuiTextBuffer_c_str"
	Function _ImGuiTextBuffer_append(this:Byte Ptr, str:String, str_end:String) = "bmx_ImGuiTextBuffer_append"
	Function _ImGuiTextBuffer_appendf(this:Byte Ptr, fmt:String) = "bmx_ImGuiTextBuffer_appendf"
	Function _ImGuiTextBuffer_appendfv(this:Byte Ptr, fmt:String) = "bmx_ImGuiTextBuffer_appendfv"
	Function _ImGuiStorage_Clear(this:Byte Ptr) = "ImGuiStorage_Clear"
	Function _ImGuiStorage_GetInt:Int(this:Byte Ptr, key:UInt, default_val:Int) = "ImGuiStorage_GetInt"
	Function _ImGuiStorage_SetInt(this:Byte Ptr, key:UInt, val:Int) = "ImGuiStorage_SetInt"
	Function _ImGuiStorage_GetBool:Int(this:Byte Ptr, key:UInt, default_val:Int) = "ImGuiStorage_GetBool"
	Function _ImGuiStorage_SetBool(this:Byte Ptr, key:UInt, val:Int) = "ImGuiStorage_SetBool"
	Function _ImGuiStorage_GetFloat:Float(this:Byte Ptr, key:UInt, default_val:Float) = "ImGuiStorage_GetFloat"
	Function _ImGuiStorage_SetFloat(this:Byte Ptr, key:UInt, val:Float) = "ImGuiStorage_SetFloat"
	Function _ImGuiStorage_GetVoidPtr:Byte Ptr(this:Byte Ptr, key:UInt) = "ImGuiStorage_GetVoidPtr"
	Function _ImGuiStorage_SetVoidPtr(this:Byte Ptr, key:UInt, val:Byte Ptr) = "ImGuiStorage_SetVoidPtr"
	Function _ImGuiStorage_GetIntRef:Byte Ptr(this:Byte Ptr, key:UInt, default_val:Int) = "ImGuiStorage_GetIntRef"
	Function _ImGuiStorage_GetBoolRef:Byte Ptr(this:Byte Ptr, key:UInt, default_val:Int) = "ImGuiStorage_GetBoolRef"
	Function _ImGuiStorage_GetFloatRef:Byte Ptr(this:Byte Ptr, key:UInt, default_val:Float) = "ImGuiStorage_GetFloatRef"
	Function _ImGuiStorage_GetVoidPtrRef:Byte Ptr(this:Byte Ptr, key:UInt, default_val:Byte Ptr) = "ImGuiStorage_GetVoidPtrRef"
	Function _ImGuiStorage_BuildSortByKey(this:Byte Ptr) = "ImGuiStorage_BuildSortByKey"
	Function _ImGuiStorage_SetAllInt(this:Byte Ptr, val:Int) = "ImGuiStorage_SetAllInt"
	Function _ImGuiListClipper_Begin(this:Byte Ptr, items_count:Int, items_height:Float) = "ImGuiListClipper_Begin"
	Function _ImGuiListClipper_End(this:Byte Ptr) = "ImGuiListClipper_End"
	Function _ImGuiListClipper_Step:Int(this:Byte Ptr) = "ImGuiListClipper_Step"
	Function _ImGuiListClipper_IncludeItemByIndex(this:Byte Ptr, item_index:Int) = "ImGuiListClipper_IncludeItemByIndex"
	Function _ImGuiListClipper_IncludeItemsByIndex(this:Byte Ptr, item_begin:Int, item_end:Int) = "ImGuiListClipper_IncludeItemsByIndex"
	Function _ImGuiListClipper_SeekCursorForItem(this:Byte Ptr, item_index:Int) = "ImGuiListClipper_SeekCursorForItem"
	Function _ImColor_SetHSV(this:Byte Ptr, h:Float, s:Float, v:Float, a:Float) = "ImColor_SetHSV"
	Function _ImColor_HSV:UInt(h:Float, s:Float, v:Float, a:Float) = "ImColor_HSV"
	Function _ImGuiSelectionBasicStorage_ApplyRequests(this:Byte Ptr, ms_io:Byte Ptr) = "ImGuiSelectionBasicStorage_ApplyRequests"
	Function _ImGuiSelectionBasicStorage_Contains:Int(this:Byte Ptr, id:UInt) = "ImGuiSelectionBasicStorage_Contains"
	Function _ImGuiSelectionBasicStorage_Clear(this:Byte Ptr) = "ImGuiSelectionBasicStorage_Clear"
	Function _ImGuiSelectionBasicStorage_Swap(this:Byte Ptr, r:Byte Ptr) = "ImGuiSelectionBasicStorage_Swap"
	Function _ImGuiSelectionBasicStorage_SetItemSelected(this:Byte Ptr, id:UInt, selected:Int) = "ImGuiSelectionBasicStorage_SetItemSelected"
	Function _ImGuiSelectionBasicStorage_GetNextSelectedItem:Int(this:Byte Ptr, opaque_it:Byte Ptr, out_id:Byte Ptr) = "ImGuiSelectionBasicStorage_GetNextSelectedItem"
	Function _ImGuiSelectionBasicStorage_GetStorageIdFromIndex:UInt(this:Byte Ptr, idx:Int) = "ImGuiSelectionBasicStorage_GetStorageIdFromIndex"
	Function _ImGuiSelectionExternalStorage_ApplyRequests(this:Byte Ptr, ms_io:Byte Ptr) = "ImGuiSelectionExternalStorage_ApplyRequests"
	Function _ImDrawCmd_GetTexID:ULong(this:Byte Ptr) = "ImDrawCmd_GetTexID"
	Function _ImDrawListSplitter_Clear(this:Byte Ptr) = "ImDrawListSplitter_Clear"
	Function _ImDrawListSplitter_ClearFreeMemory(this:Byte Ptr) = "ImDrawListSplitter_ClearFreeMemory"
	Function _ImDrawListSplitter_Split(this:Byte Ptr, draw_list:Byte Ptr, count:Int) = "ImDrawListSplitter_Split"
	Function _ImDrawListSplitter_Merge(this:Byte Ptr, draw_list:Byte Ptr) = "ImDrawListSplitter_Merge"
	Function _ImDrawListSplitter_SetCurrentChannel(this:Byte Ptr, draw_list:Byte Ptr, channel_idx:Int) = "ImDrawListSplitter_SetCurrentChannel"
	Function _ImDrawList_PushClipRect(this:Byte Ptr, clip_rect_min:SImVec2, clip_rect_max:SImVec2, intersect_with_current_clip_rect:Int) = "ImDrawList_PushClipRect"
	Function _ImDrawList_PushClipRectFullScreen(this:Byte Ptr) = "ImDrawList_PushClipRectFullScreen"
	Function _ImDrawList_PopClipRect(this:Byte Ptr) = "ImDrawList_PopClipRect"
	Function _ImDrawList_PushTextureID(this:Byte Ptr, texture_id:ULong) = "ImDrawList_PushTextureID"
	Function _ImDrawList_PopTextureID(this:Byte Ptr) = "ImDrawList_PopTextureID"
	Function _ImDrawList_GetClipRectMin:SImVec2(this:Byte Ptr) = "ImDrawList_GetClipRectMin"
	Function _ImDrawList_GetClipRectMax:SImVec2(this:Byte Ptr) = "ImDrawList_GetClipRectMax"
	Function _ImDrawList_AddLine(this:Byte Ptr, p1:SImVec2, p2:SImVec2, col:UInt) = "ImDrawList_AddLine"
	Function _ImDrawList_AddLineEx(this:Byte Ptr, p1:SImVec2, p2:SImVec2, col:UInt, thickness:Float) = "ImDrawList_AddLineEx"
	Function _ImDrawList_AddRect(this:Byte Ptr, p_min:SImVec2, p_max:SImVec2, col:UInt) = "ImDrawList_AddRect"
	Function _ImDrawList_AddRectEx(this:Byte Ptr, p_min:SImVec2, p_max:SImVec2, col:UInt, rounding:Float, flags:EImDrawFlags, thickness:Float) = "ImDrawList_AddRectEx"
	Function _ImDrawList_AddRectFilled(this:Byte Ptr, p_min:SImVec2, p_max:SImVec2, col:UInt) = "ImDrawList_AddRectFilled"
	Function _ImDrawList_AddRectFilledEx(this:Byte Ptr, p_min:SImVec2, p_max:SImVec2, col:UInt, rounding:Float, flags:EImDrawFlags) = "ImDrawList_AddRectFilledEx"
	Function _ImDrawList_AddRectFilledMultiColor(this:Byte Ptr, p_min:SImVec2, p_max:SImVec2, col_upr_left:UInt, col_upr_right:UInt, col_bot_right:UInt, col_bot_left:UInt) = "ImDrawList_AddRectFilledMultiColor"
	Function _ImDrawList_AddQuad(this:Byte Ptr, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2, col:UInt) = "ImDrawList_AddQuad"
	Function _ImDrawList_AddQuadEx(this:Byte Ptr, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2, col:UInt, thickness:Float) = "ImDrawList_AddQuadEx"
	Function _ImDrawList_AddQuadFilled(this:Byte Ptr, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2, col:UInt) = "ImDrawList_AddQuadFilled"
	Function _ImDrawList_AddTriangle(this:Byte Ptr, p1:SImVec2, p2:SImVec2, p3:SImVec2, col:UInt) = "ImDrawList_AddTriangle"
	Function _ImDrawList_AddTriangleEx(this:Byte Ptr, p1:SImVec2, p2:SImVec2, p3:SImVec2, col:UInt, thickness:Float) = "ImDrawList_AddTriangleEx"
	Function _ImDrawList_AddTriangleFilled(this:Byte Ptr, p1:SImVec2, p2:SImVec2, p3:SImVec2, col:UInt) = "ImDrawList_AddTriangleFilled"
	Function _ImDrawList_AddCircle(this:Byte Ptr, center:SImVec2, radius:Float, col:UInt) = "ImDrawList_AddCircle"
	Function _ImDrawList_AddCircleEx(this:Byte Ptr, center:SImVec2, radius:Float, col:UInt, num_segments:Int, thickness:Float) = "ImDrawList_AddCircleEx"
	Function _ImDrawList_AddCircleFilled(this:Byte Ptr, center:SImVec2, radius:Float, col:UInt, num_segments:Int) = "ImDrawList_AddCircleFilled"
	Function _ImDrawList_AddNgon(this:Byte Ptr, center:SImVec2, radius:Float, col:UInt, num_segments:Int) = "ImDrawList_AddNgon"
	Function _ImDrawList_AddNgonEx(this:Byte Ptr, center:SImVec2, radius:Float, col:UInt, num_segments:Int, thickness:Float) = "ImDrawList_AddNgonEx"
	Function _ImDrawList_AddNgonFilled(this:Byte Ptr, center:SImVec2, radius:Float, col:UInt, num_segments:Int) = "ImDrawList_AddNgonFilled"
	Function _ImDrawList_AddEllipse(this:Byte Ptr, center:SImVec2, radius:SImVec2, col:UInt) = "ImDrawList_AddEllipse"
	Function _ImDrawList_AddEllipseEx(this:Byte Ptr, center:SImVec2, radius:SImVec2, col:UInt, rot:Float, num_segments:Int, thickness:Float) = "ImDrawList_AddEllipseEx"
	Function _ImDrawList_AddEllipseFilled(this:Byte Ptr, center:SImVec2, radius:SImVec2, col:UInt) = "ImDrawList_AddEllipseFilled"
	Function _ImDrawList_AddEllipseFilledEx(this:Byte Ptr, center:SImVec2, radius:SImVec2, col:UInt, rot:Float, num_segments:Int) = "ImDrawList_AddEllipseFilledEx"
	Function _ImDrawList_AddText(this:Byte Ptr, pos:SImVec2, col:UInt, text_begin:String) = "bmx_ImDrawList_AddText"
	Function _ImDrawList_AddTextEx(this:Byte Ptr, pos:SImVec2, col:UInt, text_begin:String, text_end:String) = "bmx_ImDrawList_AddTextEx"
	Function _ImDrawList_AddTextImFontPtr(this:Byte Ptr, font:Byte Ptr, font_size:Float, pos:SImVec2, col:UInt, text_begin:String) = "bmx_ImDrawList_AddTextImFontPtr"
	Function _ImDrawList_AddTextImFontPtrEx(this:Byte Ptr, font:Byte Ptr, font_size:Float, pos:SImVec2, col:UInt, text_begin:String, text_end:String, wrap_width:Float, cpu_fine_clip_rect:Byte Ptr) = "bmx_ImDrawList_AddTextImFontPtrEx"
	Function _ImDrawList_AddBezierCubic(this:Byte Ptr, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2, col:UInt, thickness:Float, num_segments:Int) = "ImDrawList_AddBezierCubic"
	Function _ImDrawList_AddBezierQuadratic(this:Byte Ptr, p1:SImVec2, p2:SImVec2, p3:SImVec2, col:UInt, thickness:Float, num_segments:Int) = "ImDrawList_AddBezierQuadratic"
	Function _ImDrawList_AddPolyline(this:Byte Ptr, points:Byte Ptr, num_points:Int, col:UInt, flags:EImDrawFlags, thickness:Float) = "ImDrawList_AddPolyline"
	Function _ImDrawList_AddConvexPolyFilled(this:Byte Ptr, points:Byte Ptr, num_points:Int, col:UInt) = "ImDrawList_AddConvexPolyFilled"
	Function _ImDrawList_AddConcavePolyFilled(this:Byte Ptr, points:Byte Ptr, num_points:Int, col:UInt) = "ImDrawList_AddConcavePolyFilled"
	Function _ImDrawList_AddImage(this:Byte Ptr, user_texture_id:ULong, p_min:SImVec2, p_max:SImVec2) = "ImDrawList_AddImage"
	Function _ImDrawList_AddImageEx(this:Byte Ptr, user_texture_id:ULong, p_min:SImVec2, p_max:SImVec2, uv_min:SImVec2, uv_max:SImVec2, col:UInt) = "ImDrawList_AddImageEx"
	Function _ImDrawList_AddImageQuad(this:Byte Ptr, user_texture_id:ULong, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2) = "ImDrawList_AddImageQuad"
	Function _ImDrawList_AddImageQuadEx(this:Byte Ptr, user_texture_id:ULong, p1:SImVec2, p2:SImVec2, p3:SImVec2, p4:SImVec2, uv1:SImVec2, uv2:SImVec2, uv3:SImVec2, uv4:SImVec2, col:UInt) = "ImDrawList_AddImageQuadEx"
	Function _ImDrawList_AddImageRounded(this:Byte Ptr, user_texture_id:ULong, p_min:SImVec2, p_max:SImVec2, uv_min:SImVec2, uv_max:SImVec2, col:UInt, rounding:Float, flags:EImDrawFlags) = "ImDrawList_AddImageRounded"
	Function _ImDrawList_PathClear(this:Byte Ptr) = "ImDrawList_PathClear"
	Function _ImDrawList_PathLineTo(this:Byte Ptr, pos:SImVec2) = "ImDrawList_PathLineTo"
	Function _ImDrawList_PathLineToMergeDuplicate(this:Byte Ptr, pos:SImVec2) = "ImDrawList_PathLineToMergeDuplicate"
	Function _ImDrawList_PathFillConvex(this:Byte Ptr, col:UInt) = "ImDrawList_PathFillConvex"
	Function _ImDrawList_PathFillConcave(this:Byte Ptr, col:UInt) = "ImDrawList_PathFillConcave"
	Function _ImDrawList_PathStroke(this:Byte Ptr, col:UInt, flags:EImDrawFlags, thickness:Float) = "ImDrawList_PathStroke"
	Function _ImDrawList_PathArcTo(this:Byte Ptr, center:SImVec2, radius:Float, a_min:Float, a_max:Float, num_segments:Int) = "ImDrawList_PathArcTo"
	Function _ImDrawList_PathArcToFast(this:Byte Ptr, center:SImVec2, radius:Float, a_min_of_12:Int, a_max_of_12:Int) = "ImDrawList_PathArcToFast"
	Function _ImDrawList_PathEllipticalArcTo(this:Byte Ptr, center:SImVec2, radius:SImVec2, rot:Float, a_min:Float, a_max:Float) = "ImDrawList_PathEllipticalArcTo"
	Function _ImDrawList_PathEllipticalArcToEx(this:Byte Ptr, center:SImVec2, radius:SImVec2, rot:Float, a_min:Float, a_max:Float, num_segments:Int) = "ImDrawList_PathEllipticalArcToEx"
	Function _ImDrawList_PathBezierCubicCurveTo(this:Byte Ptr, p2:SImVec2, p3:SImVec2, p4:SImVec2, num_segments:Int) = "ImDrawList_PathBezierCubicCurveTo"
	Function _ImDrawList_PathBezierQuadraticCurveTo(this:Byte Ptr, p2:SImVec2, p3:SImVec2, num_segments:Int) = "ImDrawList_PathBezierQuadraticCurveTo"
	Function _ImDrawList_PathRect(this:Byte Ptr, rect_min:SImVec2, rect_max:SImVec2, rounding:Float, flags:EImDrawFlags) = "ImDrawList_PathRect"
	Function _ImDrawList_AddCallback(this:Byte Ptr, callback:Byte Ptr, userdata:Byte Ptr) = "ImDrawList_AddCallback"
	Function _ImDrawList_AddCallbackEx(this:Byte Ptr, callback:Byte Ptr, userdata:Byte Ptr, userdata_size:size_t) = "ImDrawList_AddCallbackEx"
	Function _ImDrawList_AddDrawCmd(this:Byte Ptr) = "ImDrawList_AddDrawCmd"
	Function _ImDrawList_CloneOutput:Byte Ptr(this:Byte Ptr) = "ImDrawList_CloneOutput"
	Function _ImDrawList_ChannelsSplit(this:Byte Ptr, count:Int) = "ImDrawList_ChannelsSplit"
	Function _ImDrawList_ChannelsMerge(this:Byte Ptr) = "ImDrawList_ChannelsMerge"
	Function _ImDrawList_ChannelsSetCurrent(this:Byte Ptr, n:Int) = "ImDrawList_ChannelsSetCurrent"
	Function _ImDrawList_PrimReserve(this:Byte Ptr, idx_count:Int, vtx_count:Int) = "ImDrawList_PrimReserve"
	Function _ImDrawList_PrimUnreserve(this:Byte Ptr, idx_count:Int, vtx_count:Int) = "ImDrawList_PrimUnreserve"
	Function _ImDrawList_PrimRect(this:Byte Ptr, a:SImVec2, b:SImVec2, col:UInt) = "ImDrawList_PrimRect"
	Function _ImDrawList_PrimRectUV(this:Byte Ptr, a:SImVec2, b:SImVec2, uv_a:SImVec2, uv_b:SImVec2, col:UInt) = "ImDrawList_PrimRectUV"
	Function _ImDrawList_PrimQuadUV(this:Byte Ptr, a:SImVec2, b:SImVec2, c:SImVec2, d:SImVec2, uv_a:SImVec2, uv_b:SImVec2, uv_c:SImVec2, uv_d:SImVec2, col:UInt) = "ImDrawList_PrimQuadUV"
	Function _ImDrawList_PrimWriteVtx(this:Byte Ptr, pos:SImVec2, uv:SImVec2, col:UInt) = "ImDrawList_PrimWriteVtx"
	Function _ImDrawList_PrimWriteIdx(this:Byte Ptr, idx:Short) = "ImDrawList_PrimWriteIdx"
	Function _ImDrawList_PrimVtx(this:Byte Ptr, pos:SImVec2, uv:SImVec2, col:UInt) = "ImDrawList_PrimVtx"
	Function _ImDrawList__ResetForNewFrame(this:Byte Ptr) = "ImDrawList__ResetForNewFrame"
	Function _ImDrawList__ClearFreeMemory(this:Byte Ptr) = "ImDrawList__ClearFreeMemory"
	Function _ImDrawList__PopUnusedDrawCmd(this:Byte Ptr) = "ImDrawList__PopUnusedDrawCmd"
	Function _ImDrawList__TryMergeDrawCmds(this:Byte Ptr) = "ImDrawList__TryMergeDrawCmds"
	Function _ImDrawList__OnChangedClipRect(this:Byte Ptr) = "ImDrawList__OnChangedClipRect"
	Function _ImDrawList__OnChangedTextureID(this:Byte Ptr) = "ImDrawList__OnChangedTextureID"
	Function _ImDrawList__OnChangedVtxOffset(this:Byte Ptr) = "ImDrawList__OnChangedVtxOffset"
	Function _ImDrawList__SetTextureID(this:Byte Ptr, texture_id:ULong) = "ImDrawList__SetTextureID"
	Function _ImDrawList__CalcCircleAutoSegmentCount:Int(this:Byte Ptr, radius:Float) = "ImDrawList__CalcCircleAutoSegmentCount"
	Function _ImDrawList__PathArcToFastEx(this:Byte Ptr, center:SImVec2, radius:Float, a_min_sample:Int, a_max_sample:Int, a_step:Int) = "ImDrawList__PathArcToFastEx"
	Function _ImDrawList__PathArcToN(this:Byte Ptr, center:SImVec2, radius:Float, a_min:Float, a_max:Float, num_segments:Int) = "ImDrawList__PathArcToN"
	Function _ImDrawData_Clear(this:Byte Ptr) = "ImDrawData_Clear"
	Function _ImDrawData_AddDrawList(this:Byte Ptr, draw_list:Byte Ptr) = "ImDrawData_AddDrawList"
	Function _ImDrawData_DeIndexAllBuffers(this:Byte Ptr) = "ImDrawData_DeIndexAllBuffers"
	Function _ImDrawData_ScaleClipRects(this:Byte Ptr, fb_scale:SImVec2) = "ImDrawData_ScaleClipRects"
	Function _ImFontGlyphRangesBuilder_Clear(this:Byte Ptr) = "ImFontGlyphRangesBuilder_Clear"
	Function _ImFontGlyphRangesBuilder_GetBit:Int(this:Byte Ptr, n:size_t) = "ImFontGlyphRangesBuilder_GetBit"
	Function _ImFontGlyphRangesBuilder_SetBit(this:Byte Ptr, n:size_t) = "ImFontGlyphRangesBuilder_SetBit"
	Function _ImFontGlyphRangesBuilder_AddChar(this:Byte Ptr, c:Short) = "ImFontGlyphRangesBuilder_AddChar"
	Function _ImFontGlyphRangesBuilder_AddText(this:Byte Ptr, text:String, text_end:String) = "bmx_ImFontGlyphRangesBuilder_AddText"
	Function _ImFontGlyphRangesBuilder_AddRanges(this:Byte Ptr, ranges:Byte Ptr) = "ImFontGlyphRangesBuilder_AddRanges"
	Function _ImFontGlyphRangesBuilder_BuildRanges(this:Byte Ptr, out_ranges:Byte Ptr) = "ImFontGlyphRangesBuilder_BuildRanges"
	Function _ImFontAtlas_AddFont:Byte Ptr(this:Byte Ptr, font_cfg:Byte Ptr) = "ImFontAtlas_AddFont"
	Function _ImFontAtlas_AddFontDefault:Byte Ptr(this:Byte Ptr, font_cfg:Byte Ptr) = "ImFontAtlas_AddFontDefault"
	Function _ImFontAtlas_AddFontFromFileTTF:Byte Ptr(this:Byte Ptr, filename:String, size_pixels:Float, font_cfg:Byte Ptr, glyph_ranges:Byte Ptr) = "bmx_ImFontAtlas_AddFontFromFileTTF"
	Function _ImFontAtlas_AddFontFromMemoryTTF:Byte Ptr(this:Byte Ptr, font_data:Byte Ptr, font_data_size:Int, size_pixels:Float, font_cfg:Byte Ptr, glyph_ranges:Byte Ptr) = "ImFontAtlas_AddFontFromMemoryTTF"
	Function _ImFontAtlas_AddFontFromMemoryCompressedTTF:Byte Ptr(this:Byte Ptr, compressed_font_data:Byte Ptr, compressed_font_data_size:Int, size_pixels:Float, font_cfg:Byte Ptr, glyph_ranges:Byte Ptr) = "ImFontAtlas_AddFontFromMemoryCompressedTTF"
	Function _ImFontAtlas_AddFontFromMemoryCompressedBase85TTF:Byte Ptr(this:Byte Ptr, compressed_font_data_base85:String, size_pixels:Float, font_cfg:Byte Ptr, glyph_ranges:Byte Ptr) = "bmx_ImFontAtlas_AddFontFromMemoryCompressedBase85TTF"
	Function _ImFontAtlas_ClearInputData(this:Byte Ptr) = "ImFontAtlas_ClearInputData"
	Function _ImFontAtlas_ClearFonts(this:Byte Ptr) = "ImFontAtlas_ClearFonts"
	Function _ImFontAtlas_ClearTexData(this:Byte Ptr) = "ImFontAtlas_ClearTexData"
	Function _ImFontAtlas_Clear(this:Byte Ptr) = "ImFontAtlas_Clear"
	Function _ImFontAtlas_Build:Int(this:Byte Ptr) = "ImFontAtlas_Build"
	Function _ImFontAtlas_GetTexDataAsAlpha8(this:Byte Ptr, out_pixels:Byte Ptr, out_width:Int Var, out_height:Int Var, out_bytes_per_pixel:Int Var) = "ImFontAtlas_GetTexDataAsAlpha8"
	Function _ImFontAtlas_GetTexDataAsRGBA32(this:Byte Ptr, out_pixels:Byte Ptr, out_width:Int Var, out_height:Int Var, out_bytes_per_pixel:Int Var) = "ImFontAtlas_GetTexDataAsRGBA32"
	Function _ImFontAtlas_IsBuilt:Int(this:Byte Ptr) = "ImFontAtlas_IsBuilt"
	Function _ImFontAtlas_SetTexID(this:Byte Ptr, id:ULong) = "ImFontAtlas_SetTexID"
	Function _ImFontAtlas_GetGlyphRangesDefault:Byte Ptr(this:Byte Ptr) = "ImFontAtlas_GetGlyphRangesDefault"
	Function _ImFontAtlas_GetGlyphRangesGreek:Byte Ptr(this:Byte Ptr) = "ImFontAtlas_GetGlyphRangesGreek"
	Function _ImFontAtlas_GetGlyphRangesKorean:Byte Ptr(this:Byte Ptr) = "ImFontAtlas_GetGlyphRangesKorean"
	Function _ImFontAtlas_GetGlyphRangesJapanese:Byte Ptr(this:Byte Ptr) = "ImFontAtlas_GetGlyphRangesJapanese"
	Function _ImFontAtlas_GetGlyphRangesChineseFull:Byte Ptr(this:Byte Ptr) = "ImFontAtlas_GetGlyphRangesChineseFull"
	Function _ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon:Byte Ptr(this:Byte Ptr) = "ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon"
	Function _ImFontAtlas_GetGlyphRangesCyrillic:Byte Ptr(this:Byte Ptr) = "ImFontAtlas_GetGlyphRangesCyrillic"
	Function _ImFontAtlas_GetGlyphRangesThai:Byte Ptr(this:Byte Ptr) = "ImFontAtlas_GetGlyphRangesThai"
	Function _ImFontAtlas_GetGlyphRangesVietnamese:Byte Ptr(this:Byte Ptr) = "ImFontAtlas_GetGlyphRangesVietnamese"
	Function _ImFontAtlas_AddCustomRectRegular:Int(this:Byte Ptr, width:Int, height:Int) = "ImFontAtlas_AddCustomRectRegular"
	Function _ImFontAtlas_AddCustomRectFontGlyph:Int(this:Byte Ptr, font:Byte Ptr, id:Short, width:Int, height:Int, advance_x:Float, offset:SImVec2) = "ImFontAtlas_AddCustomRectFontGlyph"
	Function _ImFontAtlas_GetCustomRectByIndex:Byte Ptr(this:Byte Ptr, index:Int) = "ImFontAtlas_GetCustomRectByIndex"
	Function _ImFont_FindGlyph:Byte Ptr(this:Byte Ptr, c:Short) = "ImFont_FindGlyph"
	Function _ImFont_FindGlyphNoFallback:Byte Ptr(this:Byte Ptr, c:Short) = "ImFont_FindGlyphNoFallback"
	Function _ImFont_GetCharAdvance:Float(this:Byte Ptr, c:Short) = "ImFont_GetCharAdvance"
	Function _ImFont_IsLoaded:Int(this:Byte Ptr) = "ImFont_IsLoaded"
	Function _ImFont_GetDebugName:String(this:Byte Ptr) = "bmx_ImFont_GetDebugName"
	Function _ImGuiViewport_GetCenter:SImVec2(this:Byte Ptr) = "ImGuiViewport_GetCenter"
	Function _ImGuiViewport_GetWorkCenter:SImVec2(this:Byte Ptr) = "ImGuiViewport_GetWorkCenter"
End Extern

Public
Enum EImGuiWindowFlags Flags
	_None = 0
	_NoTitleBar = 1
	_NoResize = 2
	_NoMove = 4
	_NoScrollbar = 8
	_NoScrollWithMouse = 16
	_NoCollapse = 32
	_AlwaysAutoResize = 64
	_NoBackground = 128
	_NoSavedSettings = 256
	_NoMouseInputs = 512
	_MenuBar = 1024
	_HorizontalScrollbar = 2048
	_NoFocusOnAppearing = 4096
	_NoBringToFrontOnFocus = 8192
	_AlwaysVerticalScrollbar = 16384
	_AlwaysHorizontalScrollbar = 32768
	_NoNavInputs = 65536
	_NoNavFocus = 131072
	_UnsavedDocument = 262144
	_NoNav = 196608
	_NoDecoration = 43
	_NoInputs = 197120
	_ChildWindow = 16777216
	_Tooltip = 33554432
	_Popup = 67108864
	_Modal = 134217728
	_ChildMenu = 268435456
	_NavFlattened = 536870912
	_AlwaysUseWindowPadding = 1073741824
End Enum

Enum EImGuiChildFlags Flags
	_None = 0
	_Borders = 1
	_AlwaysUseWindowPadding = 2
	_ResizeX = 4
	_ResizeY = 8
	_AutoResizeX = 16
	_AutoResizeY = 32
	_AlwaysAutoResize = 64
	_FrameStyle = 128
	_NavFlattened = 256
	_Border = 1
End Enum

Enum EImGuiItemFlags Flags
	_None = 0
	_NoTabStop = 1
	_NoNav = 2
	_NoNavDefaultFocus = 4
	_ButtonRepeat = 8
	_AutoClosePopups = 16
	_AllowDuplicateId = 32
End Enum

Enum EImGuiInputTextFlags Flags
	_None = 0
	_CharsDecimal = 1
	_CharsHexadecimal = 2
	_CharsScientific = 4
	_CharsUppercase = 8
	_CharsNoBlank = 16
	_AllowTabInput = 32
	_EnterReturnsTrue = 64
	_EscapeClearsAll = 128
	_CtrlEnterForNewLine = 256
	_ReadOnly = 512
	_Password = 1024
	_AlwaysOverwrite = 2048
	_AutoSelectAll = 4096
	_ParseEmptyRefVal = 8192
	_DisplayEmptyRefVal = 16384
	_NoHorizontalScroll = 32768
	_NoUndoRedo = 65536
	_ElideLeft = 131072
	_CallbackCompletion = 262144
	_CallbackHistory = 524288
	_CallbackAlways = 1048576
	_CallbackCharFilter = 2097152
	_CallbackResize = 4194304
	_CallbackEdit = 8388608
End Enum

Enum EImGuiTreeNodeFlags Flags
	_None = 0
	_Selected = 1
	_Framed = 2
	_AllowOverlap = 4
	_NoTreePushOnOpen = 8
	_NoAutoOpenOnLog = 16
	_DefaultOpen = 32
	_OpenOnDoubleClick = 64
	_OpenOnArrow = 128
	_Leaf = 256
	_Bullet = 512
	_FramePadding = 1024
	_SpanAvailWidth = 2048
	_SpanFullWidth = 4096
	_SpanLabelWidth = 8192
	_SpanAllColumns = 16384
	_LabelSpanAllColumns = 32768
	_NavLeftJumpsBackHere = 131072
	_CollapsingHeader = 26
	_AllowItemOverlap = 4
	_SpanTextWidth = 8192
End Enum

Enum EImGuiPopupFlags Flags
	_None = 0
	_MouseButtonLeft = 0
	_MouseButtonRight = 1
	_MouseButtonMiddle = 2
	_MouseButtonMask_ = 31
	_MouseButtonDefault_ = 1
	_NoReopen = 32
	_NoOpenOverExistingPopup = 128
	_NoOpenOverItems = 256
	_AnyPopupId = 1024
	_AnyPopupLevel = 2048
	_AnyPopup = 3072
End Enum

Enum EImGuiSelectableFlags Flags
	_None = 0
	_NoAutoClosePopups = 1
	_SpanAllColumns = 2
	_AllowDoubleClick = 4
	_Disabled = 8
	_AllowOverlap = 16
	_Highlight = 32
	_DontClosePopups = 1
	_AllowItemOverlap = 16
End Enum

Enum EImGuiComboFlags Flags
	_None = 0
	_PopupAlignLeft = 1
	_HeightSmall = 2
	_HeightRegular = 4
	_HeightLarge = 8
	_HeightLargest = 16
	_NoArrowButton = 32
	_NoPreview = 64
	_WidthFitPreview = 128
	_HeightMask_ = 30
End Enum

Enum EImGuiTabBarFlags Flags
	_None = 0
	_Reorderable = 1
	_AutoSelectNewTabs = 2
	_TabListPopupButton = 4
	_NoCloseWithMiddleMouseButton = 8
	_NoTabListScrollingButtons = 16
	_NoTooltip = 32
	_DrawSelectedOverline = 64
	_FittingPolicyResizeDown = 128
	_FittingPolicyScroll = 256
	_FittingPolicyMask_ = 384
	_FittingPolicyDefault_ = 128
End Enum

Enum EImGuiTabItemFlags Flags
	_None = 0
	_UnsavedDocument = 1
	_SetSelected = 2
	_NoCloseWithMiddleMouseButton = 4
	_NoPushId = 8
	_NoTooltip = 16
	_NoReorder = 32
	_Leading = 64
	_Trailing = 128
	_NoAssumedClosure = 256
End Enum

Enum EImGuiFocusedFlags Flags
	_None = 0
	_ChildWindows = 1
	_RootWindow = 2
	_AnyWindow = 4
	_NoPopupHierarchy = 8
	_RootAndChildWindows = 3
End Enum

Enum EImGuiHoveredFlags Flags
	_None = 0
	_ChildWindows = 1
	_RootWindow = 2
	_AnyWindow = 4
	_NoPopupHierarchy = 8
	_AllowWhenBlockedByPopup = 32
	_AllowWhenBlockedByActiveItem = 128
	_AllowWhenOverlappedByItem = 256
	_AllowWhenOverlappedByWindow = 512
	_AllowWhenDisabled = 1024
	_NoNavOverride = 2048
	_AllowWhenOverlapped = 768
	_RectOnly = 928
	_RootAndChildWindows = 3
	_ForTooltip = 4096
	_Stationary = 8192
	_DelayNone = 16384
	_DelayShort = 32768
	_DelayNormal = 65536
	_NoSharedDelay = 131072
End Enum

Enum EImGuiDragDropFlags Flags
	_None = 0
	_SourceNoPreviewTooltip = 1
	_SourceNoDisableHover = 2
	_SourceNoHoldToOpenOthers = 4
	_SourceAllowNullID = 8
	_SourceExtern = 16
	_PayloadAutoExpire = 32
	_PayloadNoCrossContext = 64
	_PayloadNoCrossProcess = 128
	_AcceptBeforeDelivery = 1024
	_AcceptNoDrawDefaultRect = 2048
	_AcceptNoPreviewTooltip = 4096
	_AcceptPeekOnly = 3072
	_SourceAutoExpirePayload = 32
End Enum

Enum EImGuiDataType
	_S8 = 0
	_U8 = 1
	_S16 = 2
	_U16 = 3
	_S32 = 4
	_U32 = 5
	_S64 = 6
	_U64 = 7
	_Float = 8
	_Double = 9
	_Bool = 10
	_String = 11
	_COUNT = 12
End Enum

Enum EImGuiDir
	__None = -1
	__Left = 0
	__Right = 1
	__Up = 2
	__Down = 3
	__COUNT = 4
End Enum

Enum EImGuiSortDirection
	__None = 0
	__Ascending = 1
	__Descending = 2
End Enum

Enum EImGuiKey
	__None = 0
	__NamedKey_BEGIN = 512
	__Tab = 512
	__LeftArrow = 513
	__RightArrow = 514
	__UpArrow = 515
	__DownArrow = 516
	__PageUp = 517
	__PageDown = 518
	__Home = 519
	__End = 520
	__Insert = 521
	__Delete = 522
	__Backspace = 523
	__Space = 524
	__Enter = 525
	__Escape = 526
	__LeftCtrl = 527
	__LeftShift = 528
	__LeftAlt = 529
	__LeftSuper = 530
	__RightCtrl = 531
	__RightShift = 532
	__RightAlt = 533
	__RightSuper = 534
	__Menu = 535
	__0 = 536
	__1 = 537
	__2 = 538
	__3 = 539
	__4 = 540
	__5 = 541
	__6 = 542
	__7 = 543
	__8 = 544
	__9 = 545
	__A = 546
	__B = 547
	__C = 548
	__D = 549
	__E = 550
	__F = 551
	__G = 552
	__H = 553
	__I = 554
	__J = 555
	__K = 556
	__L = 557
	__M = 558
	__N = 559
	__O = 560
	__P = 561
	__Q = 562
	__R = 563
	__S = 564
	__T = 565
	__U = 566
	__V = 567
	__W = 568
	__X = 569
	__Y = 570
	__Z = 571
	__F1 = 572
	__F2 = 573
	__F3 = 574
	__F4 = 575
	__F5 = 576
	__F6 = 577
	__F7 = 578
	__F8 = 579
	__F9 = 580
	__F10 = 581
	__F11 = 582
	__F12 = 583
	__F13 = 584
	__F14 = 585
	__F15 = 586
	__F16 = 587
	__F17 = 588
	__F18 = 589
	__F19 = 590
	__F20 = 591
	__F21 = 592
	__F22 = 593
	__F23 = 594
	__F24 = 595
	__Apostrophe = 596
	__Comma = 597
	__Minus = 598
	__Period = 599
	__Slash = 600
	__Semicolon = 601
	__Equal = 602
	__LeftBracket = 603
	__Backslash = 604
	__RightBracket = 605
	__GraveAccent = 606
	__CapsLock = 607
	__ScrollLock = 608
	__NumLock = 609
	__PrintScreen = 610
	__Pause = 611
	__Keypad0 = 612
	__Keypad1 = 613
	__Keypad2 = 614
	__Keypad3 = 615
	__Keypad4 = 616
	__Keypad5 = 617
	__Keypad6 = 618
	__Keypad7 = 619
	__Keypad8 = 620
	__Keypad9 = 621
	__KeypadDecimal = 622
	__KeypadDivide = 623
	__KeypadMultiply = 624
	__KeypadSubtract = 625
	__KeypadAdd = 626
	__KeypadEnter = 627
	__KeypadEqual = 628
	__AppBack = 629
	__AppForward = 630
	__Oem102 = 631
	__GamepadStart = 632
	__GamepadBack = 633
	__GamepadFaceLeft = 634
	__GamepadFaceRight = 635
	__GamepadFaceUp = 636
	__GamepadFaceDown = 637
	__GamepadDpadLeft = 638
	__GamepadDpadRight = 639
	__GamepadDpadUp = 640
	__GamepadDpadDown = 641
	__GamepadL1 = 642
	__GamepadR1 = 643
	__GamepadL2 = 644
	__GamepadR2 = 645
	__GamepadL3 = 646
	__GamepadR3 = 647
	__GamepadLStickLeft = 648
	__GamepadLStickRight = 649
	__GamepadLStickUp = 650
	__GamepadLStickDown = 651
	__GamepadRStickLeft = 652
	__GamepadRStickRight = 653
	__GamepadRStickUp = 654
	__GamepadRStickDown = 655
	__MouseLeft = 656
	__MouseRight = 657
	__MouseMiddle = 658
	__MouseX1 = 659
	__MouseX2 = 660
	__MouseWheelX = 661
	__MouseWheelY = 662
	__ReservedForModCtrl = 663
	__ReservedForModShift = 664
	__ReservedForModAlt = 665
	__ReservedForModSuper = 666
	__NamedKey_END = 667
	ImGuiMod_None = 0
	ImGuiMod_Ctrl = 4096
	ImGuiMod_Shift = 8192
	ImGuiMod_Alt = 16384
	ImGuiMod_Super = 32768
	ImGuiMod_Mask_ = 61440
	__NamedKey_COUNT = 155
	__COUNT = 667
	ImGuiMod_Shortcut = 4096
	__ModCtrl = 4096
	__ModShift = 8192
	__ModAlt = 16384
	__ModSuper = 32768
End Enum

Enum EImGuiInputFlags Flags
	_None = 0
	_Repeat = 1
	_RouteActive = 1024
	_RouteFocused = 2048
	_RouteGlobal = 4096
	_RouteAlways = 8192
	_RouteOverFocused = 16384
	_RouteOverActive = 32768
	_RouteUnlessBgFocused = 65536
	_RouteFromRootWindow = 131072
	_Tooltip = 262144
End Enum

Enum EImGuiConfigFlags Flags
	_None = 0
	_NavEnableKeyboard = 1
	_NavEnableGamepad = 2
	_NoMouse = 16
	_NoMouseCursorChange = 32
	_NoKeyboard = 64
	_IsSRGB = 1048576
	_IsTouchScreen = 2097152
	_NavEnableSetMousePos = 4
	_NavNoCaptureKeyboard = 8
End Enum

Enum EImGuiBackendFlags Flags
	_None = 0
	_HasGamepad = 1
	_HasMouseCursors = 2
	_HasSetMousePos = 4
	_RendererHasVtxOffset = 8
End Enum

Enum EImGuiCol
	_Text = 0
	_TextDisabled = 1
	_WindowBg = 2
	_ChildBg = 3
	_PopupBg = 4
	_Border = 5
	_BorderShadow = 6
	_FrameBg = 7
	_FrameBgHovered = 8
	_FrameBgActive = 9
	_TitleBg = 10
	_TitleBgActive = 11
	_TitleBgCollapsed = 12
	_MenuBarBg = 13
	_ScrollbarBg = 14
	_ScrollbarGrab = 15
	_ScrollbarGrabHovered = 16
	_ScrollbarGrabActive = 17
	_CheckMark = 18
	_SliderGrab = 19
	_SliderGrabActive = 20
	_Button = 21
	_ButtonHovered = 22
	_ButtonActive = 23
	_Header = 24
	_HeaderHovered = 25
	_HeaderActive = 26
	_Separator = 27
	_SeparatorHovered = 28
	_SeparatorActive = 29
	_ResizeGrip = 30
	_ResizeGripHovered = 31
	_ResizeGripActive = 32
	_TabHovered = 33
	_Tab = 34
	_TabSelected = 35
	_TabSelectedOverline = 36
	_TabDimmed = 37
	_TabDimmedSelected = 38
	_TabDimmedSelectedOverline = 39
	_PlotLines = 40
	_PlotLinesHovered = 41
	_PlotHistogram = 42
	_PlotHistogramHovered = 43
	_TableHeaderBg = 44
	_TableBorderStrong = 45
	_TableBorderLight = 46
	_TableRowBg = 47
	_TableRowBgAlt = 48
	_TextLink = 49
	_TextSelectedBg = 50
	_DragDropTarget = 51
	_NavCursor = 52
	_NavWindowingHighlight = 53
	_NavWindowingDimBg = 54
	_ModalWindowDimBg = 55
	_COUNT = 56
	_TabActive = 35
	_TabUnfocused = 37
	_TabUnfocusedActive = 38
	_NavHighlight = 52
End Enum

Enum EImGuiStyleVar
	_Alpha = 0
	_DisabledAlpha = 1
	_WindowPadding = 2
	_WindowRounding = 3
	_WindowBorderSize = 4
	_WindowMinSize = 5
	_WindowTitleAlign = 6
	_ChildRounding = 7
	_ChildBorderSize = 8
	_PopupRounding = 9
	_PopupBorderSize = 10
	_FramePadding = 11
	_FrameRounding = 12
	_FrameBorderSize = 13
	_ItemSpacing = 14
	_ItemInnerSpacing = 15
	_IndentSpacing = 16
	_CellPadding = 17
	_ScrollbarSize = 18
	_ScrollbarRounding = 19
	_GrabMinSize = 20
	_GrabRounding = 21
	_ImageBorderSize = 22
	_TabRounding = 23
	_TabBorderSize = 24
	_TabBarBorderSize = 25
	_TabBarOverlineSize = 26
	_TableAngledHeadersAngle = 27
	_TableAngledHeadersTextAlign = 28
	_ButtonTextAlign = 29
	_SelectableTextAlign = 30
	_SeparatorTextBorderSize = 31
	_SeparatorTextAlign = 32
	_SeparatorTextPadding = 33
	_COUNT = 34
End Enum

Enum EImGuiButtonFlags Flags
	_None = 0
	_MouseButtonLeft = 1
	_MouseButtonRight = 2
	_MouseButtonMiddle = 4
	_MouseButtonMask_ = 7
	_EnableNav = 8
End Enum

Enum EImGuiColorEditFlags Flags
	_None = 0
	_NoAlpha = 2
	_NoPicker = 4
	_NoOptions = 8
	_NoSmallPreview = 16
	_NoInputs = 32
	_NoTooltip = 64
	_NoLabel = 128
	_NoSidePreview = 256
	_NoDragDrop = 512
	_NoBorder = 1024
	_AlphaOpaque = 2048
	_AlphaNoBg = 4096
	_AlphaPreviewHalf = 8192
	_AlphaBar = 65536
	_HDR = 524288
	_DisplayRGB = 1048576
	_DisplayHSV = 2097152
	_DisplayHex = 4194304
	_Uint8 = 8388608
	_Float = 16777216
	_PickerHueBar = 33554432
	_PickerHueWheel = 67108864
	_InputRGB = 134217728
	_InputHSV = 268435456
	_DefaultOptions_ = 177209344
	_AlphaMask_ = 14338
	_DisplayMask_ = 7340032
	_DataTypeMask_ = 25165824
	_PickerMask_ = 100663296
	_InputMask_ = 402653184
	_AlphaPreview = 0
End Enum

Enum EImGuiSliderFlags Flags
	_None = 0
	_Logarithmic = 32
	_NoRoundToFormat = 64
	_NoInput = 128
	_WrapAround = 256
	_ClampOnInput = 512
	_ClampZeroRange = 1024
	_NoSpeedTweaks = 2048
	_AlwaysClamp = 1536
	_InvalidMask_ = 1879048207
End Enum

Enum EImGuiMouseButton
	_Left = 0
	_Right = 1
	_Middle = 2
	_COUNT = 5
End Enum

Enum EImGuiMouseCursor
	_None = -1
	_Arrow = 0
	_TextInput = 1
	_ResizeAll = 2
	_ResizeNS = 3
	_ResizeEW = 4
	_ResizeNESW = 5
	_ResizeNWSE = 6
	_Hand = 7
	_Wait = 8
	_Progress = 9
	_NotAllowed = 10
	_COUNT = 11
End Enum

Enum EImGuiMouseSource
	__Mouse = 0
	__TouchScreen = 1
	__Pen = 2
	__COUNT = 3
End Enum

Enum EImGuiCond
	_None = 0
	_Always = 1
	_Once = 2
	_FirstUseEver = 4
	_Appearing = 8
End Enum

Enum EImGuiTableFlags Flags
	_None = 0
	_Resizable = 1
	_Reorderable = 2
	_Hideable = 4
	_Sortable = 8
	_NoSavedSettings = 16
	_ContextMenuInBody = 32
	_RowBg = 64
	_BordersInnerH = 128
	_BordersOuterH = 256
	_BordersInnerV = 512
	_BordersOuterV = 1024
	_BordersH = 384
	_BordersV = 1536
	_BordersInner = 640
	_BordersOuter = 1280
	_Borders = 1920
	_NoBordersInBody = 2048
	_NoBordersInBodyUntilResize = 4096
	_SizingFixedFit = 8192
	_SizingFixedSame = 16384
	_SizingStretchProp = 24576
	_SizingStretchSame = 32768
	_NoHostExtendX = 65536
	_NoHostExtendY = 131072
	_NoKeepColumnsVisible = 262144
	_PreciseWidths = 524288
	_NoClip = 1048576
	_PadOuterX = 2097152
	_NoPadOuterX = 4194304
	_NoPadInnerX = 8388608
	_ScrollX = 16777216
	_ScrollY = 33554432
	_SortMulti = 67108864
	_SortTristate = 134217728
	_HighlightHoveredColumn = 268435456
	_SizingMask_ = 57344
End Enum

Enum EImGuiTableColumnFlags Flags
	_None = 0
	_Disabled = 1
	_DefaultHide = 2
	_DefaultSort = 4
	_WidthStretch = 8
	_WidthFixed = 16
	_NoResize = 32
	_NoReorder = 64
	_NoHide = 128
	_NoClip = 256
	_NoSort = 512
	_NoSortAscending = 1024
	_NoSortDescending = 2048
	_NoHeaderLabel = 4096
	_NoHeaderWidth = 8192
	_PreferSortAscending = 16384
	_PreferSortDescending = 32768
	_IndentEnable = 65536
	_IndentDisable = 131072
	_AngledHeader = 262144
	_IsEnabled = 16777216
	_IsVisible = 33554432
	_IsSorted = 67108864
	_IsHovered = 134217728
	_WidthMask_ = 24
	_IndentMask_ = 196608
	_StatusMask_ = 251658240
	_NoDirectResize_ = 1073741824
End Enum

Enum EImGuiTableRowFlags Flags
	_None = 0
	_Headers = 1
End Enum

Enum EImGuiTableBgTarget
	_None = 0
	_RowBg0 = 1
	_RowBg1 = 2
	_CellBg = 3
End Enum

Enum EImGuiMultiSelectFlags Flags
	_None = 0
	_SingleSelect = 1
	_NoSelectAll = 2
	_NoRangeSelect = 4
	_NoAutoSelect = 8
	_NoAutoClear = 16
	_NoAutoClearOnReselect = 32
	_BoxSelect1d = 64
	_BoxSelect2d = 128
	_BoxSelectNoScroll = 256
	_ClearOnEscape = 512
	_ClearOnClickVoid = 1024
	_ScopeWindow = 2048
	_ScopeRect = 4096
	_SelectOnClick = 8192
	_SelectOnClickRelease = 16384
	_NavWrapX = 65536
End Enum

Enum EImGuiSelectionRequestType
	__None = 0
	__SetAll = 1
	__SetRange = 2
End Enum

Enum EImDrawFlags Flags
	_None = 0
	_Closed = 1
	_RoundCornersTopLeft = 16
	_RoundCornersTopRight = 32
	_RoundCornersBottomLeft = 64
	_RoundCornersBottomRight = 128
	_RoundCornersNone = 256
	_RoundCornersTop = 48
	_RoundCornersBottom = 192
	_RoundCornersLeft = 80
	_RoundCornersRight = 160
	_RoundCornersAll = 240
	_RoundCornersDefault_ = 240
	_RoundCornersMask_ = 496
End Enum

Enum EImDrawListFlags Flags
	_None = 0
	_AntiAliasedLines = 1
	_AntiAliasedLinesUseTex = 2
	_AntiAliasedFill = 4
	_AllowVtxOffset = 8
End Enum

Enum EImFontAtlasFlags Flags
	_None = 0
	_NoPowerOfTwoHeight = 1
	_NoMouseCursors = 2
	_NoBakedLines = 4
End Enum

Enum EImGuiViewportFlags Flags
	_None = 0
	_IsPlatformWindow = 1
	_IsPlatformMonitor = 2
	_OwnedByApp = 4
End Enum

