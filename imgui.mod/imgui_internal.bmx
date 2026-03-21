SuperStrict

Import "generated/common_gen.bmx"

Type TImGuiDockNode
	Field handle:Byte Ptr
	Function _Create:TImGuiDockNode(handle:Byte Ptr)
		Local this:TImGuiDockNode = New TImGuiDockNode
		this.handle = handle
		Return this
	End Function
End Type


Function ImGui_DockBuilderDockWindow(window_name:String, node_id:UInt)
	_ImGui_DockBuilderDockWindow(window_name, node_id)
End Function

Function ImGui_DockBuilderGetNode:TImGuiDockNode(node_id:UInt)
	Local handle:Byte Ptr = _ImGui_DockBuilderGetNode(node_id)
	If handle Then
		Return TImGuiDockNode._Create(handle)
	End If
	Return Null
End Function

Function ImGui_DockBuilderGetCentralNode:TImGuiDockNode(node_id:UInt)
	Local handle:Byte Ptr = _ImGui_DockBuilderGetCentralNode(node_id)
	If handle Then
		Return TImGuiDockNode._Create(handle)
	End If
	Return Null
End Function

Function ImGui_DockBuilderAddNode:UInt()
	Return _ImGui_DockBuilderAddNode()
End Function

Function ImGui_DockBuilderAddNodeEx:UInt(node_id:UInt, flags:EImGuiDockNodeFlags)
	Return _ImGui_DockBuilderAddNodeEx(node_id, flags)
End Function

Function ImGui_DockBuilderRemoveNode(node_id:UInt)
	_ImGui_DockBuilderRemoveNode(node_id)
End Function

Function ImGui_DockBuilderRemoveNodeDockedWindows(node_id:UInt)
	_ImGui_DockBuilderRemoveNodeDockedWindows(node_id)
End Function

Function ImGui_DockBuilderRemoveNodeDockedWindowsEx(node_id:UInt, clear_settings_refs:Int)
	_ImGui_DockBuilderRemoveNodeDockedWindowsEx(node_id, clear_settings_refs)
End Function

Function ImGui_DockBuilderRemoveNodeChildNodes(node_id:UInt)
	_ImGui_DockBuilderRemoveNodeChildNodes(node_id)
End Function

Function ImGui_DockBuilderSetNodePos(node_id:UInt, pos:SImVec2)
	_ImGui_DockBuilderSetNodePos(node_id, pos)
End Function

Function ImGui_DockBuilderSetNodeSize(node_id:UInt, size:SImVec2)
	_ImGui_DockBuilderSetNodeSize(node_id, size)
End Function

Function ImGui_DockBuilderSplitNode:UInt(node_id:UInt, split_dir:EImGuiDir, size_ratio_for_node_at_dir:Float, out_id_at_dir:UInt Ptr, out_id_at_opposite_dir:UInt Ptr)
	Return _ImGui_DockBuilderSplitNode(node_id, split_dir, size_ratio_for_node_at_dir, out_id_at_dir, out_id_at_opposite_dir)
End Function

Function ImGui_DockBuilderCopyWindowSettings(src_name:String, dst_name:String)
	_ImGui_DockBuilderCopyWindowSettings(src_name, dst_name)
End Function

Function ImGui_DockBuilderFinish(node_id:UInt)
	_ImGui_DockBuilderFinish(node_id)
End Function



Extern
	Function _ImGui_DockBuilderDockWindow(window_name:String, node_id:UInt)="bmx_ImGui_DockBuilderDockWindow"
	Function _ImGui_DockBuilderGetNode:Byte Ptr(node_id:UInt)="ImGui_DockBuilderGetNode"
	Function _ImGui_DockBuilderGetCentralNode:Byte Ptr(node_id:UInt)="ImGui_DockBuilderGetCentralNode"
	Function _ImGui_DockBuilderAddNode:UInt()="ImGui_DockBuilderAddNode"
	Function _ImGui_DockBuilderAddNodeEx:UInt(node_id:UInt, flags:EImGuiDockNodeFlags)="ImGui_DockBuilderAddNodeEx"
	Function _ImGui_DockBuilderRemoveNode(node_id:UInt)="ImGui_DockBuilderRemoveNode"
	Function _ImGui_DockBuilderRemoveNodeDockedWindows(node_id:UInt)="ImGui_DockBuilderRemoveNodeDockedWindows"
	Function _ImGui_DockBuilderRemoveNodeDockedWindowsEx(node_id:UInt, clear_settings_refs:Int)="ImGui_DockBuilderRemoveNodeDockedWindowsEx"
	Function _ImGui_DockBuilderRemoveNodeChildNodes(node_id:UInt)="ImGui_DockBuilderRemoveNodeChildNodes"
	Function _ImGui_DockBuilderSetNodePos(node_id:UInt, pos:SImVec2)="ImGui_DockBuilderSetNodePos"
	Function _ImGui_DockBuilderSetNodeSize(node_id:UInt, size:SImVec2)="ImGui_DockBuilderSetNodeSize"
	Function _ImGui_DockBuilderSplitNode:UInt(node_id:UInt, split_dir:EImGuiDir, size_ratio_for_node_at_dir:Float, out_id_at_dir:UInt Ptr, out_id_at_opposite_dir:UInt Ptr)="ImGui_DockBuilderSplitNode"
	Function _ImGui_DockBuilderCopyWindowSettings(src_name:String, dst_name:String)="bmx_ImGui_DockBuilderCopyWindowSettings"
	Function _ImGui_DockBuilderFinish(node_id:UInt)="ImGui_DockBuilderFinish"
End Extern
