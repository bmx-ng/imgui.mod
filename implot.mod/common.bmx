' Copyright (c) 2025-2026 Bruce A Henderson
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
Import "source.bmx"

Type TImPlotContext
	Field handle:Byte Ptr
	Function _Create:TImPlotContext(handle:Byte Ptr)
		Local this:TImPlotContext = New TImPlotContext
		this.handle = handle
		Return this
	End Function
End Type


' functions

Rem
bbdoc: Creates a new ImPlot demo window.
about: The demo window is a great way to get started with ImPlot. It contains many examples of how to use the library.
End Rem
Function ImPlot_ShowDemoWindow(open:Int Var)
	_ImPlot_ShowDemoWindow(open)
End Function

' Contexts

Rem
bbdoc: Creates a new ImPlot context.
End Rem
Function ImPlot_CreateContext:TImPlotContext()
	Return TImPlotContext._Create(_ImPlot_CreateContext())
End Function

Rem
bbdoc: Destroys an ImPlot context.
about: If ctx is #Null, the current context is destroyed.
End Rem
Function ImPlot_DestroyContext(ctx:TImPlotContext)
	If ctx Then
		_ImPlot_DestroyContext(ctx.handle)
	Else
		_ImPlot_DestroyContext(Null)
	End If
End Function

Rem
bbdoc: Returns the current ImPlot context, or #Null if no context is set.
End Rem
Function ImPlot_GetCurrentContext:TImPlotContext()
	Local handle:Byte Ptr = _ImPlot_GetCurrentContext()
	If handle Then
		Local ctx:TImPlotContext = New TImPlotContext
		ctx.handle = handle
		Return ctx
	End If
End Function

Rem
bbdoc: Sets the current ImPlot context.
End Rem
Function ImPlot_SetCurrentContext(ctx:TImPlotContext)
	If ctx Then
		_ImPlot_SetCurrentContext(ctx.handle)
	Else
		_ImPlot_SetCurrentContext(Null)
	End If
End Function

' Begin/End Plot

Rem
bbdoc: Starts a 2D plotting context.
about: If this function returns true, #ImPlot_EndPlot() MUST be called!

You are encouraged to use the following convention:
```blitzmax
If ImPlot_BeginPlot(...) Then
     ImPlot_PlotLine(...)
     ...
     ImPlot_EndPlot()
End If
```
End Rem
Function ImPlot_BeginPlot:Int(title_id:String, size:SImVec2, flags:EImPlotFlags = EImPlotFlags._None)
	Return _ImPlot_BeginPlotSize(title_id, size, flags)
End Function

Rem
bbdoc: Starts a 2D plotting context.
about: If this function returns true, #ImPlot_EndPlot() MUST be called!

You are encouraged to use the following convention:
```blitzmax
If ImPlot_BeginPlot(...) Then
     ImPlot_PlotLine(...)
     ...
     ImPlot_EndPlot()
End If
```
End Rem
Function ImPlot_BeginPlot:Int(title_id:String, flags:EImPlotFlags = EImPlotFlags._None)
	Return _ImPlot_BeginPlot(title_id, flags)
End Function

Rem
bbdoc: Only call #ImPlot_EndPlot() if #ImPlot_BeginPlot() returns true!
about: Typically called at the end of an if statement conditioned on ImPlot_BeginPlot().
End Rem
Function ImPlot_EndPlot()
	_ImPlot_EndPlot()
End Function

' Begin/End Subplots

Function ImPlot_BeginSubplots:Int(title_id:String, rows:Int, cols:Int, size:SImVec2, flags:EImPlotSubplotFlags = EImPlotSubplotFlags._None, row_ratios:Float Ptr, col_ratios:Float Ptr)
	Return _ImPlot_BeginSubplots(title_id, rows, cols, size, flags, row_ratios, col_ratios)
End Function

Function ImPlot_EndSubplots()
	_ImPlot_EndSubplots()
End Function

' Setup

Function ImPlot_SetupAxis(axis:EImAxis, label:String = Null, flags:EImPlotAxisFlags = EImPlotAxisFlags._None)
	_ImPlot_SetupAxis(axis, label, flags)
End Function

Function ImPlot_SetupAxisLimits(axis:EImAxis, v_min:Double, v_max:Double, cond:EImPlotCond = EImPlotCond._Once)
	_ImPlot_SetupAxisLimits(axis, v_min, v_max, cond)
End Function

Rem
bbdoc: Links an axis range limits to external values.
about: Set to Null for no linkage. The pointer data must remain valid until EndPlot.
End Rem
Function ImPlot_SetupAxisLinks(axis:EImAxis, link_min:Double Ptr, link_max:Double Ptr)
	_ImPlot_SetupAxisLinks(axis, link_min, link_max)
End Function

Function ImPlot_SetupAxisFormat(axis:EImAxis, fmt:String)
	_ImPlot_SetupAxisFormat(axis, fmt)
End Function

' Plot Items

'float
Rem
bbdoc: Plots a standard 2D line plot using #Float values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Float Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotLineFloat(title_id, values, count, xscale, xstart)
End Function

Rem
bbdoc: Plots a standard 2D line plot using #Float values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Float Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotLineFloat_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Float values.
about: If your data is a simple struct/array you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int)
	_ImPlot_PlotLineXYFloat(title_id, xs, ys, count)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Float values.
about: If your data is a simple struct/array you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotLineXYFloat_Spec(title_id, xs, ys, count, spec)
End Function

'double
Rem
bbdoc: Plots a standard 2D line plot using #Double values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Double Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotLineDouble(title_id, values, count, xscale, xstart)
End Function

Rem
bbdoc: Plots a standard 2D line plot using #Double values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Double Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotLineDouble_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Double values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int)
	_ImPlot_PlotLineXYDouble(title_id, xs, ys, count)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Double values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotLineXYDouble_Spec(title_id, xs, ys, count, spec)
End Function

'byte
Rem
bbdoc: Plots a standard 2D line plot using #Byte values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Byte Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotLineByte(title_id, values, count, xscale, xstart)
End Function

Rem
bbdoc: Plots a standard 2D line plot using #Byte values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Byte Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotLineByte_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Byte values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int)
	_ImPlot_PlotLineXYByte(title_id, xs, ys, count)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Byte values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotLineXYByte_Spec(title_id, xs, ys, count, spec)
End Function

'short
Rem
bbdoc: Plots a standard 2D line plot using #Short values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Short Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotLineShort(title_id, values, count, xscale, xstart)
End Function

Rem
bbdoc: Plots a standard 2D line plot using #Short values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Short Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotLineShort_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Short values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int)
	_ImPlot_PlotLineXYShort(title_id, xs, ys, count)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Short values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotLineXYShort_Spec(title_id, xs, ys, count, spec)
End Function

'int
Rem
bbdoc: Plots a standard 2D line plot using #Int values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Int Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotLineInt(title_id, values, count, xscale, xstart)
End Function

Rem
bbdoc: Plots a standard 2D line plot using #Int values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Int Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotLineInt_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Int values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int)
	_ImPlot_PlotLineXYInt(title_id, xs, ys, count)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Int values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotLineXYInt_Spec(title_id, xs, ys, count, spec)
End Function

'long
Rem
bbdoc: Plots a standard 2D line plot using #Long values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Long Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotLineLong(title_id, values, count, xscale, xstart)
End Function

Rem
bbdoc: Plots a standard 2D line plot using #Long values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:Long Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotLineLong_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Long values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int)
	_ImPlot_PlotLineXYLong(title_id, xs, ys, count)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #Long values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotLineXYLong_Spec(title_id, xs, ys, count, spec)
End Function

'uint
Rem
bbdoc: Plots a standard 2D line plot using #UInt values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:UInt Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotLineUInt(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotLine(title_id:String, values:UInt Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotLineUInt_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #UInt values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int)
	_ImPlot_PlotLineXYUInt(title_id, xs, ys, count)
End Function

Function ImPlot_PlotLine(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotLineXYUInt_Spec(title_id, xs, ys, count, spec)
End Function

'ulong
Rem
bbdoc: Plots a standard 2D line plot using #ULong values.
End Rem
Function ImPlot_PlotLine(title_id:String, values:ULong Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotLineULong(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotLine(title_id:String, values:ULong Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotLineULong_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D line plot using x and y #ULong values.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotLine(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int)
	_ImPlot_PlotLineXYULong(title_id, xs, ys, count)
End Function

Function ImPlot_PlotLine(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotLineXYULong_Spec(title_id, xs, ys, count, spec)
End Function

' scatter

' float
Rem
bbdoc: Plots a standard 2D scatter plot using #Float values.
about: Default marker is _Circle.
End Rem
Function ImPlot_PlotScatter(title_id:String, values:Float Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotScatterFloat(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotScatter(title_id:String, values:Float Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotScatterFloat_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D scatter plot using x and y #Float values.
about: Default marker is _Circle.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotScatter(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int)
	_ImPlot_PlotScatterXYFloat(title_id, xs, ys, count)
End Function

Function ImPlot_PlotScatter(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotScatterXYFloat_Spec(title_id, xs, ys, count, spec)
End Function

' double
Rem
bbdoc: Plots a standard 2D scatter plot using #Double values.
about: Default marker is _Circle.
End Rem
Function ImPlot_PlotScatter(title_id:String, values:Double Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotScatterDouble(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotScatter(title_id:String, values:Double Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotScatterDouble_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D scatter plot using x and y #Double values.
about: Default marker is _Circle.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotScatter(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int)
	_ImPlot_PlotScatterXYDouble(title_id, xs, ys, count)
End Function

Function ImPlot_PlotScatter(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotScatterXYDouble_Spec(title_id, xs, ys, count, spec)
End Function

' byte
Rem
bbdoc: Plots a standard 2D scatter plot using #Byte values.
about: Default marker is _Circle.
End Rem
Function ImPlot_PlotScatter(title_id:String, values:Byte Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotScatterByte(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotScatter(title_id:String, values:Byte Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotScatterByte_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D scatter plot using x and y #Byte values.
about: Default marker is _Circle.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotScatter(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int)
	_ImPlot_PlotScatterXYByte(title_id, xs, ys, count)
End Function

Function ImPlot_PlotScatter(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotScatterXYByte_Spec(title_id, xs, ys, count, spec)
End Function

' short
Rem
bbdoc: Plots a standard 2D scatter plot using #Short values.
about: Default marker is _Circle.
End Rem
Function ImPlot_PlotScatter(title_id:String, values:Short Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotScatterShort(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotScatter(title_id:String, values:Short Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotScatterShort_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D scatter plot using x and y #Short values.
about: Default marker is _Circle.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotScatter(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int)
	_ImPlot_PlotScatterXYShort(title_id, xs, ys, count)
End Function

Function ImPlot_PlotScatter(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotScatterXYShort_Spec(title_id, xs, ys, count, spec)
End Function

' int
Rem
bbdoc: Plots a standard 2D scatter plot using #Int values.
about: Default marker is _Circle.
End Rem
Function ImPlot_PlotScatter(title_id:String, values:Int Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotScatterInt(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotScatter(title_id:String, values:Int Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotScatterInt_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D scatter plot using x and y #Int values.
about: Default marker is _Circle.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotScatter(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int)
	_ImPlot_PlotScatterXYInt(title_id, xs, ys, count)
End Function

Function ImPlot_PlotScatter(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotScatterXYInt_Spec(title_id, xs, ys, count, spec)
End Function

' long
Rem
bbdoc: Plots a standard 2D scatter plot using #Long values.
about: Default marker is _Circle.
End Rem
Function ImPlot_PlotScatter(title_id:String, values:Long Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotScatterLong(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotScatter(title_id:String, values:Long Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotScatterLong_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D scatter plot using x and y #Long values.
about: Default marker is _Circle.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotScatter(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int)
	_ImPlot_PlotScatterXYLong(title_id, xs, ys, count)
End Function

Function ImPlot_PlotScatter(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotScatterXYLong_Spec(title_id, xs, ys, count, spec)
End Function

' uint
Rem
bbdoc: Plots a standard 2D scatter plot using #UInt values.
about: Default marker is _Circle.
End Rem
Function ImPlot_PlotScatter(title_id:String, values:UInt Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotScatterUInt(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotScatter(title_id:String, values:UInt Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotScatterUInt_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D scatter plot using x and y #UInt values.
about: Default marker is _Circle.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotScatter(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int)
	_ImPlot_PlotScatterXYUInt(title_id, xs, ys, count)
End Function

Function ImPlot_PlotScatter(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotScatterXYUInt_Spec(title_id, xs, ys, count, spec)
End Function

' ulong
Rem
bbdoc: Plots a standard 2D scatter plot using #ULong values.
about: Default marker is _Circle.
End Rem
Function ImPlot_PlotScatter(title_id:String, values:ULong Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotScatterULong(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotScatter(title_id:String, values:ULong Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotScatterULong_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a standard 2D scatter plot using x and y #ULong values.
about: Default marker is _Circle.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotScatter(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int)
	_ImPlot_PlotScatterXYULong(title_id, xs, ys, count)
End Function

Function ImPlot_PlotScatter(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotScatterXYULong_Spec(title_id, xs, ys, count, spec)
End Function

' plot stairs

' float
Rem
bbdoc: Plots a a stairstep graph using #Float values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
End Rem
Function ImPlot_PlotStairs(title_id:String, values:Float Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotStairsFloat(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotStairs(title_id:String, values:Float Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStairsFloat_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a a stairstep graph using x and y #Float values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStairs(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int)
	_ImPlot_PlotStairsXYFloat(title_id, xs, ys, count)
End Function

Function ImPlot_PlotStairs(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotStairsXYFloat_Spec(title_id, xs, ys, count, spec)
End Function

' double
Rem
bbdoc: Plots a a stairstep graph using #Double values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
End Rem
Function ImPlot_PlotStairs(title_id:String, values:Double Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotStairsDouble(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotStairs(title_id:String, values:Double Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStairsDouble_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a a stairstep graph using x and y #Double values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStairs(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int)
	_ImPlot_PlotStairsXYDouble(title_id, xs, ys, count)
End Function

Function ImPlot_PlotStairs(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotStairsXYDouble_Spec(title_id, xs, ys, count, spec)
End Function

' byte
Rem
bbdoc: Plots a a stairstep graph using #Byte values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
End Rem
Function ImPlot_PlotStairs(title_id:String, values:Byte Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotStairsByte(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotStairs(title_id:String, values:Byte Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStairsByte_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a a stairstep graph using x and y #Byte values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStairs(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int)
	_ImPlot_PlotStairsXYByte(title_id, xs, ys, count)
End Function

Function ImPlot_PlotStairs(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotStairsXYByte_Spec(title_id, xs, ys, count, spec)
End Function

' short
Rem
bbdoc: Plots a a stairstep graph using #Short values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
End Rem
Function ImPlot_PlotStairs(title_id:String, values:Short Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotStairsShort(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotStairs(title_id:String, values:Short Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStairsShort_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a a stairstep graph using x and y #Short values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStairs(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int)
	_ImPlot_PlotStairsXYShort(title_id, xs, ys, count)
End Function

Function ImPlot_PlotStairs(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotStairsXYShort_Spec(title_id, xs, ys, count, spec)
End Function

' int
Rem
bbdoc: Plots a a stairstep graph using #Int values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
End Rem
Function ImPlot_PlotStairs(title_id:String, values:Int Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotStairsInt(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotStairs(title_id:String, values:Int Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStairsInt_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a a stairstep graph using x and y #Int values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStairs(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int)
	_ImPlot_PlotStairsXYInt(title_id, xs, ys, count)
End Function

Function ImPlot_PlotStairs(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotStairsXYInt_Spec(title_id, xs, ys, count, spec)
End Function

' long
Rem
bbdoc: Plots a a stairstep graph using #Long values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
End Rem
Function ImPlot_PlotStairs(title_id:String, values:Long Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotStairsLong(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotStairs(title_id:String, values:Long Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStairsLong_Spec(title_id, values, count, xscale, xstart, spec)
End Function


Rem
bbdoc: Plots a a stairstep graph using x and y #Long values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStairs(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int)
	_ImPlot_PlotStairsXYLong(title_id, xs, ys, count)
End Function

Function ImPlot_PlotStairs(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotStairsXYLong_Spec(title_id, xs, ys, count, spec)
End Function

' uint
Rem
bbdoc: Plots a a stairstep graph using #UInt values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
End Rem
Function ImPlot_PlotStairs(title_id:String, values:UInt Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotStairsUInt(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotStairs(title_id:String, values:UInt Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStairsUInt_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a a stairstep graph using x and y #UInt values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStairs(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int)
	_ImPlot_PlotStairsXYUInt(title_id, xs, ys, count)
End Function

Function ImPlot_PlotStairs(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotStairsXYUInt_Spec(title_id, xs, ys, count, spec)
End Function

' ulong
Rem
bbdoc: Plots a a stairstep graph using #ULong values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
End Rem
Function ImPlot_PlotStairs(title_id:String, values:ULong Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotStairsULong(title_id, values, count, xscale, xstart)
End Function

Function ImPlot_PlotStairs(title_id:String, values:ULong Ptr, count:Int, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStairsULong_Spec(title_id, values, count, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a a stairstep graph using x and y #ULong values.
about: The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStairs(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int)
	_ImPlot_PlotStairsXYULong(title_id, xs, ys, count)
End Function

Function ImPlot_PlotStairs(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotStairsXYULong_Spec(title_id, xs, ys, count, spec)
End Function

' plot shaded
' float
Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using #Float values.
about: Set yref to +/-INFINITY for infinite fill extents.
End Rem
Function ImPlot_PlotShaded(title_id:String, values:Float Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotShadedFloat(title_id, values, count, yref, xscale, xstart)
End Function

Function ImPlot_PlotShaded(title_id:String, values:Float Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedFloat_Spec(title_id, values, count, yref, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Float values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, yref:Double = 0.0)
	_ImPlot_PlotShadedXYFloat(title_id, xs, ys, count, yref)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, yref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYFloat_Spec(title_id, xs, ys, count, yref, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using #Float values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Float Ptr, ys1:Float Ptr, ys2:Float Ptr, count:Int)
	_ImPlot_PlotShadedXYYFloat(title_id, xs, ys1, ys2, count)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Float Ptr, ys1:Float Ptr, ys2:Float Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYYFloat_Spec(title_id, xs, ys1, ys2, count, spec)
End Function

' double
Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using #Double values.
about: Set yref to +/-INFINITY for infinite fill extents.
End Rem
Function ImPlot_PlotShaded(title_id:String, values:Double Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotShadedDouble(title_id, values, count, yref, xscale, xstart)
End Function

Function ImPlot_PlotShaded(title_id:String, values:Double Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedDouble_Spec(title_id, values, count, yref, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Double values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, yref:Double = 0.0)
	_ImPlot_PlotShadedXYDouble(title_id, xs, ys, count, yref)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, yref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYDouble_Spec(title_id, xs, ys, count, yref, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Double values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Double Ptr, ys1:Double Ptr, ys2:Double Ptr, count:Int)
	_ImPlot_PlotShadedXYYDouble(title_id, xs, ys1, ys2, count)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Double Ptr, ys1:Double Ptr, ys2:Double Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYYDouble_Spec(title_id, xs, ys1, ys2, count, spec)
End Function

' byte
Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using #Byte values.
about: Set yref to +/-INFINITY for infinite fill extents.
End Rem
Function ImPlot_PlotShaded(title_id:String, values:Byte Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotShadedByte(title_id, values, count, yref, xscale, xstart)
End Function

Function ImPlot_PlotShaded(title_id:String, values:Byte Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedByte_Spec(title_id, values, count, yref, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Byte values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, yref:Double = 0.0)
	_ImPlot_PlotShadedXYByte(title_id, xs, ys, count, yref)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, yref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYByte_Spec(title_id, xs, ys, count, yref, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Byte values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Byte Ptr, ys1:Byte Ptr, ys2:Byte Ptr, count:Int)
	_ImPlot_PlotShadedXYYByte(title_id, xs, ys1, ys2, count)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Byte Ptr, ys1:Byte Ptr, ys2:Byte Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYYByte_Spec(title_id, xs, ys1, ys2, count, spec)
End Function

' short
Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using #Short values.
about: Set yref to +/-INFINITY for infinite fill extents.
End Rem
Function ImPlot_PlotShaded(title_id:String, values:Short Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotShadedShort(title_id, values, count, yref, xscale, xstart)
End Function

Function ImPlot_PlotShaded(title_id:String, values:Short Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedShort_Spec(title_id, values, count, yref, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Short values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, yref:Double = 0.0)
	_ImPlot_PlotShadedXYShort(title_id, xs, ys, count, yref)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, yref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYShort_Spec(title_id, xs, ys, count, yref, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Short values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Short Ptr, ys1:Short Ptr, ys2:Short Ptr, count:Int)
	_ImPlot_PlotShadedXYYShort(title_id, xs, ys1, ys2, count)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Short Ptr, ys1:Short Ptr, ys2:Short Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYYShort_Spec(title_id, xs, ys1, ys2, count, spec)
End Function

' int
Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using #Int values.
about: Set yref to +/-INFINITY for infinite fill extents.
End Rem
Function ImPlot_PlotShaded(title_id:String, values:Int Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotShadedInt(title_id, values, count, yref, xscale, xstart)
End Function

Function ImPlot_PlotShaded(title_id:String, values:Int Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedInt_Spec(title_id, values, count, yref, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Int values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, yref:Double = 0.0)
	_ImPlot_PlotShadedXYInt(title_id, xs, ys, count, yref)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, yref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYInt_Spec(title_id, xs, ys, count, yref, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Int values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Int Ptr, ys1:Int Ptr, ys2:Int Ptr, count:Int)
	_ImPlot_PlotShadedXYYInt(title_id, xs, ys1, ys2, count)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Int Ptr, ys1:Int Ptr, ys2:Int Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYYInt_Spec(title_id, xs, ys1, ys2, count, spec)
End Function

' long
Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using #Long values.
about: Set yref to +/-INFINITY for infinite fill extents.
End Rem
Function ImPlot_PlotShaded(title_id:String, values:Long Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotShadedLong(title_id, values, count, yref, xscale, xstart)
End Function

Function ImPlot_PlotShaded(title_id:String, values:Long Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedLong_Spec(title_id, values, count, yref, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Long values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, yref:Double = 0.0)
	_ImPlot_PlotShadedXYLong(title_id, xs, ys, count, yref)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, yref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYLong_Spec(title_id, xs, ys, count, yref, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #Long values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:Long Ptr, ys1:Long Ptr, ys2:Long Ptr, count:Int)
	_ImPlot_PlotShadedXYYLong(title_id, xs, ys1, ys2, count)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:Long Ptr, ys1:Long Ptr, ys2:Long Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYYLong_Spec(title_id, xs, ys1, ys2, count, spec)
End Function

' uint
Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using #UInt values.
about: Set yref to +/-INFINITY for infinite fill extents.
End Rem
Function ImPlot_PlotShaded(title_id:String, values:UInt Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotShadedUInt(title_id, values, count, yref, xscale, xstart)
End Function

Function ImPlot_PlotShaded(title_id:String, values:UInt Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedUInt_Spec(title_id, values, count, yref, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #UInt values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, yref:Double = 0.0)
	_ImPlot_PlotShadedXYUInt(title_id, xs, ys, count, yref)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, yref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYUInt_Spec(title_id, xs, ys, count, yref, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #UInt values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:UInt Ptr, ys1:UInt Ptr, ys2:UInt Ptr, count:Int)
	_ImPlot_PlotShadedXYYUInt(title_id, xs, ys1, ys2, count)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:UInt Ptr, ys1:UInt Ptr, ys2:UInt Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYYUInt_Spec(title_id, xs, ys1, ys2, count, spec)
End Function

' ulong
Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using #ULong values.
about: Set yref to +/-INFINITY for infinite fill extents.
End Rem
Function ImPlot_PlotShaded(title_id:String, values:ULong Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0)
	_ImPlot_PlotShadedULong(title_id, values, count, yref, xscale, xstart)
End Function

Function ImPlot_PlotShaded(title_id:String, values:ULong Ptr, count:Int, yref:Double = 0.0, xscale:Double = 1.0, xstart:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedULong_Spec(title_id, values, count, yref, xscale, xstart, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #ULong values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, yref:Double = 0.0)
	_ImPlot_PlotShadedXYULong(title_id, xs, ys, count, yref)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, yref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYULong_Spec(title_id, xs, ys, count, yref, spec)
End Function

Rem
bbdoc: Plots a shaded (filled) region between two lines, or a line and a horizontal reference using x and y #ULong values.
about: Set yref to +/-INFINITY for infinite fill extents.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotShaded(title_id:String, xs:ULong Ptr, ys1:ULong Ptr, ys2:ULong Ptr, count:Int)
	_ImPlot_PlotShadedXYYULong(title_id, xs, ys1, ys2, count)
End Function

Function ImPlot_PlotShaded(title_id:String, xs:ULong Ptr, ys1:ULong Ptr, ys2:ULong Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotShadedXYYULong_Spec(title_id, xs, ys1, ys2, count, spec)
End Function

' plot bars
' float
Rem
bbdoc: Plots a bar graph using #Float values.
Vertical by default. @bar_size and @shift are in plot units.
End Rem
Function ImPlot_PlotBars(title_id:String, values:Float Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarsFloat(title_id, values, count, bar_size, shift)
End Function

Function ImPlot_PlotBars(title_id:String, values:Float Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarsFloat_Spec(title_id, values, count, bar_size, shift, spec)
End Function

Rem
bbdoc: Plots a bar graph using x and y #Float values.
Vertical by default. @bar_size and @shift are in plot units.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotBars(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, bar_size:Double)
	_ImPlot_PlotBarsXYFloat(title_id, xs, ys, count, bar_size)
End Function

Function ImPlot_PlotBars(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, bar_size:Double, spec:SImPlotSpec)
	_ImPlot_PlotBarsXYFloat_Spec(title_id, xs, ys, count, bar_size, spec)
End Function

' double
Rem
bbdoc: Plots a bar graph using #Double values.
Vertical by default. @bar_size and @shift are in plot units.
End Rem
Function ImPlot_PlotBars(title_id:String, values:Double Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarsDouble(title_id, values, count, bar_size, shift)
End Function

Function ImPlot_PlotBars(title_id:String, values:Double Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarsDouble_Spec(title_id, values, count, bar_size, shift, spec)
End Function

Rem
bbdoc: Plots a bar graph using x and y #Double values.
Vertical by default. @bar_size and @shift are in plot units.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotBars(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, bar_size:Double)
	_ImPlot_PlotBarsXYDouble(title_id, xs, ys, count, bar_size)
End Function

Function ImPlot_PlotBars(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, bar_size:Double, spec:SImPlotSpec)
	_ImPlot_PlotBarsXYDouble_Spec(title_id, xs, ys, count, bar_size, spec)
End Function

' byte
Rem
bbdoc: Plots a bar graph using #Byte values.
Vertical by default. @bar_size and @shift are in plot units.
End Rem
Function ImPlot_PlotBars(title_id:String, values:Byte Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarsByte(title_id, values, count, bar_size, shift)
End Function

Function ImPlot_PlotBars(title_id:String, values:Byte Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarsByte_Spec(title_id, values, count, bar_size, shift, spec)
End Function

Rem
bbdoc: Plots a bar graph using x and y #Byte values.
Vertical by default. @bar_size and @shift are in plot units.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotBars(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, bar_size:Double)
	_ImPlot_PlotBarsXYByte(title_id, xs, ys, count, bar_size)
End Function

Function ImPlot_PlotBars(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, bar_size:Double, spec:SImPlotSpec)
	_ImPlot_PlotBarsXYByte_Spec(title_id, xs, ys, count, bar_size, spec)
End Function

' short
Rem
bbdoc: Plots a bar graph using #Short values.
Vertical by default. @bar_size and @shift are in plot units.
End Rem
Function ImPlot_PlotBars(title_id:String, values:Short Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarsShort(title_id, values, count, bar_size, shift)
End Function

Function ImPlot_PlotBars(title_id:String, values:Short Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarsShort_Spec(title_id, values, count, bar_size, shift, spec)
End Function

Rem
bbdoc: Plots a bar graph using x and y #Short values.
Vertical by default. @bar_size and @shift are in plot units.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotBars(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, bar_size:Double)
	_ImPlot_PlotBarsXYShort(title_id, xs, ys, count, bar_size)
End Function

Function ImPlot_PlotBars(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, bar_size:Double, spec:SImPlotSpec)
	_ImPlot_PlotBarsXYShort_Spec(title_id, xs, ys, count, bar_size, spec)
End Function

' int
Rem
bbdoc: Plots a bar graph using #Int values.
Vertical by default. @bar_size and @shift are in plot units.
End Rem
Function ImPlot_PlotBars(title_id:String, values:Int Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarsInt(title_id, values, count, bar_size, shift)
End Function

Function ImPlot_PlotBars(title_id:String, values:Int Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarsInt_Spec(title_id, values, count, bar_size, shift, spec)
End Function

Rem
bbdoc: Plots a bar graph using x and y #Int values.
Vertical by default. @bar_size and @shift are in plot units.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotBars(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, bar_size:Double)
	_ImPlot_PlotBarsXYInt(title_id, xs, ys, count, bar_size)
End Function

Function ImPlot_PlotBars(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, bar_size:Double, spec:SImPlotSpec)
	_ImPlot_PlotBarsXYInt_Spec(title_id, xs, ys, count, bar_size, spec)
End Function

' long
Rem
bbdoc: Plots a bar graph using #Long values.
Vertical by default. @bar_size and @shift are in plot units.
End Rem
Function ImPlot_PlotBars(title_id:String, values:Long Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarsLong(title_id, values, count, bar_size, shift)
End Function

Function ImPlot_PlotBars(title_id:String, values:Long Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarsLong_Spec(title_id, values, count, bar_size, shift, spec)
End Function

Rem
bbdoc: Plots a bar graph using x and y #Long values.
Vertical by default. @bar_size and @shift are in plot units.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotBars(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, bar_size:Double)
	_ImPlot_PlotBarsXYLong(title_id, xs, ys, count, bar_size)
End Function

Function ImPlot_PlotBars(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, bar_size:Double, spec:SImPlotSpec)
	_ImPlot_PlotBarsXYLong_Spec(title_id, xs, ys, count, bar_size, spec)
End Function

' uint
Rem
bbdoc: Plots a bar graph using #UInt values.
Vertical by default. @bar_size and @shift are in plot units.
End Rem
Function ImPlot_PlotBars(title_id:String, values:UInt Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarsUInt(title_id, values, count, bar_size, shift)
End Function

Function ImPlot_PlotBars(title_id:String, values:UInt Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarsUInt_Spec(title_id, values, count, bar_size, shift, spec)
End Function

Rem
bbdoc: Plots a bar graph using x and y #UInt values.
Vertical by default. @bar_size and @shift are in plot units.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotBars(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, bar_size:Double)
	_ImPlot_PlotBarsXYUInt(title_id, xs, ys, count, bar_size)
End Function

Function ImPlot_PlotBars(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, bar_size:Double, spec:SImPlotSpec)
	_ImPlot_PlotBarsXYUInt_Spec(title_id, xs, ys, count, bar_size, spec)
End Function

' ulong
Rem
bbdoc: Plots a bar graph using #ULong values.
Vertical by default. @bar_size and @shift are in plot units.
End Rem
Function ImPlot_PlotBars(title_id:String, values:ULong Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarsULong(title_id, values, count, bar_size, shift)
End Function

Function ImPlot_PlotBars(title_id:String, values:ULong Ptr, count:Int, bar_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarsULong_Spec(title_id, values, count, bar_size, shift, spec)
End Function

Rem
bbdoc: Plots a bar graph using x and y #ULong values.
Vertical by default. @bar_size and @shift are in plot units.
about: If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotBars(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, bar_size:Double)
	_ImPlot_PlotBarsXYULong(title_id, xs, ys, count, bar_size)
End Function

Function ImPlot_PlotBars(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, bar_size:Double, spec:SImPlotSpec)
	_ImPlot_PlotBarsXYULong_Spec(title_id, xs, ys, count, bar_size, spec)
End Function

' IMPLOT_TMP void PlotBarGroups(const char* const label_ids[], const T* values, int item_count, int group_count, double group_size=0.67, double shift=0, ImPlotBarGroupsFlags flags=0);

' float
Rem
bbdoc: Plots a group of bars using #Float values.
about: @values is a row-major matrix with @item_count rows and @group_count cols. @label_ids should have @item_count elements.
End Rem
Function ImPlot_PlotBarGroups(label_ids:String[], values:Float Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarGroupsFloat(label_ids, values, item_count, group_count, group_size, shift)
End Function

Function ImPlot_PlotBarGroups(label_ids:String[], values:Float Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarGroupsFloat_Spec(label_ids, values, item_count, group_count, group_size, shift, spec)
End Function

' double
Rem
bbdoc: Plots a group of bars using #Double values.
about: @values is a row-major matrix with @item_count rows and @group_count cols. @label_ids should have @item_count elements.
End Rem
Function ImPlot_PlotBarGroups(label_ids:String[], values:Double Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarGroupsDouble(label_ids, values, item_count, group_count, group_size, shift)
End Function

Function ImPlot_PlotBarGroups(label_ids:String[], values:Double Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarGroupsDouble_Spec(label_ids, values, item_count, group_count, group_size, shift, spec)
End Function

' byte
Rem
bbdoc: Plots a group of bars using #Byte values.
about: @values is a row-major matrix with @item_count rows and @group_count cols. @label_ids should have @item_count elements.
End Rem
Function ImPlot_PlotBarGroups(label_ids:String[], values:Byte Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarGroupsByte(label_ids, values, item_count, group_count, group_size, shift)
End Function

Function ImPlot_PlotBarGroups(label_ids:String[], values:Byte Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarGroupsByte_Spec(label_ids, values, item_count, group_count, group_size, shift, spec)
End Function

' short
Rem
bbdoc: Plots a group of bars using #Short values.
about: @values is a row-major matrix with @item_count rows and @group_count cols. @label_ids should have @item_count elements.
End Rem
Function ImPlot_PlotBarGroups(label_ids:String[], values:Short Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarGroupsShort(label_ids, values, item_count, group_count, group_size, shift)
End Function

Function ImPlot_PlotBarGroups(label_ids:String[], values:Short Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarGroupsShort_Spec(label_ids, values, item_count, group_count, group_size, shift, spec)
End Function

' int
Rem
bbdoc: Plots a group of bars using #Int values.
about: @values is a row-major matrix with @item_count rows and @group_count cols. @label_ids should have @item_count elements.
End Rem
Function ImPlot_PlotBarGroups(label_ids:String[], values:Int Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarGroupsInt(label_ids, values, item_count, group_count, group_size, shift)
End Function

Function ImPlot_PlotBarGroups(label_ids:String[], values:Int Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarGroupsInt_Spec(label_ids, values, item_count, group_count, group_size, shift, spec)
End Function

' long
Rem
bbdoc: Plots a group of bars using #Long values.
about: @values is a row-major matrix with @item_count rows and @group_count cols. @label_ids should have @item_count elements.
End Rem
Function ImPlot_PlotBarGroups(label_ids:String[], values:Long Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarGroupsLong(label_ids, values, item_count, group_count, group_size, shift)
End Function

Function ImPlot_PlotBarGroups(label_ids:String[], values:Long Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarGroupsLong_Spec(label_ids, values, item_count, group_count, group_size, shift, spec)
End Function

' uint
Rem
bbdoc: Plots a group of bars using #UInt values.
about: @values is a row-major matrix with @item_count rows and @group_count cols. @label_ids should have @item_count elements.
End Rem
Function ImPlot_PlotBarGroups(label_ids:String[], values:UInt Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarGroupsUInt(label_ids, values, item_count, group_count, group_size, shift)
End Function

Function ImPlot_PlotBarGroups(label_ids:String[], values:UInt Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarGroupsUInt_Spec(label_ids, values, item_count, group_count, group_size, shift, spec)
End Function

' ulong
Rem
bbdoc: Plots a group of bars using #ULong values.
about: @values is a row-major matrix with @item_count rows and @group_count cols. @label_ids should have @item_count elements.
End Rem
Function ImPlot_PlotBarGroups(label_ids:String[], values:ULong Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0)
	_ImPlot_PlotBarGroupsULong(label_ids, values, item_count, group_count, group_size, shift)
End Function

Function ImPlot_PlotBarGroups(label_ids:String[], values:ULong Ptr, item_count:Int, group_count:Int, group_size:Double = 0.67, shift:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotBarGroupsULong_Spec(label_ids, values, item_count, group_count, group_size, shift, spec)
End Function

' float
Rem
bbdoc: Plots vertical error bars using #Float values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Float Ptr, ys:Float Ptr, err:Float Ptr, count:Int)
	_ImPlot_PlotErrorBarsFloat(title_id, xs, ys, err, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Float Ptr, ys:Float Ptr, err:Float Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsFloat_Spec(title_id, xs, ys, err, count, spec)
End Function

Rem
bbdoc: Plots vertical error bars using x and y #Float values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Float Ptr, ys:Float Ptr, neg:Float Ptr, pos:Float Ptr, count:Int)
	_ImPlot_PlotErrorBarsNPFloat(title_id, xs, ys, neg, pos, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Float Ptr, ys:Float Ptr, neg:Float Ptr, pos:Float Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsNPFloat_Spec(title_id, xs, ys, neg, pos, count, spec)
End Function

' double
Rem
bbdoc: Plots vertical error bars using #Double values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Double Ptr, ys:Double Ptr, err:Double Ptr, count:Int)
	_ImPlot_PlotErrorBarsDouble(title_id, xs, ys, err, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Double Ptr, ys:Double Ptr, err:Double Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsDouble_Spec(title_id, xs, ys, err, count, spec)
End Function

Rem
bbdoc: Plots vertical error bars using x and y #Double values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Double Ptr, ys:Double Ptr, neg:Double Ptr, pos:Double Ptr, count:Int)
	_ImPlot_PlotErrorBarsNPDouble(title_id, xs, ys, neg, pos, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Double Ptr, ys:Double Ptr, neg:Double Ptr, pos:Double Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsNPDouble_Spec(title_id, xs, ys, neg, pos, count, spec)
End Function

' byte
Rem
bbdoc: Plots vertical error bars using #Byte values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Byte Ptr, ys:Byte Ptr, err:Byte Ptr, count:Int)
	_ImPlot_PlotErrorBarsByte(title_id, xs, ys, err, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Byte Ptr, ys:Byte Ptr, err:Byte Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsByte_Spec(title_id, xs, ys, err, count, spec)
End Function

Rem
bbdoc: Plots vertical error bars using x and y #Byte values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Byte Ptr, ys:Byte Ptr, neg:Byte Ptr, pos:Byte Ptr, count:Int)
	_ImPlot_PlotErrorBarsNPByte(title_id, xs, ys, neg, pos, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Byte Ptr, ys:Byte Ptr, neg:Byte Ptr, pos:Byte Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsNPByte_Spec(title_id, xs, ys, neg, pos, count, spec)
End Function

' short
Rem
bbdoc: Plots vertical error bars using #Short values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Short Ptr, ys:Short Ptr, err:Short Ptr, count:Int)
	_ImPlot_PlotErrorBarsShort(title_id, xs, ys, err, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Short Ptr, ys:Short Ptr, err:Short Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsShort_Spec(title_id, xs, ys, err, count, spec)
End Function

Rem
bbdoc: Plots vertical error bars using x and y #Short values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Short Ptr, ys:Short Ptr, neg:Short Ptr, pos:Short Ptr, count:Int)
	_ImPlot_PlotErrorBarsNPShort(title_id, xs, ys, neg, pos, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Short Ptr, ys:Short Ptr, neg:Short Ptr, pos:Short Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsNPShort_Spec(title_id, xs, ys, neg, pos, count, spec)
End Function

' int
Rem
bbdoc: Plots vertical error bars using #Int values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Int Ptr, ys:Int Ptr, err:Int Ptr, count:Int)
	_ImPlot_PlotErrorBarsInt(title_id, xs, ys, err, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Int Ptr, ys:Int Ptr, err:Int Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsInt_Spec(title_id, xs, ys, err, count, spec)
End Function

Rem
bbdoc: Plots vertical error bars using x and y #Int values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Int Ptr, ys:Int Ptr, neg:Int Ptr, pos:Int Ptr, count:Int)
	_ImPlot_PlotErrorBarsNPInt(title_id, xs, ys, neg, pos, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Int Ptr, ys:Int Ptr, neg:Int Ptr, pos:Int Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsNPInt_Spec(title_id, xs, ys, neg, pos, count, spec)
End Function

' long
Rem
bbdoc: Plots vertical error bars using #Long values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Long Ptr, ys:Long Ptr, err:Long Ptr, count:Int)
	_ImPlot_PlotErrorBarsLong(title_id, xs, ys, err, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Long Ptr, ys:Long Ptr, err:Long Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsLong_Spec(title_id, xs, ys, err, count, spec)
End Function

Rem
bbdoc: Plots vertical error bars using x and y #Long values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:Long Ptr, ys:Long Ptr, neg:Long Ptr, pos:Long Ptr, count:Int)
	_ImPlot_PlotErrorBarsNPLong(title_id, xs, ys, neg, pos, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:Long Ptr, ys:Long Ptr, neg:Long Ptr, pos:Long Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsNPLong_Spec(title_id, xs, ys, neg, pos, count, spec)
End Function

' uint
Rem
bbdoc: Plots vertical error bars using #UInt values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:UInt Ptr, ys:UInt Ptr, err:UInt Ptr, count:Int)
	_ImPlot_PlotErrorBarsUInt(title_id, xs, ys, err, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:UInt Ptr, ys:UInt Ptr, err:UInt Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsUInt_Spec(title_id, xs, ys, err, count, spec)
End Function

Rem
bbdoc: Plots vertical error bars using x and y #UInt values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:UInt Ptr, ys:UInt Ptr, neg:UInt Ptr, pos:UInt Ptr, count:Int)
	_ImPlot_PlotErrorBarsNPUInt(title_id, xs, ys, neg, pos, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:UInt Ptr, ys:UInt Ptr, neg:UInt Ptr, pos:UInt Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsNPUInt_Spec(title_id, xs, ys, neg, pos, count, spec)
End Function

' ulong
Rem
bbdoc: Plots vertical error bars using #ULong values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:ULong Ptr, ys:ULong Ptr, err:ULong Ptr, count:Int)
	_ImPlot_PlotErrorBarsULong(title_id, xs, ys, err, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:ULong Ptr, ys:ULong Ptr, err:ULong Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsULong_Spec(title_id, xs, ys, err, count, spec)
End Function

Rem
bbdoc: Plots vertical error bars using x and y #ULong values.
about: The @label_id should be the same as the label_id of the associated line or bar plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotErrorBars(title_id:String, xs:ULong Ptr, ys:ULong Ptr, neg:ULong Ptr, pos:ULong Ptr, count:Int)
	_ImPlot_PlotErrorBarsNPULong(title_id, xs, ys, neg, pos, count)
End Function

Function ImPlot_PlotErrorBars(title_id:String, xs:ULong Ptr, ys:ULong Ptr, neg:ULong Ptr, pos:ULong Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotErrorBarsNPULong_Spec(title_id, xs, ys, neg, pos, count, spec)
End Function

' float
Rem
bbdoc: Plots stems using #Float values.
about: Vertical by default.
End Rem
Function ImPlot_PlotStems(title_id:String, values:Float Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0)
	_ImPlot_PlotStemsFloat(title_id, values, count, ref, scale, start)
End Function

Function ImPlot_PlotStems(title_id:String, values:Float Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsFloat_Spec(title_id, values, count, ref, scale, start, spec)
End Function

Rem
bbdoc: Plots stems using x and y #Float values.
about: Vertical by default.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStems(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, ref:Double = 0.0)
	_ImPlot_PlotStemsXYFloat(title_id, xs, ys, count, ref)
End Function

Function ImPlot_PlotStems(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, ref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsXYFloat_Spec(title_id, xs, ys, count, ref, spec)
End Function

' double
Rem
bbdoc: Plots stems using #Double values.
about: Vertical by default.
End Rem
Function ImPlot_PlotStems(title_id:String, values:Double Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0)
	_ImPlot_PlotStemsDouble(title_id, values, count, ref, scale, start)
End Function

Function ImPlot_PlotStems(title_id:String, values:Double Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsDouble_Spec(title_id, values, count, ref, scale, start, spec)
End Function

Rem
bbdoc: Plots stems using x and y #Double values.
about: Vertical by default.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStems(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, ref:Double = 0.0)
	_ImPlot_PlotStemsXYDouble(title_id, xs, ys, count, ref)
End Function

Function ImPlot_PlotStems(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, ref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsXYDouble_Spec(title_id, xs, ys, count, ref, spec)
End Function

' byte
Rem
bbdoc: Plots stems using #Byte values.
about: Vertical by default.
End Rem
Function ImPlot_PlotStems(title_id:String, values:Byte Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0)
	_ImPlot_PlotStemsByte(title_id, values, count, ref, scale, start)
End Function

Function ImPlot_PlotStems(title_id:String, values:Byte Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsByte_Spec(title_id, values, count, ref, scale, start, spec)
End Function

Rem
bbdoc: Plots stems using x and y #Byte values.
about: Vertical by default.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStems(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, ref:Double = 0.0)
	_ImPlot_PlotStemsXYByte(title_id, xs, ys, count, ref)
End Function

Function ImPlot_PlotStems(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, ref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsXYByte_Spec(title_id, xs, ys, count, ref, spec)
End Function

' short
Rem
bbdoc: Plots stems using #Short values.
about: Vertical by default.
End Rem
Function ImPlot_PlotStems(title_id:String, values:Short Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0)
	_ImPlot_PlotStemsShort(title_id, values, count, ref, scale, start)
End Function

Function ImPlot_PlotStems(title_id:String, values:Short Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsShort_Spec(title_id, values, count, ref, scale, start, spec)
End Function

Rem
bbdoc: Plots stems using x and y #Short values.
about: Vertical by default.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStems(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, ref:Double = 0.0)
	_ImPlot_PlotStemsXYShort(title_id, xs, ys, count, ref)
End Function

Function ImPlot_PlotStems(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, ref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsXYShort_Spec(title_id, xs, ys, count, ref, spec)
End Function

' int
Rem
bbdoc: Plots stems using #Int values.
about: Vertical by default.
End Rem
Function ImPlot_PlotStems(title_id:String, values:Int Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0)
	_ImPlot_PlotStemsInt(title_id, values, count, ref, scale, start)
End Function

Function ImPlot_PlotStems(title_id:String, values:Int Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsInt_Spec(title_id, values, count, ref, scale, start, spec)
End Function

Rem
bbdoc: Plots stems using x and y #Int values.
about: Vertical by default.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStems(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, ref:Double = 0.0)
	_ImPlot_PlotStemsXYInt(title_id, xs, ys, count, ref)
End Function

Function ImPlot_PlotStems(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, ref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsXYInt_Spec(title_id, xs, ys, count, ref, spec)
End Function

' long
Rem
bbdoc: Plots stems using #Long values.
about: Vertical by default.
End Rem
Function ImPlot_PlotStems(title_id:String, values:Long Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0)
	_ImPlot_PlotStemsLong(title_id, values, count, ref, scale, start)
End Function

Function ImPlot_PlotStems(title_id:String, values:Long Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsLong_Spec(title_id, values, count, ref, scale, start, spec)
End Function

Rem
bbdoc: Plots stems using x and y #Long values.
about: Vertical by default.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStems(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, ref:Double = 0.0)
	_ImPlot_PlotStemsXYLong(title_id, xs, ys, count, ref)
End Function

Function ImPlot_PlotStems(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, ref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsXYLong_Spec(title_id, xs, ys, count, ref, spec)
End Function

' uint
Rem
bbdoc: Plots stems using #UInt values.
about: Vertical by default.
End Rem
Function ImPlot_PlotStems(title_id:String, values:UInt Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0)
	_ImPlot_PlotStemsUInt(title_id, values, count, ref, scale, start)
End Function

Function ImPlot_PlotStems(title_id:String, values:UInt Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsUInt_Spec(title_id, values, count, ref, scale, start, spec)
End Function

Rem
bbdoc: Plots stems using x and y #UInt values.
about: Vertical by default.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStems(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, ref:Double = 0.0)
	_ImPlot_PlotStemsXYUInt(title_id, xs, ys, count, ref)
End Function

Function ImPlot_PlotStems(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, ref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsXYUInt_Spec(title_id, xs, ys, count, ref, spec)
End Function

' ulong
Rem
bbdoc: Plots stems using #ULong values.
about: Vertical by default.
End Rem
Function ImPlot_PlotStems(title_id:String, values:ULong Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0)
	_ImPlot_PlotStemsULong(title_id, values, count, ref, scale, start)
End Function

Function ImPlot_PlotStems(title_id:String, values:ULong Ptr, count:Int, ref:Double = 0.0, scale:Double = 1.0, start:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsULong_Spec(title_id, values, count, ref, scale, start, spec)
End Function

Rem
bbdoc: Plots stems using x and y #ULong values.
about: Vertical by default.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotStems(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, ref:Double = 0.0)
	_ImPlot_PlotStemsXYULong(title_id, xs, ys, count, ref)
End Function

Function ImPlot_PlotStems(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, ref:Double = 0.0, spec:SImPlotSpec)
	_ImPlot_PlotStemsXYULong_Spec(title_id, xs, ys, count, ref, spec)
End Function

' float
Rem
bbdoc: Plots infinite vertical or horizontal lines (e.g. for references or asymptotes) using #Float values.
End Rem
Function ImPlot_PlotInfLines(title_id:String, values:Float Ptr, count:Int)
	_ImPlot_PlotInfLinesFloat(title_id, values, count)
End Function

Function ImPlot_PlotInfLines(title_id:String, values:Float Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotInfLinesFloat_Spec(title_id, values, count, spec)
End Function

' double
Rem
bbdoc: Plots infinite vertical or horizontal lines (e.g. for references or asymptotes) using #Double values.
End Rem
Function ImPlot_PlotInfLines(title_id:String, values:Double Ptr, count:Int)
	_ImPlot_PlotInfLinesDouble(title_id, values, count)
End Function

Function ImPlot_PlotInfLines(title_id:String, values:Double Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotInfLinesDouble_Spec(title_id, values, count, spec)
End Function

' byte
Rem
bbdoc: Plots infinite vertical or horizontal lines (e.g. for references or asymptotes) using #Byte values.
End Rem
Function ImPlot_PlotInfLines(title_id:String, values:Byte Ptr, count:Int)
	_ImPlot_PlotInfLinesByte(title_id, values, count)
End Function

Function ImPlot_PlotInfLines(title_id:String, values:Byte Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotInfLinesByte_Spec(title_id, values, count, spec)
End Function

' short
Rem
bbdoc: Plots infinite vertical or horizontal lines (e.g. for references or asymptotes) using #Short values.
End Rem
Function ImPlot_PlotInfLines(title_id:String, values:Short Ptr, count:Int)
	_ImPlot_PlotInfLinesShort(title_id, values, count)
End Function

Function ImPlot_PlotInfLines(title_id:String, values:Short Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotInfLinesShort_Spec(title_id, values, count, spec)
End Function

' int
Rem
bbdoc: Plots infinite vertical or horizontal lines (e.g. for references or asymptotes) using #Int values.
End Rem
Function ImPlot_PlotInfLines(title_id:String, values:Int Ptr, count:Int)
	_ImPlot_PlotInfLinesInt(title_id, values, count)
End Function

Function ImPlot_PlotInfLines(title_id:String, values:Int Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotInfLinesInt_Spec(title_id, values, count, spec)
End Function

' long
Rem
bbdoc: Plots infinite vertical or horizontal lines (e.g. for references or asymptotes) using #Long values.
End Rem
Function ImPlot_PlotInfLines(title_id:String, values:Long Ptr, count:Int)
	_ImPlot_PlotInfLinesLong(title_id, values, count)
End Function

Function ImPlot_PlotInfLines(title_id:String, values:Long Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotInfLinesLong_Spec(title_id, values, count, spec)
End Function

' uint
Rem
bbdoc: Plots infinite vertical or horizontal lines (e.g. for references or asymptotes) using #UInt values.
End Rem
Function ImPlot_PlotInfLines(title_id:String, values:UInt Ptr, count:Int)
	_ImPlot_PlotInfLinesUInt(title_id, values, count)
End Function

Function ImPlot_PlotInfLines(title_id:String, values:UInt Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotInfLinesUInt_Spec(title_id, values, count, spec)
End Function

' ulong
Rem
bbdoc: Plots infinite vertical or horizontal lines (e.g. for references or asymptotes) using #ULong values.
End Rem
Function ImPlot_PlotInfLines(title_id:String, values:ULong Ptr, count:Int)
	_ImPlot_PlotInfLinesULong(title_id, values, count)
End Function

Function ImPlot_PlotInfLines(title_id:String, values:ULong Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotInfLinesULong_Spec(title_id, values, count, spec)
End Function

' float
Rem
bbdoc: Plots a pie chart using #Float values.
about: Center and radius are in plot units. @label_fmt can be set to Null for no labels.
End Rem
Function ImPlot_PlotPieChart(label_ids:String[], values:Float Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0)
	_ImPlot_PlotPieChartFloat(label_ids, values, count, x, y, radius, label_fmt, angle0)
End Function

Function ImPlot_PlotPieChart(label_ids:String[], values:Float Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0, spec:SImPlotSpec)
	_ImPlot_PlotPieChartFloat_Spec(label_ids, values, count, x, y, radius, label_fmt, angle0, spec)
End Function

' double
Rem
bbdoc: Plots a pie chart using #Double values.
about: Center and radius are in plot units. @label_fmt can be set to Null for no labels.
End Rem
Function ImPlot_PlotPieChart(label_ids:String[], values:Double Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0)
	_ImPlot_PlotPieChartDouble(label_ids, values, count, x, y, radius, label_fmt, angle0)
End Function

Function ImPlot_PlotPieChart(label_ids:String[], values:Double Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0, spec:SImPlotSpec)
	_ImPlot_PlotPieChartDouble_Spec(label_ids, values, count, x, y, radius, label_fmt, angle0, spec)
End Function

' byte
Rem
bbdoc: Plots a pie chart using #Byte values.
about: Center and radius are in plot units. @label_fmt can be set to Null for no labels.
End Rem
Function ImPlot_PlotPieChart(label_ids:String[], values:Byte Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0)
	_ImPlot_PlotPieChartByte(label_ids, values, count, x, y, radius, label_fmt, angle0)
End Function

Function ImPlot_PlotPieChart(label_ids:String[], values:Byte Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0, spec:SImPlotSpec)
	_ImPlot_PlotPieChartByte_Spec(label_ids, values, count, x, y, radius, label_fmt, angle0, spec)
End Function

' short
Rem
bbdoc: Plots a pie chart using #Short values.
about: Center and radius are in plot units. @label_fmt can be set to Null for no labels.
End Rem
Function ImPlot_PlotPieChart(label_ids:String[], values:Short Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0)
	_ImPlot_PlotPieChartShort(label_ids, values, count, x, y, radius, label_fmt, angle0)
End Function

Function ImPlot_PlotPieChart(label_ids:String[], values:Short Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0, spec:SImPlotSpec)
	_ImPlot_PlotPieChartShort_Spec(label_ids, values, count, x, y, radius, label_fmt, angle0, spec)
End Function

' int
Rem
bbdoc: Plots a pie chart using #Int values.
about: Center and radius are in plot units. @label_fmt can be set to Null for no labels.
End Rem
Function ImPlot_PlotPieChart(label_ids:String[], values:Int Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0)
	_ImPlot_PlotPieChartInt(label_ids, values, count, x, y, radius, label_fmt, angle0)
End Function

Function ImPlot_PlotPieChart(label_ids:String[], values:Int Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0, spec:SImPlotSpec)
	_ImPlot_PlotPieChartInt_Spec(label_ids, values, count, x, y, radius, label_fmt, angle0, spec)
End Function

' long
Rem
bbdoc: Plots a pie chart using #Long values.
about: Center and radius are in plot units. @label_fmt can be set to Null for no labels.
End Rem
Function ImPlot_PlotPieChart(label_ids:String[], values:Long Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0)
	_ImPlot_PlotPieChartLong(label_ids, values, count, x, y, radius, label_fmt, angle0)
End Function

Function ImPlot_PlotPieChart(label_ids:String[], values:Long Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0, spec:SImPlotSpec)
	_ImPlot_PlotPieChartLong_Spec(label_ids, values, count, x, y, radius, label_fmt, angle0, spec)
End Function

' uint
Rem
bbdoc: Plots a pie chart using #UInt values.
about: Center and radius are in plot units. @label_fmt can be set to Null for no labels.
End Rem
Function ImPlot_PlotPieChart(label_ids:String[], values:UInt Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0)
	_ImPlot_PlotPieChartUInt(label_ids, values, count, x, y, radius, label_fmt, angle0)
End Function

Function ImPlot_PlotPieChart(label_ids:String[], values:UInt Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0, spec:SImPlotSpec)
	_ImPlot_PlotPieChartUInt_Spec(label_ids, values, count, x, y, radius, label_fmt, angle0, spec)
End Function

' ulong
Rem
bbdoc: Plots a pie chart using #ULong values.
about: Center and radius are in plot units. @label_fmt can be set to Null for no labels.
End Rem
Function ImPlot_PlotPieChart(label_ids:String[], values:ULong Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0)
	_ImPlot_PlotPieChartULong(label_ids, values, count, x, y, radius, label_fmt, angle0)
End Function

Function ImPlot_PlotPieChart(label_ids:String[], values:ULong Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String = "%.1f", angle0:Double = 90.0, spec:SImPlotSpec)
	_ImPlot_PlotPieChartULong_Spec(label_ids, values, count, x, y, radius, label_fmt, angle0, spec)
End Function

' float
Rem
bbdoc: Plots a 2D heatmap chart using #Float values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Float Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapFloat(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Float Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapFloat_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

Rem
bbdoc: Plots a 2D heatmap chart using #Float values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Float Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	_ImPlot_PlotHeatmapFloat(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Float Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	_ImPlot_PlotHeatmapFloat_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

' double
Rem
bbdoc: Plots a 2D heatmap chart using #Double values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Double Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapDouble(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Double Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapDouble_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

Rem
bbdoc: Plots a 2D heatmap chart using #Double values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Double Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	_ImPlot_PlotHeatmapDouble(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Double Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	_ImPlot_PlotHeatmapDouble_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

' byte
Rem
bbdoc: Plots a 2D heatmap chart using #Byte values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Byte Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapByte(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Byte Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapByte_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

Rem
bbdoc: Plots a 2D heatmap chart using #Byte values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Byte Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	_ImPlot_PlotHeatmapByte(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Byte Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	_ImPlot_PlotHeatmapByte_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

' short
Rem
bbdoc: Plots a 2D heatmap chart using #Short values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Short Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapShort(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Short Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapShort_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

Rem
bbdoc: Plots a 2D heatmap chart using #Short values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Short Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	_ImPlot_PlotHeatmapShort(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Short Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	_ImPlot_PlotHeatmapShort_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

' int
Rem
bbdoc: Plots a 2D heatmap chart using #Int values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Int Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapInt(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Int Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapInt_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

Rem
bbdoc: Plots a 2D heatmap chart using #Int values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Int Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	_ImPlot_PlotHeatmapInt(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Int Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	_ImPlot_PlotHeatmapInt_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

' long
Rem
bbdoc: Plots a 2D heatmap chart using #Long values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Long Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapLong(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Long Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapLong_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

Rem
bbdoc: Plots a 2D heatmap chart using #Long values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:Long Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	_ImPlot_PlotHeatmapLong(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:Long Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	_ImPlot_PlotHeatmapLong_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

' uint
Rem
bbdoc: Plots a 2D heatmap chart using #UInt values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:UInt Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapUInt(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:UInt Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapUInt_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

Rem
bbdoc: Plots a 2D heatmap chart using #UInt values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:UInt Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	_ImPlot_PlotHeatmapUInt(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:UInt Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	_ImPlot_PlotHeatmapUInt_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

' ulong
Rem
bbdoc: Plots a 2D heatmap chart using #ULong values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:ULong Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapULong(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:ULong Ptr, rows:Int, cols:Int, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	Local bounds_min:SImPlotPoint = New SImPlotPoint
	Local bounds_max:SImPlotPoint = New SImPlotPoint(1.0, 1.0)
	_ImPlot_PlotHeatmapULong_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

Rem
bbdoc: Plots a 2D heatmap chart using #ULong values.
about: Values are expected to be in row-major order by default. Leave @scale_min and @scale_max both at 0 for automatic color scaling, or set them to a predefined range. @label_fmt can be set to #Null for no labels.
End Rem
Function ImPlot_PlotHeatmap(label_id:String, values:ULong Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f")
	_ImPlot_PlotHeatmapULong(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
End Function

Function ImPlot_PlotHeatmap(label_id:String, values:ULong Ptr, rows:Int, cols:Int, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, scale_min:Double = 0.0, scale_max:Double = 0.0, label_fmt:String = "%.1f", spec:SImPlotSpec)
	_ImPlot_PlotHeatmapULong_Spec(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max, spec)
End Function

' float
Rem
bbdoc: Plots a horizontal histogram using #Float values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. The min/max of @values will be used as the range.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Float Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramFloat(label_id, values, count, bins, bar_scale, New SImPlotRange)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Float Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramFloat_Spec(label_id, values, count, bins, bar_scale, New SImPlotRange, spec)
End Function

Rem
bbdoc: Plots a horizontal histogram using #Float values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. @range defines the range of the histogram.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Float Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramFloat(label_id, values, count, bins, bar_scale, range)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Float Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramFloat_Spec(label_id, values, count, bins, bar_scale, range, spec)
End Function

' double
Rem
bbdoc: Plots a horizontal histogram using #Double values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. The min/max of @values will be used as the range.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Double Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramDouble(label_id, values, count, bins, bar_scale, New SImPlotRange)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Double Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramDouble_Spec(label_id, values, count, bins, bar_scale, New SImPlotRange, spec)
End Function

Rem
bbdoc: Plots a horizontal histogram using #Double values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. @range defines the range of the histogram.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Double Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramDouble(label_id, values, count, bins, bar_scale, range)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Double Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramDouble_Spec(label_id, values, count, bins, bar_scale, range, spec)
End Function

' byte
Rem
bbdoc: Plots a horizontal histogram using #Byte values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. The min/max of @values will be used as the range.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Byte Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramByte(label_id, values, count, bins, bar_scale, New SImPlotRange)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Byte Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramByte_Spec(label_id, values, count, bins, bar_scale, New SImPlotRange, spec)
End Function

Rem
bbdoc: Plots a horizontal histogram using #Byte values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. @range defines the range of the histogram.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Byte Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramByte(label_id, values, count, bins, bar_scale, range)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Byte Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramByte_Spec(label_id, values, count, bins, bar_scale, range, spec)
End Function

' short
Rem
bbdoc: Plots a horizontal histogram using #Short values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. The min/max of @values will be used as the range.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Short Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramShort(label_id, values, count, bins, bar_scale, New SImPlotRange)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Short Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramShort_Spec(label_id, values, count, bins, bar_scale, New SImPlotRange, spec)
End Function

Rem
bbdoc: Plots a horizontal histogram using #Short values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. @range defines the range of the histogram.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Short Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramShort(label_id, values, count, bins, bar_scale, range)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Short Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramShort_Spec(label_id, values, count, bins, bar_scale, range, spec)
End Function

' int
Rem
bbdoc: Plots a horizontal histogram using #Int values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. The min/max of @values will be used as the range.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Int Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramInt(label_id, values, count, bins, bar_scale, New SImPlotRange)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Int Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramInt_Spec(label_id, values, count, bins, bar_scale, New SImPlotRange, spec)
End Function

Rem
bbdoc: Plots a horizontal histogram using #Int values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. @range defines the range of the histogram.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Int Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramInt(label_id, values, count, bins, bar_scale, range)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Int Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramInt_Spec(label_id, values, count, bins, bar_scale, range, spec)
End Function

' long
Rem
bbdoc: Plots a horizontal histogram using #Long values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. The min/max of @values will be used as the range.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Long Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramLong(label_id, values, count, bins, bar_scale, New SImPlotRange)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Long Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramLong_Spec(label_id, values, count, bins, bar_scale, New SImPlotRange, spec)
End Function

Rem
bbdoc: Plots a horizontal histogram using #Long values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. @range defines the range of the histogram.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:Long Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramLong(label_id, values, count, bins, bar_scale, range)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:Long Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramLong_Spec(label_id, values, count, bins, bar_scale, range, spec)
End Function

' uint
Rem
bbdoc: Plots a horizontal histogram using #UInt values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. The min/max of @values will be used as the range.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:UInt Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramUInt(label_id, values, count, bins, bar_scale, New SImPlotRange)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:UInt Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramUInt_Spec(label_id, values, count, bins, bar_scale, New SImPlotRange, spec)
End Function

Rem
bbdoc: Plots a horizontal histogram using #UInt values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. @range defines the range of the histogram.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:UInt Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramUInt(label_id, values, count, bins, bar_scale, range)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:UInt Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramUInt_Spec(label_id, values, count, bins, bar_scale, range, spec)
End Function

' ulong
Rem
bbdoc: Plots a horizontal histogram using #ULong values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. The min/max of @values will be used as the range.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:ULong Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramULong(label_id, values, count, bins, bar_scale, New SImPlotRange)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:ULong Ptr, count:Int, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramULong_Spec(label_id, values, count, bins, bar_scale, New SImPlotRange, spec)
End Function

Rem
bbdoc: Plots a horizontal histogram using #ULong values.
about: @bins can be a positive integer or one of the ImPlotBin_ methods. @range defines the range of the histogram.
Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram:Double(label_id:String, values:ULong Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0)
	Return _ImPlot_PlotHistogramULong(label_id, values, count, bins, bar_scale, range)
End Function

Function ImPlot_PlotHistogram:Double(label_id:String, values:ULong Ptr, count:Int, range:SImPlotRange, bins:Int = ImPlotBin_Sturges, bar_scale:Double = 1.0, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogramULong_Spec(label_id, values, count, bins, bar_scale, range, spec)
End Function

' float
Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Float values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. The min/max of @xs an @ys will be used as the ranges.
Otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DFloat(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect())
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DFloat_Spec(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect(), spec)
End Function

Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Float values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. @range defines the range of the histogram.
Otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DFloat(label_id, xs, ys, count, x_bins, y_bins, range)
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DFloat_Spec(label_id, xs, ys, count, x_bins, y_bins, range, spec)
End Function

' double
Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Double values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. The min/max of @xs an @ys will be used as the ranges.
Otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DDouble(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect())
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DDouble_Spec(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect(), spec)
End Function

Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Double values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. @range defines the range of the histogram.
Otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DDouble(label_id, xs, ys, count, x_bins, y_bins, range)
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DDouble_Spec(label_id, xs, ys, count, x_bins, y_bins, range, spec)
End Function

' byte
Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Byte values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. The min/max of @xs an @ys will be used as the ranges.
Otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DByte(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect())
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DByte_Spec(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect(), spec)
End Function

Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Byte values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. @range defines the range of the histogram.
Otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DByte(label_id, xs, ys, count, x_bins, y_bins, range)
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DByte_Spec(label_id, xs, ys, count, x_bins, y_bins, range, spec)
End Function

' short
Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Short values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. The min/max of @xs an @ys will be used as the ranges.
otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DShort(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect())
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DShort_Spec(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect(), spec)
End Function

Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Short values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. @range defines the range of the histogram.
otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DShort(label_id, xs, ys, count, x_bins, y_bins, range)
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DShort_Spec(label_id, xs, ys, count, x_bins, y_bins, range, spec)
End Function

' int
Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Int values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. The min/max of @xs an @ys will be used as the ranges.
otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DInt(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect())
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DInt_Spec(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect(), spec)
End Function

Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Int values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. @range defines the range of the histogram.
otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DInt(label_id, xs, ys, count, x_bins, y_bins, range)
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DInt_Spec(label_id, xs, ys, count, x_bins, y_bins, range, spec)
End Function

' long
Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Long values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. The min/max of @xs an @ys will be used as the ranges.
otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DLong(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect())
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DLong_Spec(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect(), spec)
End Function

Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #Long values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. @range defines the range of the histogram.
otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DLong(label_id, xs, ys, count, x_bins, y_bins, range)
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DLong_Spec(label_id, xs, ys, count, x_bins, y_bins, range, spec)
End Function

' uint
Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #UInt values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. The min/max of @xs an @ys will be used as the ranges.
otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DUInt(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect())
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DUInt_Spec(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect(), spec)
End Function

Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #UInt values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. @range defines the range of the histogram.
otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DUInt(label_id, xs, ys, count, x_bins, y_bins, range)
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DUInt_Spec(label_id, xs, ys, count, x_bins, y_bins, range, spec)
End Function

' ulong
Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #ULong values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. The min/max of @xs an @ys will be used as the ranges.
otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DULong(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect())
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DULong_Spec(label_id, xs, ys, count, x_bins, y_bins, new SImPlotRect(), spec)
End Function

Rem
bbdoc: Plots two dimensional, bivariate histogram as a heatmap using #ULong values.
about: @x_bins and @y_bins can be a positive integer or an ImPlotBin_ method. @range defines the range of the histogram.
otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
End Rem
Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges)
	Return _ImPlot_PlotHistogram2DULong(label_id, xs, ys, count, x_bins, y_bins, range)
End Function

Function ImPlot_PlotHistogram2D:Double(label_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, range:SImPlotRect, x_bins:Int = ImPlotBin_Sturges, y_bins:Int = ImPlotBin_Sturges, spec:SImPlotSpec)
	Return _ImPlot_PlotHistogram2DULong_Spec(label_id, xs, ys, count, x_bins, y_bins, range, spec)
End Function

' float
Rem
bbdoc: Plots digital data using #Float values.
about: Digital plots do not respond to y drag or zoom, and are always referenced to the bottom of the plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotDigital(label_id:String, xs:Float Ptr, ys:Float Ptr, count:Int)
	_ImPlot_PlotDigitalFloat(label_id, xs, ys, count)
End Function

Function ImPlot_PlotDigital(label_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotDigitalFloat_Spec(label_id, xs, ys, count, spec)
End Function

' double
Rem
bbdoc: Plots digital data using #Double values.
about: Digital plots do not respond to y drag or zoom, and are always referenced to the bottom of the plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotDigital(label_id:String, xs:Double Ptr, ys:Double Ptr, count:Int)
	_ImPlot_PlotDigitalDouble(label_id, xs, ys, count)
End Function

Function ImPlot_PlotDigital(label_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotDigitalDouble_Spec(label_id, xs, ys, count, spec)
End Function

' int
Rem
bbdoc: Plots digital data using #Int values.
about: Digital plots do not respond to y drag or zoom, and are always referenced to the bottom of the plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotDigital(label_id:String, xs:Int Ptr, ys:Int Ptr, count:Int)
	_ImPlot_PlotDigitalInt(label_id, xs, ys, count)
End Function

Function ImPlot_PlotDigital(label_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotDigitalInt_Spec(label_id, xs, ys, count, spec)
End Function

' long
Rem
bbdoc: Plots digital data using #Long values.
about: Digital plots do not respond to y drag or zoom, and are always referenced to the bottom of the plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotDigital(label_id:String, xs:Long Ptr, ys:Long Ptr, count:Int)
	_ImPlot_PlotDigitalLong(label_id, xs, ys, count)
End Function

Function ImPlot_PlotDigital(label_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotDigitalLong_Spec(label_id, xs, ys, count, spec)
End Function

' uint
Rem
bbdoc: Plots digital data using #UInt values.
about: Digital plots do not respond to y drag or zoom, and are always referenced to the bottom of the plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotDigital(label_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int)
	_ImPlot_PlotDigitalUInt(label_id, xs, ys, count)
End Function

Function ImPlot_PlotDigital(label_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotDigitalUInt_Spec(label_id, xs, ys, count, spec)
End Function

' ulong
Rem
bbdoc: Plots digital data using #ULong values.
about: Digital plots do not respond to y drag or zoom, and are always referenced to the bottom of the plot.
If your data is a simple struct/array, you can use striding. This is the most performant option if applicable.
End Rem
Function ImPlot_PlotDigital(label_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int)
	_ImPlot_PlotDigitalULong(label_id, xs, ys, count)
End Function

Function ImPlot_PlotDigital(label_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, spec:SImPlotSpec)
	_ImPlot_PlotDigitalULong_Spec(label_id, xs, ys, count, spec)
End Function

Rem
bbdoc: Plots a centered text label at point x,y.
about: Text color can be changed with ImPlot_PushStyleColor(ImPlotCol_InlayText, ...).
End Rem
Function ImPlot_PlotText(text:String, x:Double, y:Double)
	_ImPlot_PlotText(text, x, y, New SImVec2)
End Function

Function ImPlot_PlotText(text:String, x:Double, y:Double, spec:SImPlotSpec)
	_ImPlot_PlotText_Spec(text, x, y, New SImVec2, spec)
End Function

Rem
bbdoc: Plots a centered text label at point x,y with an offset.
about: Text color can be changed with ImPlot_PushStyleColor(ImPlotCol_InlayText, ...).
End Rem
Function ImPlot_PlotText(text:String, x:Double, y:Double, pix_offset:SImVec2)
	_ImPlot_PlotText(text, x, y, pix_offset)
End Function

Function ImPlot_PlotText(text:String, x:Double, y:Double, pix_offset:SImVec2, spec:SImPlotSpec)
	_ImPlot_PlotText_Spec(text, x, y, pix_offset, spec)
End Function

Rem
bbdoc: Plots a dummy item (i.e. adds a legend entry colored by ImPlotCol_Line)
End Rem
Function ImPlot_PlotDummy(label_id:String)
	_ImPlot_PlotDummy(label_id)
End Function

Function ImPlot_PlotDummy(label_id:String, spec:SImPlotSpec)
	_ImPlot_PlotDummy_Spec(label_id, spec)
End Function

Rem
bbdoc: Shows a draggable point at x,y.
about: @col defaults to ImGuiCol_Text.
Returns #True when user interaction causes the provided coordinates to change. Additional user interactions can be retrieved
through the optional output parameters.
End Rem
Function ImPlot_DragPoint:Int(id:Int, x:Double Ptr, y:Double Ptr, col:SImVec4, size:Float = 4.0, flags:EImPlotDragToolFlags = EImPlotDragToolFlags._None, out_clicked:Int Ptr = Null, out_hovered:Int Ptr = Null, held:Int Ptr = Null)
	Return _ImPlot_DragPoint(id, x, y, col, size, flags, out_clicked, out_hovered, held)
End Function

Rem
bbdoc: Shows a draggable vertical guide line at an x-value.
about: @col defaults to ImGuiCol_Text.
Returns #True when user interaction causes the provided coordinates to change. Additional user interactions can be retrieved
through the optional output parameters.
End Rem
Function ImPlot_DragLineX:Int(id:Int, x:Double Ptr, col:SImVec4, thickness:Float = 1.0, flags:EImPlotDragToolFlags = EImPlotDragToolFlags._None, out_clicked:Int Ptr = Null, out_hovered:Int Ptr = Null, held:Int Ptr = Null)
	Return _ImPlot_DragLineX(id, x, col, thickness, flags, out_clicked, out_hovered, held)
End Function

Rem
bbdoc: Shows a draggable horizontal guide line at a y-value.
about: @col defaults to ImGuiCol_Text.
Returns #True when user interaction causes the provided coordinates to change. Additional user interactions can be retrieved
through the optional output parameters.
End Rem
Function ImPlot_DragLineY:Int(id:Int, y:Double Ptr, col:SImVec4, thickness:Float = 1.0, flags:EImPlotDragToolFlags = EImPlotDragToolFlags._None, out_clicked:Int Ptr = Null, out_hovered:Int Ptr = Null, held:Int Ptr = Null)
	Return _ImPlot_DragLineY(id, y, col, thickness, flags, out_clicked, out_hovered, held)
End Function

Rem
bbdoc: Shows a draggable and resizeable rectangle.
Returns #True when user interaction causes the provided coordinates to change. Additional user interactions can be retrieved
through the optional output parameters.
End Rem
Function ImPlot_DragRect:Int(id:Int, x1:Double Ptr, y1:Double Ptr, x2:Double Ptr, y2:Double Ptr, col:SImVec4, flags:EImPlotDragToolFlags = EImPlotDragToolFlags._None, out_clicked:Int Ptr = Null, out_hovered:Int Ptr = Null, held:Int Ptr = Null)
	Return _ImPlot_DragRect(id, x1, y1, x2, y2, col, flags, out_clicked, out_hovered, held)
End Function

Rem
bbdoc: Shows an annotation callout at a chosen point.
about: Clamping keeps annotations in the plot area. Annotations are always rendered on top.
End Rem
Function ImPlot_Annotation(x:Double, y:Double, col:SImVec4, pix_offset:SImVec2, clamp:Int, round:Int = 0)
	_ImPlot_Annotation(x, y, col, pix_offset, clamp, round)
End Function

Rem
bbdoc: Shows an annotation callout at a chosen point.
about: Clamping keeps annotations in the plot area. Annotations are always rendered on top.
End Rem
Function ImPlot_Annotation(x:Double, y:Double, col:SImVec4, pix_offset:SImVec2, clamp:Int, fmt:String)
	_ImPlot_AnnotationFmt(x, y, col, pix_offset, clamp, fmt)
End Function

Rem
bbdoc: Shows an x-axis tag at the specified coordinate value.
End Rem
Function ImPlot_TagX(x:Double, col:SImVec4, round:Int = 0)
	_ImPlot_TagX(x, col, round)
End Function

Rem
bbdoc: Shows an x-axis tag at the specified coordinate value.
End Rem
Function ImPlot_TagX(x:Double, col:SImVec4, fmt:String)
	_ImPlot_TagXFmt(x, col, fmt)
End Function

Rem
bbdoc: Shows a y-axis tag at the specified coordinate value.
End Rem
Function ImPlot_TagY(y:Double, col:SImVec4, round:Int = 0)
	_ImPlot_TagY(y, col, round)
End Function

Rem
bbdoc: Shows a y-axis tag at the specified coordinate value.
End Rem
Function ImPlot_TagY(y:Double, col:SImVec4, fmt:String)
	_ImPlot_TagYFmt(y, col, fmt)
End Function

Rem
bbdoc: Selects which axis/axes will be used for subsequent plot elements.
End Rem
Function ImPlot_SetAxis(axis:EImAxis)
	_ImPlot_SetAxis(axis)
End Function

Rem
bbdoc: Selects which axis/axes will be used for subsequent plot elements.
End Rem
Function ImPlot_SetAxes(x_axis:EImAxis, y_axis:EImAxis)
	_ImPlot_SetAxes(x_axis, y_axis)
End Function

Rem
bbdoc: Converts pixels to a position in the current plot's coordinate system.
about: Passing IMPLOT_AUTO uses the current axes.
End Rem
Function ImPlot_PixelsToPlot:SImPlotPoint(pix:SImVec2, x_axis:EImAxis = EImAxis._Auto, y_axis:EImAxis = EImAxis._Auto)
	Return _ImPlot_PixelsToPlot(pix, x_axis, y_axis)
End Function

Rem
bbdoc: Converts pixels to a position in the current plot's coordinate system.
about: Passing IMPLOT_AUTO uses the current axes.
End Rem
Function ImPlot_PixelsToPlot:SImPlotPoint(x:Float, y:Float, x_axis:EImAxis = EImAxis._Auto, y_axis:EImAxis = EImAxis._Auto)
	Return _ImPlot_PixelsToPlotXY(x, y, x_axis, y_axis)
End Function

Rem
bbdoc: Converts a position in the current plot's coordinate system to pixels.
about: Passing IMPLOT_AUTO uses the current axes.
End Rem
Function ImPlot_PlotToPixels:SImVec2(plt:SImPlotPoint, x_axis:EImAxis = EImAxis._Auto, y_axis:EImAxis = EImAxis._Auto)
	Return _ImPlot_PlotToPixels(plt, x_axis, y_axis)
End Function

Rem
bbdoc: Converts a position in the current plot's coordinate system to pixels.
about: Passing IMPLOT_AUTO uses the current axes.
End Rem
Function ImPlot_PlotToPixels:SImVec2(x:Double, y:Double, x_axis:EImAxis = EImAxis._Auto, y_axis:EImAxis = EImAxis._Auto)
	Return _ImPlot_PlotToPixelsXY(x, y, x_axis, y_axis)
End Function

Rem
bbdoc: Gets the current Plot position (top-left) in pixels.
End Rem
Function ImPlot_GetPlotPos:SImVec2()
	Return _ImPlot_GetPlotPos()
End Function

Rem
bbdoc: Gets the curent Plot size in pixels.
End Rem
Function ImPlot_GetPlotSize:SImVec2()
	Return _ImPlot_GetPlotSize()
End Function

Rem
bbdoc: Returns the mouse position in x,y coordinates of the current plot.
about: Passing IMPLOT_AUTO uses the current axes.
End Rem
Function ImPlot_GetPlotMousePos:SImPlotPoint(x_axis:EImAxis = EImAxis._Auto, y_axis:EImAxis = EImAxis._Auto)
	Return _ImPlot_GetPlotMousePos(x_axis, y_axis)
End Function

Rem
bbdoc: Returns the current plot axis range.
End Rem
Function ImPlot_GetPlotLimits:SImPlotRect(x_axis:EImAxis = EImAxis._Auto, y_axis:EImAxis = EImAxis._Auto)
	Return _ImPlot_GetPlotLimits(x_axis, y_axis)
End Function

Rem
bbdoc: Returns true if the plot area in the current plot is hovered.
End Rem
Function ImPlot_IsPlotHovered:Int()
	Return _ImPlot_IsPlotHovered()
End Function

Rem
bbdoc: Returns true if the axis label area in the current plot is hovered.
End Rem
Function ImPlot_IsAxisHovered:Int(axis:EImAxis)
	Return _ImPlot_IsAxisHovered(axis)
End Function

Rem
bbdoc: Returns true if the bounding frame of a subplot is hovered.
End Rem
Function ImPlot_IsSubplotsHovered:Int()
	Return _ImPlot_IsSubplotsHovered()
End Function

Rem
bbdoc: Returns true if the current plot is being box selected.
End Rem
Function ImPlot_IsPlotSelected:Int()
	Return _ImPlot_IsPlotSelected()
End Function

Rem
bbdoc: Returns the current plot box selection bounds.
about: Passing IMPLOT_AUTO uses the current axes.
End Rem
Function ImPlot_GetPlotSelection:SImPlotRect(x_axis:EImAxis = EImAxis._Auto, y_axis:EImAxis = EImAxis._Auto)
	Return _ImPlot_GetPlotSelection(x_axis, y_axis)
End Function

Rem
bbdoc: Cancels a the current plot box selection.
End Rem
Function ImPlot_CancelPlotSelection()
	_ImPlot_CancelPlotSelection()
End Function

Rem
bbdoc: Hides or shows the next plot item (i.e. as if it were toggled from the legend).
about: Use EImPlotCond._Always if you need to forcefully set this every frame.
End Rem
Function ImPlot_HideNextItem(hidden:Int = 1, cond:EImPlotCond = EImPlotCond._Once)
	_ImPlot_HideNextItem(hidden, cond)
End Function

Rem
bbdoc: Aligsn axis padding over multiple plots in a single row or column.
about: @group_id must be unique. If this function returns #True, #ImPlot_EndAlignedPlots() must be called.
Use this function around calls to Begin/EndPlot to align l/r/t/b padding.
Consider using Begin/EndSubplots first. They are more feature rich and
accomplish the same behaviour by default.
End Rem
Function ImPlot_BeginAlignedPlots:Int(group_id:String, vertical:Int = True)
	Return _ImPlot_BeginAlignedPlots(group_id, vertical)
End Function

Rem
bbdoc: Only call if #ImPlot_BeginAlignedPlots() returns #True.
End Rem
Function ImPlot_EndAlignedPlots()
	_ImPlot_EndAlignedPlots()
End Function

Rem
bbdoc: Begins a popup for a legend entry.
End Rem
Function ImPlot_BeginLegendPopup:Int(label_id:String, mouse_button:EImGuiMouseButton = EImGuiMouseButton._Right)
	Return _ImPlot_BeginLegendPopup(label_id, mouse_button)
End Function

Rem
bbddoc: Ends a popup for a legend entry.
End Rem
Function ImPlot_EndLegendPopup()
	_ImPlot_EndLegendPopup()
End Function

Rem
bbdoc: Returns #True if a plot item legend entry is hovered.
End Rem
Function ImPlot_IsLegendEntryHovered:Int(label_id:String)
	Return _ImPlot_IsLegendEntryHovered(label_id)
End Function

Rem
bbdoc: Turns the current plot's plotting area into a drag and drop target.
about: Don't forget to call #ImPlot_EndDragDropTarget()
End Rem
Function ImPlot_BeginDragDropTargetPlot:Int()
	Return _ImPlot_BeginDragDropTargetPlot()
End Function

Rem
bbdoc: Turns the current plot's X-axis into a drag and drop target.
about: Don't forget to call #ImPlot_EndDragDropTarget()
End Rem
Function ImPlot_BeginDragDropTargetAxis:Int(axis:EImAxis)
	Return _ImPlot_BeginDragDropTargetAxis(axis)
End Function

Rem
bbdoc: Turns the current plot's legend into a drag and drop target.
about: Don't forget to call #ImPlot_EndDragDropTarget()
End Rem
Function ImPlot_BeginDragDropTargetLegend:Int()
	Return _ImPlot_BeginDragDropTargetLegend()
End Function

Rem
bbdoc: Ends a drag and drop target (currently just an alias for #ImGui_EndDragDropTarget).
End Rem
Function ImPlot_EndDragDropTarget()
	_ImPlot_EndDragDropTarget()
End Function

Rem
bbdoc: Turns the current plot's plotting area into a drag and drop source.
about: You must hold Ctrl. Don't forget to call #ImPlot_EndDragDropSource()
End Rem
Function ImPlot_BeginDragDropSourcePlot:Int(flags:EImGuiDragDropFlags = EImGuiDragDropFlags._None)
	Return _ImPlot_BeginDragDropSourcePlot(flags)
End Function

Rem
bbdoc: Turns the current plot's X-axis into a drag and drop source.
about: You must hold Ctrl. Don't forget to call #ImPlot_EndDragDropSource()
End Rem
Function ImPlot_BeginDragDropSourceAxis:Int(axis:EImAxis, flags:EImGuiDragDropFlags = EImGuiDragDropFlags._None)
	Return _ImPlot_BeginDragDropSourceAxis(axis, flags)
End Function

Rem
bbdoc: Turns an item in the current plot's legend into drag and drop source.
about: Don't forget to call #ImPlot_EndDragDropSource()
End Rem
Function ImPlot_BeginDragDropSourceItem:Int(label_id:String, flags:EImGuiDragDropFlags = EImGuiDragDropFlags._None)
	Return _ImPlot_BeginDragDropSourceItem(label_id, flags)
End Function

Rem
bbdoc: Ends a drag and drop source (currently just an alias for #ImGui_EndDragDropSource).
End Rem
Function ImPlot_EndDragDropSource()
	_ImPlot_EndDragDropSource()
End Function

Rem
bbdoc: Provides access to plot style structure for permanant modifications to colors, sizes, etc.
End Rem
Function ImPlot_GetStyle:TImPlotStyle()
	Return TImPlotStyle._Create(_ImPlot_GetStyle())
End Function

Rem
bbdoc: Styles plot colors for current ImGui style (default).
End Rem
Function ImPlot_StyleColorsAuto(dst:TImPlotStyle = Null)
	If dst Then
		dst.Init()
		_ImPlot_StyleColorsAuto(dst.stylePtr)
	Else
		_ImPlot_StyleColorsAuto(Null)
	End If
End Function

Rem
bbdoc: Styles plot colors for classic ImGui style.
End Rem
Function ImPlot_StyleColorsClassic(dst:TImPlotStyle = Null)
	If dst Then
		dst.Init()
		_ImPlot_StyleColorsClassic(dst.stylePtr)
	Else
		_ImPlot_StyleColorsClassic(Null)
	End If
End Function

Rem
bbdoc: Styles plot colors for dark ImGui style.
End Rem
Function ImPlot_StyleColorsDark(dst:TImPlotStyle = Null)
	If dst Then
		dst.Init()
		_ImPlot_StyleColorsDark(dst.stylePtr)
	Else
		_ImPlot_StyleColorsDark(Null)
	End If
End Function

Rem
bbdoc: Styles plot colors for light ImGui style.
End Rem
Function ImPlot_StyleColorsLight(dst:TImPlotStyle = Null)
	If dst Then
		dst.Init()
		_ImPlot_StyleColorsLight(dst.stylePtr)
	Else
		_ImPlot_StyleColorsLight(Null)
	End If
End Function

Rem
bbdoc: Temporarily modifies a style color.
about: Don't forget to call #ImPlot_PopStyleColor() to restore the previous color.
End Rem
Function ImPlot_PushStyleColor(idx:EImPlotCol, col:UInt)
	_ImPlot_PushStyleColor(idx, col)
End Function

Rem
bbdoc: Temporarily modifies a style color.
about: Don't forget to call #ImPlot_PopStyleColor() to restore the previous color.
End Rem
Function ImPlot_PushStyleColor(idx:EImPlotCol, col:SImVec4)
	_ImPlot_PushStyleColorVec4(idx, col)
End Function

Rem
bbdoc: Undo a temporary style color modification(s).
about: Undo multiple pushes at once by increasing @count.
End Rem
Function ImPlot_PopStyleColor(count:Int = 1)
	_ImPlot_PopStyleColor(count)
End Function

Rem
bbdoc: Temporarily modifies a style variable of #Float type.
about: Don't forget to call #ImPlot_PopStyleVar() to restore the previous value.
End Rem
Function ImPlot_PushStyleVar(idx:EImPlotStyleVar, val:Float)
	_ImPlot_PushStyleVar(idx, val)
End Function

Rem
bbdoc: Temporarily modifies a style variable of #Int type.
about: Don't forget to call #ImPlot_PopStyleVar() to restore the previous value.
End Rem
Function ImPlot_PushStyleVar(idx:EImPlotStyleVar, val:Int)
	_ImPlot_PushStyleVarInt(idx, val)
End Function

Rem
bbdoc: Temporarily modifies a style variable of #SImVec2 type.
about: Don't forget to call #ImPlot_PopStyleVar() to restore the previous value.
End Rem
Function ImPlot_PushStyleVar(idx:EImPlotStyleVar, val:SImVec2)
	_ImPlot_PushStyleVarVec2(idx, val)
End Function

Rem
bbdoc: Undo temporary style variable modification(s).
about: Undo multiple pushes at once by increasing @count.
End Rem
Function ImPlot_PopStyleVar(count:Int = 1)
	_ImPlot_PopStyleVar(count)
End Function

' IMPLOT_API ImVec4 GetLastItemColor();
Rem
bbdoc: Gets the last item primary color (i.e. its legend icon color)
End Rem
Function ImPlot_GetLastItemColor:SImVec4()
	Return _ImPlot_GetLastItemColor()
End Function

Rem
bbdoc: Returns the name of the specified color.
End Rem
Function ImPlot_GetStyleColorName:String(idx:EImPlotCol)
	Return _ImPlot_GetStyleColorName(idx)
End Function

Rem
bbdoc: Returns the name of the specified marker.
End Rem
Function ImPlot_GetMarkerName:String(idx:EImPlotMarker)
	Return _ImPlot_GetMarkerName(idx)
End Function

Rem
bbdoc: Returns the next marker and advances the marker for the current plot.
about: You need to call this between Begin/EndPlot!
End Rem
Function ImPlot_NextMarker:Int()
	Return _ImPlot_NextMarker()
End Function

Rem
bbdoc: Shows ImPlot style selector dropdown menu.
End Rem
Function ImPlot_ShowStyleSelector:Int(label:String)
	Return _ImPlot_ShowStyleSelector(label)
End Function

Rem
bbdoc: Shows ImPlot colormap selector dropdown menu.
End Rem
Function ImPlot_ShowColormapSelector:Int(label:String)
	Return _ImPlot_ShowColormapSelector(label)
End Function

Rem
bbdoc: Shows ImPlot input map selector dropdown menu.
End Rem
Function ImPlot_ShowInputMapSelector:Int(label:String)
	Return _ImPlot_ShowInputMapSelector(label)
End Function

Rem
bbdoc: Shows ImPlot style editor window.
End Rem
Function ImPlot_ShowStyleEditor(ref:TImPlotStyle = Null)
	If ref Then
		ref.Init()
		_ImPlot_ShowStyleEditor(ref.stylePtr)
	Else
		_ImPlot_ShowStyleEditor(Null)
	End If
End Function

Rem
bbdoc: Adds a basic help/info block for end users (not a window).
End Rem
Function ImPlot_ShowUserGuide()
	_ImPlot_ShowUserGuide()
End Function

Rem
bbdoc: Shows ImPlot metrics/debug information window.
End Rem
Function ImPlot_ShowMetricsWindow(p_popen:Int Var)
	_ImPlot_ShowMetricsWindow(p_popen)
End Function

Private
' externs
Extern
	Function _ImPlot_ShowDemoWindow(open:Int Var) = "ImPlot_ShowDemoWindow"

	Function _ImPlot_CreateContext:Byte Ptr()="ImPlot_CreateContext"
	Function _ImPlot_DestroyContext(ctx:Byte Ptr)="ImPlot_DestroyContext"
	Function _ImPlot_GetCurrentContext:Byte Ptr()="ImPlot_GetCurrentContext"
	Function _ImPlot_SetCurrentContext(ctx:Byte Ptr) = "ImPlot_SetCurrentContext"

	Function _ImPlot_BeginPlotSize:Int(title_id:String, size:SImVec2, flags:EImPlotFlags) = "ImPlot_BeginPlotSize"
	Function _ImPlot_BeginPlot:Int(title_id:String, flags:EImPlotFlags) = "ImPlot_BeginPlot"
	Function _ImPlot_EndPlot() = "ImPlot_EndPlot"

	Function _ImPlot_BeginSubplots:Int(title_id:String, rows:Int, cols:Int, size:SImVec2, flags:EImPlotSubplotFlags, row_ratios:Float Ptr, col_ratios:Float Ptr) = "ImPlot_BeginSubplots"
	Function _ImPlot_EndSubplots() = "ImPlot_EndSubplots"

	Function _ImPlot_SetupAxis(axis:EImAxis, label:String, flags:EImPlotAxisFlags) = "ImPlot_SetupAxis"
	Function _ImPlot_SetupAxisLimits(axis:EImAxis, v_min:Double, v_max:Double, cond:EImPlotCond) = "ImPlot_SetupAxisLimits"
	Function _ImPlot_SetupAxisLinks(axis:EImAxis, link_min:Double Ptr, link_max:Double Ptr) = "ImPlot_SetupAxisLinks"
	Function _ImPlot_SetupAxisFormat(axis:EImAxis, fmt:String) = "ImPlot_SetupAxisFormat"
	
	Function _ImPlot_PlotLineFloat(title_id:String, values:Float Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotLineFloat"
	Function _ImPlot_PlotLineXYFloat(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int) = "ImPlot_PlotLineXYFloat"
	Function _ImPlot_PlotLineDouble(title_id:String, values:Double Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotLineDouble"
	Function _ImPlot_PlotLineXYDouble(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int) = "ImPlot_PlotLineXYDouble"
	Function _ImPlot_PlotLineByte(title_id:String, values:Byte Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotLineByte"
	Function _ImPlot_PlotLineXYByte(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int) = "ImPlot_PlotLineXYByte"
	Function _ImPlot_PlotLineShort(title_id:String, values:Short Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotLineShort"
	Function _ImPlot_PlotLineXYShort(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int) = "ImPlot_PlotLineXYShort"
	Function _ImPlot_PlotLineInt(title_id:String, values:Int Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotLineInt"
	Function _ImPlot_PlotLineXYInt(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int) = "ImPlot_PlotLineXYInt"
	Function _ImPlot_PlotLineLong(title_id:String, values:Long Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotLineLong"
	Function _ImPlot_PlotLineXYLong(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int) = "ImPlot_PlotLineXYLong"
	Function _ImPlot_PlotLineUInt(title_id:String, values:UInt Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotLineUInt"
	Function _ImPlot_PlotLineXYUInt(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int) = "ImPlot_PlotLineXYUInt"
	Function _ImPlot_PlotLineULong(title_id:String, values:ULong Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotLineULong"
	Function _ImPlot_PlotLineXYULong(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int) = "ImPlot_PlotLineXYULong"

	Function _ImPlot_PlotLineFloat_Spec(title_id:String, values:Float Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotLineFloat_Spec"
	Function _ImPlot_PlotLineXYFloat_Spec(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotLineXYFloat_Spec"
	Function _ImPlot_PlotLineDouble_Spec(title_id:String, values:Double Ptr, count:Int, ale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotLineDouble_Spec"
	Function _ImPlot_PlotLineXYDouble_Spec(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotLineXYDouble_Spec"
	Function _ImPlot_PlotLineByte_Spec(title_id:String, values:Byte Ptr, count:Int, ale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotLineByte_Spec"
	Function _ImPlot_PlotLineXYByte_Spec(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotLineXYByte_Spec"
	Function _ImPlot_PlotLineShort_Spec(title_id:String, values:Short Ptr, count:Int, ale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotLineShort_Spec"
	Function _ImPlot_PlotLineXYShort_Spec(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotLineXYShort_Spec"
	Function _ImPlot_PlotLineInt_Spec(title_id:String, values:Int Ptr, count:Int, ale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotLineInt_Spec"
	Function _ImPlot_PlotLineXYInt_Spec(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotLineXYInt_Spec"
	Function _ImPlot_PlotLineLong_Spec(title_id:String, values:Long Ptr, count:Int, ale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotLineLong_Spec"
	Function _ImPlot_PlotLineXYLong_Spec(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotLineXYLong_Spec"
	Function _ImPlot_PlotLineUInt_Spec(title_id:String, values:UInt Ptr, count:Int, ale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotLineUInt_Spec"
	Function _ImPlot_PlotLineXYUInt_Spec(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotLineXYUInt_Spec"
	Function _ImPlot_PlotLineULong_Spec(title_id:String, values:ULong Ptr, count:Int, ale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotLineULong_Spec"
	Function _ImPlot_PlotLineXYULong_Spec(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotLineXYULong_Spec"

	Function _ImPlot_PlotScatterFloat(title_id:String, values:Float Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotScatterFloat"
	Function _ImPlot_PlotScatterXYFloat(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int) = "ImPlot_PlotScatterXYFloat"
	Function _ImPlot_PlotScatterDouble(title_id:String, values:Double Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotScatterDouble"
	Function _ImPlot_PlotScatterXYDouble(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int) = "ImPlot_PlotScatterXYDouble"
	Function _ImPlot_PlotScatterByte(title_id:String, values:Byte Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotScatterByte"
	Function _ImPlot_PlotScatterXYByte(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int) = "ImPlot_PlotScatterXYByte"
	Function _ImPlot_PlotScatterShort(title_id:String, values:Short Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotScatterShort"
	Function _ImPlot_PlotScatterXYShort(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int) = "ImPlot_PlotScatterXYShort"
	Function _ImPlot_PlotScatterInt(title_id:String, values:Int Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotScatterInt"
	Function _ImPlot_PlotScatterXYInt(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int) = "ImPlot_PlotScatterXYInt"
	Function _ImPlot_PlotScatterLong(title_id:String, values:Long Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotScatterLong"
	Function _ImPlot_PlotScatterXYLong(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int) = "ImPlot_PlotScatterXYLong"
	Function _ImPlot_PlotScatterUInt(title_id:String, values:UInt Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotScatterUInt"
	Function _ImPlot_PlotScatterXYUInt(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int) = "ImPlot_PlotScatterXYUInt"
	Function _ImPlot_PlotScatterULong(title_id:String, values:ULong Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotScatterULong"
	Function _ImPlot_PlotScatterXYULong(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int) = "ImPlot_PlotScatterXYULong"

	Function _ImPlot_PlotScatterFloat_Spec(title_id:String, values:Float Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotScatterFloat_Spec"
	Function _ImPlot_PlotScatterXYFloat_Spec(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotScatterXYFloat_Spec"
	Function _ImPlot_PlotScatterDouble_Spec(title_id:String, values:Double Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotScatterDouble_Spec"
	Function _ImPlot_PlotScatterXYDouble_Spec(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotScatterXYDouble_Spec"
	Function _ImPlot_PlotScatterByte_Spec(title_id:String, values:Byte Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotScatterByte_Spec"
	Function _ImPlot_PlotScatterXYByte_Spec(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotScatterXYByte_Spec"
	Function _ImPlot_PlotScatterShort_Spec(title_id:String, values:Short Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotScatterShort_Spec"
	Function _ImPlot_PlotScatterXYShort_Spec(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotScatterXYShort_Spec"
	Function _ImPlot_PlotScatterInt_Spec(title_id:String, values:Int Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotScatterInt_Spec"
	Function _ImPlot_PlotScatterXYInt_Spec(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotScatterXYInt_Spec"
	Function _ImPlot_PlotScatterLong_Spec(title_id:String, values:Long Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotScatterLong_Spec"
	Function _ImPlot_PlotScatterXYLong_Spec(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotScatterXYLong_Spec"
	Function _ImPlot_PlotScatterUInt_Spec(title_id:String, values:UInt Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotScatterUInt_Spec"
	Function _ImPlot_PlotScatterXYUInt_Spec(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotScatterXYUInt_Spec"
	Function _ImPlot_PlotScatterULong_Spec(title_id:String, values:ULong Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotScatterULong_Spec"
	Function _ImPlot_PlotScatterXYULong_Spec(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotScatterXYULong_Spec"

	Function _ImPlot_PlotStairsFloat(title_id:String, values:Float Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotStairsFloat"
	Function _ImPlot_PlotStairsXYFloat(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int) = "ImPlot_PlotStairsXYFloat"
	Function _ImPlot_PlotStairsDouble(title_id:String, values:Double Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotStairsDouble"
	Function _ImPlot_PlotStairsXYDouble(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int) = "ImPlot_PlotStairsXYDouble"
	Function _ImPlot_PlotStairsByte(title_id:String, values:Byte Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotStairsByte"
	Function _ImPlot_PlotStairsXYByte(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int) = "ImPlot_PlotStairsXYByte"
	Function _ImPlot_PlotStairsShort(title_id:String, values:Short Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotStairsShort"
	Function _ImPlot_PlotStairsXYShort(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int) = "ImPlot_PlotStairsXYShort"
	Function _ImPlot_PlotStairsInt(title_id:String, values:Int Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotStairsInt"
	Function _ImPlot_PlotStairsXYInt(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int) = "ImPlot_PlotStairsXYInt"
	Function _ImPlot_PlotStairsLong(title_id:String, values:Long Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotStairsLong"
	Function _ImPlot_PlotStairsXYLong(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int) = "ImPlot_PlotStairsXYLong"
	Function _ImPlot_PlotStairsUInt(title_id:String, values:UInt Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotStairsUInt"
	Function _ImPlot_PlotStairsXYUInt(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int) = "ImPlot_PlotStairsXYUInt"
	Function _ImPlot_PlotStairsULong(title_id:String, values:ULong Ptr, count:Int, xscale:Double, xstart:Double) = "ImPlot_PlotStairsULong"
	Function _ImPlot_PlotStairsXYULong(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int) = "ImPlot_PlotStairsXYULong"

	Function _ImPlot_PlotStairsFloat_Spec(title_id:String, values:Float Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotStairsFloat_Spec"
	Function _ImPlot_PlotStairsXYFloat_Spec(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotStairsXYFloat_Spec"
	Function _ImPlot_PlotStairsDouble_Spec(title_id:String, values:Double Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotStairsDouble_Spec"
	Function _ImPlot_PlotStairsXYDouble_Spec(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotStairsXYDouble_Spec"
	Function _ImPlot_PlotStairsByte_Spec(title_id:String, values:Byte Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotStairsByte_Spec"
	Function _ImPlot_PlotStairsXYByte_Spec(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotStairsXYByte_Spec"
	Function _ImPlot_PlotStairsShort_Spec(title_id:String, values:Short Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotStairsShort_Spec"
	Function _ImPlot_PlotStairsXYShort_Spec(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotStairsXYShort_Spec"
	Function _ImPlot_PlotStairsInt_Spec(title_id:String, values:Int Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotStairsInt_Spec"
	Function _ImPlot_PlotStairsXYInt_Spec(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotStairsXYInt_Spec"
	Function _ImPlot_PlotStairsLong_Spec(title_id:String, values:Long Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotStairsLong_Spec"
	Function _ImPlot_PlotStairsXYLong_Spec(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotStairsXYLong_Spec"
	Function _ImPlot_PlotStairsUInt_Spec(title_id:String, values:UInt Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotStairsUInt_Spec"
	Function _ImPlot_PlotStairsXYUInt_Spec(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotStairsXYUInt_Spec"
	Function _ImPlot_PlotStairsULong_Spec(title_id:String, values:ULong Ptr, count:Int, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotStairsULong_Spec"
	Function _ImPlot_PlotStairsXYULong_Spec(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotStairsXYULong_Spec"

	Function _ImPlot_PlotShadedFloat(title_id:String, values:Float Ptr, count:Int, yref:Double, xscale:Double, xstart:Double) = "ImPlot_PlotShadedFloat"
	Function _ImPlot_PlotShadedXYFloat(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, yref:Double) = "ImPlot_PlotShadedXYFloat"
	Function _ImPlot_PlotShadedXYYFloat(title_id:String, xs:Float Ptr, ys1:Float Ptr, ys2:Float Ptr, count:Int) = "ImPlot_PlotShadedXYYFloat"
	Function _ImPlot_PlotShadedDouble(title_id:String, values:Double Ptr, count:Int, yref:Double, xscale:Double, xstart:Double) = "ImPlot_PlotShadedDouble"
	Function _ImPlot_PlotShadedXYDouble(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, yref:Double) = "ImPlot_PlotShadedXYDouble"
	Function _ImPlot_PlotShadedXYYDouble(title_id:String, xs:Double Ptr, ys1:Double Ptr, ys2:Double Ptr, count:Int) = "ImPlot_PlotShadedXYYDouble"
	Function _ImPlot_PlotShadedByte(title_id:String, values:Byte Ptr, count:Int, yref:Double, xscale:Double, xstart:Double) = "ImPlot_PlotShadedByte"
	Function _ImPlot_PlotShadedXYByte(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, yref:Double) = "ImPlot_PlotShadedXYByte"
	Function _ImPlot_PlotShadedXYYByte(title_id:String, xs:Byte Ptr, ys1:Byte Ptr, ys2:Byte Ptr, count:Int) = "ImPlot_PlotShadedXYYByte"
	Function _ImPlot_PlotShadedShort(title_id:String, values:Short Ptr, count:Int, yref:Double, xscale:Double, xstart:Double) = "ImPlot_PlotShadedShort"
	Function _ImPlot_PlotShadedXYShort(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, yref:Double) = "ImPlot_PlotShadedXYShort"
	Function _ImPlot_PlotShadedXYYShort(title_id:String, xs:Short Ptr, ys1:Short Ptr, ys2:Short Ptr, count:Int) = "ImPlot_PlotShadedXYYShort"
	Function _ImPlot_PlotShadedInt(title_id:String, values:Int Ptr, count:Int, yref:Double, xscale:Double, xstart:Double) = "ImPlot_PlotShadedInt"
	Function _ImPlot_PlotShadedXYInt(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, yref:Double) = "ImPlot_PlotShadedXYInt"
	Function _ImPlot_PlotShadedXYYInt(title_id:String, xs:Int Ptr, ys1:Int Ptr, ys2:Int Ptr, count:Int) = "ImPlot_PlotShadedXYYInt"
	Function _ImPlot_PlotShadedLong(title_id:String, values:Long Ptr, count:Int, yref:Double, xscale:Double, xstart:Double) = "ImPlot_PlotShadedLong"
	Function _ImPlot_PlotShadedXYLong(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, yref:Double) = "ImPlot_PlotShadedXYLong"
	Function _ImPlot_PlotShadedXYYLong(title_id:String, xs:Long Ptr, ys1:Long Ptr, ys2:Long Ptr, count:Int) = "ImPlot_PlotShadedXYYLong"
	Function _ImPlot_PlotShadedUInt(title_id:String, values:UInt Ptr, count:Int, yref:Double, xscale:Double, xstart:Double) = "ImPlot_PlotShadedUInt"
	Function _ImPlot_PlotShadedXYUInt(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, yref:Double) = "ImPlot_PlotShadedXYUInt"
	Function _ImPlot_PlotShadedXYYUInt(title_id:String, xs:UInt Ptr, ys1:UInt Ptr, ys2:UInt Ptr, count:Int) = "ImPlot_PlotShadedXYYUInt"
	Function _ImPlot_PlotShadedULong(title_id:String, values:ULong Ptr, count:Int, yref:Double, xscale:Double, xstart:Double) = "ImPlot_PlotShadedULong"
	Function _ImPlot_PlotShadedXYULong(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, yref:Double) = "ImPlot_PlotShadedXYULong"
	Function _ImPlot_PlotShadedXYYULong(title_id:String, xs:ULong Ptr, ys1:ULong Ptr, ys2:ULong Ptr, count:Int) = "ImPlot_PlotShadedXYYULong"

	Function _ImPlot_PlotShadedFloat_Spec(title_id:String, values:Float Ptr, count:Int, yref:Double, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedFloat_Spec"
	Function _ImPlot_PlotShadedXYFloat_Spec(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, yref:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedXYFloat_Spec"
	Function _ImPlot_PlotShadedXYYFloat_Spec(title_id:String, xs:Float Ptr, ys1:Float Ptr, ys2:Float Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotShadedXYYFloat_Spec"
	Function _ImPlot_PlotShadedDouble_Spec(title_id:String, values:Double Ptr, count:Int, yref:Double, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedDouble_Spec"
	Function _ImPlot_PlotShadedXYDouble_Spec(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, yref:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedXYDouble_Spec"
	Function _ImPlot_PlotShadedXYYDouble_Spec(title_id:String, xs:Double Ptr, ys1:Double Ptr, ys2:Double Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotShadedXYYDouble_Spec"
	Function _ImPlot_PlotShadedByte_Spec(title_id:String, values:Byte Ptr, count:Int, yref:Double, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedByte_Spec"
	Function _ImPlot_PlotShadedXYByte_Spec(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, yref:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedXYByte_Spec"
	Function _ImPlot_PlotShadedXYYByte_Spec(title_id:String, xs:Byte Ptr, ys1:Byte Ptr, ys2:Byte Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotShadedXYYByte_Spec"
	Function _ImPlot_PlotShadedShort_Spec(title_id:String, values:Short Ptr, count:Int, yref:Double, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedShort_Spec"
	Function _ImPlot_PlotShadedXYShort_Spec(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, yref:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedXYShort_Spec"
	Function _ImPlot_PlotShadedXYYShort_Spec(title_id:String, xs:Short Ptr, ys1:Short Ptr, ys2:Short Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotShadedXYYShort_Spec"
	Function _ImPlot_PlotShadedInt_Spec(title_id:String, values:Int Ptr, count:Int, yref:Double, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedInt_Spec"
	Function _ImPlot_PlotShadedXYInt_Spec(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, yref:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedXYInt_Spec"
	Function _ImPlot_PlotShadedXYYInt_Spec(title_id:String, xs:Int Ptr, ys1:Int Ptr, ys2:Int Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotShadedXYYInt_Spec"
	Function _ImPlot_PlotShadedLong_Spec(title_id:String, values:Long Ptr, count:Int, yref:Double, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedLong_Spec"
	Function _ImPlot_PlotShadedXYLong_Spec(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, yref:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedXYLong_Spec"
	Function _ImPlot_PlotShadedXYYLong_Spec(title_id:String, xs:Long Ptr, ys1:Long Ptr, ys2:Long Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotShadedXYYLong_Spec"
	Function _ImPlot_PlotShadedUInt_Spec(title_id:String, values:UInt Ptr, count:Int, yref:Double, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedUInt_Spec"
	Function _ImPlot_PlotShadedXYUInt_Spec(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, yref:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedXYUInt_Spec"
	Function _ImPlot_PlotShadedXYYUInt_Spec(title_id:String, xs:UInt Ptr, ys1:UInt Ptr, ys2:UInt Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotShadedXYYUInt_Spec"
	Function _ImPlot_PlotShadedULong_Spec(title_id:String, values:ULong Ptr, count:Int, yref:Double, xscale:Double, xstart:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedULong_Spec"
	Function _ImPlot_PlotShadedXYULong_Spec(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, yref:Double, spec:SImPlotSpec) = "ImPlot_PlotShadedXYULong_Spec"
	Function _ImPlot_PlotShadedXYYULong_Spec(title_id:String, xs:ULong Ptr, ys1:ULong Ptr, ys2:ULong Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotShadedXYYULong_Spec"

	Function _ImPlot_PlotBarsFloat(title_id:String, values:Float Ptr, count:Int, bar_size:Double, shift:Double) = "ImPlot_PlotBarsFloat"
	Function _ImPlot_PlotBarsXYFloat(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, bar_size:Double) = "ImPlot_PlotBarsXYFloat"
	Function _ImPlot_PlotBarsDouble(title_id:String, values:Double Ptr, count:Int, bar_size:Double, shift:Double) = "ImPlot_PlotBarsDouble"
	Function _ImPlot_PlotBarsXYDouble(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, bar_size:Double) = "ImPlot_PlotBarsXYDouble"
	Function _ImPlot_PlotBarsByte(title_id:String, values:Byte Ptr, count:Int, bar_size:Double, shift:Double) = "ImPlot_PlotBarsByte"
	Function _ImPlot_PlotBarsXYByte(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, bar_size:Double) = "ImPlot_PlotBarsXYByte"
	Function _ImPlot_PlotBarsShort(title_id:String, values:Short Ptr, count:Int, bar_size:Double, shift:Double) = "ImPlot_PlotBarsShort"
	Function _ImPlot_PlotBarsXYShort(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, bar_size:Double) = "ImPlot_PlotBarsXYShort"
	Function _ImPlot_PlotBarsInt(title_id:String, values:Int Ptr, count:Int, bar_size:Double, shift:Double) = "ImPlot_PlotBarsInt"
	Function _ImPlot_PlotBarsXYInt(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, bar_size:Double) = "ImPlot_PlotBarsXYInt"
	Function _ImPlot_PlotBarsLong(title_id:String, values:Long Ptr, count:Int, bar_size:Double, shift:Double) = "ImPlot_PlotBarsLong"
	Function _ImPlot_PlotBarsXYLong(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, bar_size:Double) = "ImPlot_PlotBarsXYLong"
	Function _ImPlot_PlotBarsUInt(title_id:String, values:UInt Ptr, count:Int, bar_size:Double, shift:Double) = "ImPlot_PlotBarsUInt"
	Function _ImPlot_PlotBarsXYUInt(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, bar_size:Double) = "ImPlot_PlotBarsXYUInt"
	Function _ImPlot_PlotBarsULong(title_id:String, values:ULong Ptr, count:Int, bar_size:Double, shift:Double) = "ImPlot_PlotBarsULong"
	Function _ImPlot_PlotBarsXYULong(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, bar_size:Double) = "ImPlot_PlotBarsXYULong"

	Function _ImPlot_PlotBarsFloat_Spec(title_id:String, values:Float Ptr, count:Int, bar_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsFloat_Spec"
	Function _ImPlot_PlotBarsXYFloat_Spec(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, bar_size:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsXYFloat_Spec"
	Function _ImPlot_PlotBarsDouble_Spec(title_id:String, values:Double Ptr, count:Int, bar_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsDouble_Spec"
	Function _ImPlot_PlotBarsXYDouble_Spec(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, bar_size:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsXYDouble_Spec"
	Function _ImPlot_PlotBarsByte_Spec(title_id:String, values:Byte Ptr, count:Int, bar_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsByte_Spec"
	Function _ImPlot_PlotBarsXYByte_Spec(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, bar_size:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsXYByte_Spec"
	Function _ImPlot_PlotBarsShort_Spec(title_id:String, values:Short Ptr, count:Int, bar_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsShort_Spec"
	Function _ImPlot_PlotBarsXYShort_Spec(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, bar_size:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsXYShort_Spec"
	Function _ImPlot_PlotBarsInt_Spec(title_id:String, values:Int Ptr, count:Int, bar_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsInt_Spec"
	Function _ImPlot_PlotBarsXYInt_Spec(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, bar_size:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsXYInt_Spec"
	Function _ImPlot_PlotBarsLong_Spec(title_id:String, values:Long Ptr, count:Int, bar_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsLong_Spec"
	Function _ImPlot_PlotBarsXYLong_Spec(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, bar_size:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsXYLong_Spec"
	Function _ImPlot_PlotBarsUInt_Spec(title_id:String, values:UInt Ptr, count:Int, bar_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsUInt_Spec"
	Function _ImPlot_PlotBarsXYUInt_Spec(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, bar_size:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsXYUInt_Spec"
	Function _ImPlot_PlotBarsULong_Spec(title_id:String, values:ULong Ptr, count:Int, bar_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsULong_Spec"
	Function _ImPlot_PlotBarsXYULong_Spec(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, bar_size:Double, spec:SImPlotSpec) = "ImPlot_PlotBarsXYULong_Spec"

	Function _ImPlot_PlotBarGroupsFloat(label_ids:String[], values:Float Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double) = "ImPlot_PlotBarGroupsFloat"
	Function _ImPlot_PlotBarGroupsDouble(label_ids:String[], values:Double Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double) = "ImPlot_PlotBarGroupsDouble"
	Function _ImPlot_PlotBarGroupsByte(label_ids:String[], values:Byte Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double) = "ImPlot_PlotBarGroupsByte"
	Function _ImPlot_PlotBarGroupsShort(label_ids:String[], values:Short Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double) = "ImPlot_PlotBarGroupsShort"
	Function _ImPlot_PlotBarGroupsInt(label_ids:String[], values:Int Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double) = "ImPlot_PlotBarGroupsInt"
	Function _ImPlot_PlotBarGroupsLong(label_ids:String[], values:Long Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double) = "ImPlot_PlotBarGroupsLong"
	Function _ImPlot_PlotBarGroupsUInt(label_ids:String[], values:UInt Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double) = "ImPlot_PlotBarGroupsUInt"
	Function _ImPlot_PlotBarGroupsULong(label_ids:String[], values:ULong Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double) = "ImPlot_PlotBarGroupsULong"

	Function _ImPlot_PlotBarGroupsFloat_Spec(label_ids:String[], values:Float Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarGroupsFloat_Spec"
	Function _ImPlot_PlotBarGroupsDouble_Spec(label_ids:String[], values:Double Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarGroupsDouble_Spec"
	Function _ImPlot_PlotBarGroupsByte_Spec(label_ids:String[], values:Byte Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarGroupsByte_Spec"
	Function _ImPlot_PlotBarGroupsShort_Spec(label_ids:String[], values:Short Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarGroupsShort_Spec"
	Function _ImPlot_PlotBarGroupsInt_Spec(label_ids:String[], values:Int Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarGroupsInt_Spec"
	Function _ImPlot_PlotBarGroupsLong_Spec(label_ids:String[], values:Long Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarGroupsLong_Spec"
	Function _ImPlot_PlotBarGroupsUInt_Spec(label_ids:String[], values:UInt Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarGroupsUInt_Spec"
	Function _ImPlot_PlotBarGroupsULong_Spec(label_ids:String[], values:ULong Ptr, item_count:Int, group_count:Int, group_size:Double, shift:Double, spec:SImPlotSpec) = "ImPlot_PlotBarGroupsULong_Spec"

	Function _ImPlot_PlotErrorBarsFloat(title_id:String, xs:Float Ptr, ys:Float Ptr, err:Float Ptr, count:Int) = "ImPlot_PlotErrorBarsFloat"
	Function _ImPlot_PlotErrorBarsNPFloat(title_id:String, xs:Float Ptr, ys:Float Ptr, neg:Float Ptr, pos:Float Ptr, count:Int) = "ImPlot_PlotErrorBarsNPFloat"
	Function _ImPlot_PlotErrorBarsDouble(title_id:String, xs:Double Ptr, ys:Double Ptr, err:Double Ptr, count:Int) = "ImPlot_PlotErrorBarsDouble"
	Function _ImPlot_PlotErrorBarsNPDouble(title_id:String, xs:Double Ptr, ys:Double Ptr, neg:Double Ptr, pos:Double Ptr, count:Int) = "ImPlot_PlotErrorBarsNPDouble"
	Function _ImPlot_PlotErrorBarsByte(title_id:String, xs:Byte Ptr, ys:Byte Ptr, err:Byte Ptr, count:Int) = "ImPlot_PlotErrorBarsByte"
	Function _ImPlot_PlotErrorBarsNPByte(title_id:String, xs:Byte Ptr, ys:Byte Ptr, neg:Byte Ptr, pos:Byte Ptr, count:Int) = "ImPlot_PlotErrorBarsNPByte"
	Function _ImPlot_PlotErrorBarsShort(title_id:String, xs:Short Ptr, ys:Short Ptr, err:Short Ptr, count:Int) = "ImPlot_PlotErrorBarsShort"
	Function _ImPlot_PlotErrorBarsNPShort(title_id:String, xs:Short Ptr, ys:Short Ptr, neg:Short Ptr, pos:Short Ptr, count:Int) = "ImPlot_PlotErrorBarsNPShort"
	Function _ImPlot_PlotErrorBarsInt(title_id:String, xs:Int Ptr, ys:Int Ptr, err:Int Ptr, count:Int) = "ImPlot_PlotErrorBarsInt"
	Function _ImPlot_PlotErrorBarsNPInt(title_id:String, xs:Int Ptr, ys:Int Ptr, neg:Int Ptr, pos:Int Ptr, count:Int) = "ImPlot_PlotErrorBarsNPInt"
	Function _ImPlot_PlotErrorBarsLong(title_id:String, xs:Long Ptr, ys:Long Ptr, err:Long Ptr, count:Int) = "ImPlot_PlotErrorBarsLong"
	Function _ImPlot_PlotErrorBarsNPLong(title_id:String, xs:Long Ptr, ys:Long Ptr, neg:Long Ptr, pos:Long Ptr, count:Int) = "ImPlot_PlotErrorBarsNPLong"
	Function _ImPlot_PlotErrorBarsUInt(title_id:String, xs:UInt Ptr, ys:UInt Ptr, err:UInt Ptr, count:Int) = "ImPlot_PlotErrorBarsUInt"
	Function _ImPlot_PlotErrorBarsNPUInt(title_id:String, xs:UInt Ptr, ys:UInt Ptr, neg:UInt Ptr, pos:UInt Ptr, count:Int) = "ImPlot_PlotErrorBarsNPUInt"
	Function _ImPlot_PlotErrorBarsULong(title_id:String, xs:ULong Ptr, ys:ULong Ptr, err:ULong Ptr, count:Int) = "ImPlot_PlotErrorBarsULong"
	Function _ImPlot_PlotErrorBarsNPULong(title_id:String, xs:ULong Ptr, ys:ULong Ptr, neg:ULong Ptr, pos:ULong Ptr, count:Int) = "ImPlot_PlotErrorBarsNPULong"

	Function _ImPlot_PlotErrorBarsFloat_Spec(title_id:String, xs:Float Ptr, ys:Float Ptr, err:Float Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsFloat_Spec"
	Function _ImPlot_PlotErrorBarsNPFloat_Spec(title_id:String, xs:Float Ptr, ys:Float Ptr, neg:Float Ptr, pos:Float Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsNPFloat_Spec"
	Function _ImPlot_PlotErrorBarsDouble_Spec(title_id:String, xs:Double Ptr, ys:Double Ptr, err:Double Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsDouble_Spec"
	Function _ImPlot_PlotErrorBarsNPDouble_Spec(title_id:String, xs:Double Ptr, ys:Double Ptr, neg:Double Ptr, pos:Double Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsNPDouble_Spec"
	Function _ImPlot_PlotErrorBarsByte_Spec(title_id:String, xs:Byte Ptr, ys:Byte Ptr, err:Byte Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsByte_Spec"
	Function _ImPlot_PlotErrorBarsNPByte_Spec(title_id:String, xs:Byte Ptr, ys:Byte Ptr, neg:Byte Ptr, pos:Byte Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsNPByte_Spec"
	Function _ImPlot_PlotErrorBarsShort_Spec(title_id:String, xs:Short Ptr, ys:Short Ptr, err:Short Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsShort_Spec"
	Function _ImPlot_PlotErrorBarsNPShort_Spec(title_id:String, xs:Short Ptr, ys:Short Ptr, neg:Short Ptr, pos:Short Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsNPShort_Spec"
	Function _ImPlot_PlotErrorBarsInt_Spec(title_id:String, xs:Int Ptr, ys:Int Ptr, err:Int Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsInt_Spec"
	Function _ImPlot_PlotErrorBarsNPInt_Spec(title_id:String, xs:Int Ptr, ys:Int Ptr, neg:Int Ptr, pos:Int Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsNPInt_Spec"
	Function _ImPlot_PlotErrorBarsLong_Spec(title_id:String, xs:Long Ptr, ys:Long Ptr, err:Long Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsLong_Spec"
	Function _ImPlot_PlotErrorBarsNPLong_Spec(title_id:String, xs:Long Ptr, ys:Long Ptr, neg:Long Ptr, pos:Long Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsNPLong_Spec"
	Function _ImPlot_PlotErrorBarsUInt_Spec(title_id:String, xs:UInt Ptr, ys:UInt Ptr, err:UInt Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsUInt_Spec"
	Function _ImPlot_PlotErrorBarsNPUInt_Spec(title_id:String, xs:UInt Ptr, ys:UInt Ptr, neg:UInt Ptr, pos:UInt Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsNPUInt_Spec"
	Function _ImPlot_PlotErrorBarsULong_Spec(title_id:String, xs:ULong Ptr, ys:ULong Ptr, err:ULong Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsULong_Spec"
	Function _ImPlot_PlotErrorBarsNPULong_Spec(title_id:String, xs:ULong Ptr, ys:ULong Ptr, neg:ULong Ptr, pos:ULong Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotErrorBarsNPULong_Spec"

	Function _ImPlot_PlotStemsFloat(title_id:String, values:Float Ptr, count:Int, ref:Double, scale:Double, start:Double) = "ImPlot_PlotStemsFloat"
	Function _ImPlot_PlotStemsXYFloat(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, ref:Double) = "ImPlot_PlotStemsXYFloat"
	Function _ImPlot_PlotStemsDouble(title_id:String, values:Double Ptr, count:Int, ref:Double, scale:Double, start:Double) = "ImPlot_PlotStemsDouble"
	Function _ImPlot_PlotStemsXYDouble(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, ref:Double) = "ImPlot_PlotStemsXYDouble"
	Function _ImPlot_PlotStemsByte(title_id:String, values:Byte Ptr, count:Int, ref:Double, scale:Double, start:Double) = "ImPlot_PlotStemsByte"
	Function _ImPlot_PlotStemsXYByte(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, ref:Double) = "ImPlot_PlotStemsXYByte"
	Function _ImPlot_PlotStemsShort(title_id:String, values:Short Ptr, count:Int, ref:Double, scale:Double, start:Double) = "ImPlot_PlotStemsShort"
	Function _ImPlot_PlotStemsXYShort(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, ref:Double) = "ImPlot_PlotStemsXYShort"
	Function _ImPlot_PlotStemsInt(title_id:String, values:Int Ptr, count:Int, ref:Double, scale:Double, start:Double) = "ImPlot_PlotStemsInt"
	Function _ImPlot_PlotStemsXYInt(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, ref:Double) = "ImPlot_PlotStemsXYInt"
	Function _ImPlot_PlotStemsLong(title_id:String, values:Long Ptr, count:Int, ref:Double, scale:Double, start:Double) = "ImPlot_PlotStemsLong"
	Function _ImPlot_PlotStemsXYLong(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, ref:Double) = "ImPlot_PlotStemsXYLong"
	Function _ImPlot_PlotStemsUInt(title_id:String, values:UInt Ptr, count:Int, ref:Double, scale:Double, start:Double) = "ImPlot_PlotStemsUInt"
	Function _ImPlot_PlotStemsXYUInt(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, ref:Double) = "ImPlot_PlotStemsXYUInt"
	Function _ImPlot_PlotStemsULong(title_id:String, values:ULong Ptr, count:Int, ref:Double, scale:Double, start:Double) = "ImPlot_PlotStemsULong"
	Function _ImPlot_PlotStemsXYULong(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, ref:Double) = "ImPlot_PlotStemsXYULong"

	Function _ImPlot_PlotStemsFloat_Spec(title_id:String, values:Float Ptr, count:Int, ref:Double, scale:Double, start:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsFloat_Spec"
	Function _ImPlot_PlotStemsXYFloat_Spec(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, ref:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsXYFloat_Spec"
	Function _ImPlot_PlotStemsDouble_Spec(title_id:String, values:Double Ptr, count:Int, ref:Double, scale:Double, start:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsDouble_Spec"
	Function _ImPlot_PlotStemsXYDouble_Spec(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, ref:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsXYDouble_Spec"
	Function _ImPlot_PlotStemsByte_Spec(title_id:String, values:Byte Ptr, count:Int, ref:Double, scale:Double, start:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsByte_Spec"
	Function _ImPlot_PlotStemsXYByte_Spec(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, ref:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsXYByte_Spec"
	Function _ImPlot_PlotStemsShort_Spec(title_id:String, values:Short Ptr, count:Int, ref:Double, scale:Double, start:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsShort_Spec"
	Function _ImPlot_PlotStemsXYShort_Spec(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, ref:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsXYShort_Spec"
	Function _ImPlot_PlotStemsInt_Spec(title_id:String, values:Int Ptr, count:Int, ref:Double, scale:Double, start:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsInt_Spec"
	Function _ImPlot_PlotStemsXYInt_Spec(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, ref:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsXYInt_Spec"
	Function _ImPlot_PlotStemsLong_Spec(title_id:String, values:Long Ptr, count:Int, ref:Double, scale:Double, start:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsLong_Spec"
	Function _ImPlot_PlotStemsXYLong_Spec(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, ref:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsXYLong_Spec"
	Function _ImPlot_PlotStemsUInt_Spec(title_id:String, values:UInt Ptr, count:Int, ref:Double, scale:Double, start:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsUInt_Spec"
	Function _ImPlot_PlotStemsXYUInt_Spec(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, ref:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsXYUInt_Spec"
	Function _ImPlot_PlotStemsULong_Spec(title_id:String, values:ULong Ptr, count:Int, ref:Double, scale:Double, start:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsULong_Spec"
	Function _ImPlot_PlotStemsXYULong_Spec(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, ref:Double, spec:SImPlotSpec) = "ImPlot_PlotStemsXYULong_Spec"

	Function _ImPlot_PlotInfLinesFloat(title_id:String, values:Float Ptr, count:Int) = "ImPlot_PlotInfLinesFloat"
	Function _ImPlot_PlotInfLinesDouble(title_id:String, values:Double Ptr, count:Int) = "ImPlot_PlotInfLinesDouble"
	Function _ImPlot_PlotInfLinesByte(title_id:String, values:Byte Ptr, count:Int) = "ImPlot_PlotInfLinesByte"
	Function _ImPlot_PlotInfLinesShort(title_id:String, values:Short Ptr, count:Int) = "ImPlot_PlotInfLinesShort"
	Function _ImPlot_PlotInfLinesInt(title_id:String, values:Int Ptr, count:Int) = "ImPlot_PlotInfLinesInt"
	Function _ImPlot_PlotInfLinesLong(title_id:String, values:Long Ptr, count:Int) = "ImPlot_PlotInfLinesLong"
	Function _ImPlot_PlotInfLinesUInt(title_id:String, values:UInt Ptr, count:Int) = "ImPlot_PlotInfLinesUInt"
	Function _ImPlot_PlotInfLinesULong(title_id:String, values:ULong Ptr, count:Int) = "ImPlot_PlotInfLinesULong"

	Function _ImPlot_PlotInfLinesFloat_Spec(title_id:String, values:Float Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotInfLinesFloat_Spec"
	Function _ImPlot_PlotInfLinesDouble_Spec(title_id:String, values:Double Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotInfLinesDouble_Spec"
	Function _ImPlot_PlotInfLinesByte_Spec(title_id:String, values:Byte Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotInfLinesByte_Spec"
	Function _ImPlot_PlotInfLinesShort_Spec(title_id:String, values:Short Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotInfLinesShort_Spec"
	Function _ImPlot_PlotInfLinesInt_Spec(title_id:String, values:Int Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotInfLinesInt_Spec"
	Function _ImPlot_PlotInfLinesLong_Spec(title_id:String, values:Long Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotInfLinesLong_Spec"
	Function _ImPlot_PlotInfLinesUInt_Spec(title_id:String, values:UInt Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotInfLinesUInt_Spec"
	Function _ImPlot_PlotInfLinesULong_Spec(title_id:String, values:ULong Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotInfLinesULong_Spec"

	Function _ImPlot_PlotPieChartFloat(label_ids:String[], values:Float Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double) = "ImPlot_PlotPieChartFloat"
	Function _ImPlot_PlotPieChartDouble(label_ids:String[], values:Double Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double) = "ImPlot_PlotPieChartDouble"
	Function _ImPlot_PlotPieChartByte(label_ids:String[], values:Byte Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double) = "ImPlot_PlotPieChartByte"
	Function _ImPlot_PlotPieChartShort(label_ids:String[], values:Short Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double) = "ImPlot_PlotPieChartShort"
	Function _ImPlot_PlotPieChartInt(label_ids:String[], values:Int Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double) = "ImPlot_PlotPieChartInt"
	Function _ImPlot_PlotPieChartLong(label_ids:String[], values:Long Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double) = "ImPlot_PlotPieChartLong"
	Function _ImPlot_PlotPieChartUInt(label_ids:String[], values:UInt Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double) = "ImPlot_PlotPieChartUInt"
	Function _ImPlot_PlotPieChartULong(label_ids:String[], values:ULong Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double) = "ImPlot_PlotPieChartULong"

	Function _ImPlot_PlotPieChartFloat_Spec(label_ids:String[], values:Float Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double, spec:SImPlotSpec) = "ImPlot_PlotPieChartFloat_Spec"
	Function _ImPlot_PlotPieChartDouble_Spec(label_ids:String[], values:Double Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double, spec:SImPlotSpec) = "ImPlot_PlotPieChartDouble_Spec"
	Function _ImPlot_PlotPieChartByte_Spec(label_ids:String[], values:Byte Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double, spec:SImPlotSpec) = "ImPlot_PlotPieChartByte_Spec"
	Function _ImPlot_PlotPieChartShort_Spec(label_ids:String[], values:Short Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double, spec:SImPlotSpec) = "ImPlot_PlotPieChartShort_Spec"
	Function _ImPlot_PlotPieChartInt_Spec(label_ids:String[], values:Int Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double, spec:SImPlotSpec) = "ImPlot_PlotPieChartInt_Spec"
	Function _ImPlot_PlotPieChartLong_Spec(label_ids:String[], values:Long Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double, spec:SImPlotSpec) = "ImPlot_PlotPieChartLong_Spec"
	Function _ImPlot_PlotPieChartUInt_Spec(label_ids:String[], values:UInt Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double, spec:SImPlotSpec) = "ImPlot_PlotPieChartUInt_Spec"
	Function _ImPlot_PlotPieChartULong_Spec(label_ids:String[], values:ULong Ptr, count:Int, x:Double, y:Double, radius:Double, label_fmt:String, angle0:Double, spec:SImPlotSpec) = "ImPlot_PlotPieChartULong_Spec"

	Function _ImPlot_PlotHeatmapFloat(label_id:String, values:Float Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint) = "ImPlot_PlotHeatmapFloat"
	Function _ImPlot_PlotHeatmapDouble(label_id:String, values:Double Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint) = "ImPlot_PlotHeatmapDouble"
	Function _ImPlot_PlotHeatmapByte(label_id:String, values:Byte Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint) = "ImPlot_PlotHeatmapByte"
	Function _ImPlot_PlotHeatmapShort(label_id:String, values:Short Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint) = "ImPlot_PlotHeatmapShort"
	Function _ImPlot_PlotHeatmapInt(label_id:String, values:Int Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint) = "ImPlot_PlotHeatmapInt"
	Function _ImPlot_PlotHeatmapLong(label_id:String, values:Long Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint) = "ImPlot_PlotHeatmapLong"
	Function _ImPlot_PlotHeatmapUInt(label_id:String, values:UInt Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint) = "ImPlot_PlotHeatmapUInt"
	Function _ImPlot_PlotHeatmapULong(label_id:String, values:ULong Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint) = "ImPlot_PlotHeatmapULong"

	Function _ImPlot_PlotHeatmapFloat_Spec(label_id:String, values:Float Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, spec:SImPlotSpec) = "ImPlot_PlotHeatmapFloat_Spec"
	Function _ImPlot_PlotHeatmapDouble_Spec(label_id:String, values:Double Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, spec:SImPlotSpec) = "ImPlot_PlotHeatmapDouble_Spec"
	Function _ImPlot_PlotHeatmapByte_Spec(label_id:String, values:Byte Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, spec:SImPlotSpec) = "ImPlot_PlotHeatmapByte_Spec"
	Function _ImPlot_PlotHeatmapShort_Spec(label_id:String, values:Short Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, spec:SImPlotSpec) = "ImPlot_PlotHeatmapShort_Spec"
	Function _ImPlot_PlotHeatmapInt_Spec(label_id:String, values:Int Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, spec:SImPlotSpec) = "ImPlot_PlotHeatmapInt_Spec"
	Function _ImPlot_PlotHeatmapLong_Spec(label_id:String, values:Long Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, spec:SImPlotSpec) = "ImPlot_PlotHeatmapLong_Spec"
	Function _ImPlot_PlotHeatmapUInt_Spec(label_id:String, values:UInt Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, spec:SImPlotSpec) = "ImPlot_PlotHeatmapUInt_Spec"
	Function _ImPlot_PlotHeatmapULong_Spec(label_id:String, values:ULong Ptr, rows:Int, cols:Int, scale_min:Double, scale_max:Double, label_fmt:String, bounds_min:SImPlotPoint, bounds_max:SImPlotPoint, spec:SImPlotSpec) = "ImPlot_PlotHeatmapULong_Spec"

	Function _ImPlot_PlotHistogramFloat:Double(label_id:String, values:Float Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange) = "ImPlot_PlotHistogramFloat"
	Function _ImPlot_PlotHistogramDouble:Double(label_id:String, values:Double Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange) = "ImPlot_PlotHistogramDouble"
	Function _ImPlot_PlotHistogramByte:Double(label_id:String, values:Byte Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange) = "ImPlot_PlotHistogramByte"
	Function _ImPlot_PlotHistogramShort:Double(label_id:String, values:Short Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange) = "ImPlot_PlotHistogramShort"
	Function _ImPlot_PlotHistogramInt:Double(label_id:String, values:Int Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange) = "ImPlot_PlotHistogramInt"
	Function _ImPlot_PlotHistogramLong:Double(label_id:String, values:Long Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange) = "ImPlot_PlotHistogramLong"
	Function _ImPlot_PlotHistogramUInt:Double(label_id:String, values:UInt Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange) = "ImPlot_PlotHistogramUInt"
	Function _ImPlot_PlotHistogramULong:Double(label_id:String, values:ULong Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange) = "ImPlot_PlotHistogramULong"

	Function _ImPlot_PlotHistogramFloat_Spec:Double(label_id:String, values:Float Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange, spec:SImPlotSpec) = "ImPlot_PlotHistogramFloat_Spec"
	Function _ImPlot_PlotHistogramDouble_Spec:Double(label_id:String, values:Double Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange, spec:SImPlotSpec) = "ImPlot_PlotHistogramDouble_Spec"
	Function _ImPlot_PlotHistogramByte_Spec:Double(label_id:String, values:Byte Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange, spec:SImPlotSpec) = "ImPlot_PlotHistogramByte_Spec"
	Function _ImPlot_PlotHistogramShort_Spec:Double(label_id:String, values:Short Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange, spec:SImPlotSpec) = "ImPlot_PlotHistogramShort_Spec"
	Function _ImPlot_PlotHistogramInt_Spec:Double(label_id:String, values:Int Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange, spec:SImPlotSpec) = "ImPlot_PlotHistogramInt_Spec"
	Function _ImPlot_PlotHistogramLong_Spec:Double(label_id:String, values:Long Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange, spec:SImPlotSpec) = "ImPlot_PlotHistogramLong_Spec"
	Function _ImPlot_PlotHistogramUInt_Spec:Double(label_id:String, values:UInt Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange, spec:SImPlotSpec) = "ImPlot_PlotHistogramUInt_Spec"
	Function _ImPlot_PlotHistogramULong_Spec:Double(label_id:String, values:ULong Ptr, count:Int, bins:Int, bar_scale:Double, range:SImPlotRange, spec:SImPlotSpec) = "ImPlot_PlotHistogramULong_Spec"

	Function _ImPlot_PlotHistogram2DFloat:Double(label_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect) = "ImPlot_PlotHistogram2DFloat"
	Function _ImPlot_PlotHistogram2DDouble:Double(label_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect) = "ImPlot_PlotHistogram2DDouble"
	Function _ImPlot_PlotHistogram2DByte:Double(label_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect) = "ImPlot_PlotHistogram2DByte"
	Function _ImPlot_PlotHistogram2DShort:Double(label_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect) = "ImPlot_PlotHistogram2DShort"
	Function _ImPlot_PlotHistogram2DInt:Double(label_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect) = "ImPlot_PlotHistogram2DInt"
	Function _ImPlot_PlotHistogram2DLong:Double(label_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect) = "ImPlot_PlotHistogram2DLong"
	Function _ImPlot_PlotHistogram2DUInt:Double(label_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect) = "ImPlot_PlotHistogram2DUInt"
	Function _ImPlot_PlotHistogram2DULong:Double(label_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect) = "ImPlot_PlotHistogram2DULong"

	Function _ImPlot_PlotHistogram2DFloat_Spec:Double(label_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect, spec:SImPlotSpec) = "ImPlot_PlotHistogram2DFloat_Spec"
	Function _ImPlot_PlotHistogram2DDouble_Spec:Double(label_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect, spec:SImPlotSpec) = "ImPlot_PlotHistogram2DDouble_Spec"
	Function _ImPlot_PlotHistogram2DByte_Spec:Double(label_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect, spec:SImPlotSpec) = "ImPlot_PlotHistogram2DByte_Spec"
	Function _ImPlot_PlotHistogram2DShort_Spec:Double(label_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect, spec:SImPlotSpec) = "ImPlot_PlotHistogram2DShort_Spec"
	Function _ImPlot_PlotHistogram2DInt_Spec:Double(label_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect, spec:SImPlotSpec) = "ImPlot_PlotHistogram2DInt_Spec"
	Function _ImPlot_PlotHistogram2DLong_Spec:Double(label_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect, spec:SImPlotSpec) = "ImPlot_PlotHistogram2DLong_Spec"
	Function _ImPlot_PlotHistogram2DUInt_Spec:Double(label_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect, spec:SImPlotSpec) = "ImPlot_PlotHistogram2DUInt_Spec"
	Function _ImPlot_PlotHistogram2DULong_Spec:Double(label_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, x_bins:Int, y_bins:Int, range:SImPlotRect, spec:SImPlotSpec) = "ImPlot_PlotHistogram2DULong_Spec"

	Function _ImPlot_PlotDigitalFloat(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int) = "ImPlot_PlotDigitalFloat"
	Function _ImPlot_PlotDigitalDouble(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int) = "ImPlot_PlotDigitalDouble"
	Function _ImPlot_PlotDigitalByte(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int) = "ImPlot_PlotDigitalByte"
	Function _ImPlot_PlotDigitalShort(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int) = "ImPlot_PlotDigitalShort"
	Function _ImPlot_PlotDigitalInt(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int) = "ImPlot_PlotDigitalInt"
	Function _ImPlot_PlotDigitalLong(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int) = "ImPlot_PlotDigitalLong"
	Function _ImPlot_PlotDigitalUInt(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int) = "ImPlot_PlotDigitalUInt"
	Function _ImPlot_PlotDigitalULong(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int) = "ImPlot_PlotDigitalULong"

	Function _ImPlot_PlotDigitalFloat_Spec(title_id:String, xs:Float Ptr, ys:Float Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotDigitalFloat_Spec"
	Function _ImPlot_PlotDigitalDouble_Spec(title_id:String, xs:Double Ptr, ys:Double Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotDigitalDouble_Spec"
	Function _ImPlot_PlotDigitalByte_Spec(title_id:String, xs:Byte Ptr, ys:Byte Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotDigitalByte_Spec"
	Function _ImPlot_PlotDigitalShort_Spec(title_id:String, xs:Short Ptr, ys:Short Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotDigitalShort_Spec"
	Function _ImPlot_PlotDigitalInt_Spec(title_id:String, xs:Int Ptr, ys:Int Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotDigitalInt_Spec"
	Function _ImPlot_PlotDigitalLong_Spec(title_id:String, xs:Long Ptr, ys:Long Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotDigitalLong_Spec"
	Function _ImPlot_PlotDigitalUInt_Spec(title_id:String, xs:UInt Ptr, ys:UInt Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotDigitalUInt_Spec"
	Function _ImPlot_PlotDigitalULong_Spec(title_id:String, xs:ULong Ptr, ys:ULong Ptr, count:Int, spec:SImPlotSpec) = "ImPlot_PlotDigitalULong_Spec"

	Function _ImPlot_PlotText(text:String, x:Double, y:Double, pix_offset:SImVec2) = "ImPlot_PlotText"
	Function _ImPlot_PlotDummy(title_id:String) = "ImPlot_PlotDummy"

	Function _ImPlot_PlotText_Spec(text:String, x:Double, y:Double, pix_offset:SImVec2, spec:SImPlotSpec) = "ImPlot_PlotText_Spec"
	Function _ImPlot_PlotDummy_Spec(title_id:String, spec:SImPlotSpec) = "ImPlot_PlotDummy_Spec"

	Function _ImPlot_DragPoint:Int(id:Int, x:Double Ptr, y:Double Ptr, col:SImVec4, size:Float, flags:EImPlotDragToolFlags, out_clicked:Int Ptr, out_hovered:Int Ptr, held:Int Ptr) = "ImPlot_DragPoint"
	Function _ImPlot_DragLineX:Int(id:Int, x:Double Ptr, col:SImVec4, thickness:Float, flags:EImPlotDragToolFlags, out_clicked:Int Ptr, out_hovered:Int Ptr, held:Int Ptr) = "ImPlot_DragLineX"
	Function _ImPlot_DragLineY:Int(id:Int, y:Double Ptr, col:SImVec4, thickness:Float, flags:EImPlotDragToolFlags, out_clicked:Int Ptr, out_hovered:Int Ptr, held:Int Ptr) = "ImPlot_DragLineY"
	Function _ImPlot_DragRect:Int(id:Int, x1:Double Ptr, y1:Double Ptr, x2:Double Ptr, y2:Double Ptr, col:SImVec4, flags:EImPlotDragToolFlags, out_clicked:Int Ptr, out_hovered:Int Ptr, held:Int Ptr) = "ImPlot_DragRect"

	Function _ImPlot_Annotation:Int(x:Double, y:Double, col:SImVec4, pix_offset:SImVec2, clamp:Int, round:Int) = "ImPlot_Annotation"
	Function _ImPlot_AnnotationFmt:Int(x:Double, y:Double, col:SImVec4, pix_offset:SImVec2, clamp:Int, fmt:String) = "ImPlot_AnnotationFmt"
	Function _ImPlot_TagX:Int(x:Double, col:SImVec4, round:Int) = "ImPlot_TagX"
	Function _ImPlot_TagXFmt:Int(x:Double, col:SImVec4, fmt:String) = "ImPlot_TagXFmt"
	Function _ImPlot_TagY:Int(y:Double, col:SImVec4, round:Int) = "ImPlot_TagY"
	Function _ImPlot_TagYFmt:Int(y:Double, col:SImVec4, fmt:String) = "ImPlot_TagYFmt"

	Function _ImPlot_SetAxis(axis:EImAxis) = "ImPlot_SetAxis"
	Function _ImPlot_SetAxes(x_axis:EImAxis, y_axis:EImAxis) = "ImPlot_SetAxes"
	Function _ImPlot_PixelsToPlot:SImPlotPoint(pix:SImVec2, x_axis:EImAxis, y_axis:EImAxis) = "ImPlot_PixelsToPlot"
	Function _ImPlot_PixelsToPlotXY:SImPlotPoint(x:Double, y:Double, x_axis:EImAxis, y_axis:EImAxis) = "ImPlot_PixelsToPlotXY"
	Function _ImPlot_PlotToPixels:SImVec2(plt:SImPlotPoint, x_axis:EImAxis, y_axis:EImAxis) = "ImPlot_PlotToPixels"
	Function _ImPlot_PlotToPixelsXY:SImVec2(x:Double, y:Double, x_axis:EImAxis, y_axis:EImAxis) = "ImPlot_PlotToPixelsXY"
	Function _ImPlot_GetPlotPos:SImVec2() = "ImPlot_GetPlotPos"
	Function _ImPlot_GetPlotSize:SImVec2() = "ImPlot_GetPlotSize"
	Function _ImPlot_GetPlotMousePos:SImPlotPoint(x_axis:EImAxis, y_axis:EImAxis) = "ImPlot_GetPlotMousePos"
	Function _ImPlot_GetPlotLimits:SImPlotRect(x_axis:EImAxis, y_axis:EImAxis) = "ImPlot_GetPlotLimits"
	Function _ImPlot_IsPlotHovered:Int() = "ImPlot_IsPlotHovered"
	Function _ImPlot_IsAxisHovered:Int(axis:EImAxis) = "ImPlot_IsAxisHovered"
	Function _ImPlot_IsSubplotsHovered:Int() = "ImPlot_IsSubplotsHovered"
	Function _ImPlot_IsPlotSelected:Int() = "ImPlot_IsPlotSelected"
	Function _ImPlot_GetPlotSelection:SImPlotRect(x_axis:EImAxis, y_axis:EImAxis) = "ImPlot_GetPlotSelection"
	Function _ImPlot_CancelPlotSelection() = "ImPlot_CancelPlotSelection"
	Function _ImPlot_HideNextItem(hidden:Int, cond:EImPlotCond) = "ImPlot_HideNextItem"
	Function _ImPlot_BeginAlignedPlots:Int(group_id:String, vertical:Int) = "ImPlot_BeginAlignedPlots"
	Function _ImPlot_EndAlignedPlots() = "ImPlot_EndAlignedPlots"
	Function _ImPlot_BeginLegendPopup:Int(label_id:String, mouse_button:EImGuiMouseButton) = "ImPlot_BeginLegendPopup"
	Function _ImPlot_EndLegendPopup() = "ImPlot_EndLegendPopup"
	Function _ImPlot_IsLegendEntryHovered:Int(label_id:String) = "ImPlot_IsLegendEntryHovered"
	Function _ImPlot_BeginDragDropTargetPlot:Int() = "ImPlot_BeginDragDropTargetPlot"
	Function _ImPlot_BeginDragDropTargetAxis:Int(axis:EImAxis) = "ImPlot_BeginDragDropTargetAxis"
	Function _ImPlot_BeginDragDropTargetLegend:Int() = "ImPlot_BeginDragDropTargetLegend"
	Function _ImPlot_EndDragDropTarget() = "ImPlot_EndDragDropTarget"
	Function _ImPlot_BeginDragDropSourcePlot:Int(flags:EImGuiDragDropFlags) = "ImPlot_BeginDragDropSourcePlot"
	Function _ImPlot_BeginDragDropSourceAxis:Int(axis:EImAxis, flags:EImGuiDragDropFlags) = "ImPlot_BeginDragDropSourceAxis"
	Function _ImPlot_BeginDragDropSourceItem:Int(label_id:String, flags:EImGuiDragDropFlags) = "ImPlot_BeginDragDropSourceItem"
	Function _ImPlot_EndDragDropSource() = "ImPlot_EndDragDropSource"

	Function _ImPlot_GetStyle:Byte Ptr() = "ImPlot_GetStyle"
	Function _ImPlot_StyleColorsAuto(style:Byte Ptr) = "ImPlot_StyleColorsAuto"
	Function _ImPlot_StyleColorsClassic(style:Byte Ptr) = "ImPlot_StyleColorsClassic"
	Function _ImPlot_StyleColorsDark(style:Byte Ptr) = "ImPlot_StyleColorsDark"
	Function _ImPlot_StyleColorsLight(style:Byte Ptr) = "ImPlot_StyleColorsLight"
	Function _ImPlot_PushStyleColor(idx:EImPlotCol, col:UInt) = "ImPlot_PushStyleColor"
	Function _ImPlot_PushStyleColorVec4(idx:EImPlotCol, col:SImVec4) = "ImPlot_PushStyleColorVec4"
	Function _ImPlot_PopStyleColor(count:Int) = "ImPlot_PopStyleColor"
	Function _ImPlot_PushStyleVar(idx:EImPlotStyleVar, val:Float) = "ImPlot_PushStyleVar"
	Function _ImPlot_PushStyleVarInt(idx:EImPlotStyleVar, val:Int) = "ImPlot_PushStyleVarInt"
	Function _ImPlot_PushStyleVarVec2(idx:EImPlotStyleVar, val:SImVec2) = "ImPlot_PushStyleVarVec2"
	Function _ImPlot_PopStyleVar(count:Int) = "ImPlot_PopStyleVar"

	' Function _ImPlot_SetNextLineStyle(col:SImVec4, weight:Float) = "ImPlot_SetNextLineStyle"
	' Function _ImPlot_SetNextFillStyle(col:SImVec4, alpha:Float) = "ImPlot_SetNextFillStyle"
	' Function _ImPlot_SetNextMarkerStyle(marker:EImPlotMarker, size:Float, fill:SImVec4, weight:Float, outline:SImVec4) = "ImPlot_SetNextMarkerStyle"
	' Function _ImPlot_SetNextErrorBarStyle(col:SImVec4, size:Float, weight:Float) = "ImPlot_SetNextErrorBarStyle"
	Function _ImPlot_GetLastItemColor:SImVec4() = "ImPlot_GetLastItemColor"
	Function _ImPlot_GetStyleColorName:String(idx:EImPlotCol) = "ImPlot_GetStyleColorName"
	Function _ImPlot_GetMarkerName:String(idx:EImPlotMarker) = "ImPlot_GetMarkerName"
	Function _ImPlot_NextMarker:Int() = "ImPlot_NextMarker"

	Function _ImPlot_ShowStyleSelector:Int(label:String) = "ImPlot_ShowStyleSelector"
	Function _ImPlot_ShowColormapSelector:Int(label:String) = "ImPlot_ShowColormapSelector"
	Function _ImPlot_ShowInputMapSelector:Int(label:String) = "ImPlot_ShowInputMapSelector"
	Function _ImPlot_ShowStyleEditor(ref:Byte Ptr) = "ImPlot_ShowStyleEditor"
	Function _ImPlot_ShowUserGuide() = "ImPlot_ShowUserGuide"
	Function _ImPlot_ShowMetricsWindow(p_popen:Int Var) = "ImPlot_ShowMetricsWindow"

	Function bmx_implot_style_create:Byte Ptr()
	Function bmx_implot_style_delete(handle:Byte Ptr)
	' Function bmx_implot_style_get_line_weight:Float(handle:Byte Ptr)
	' Function bmx_implot_style_set_line_weight(handle:Byte Ptr, value:Float)
	' Function bmx_implot_style_get_marker:Int(handle:Byte Ptr)
	' Function bmx_implot_style_set_marker(handle:Byte Ptr, value:Int)
	' Function bmx_implot_style_get_marker_size:Float(handle:Byte Ptr)
	' Function bmx_implot_style_set_marker_size(handle:Byte Ptr, value:Float)
	' Function bmx_implot_style_get_marker_weight:Float(handle:Byte Ptr)
	' Function bmx_implot_style_set_marker_weight(handle:Byte Ptr, value:Float)
	' Function bmx_implot_style_get_fill_alpha:Float(handle:Byte Ptr)
	' Function bmx_implot_style_set_fill_alpha(handle:Byte Ptr, value:Float)
	' Function bmx_implot_style_get_error_bar_size:Float(handle:Byte Ptr)
	' Function bmx_implot_style_set_error_bar_size(handle:Byte Ptr, value:Float)
	' Function bmx_implot_style_get_error_bar_weight:Float(handle:Byte Ptr)
	' Function bmx_implot_style_set_error_bar_weight(handle:Byte Ptr, value:Float)
	' Function bmx_implot_style_get_digital_bit_height:Float(handle:Byte Ptr)
	' Function bmx_implot_style_set_digital_bit_height(handle:Byte Ptr, value:Float)
	' Function bmx_implot_style_get_digital_bit_gap:Float(handle:Byte Ptr)
	' Function bmx_implot_style_set_digital_bit_gap(handle:Byte Ptr, value:Float)
	Function bmx_implot_style_get_plot_border_size:Float(handle:Byte Ptr)
	Function bmx_implot_style_set_plot_border_size(handle:Byte Ptr, value:Float)
	Function bmx_implot_style_get_minor_alpha:Float(handle:Byte Ptr)
	Function bmx_implot_style_set_minor_alpha(handle:Byte Ptr, value:Float)
	Function bmx_implot_style_get_major_tick_len:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_major_tick_len(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_minor_tick_len:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_minor_tick_len(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_major_tick_size:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_major_tick_size(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_minor_tick_size:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_minor_tick_size(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_major_grid_size:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_major_grid_size(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_minor_grid_size:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_minor_grid_size(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_plot_padding:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_plot_padding(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_label_padding:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_label_padding(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_legend_padding:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_legend_padding(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_legend_inner_padding:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_legend_inner_padding(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_legend_spacing:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_legend_spacing(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_mouse_pos_padding:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_mouse_pos_padding(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_annotation_padding:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_annotation_padding(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_fit_padding:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_fit_padding(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_plot_default_size:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_plot_default_size(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_plot_min_size:SImVec2(handle:Byte Ptr)
	Function bmx_implot_style_set_plot_min_size(handle:Byte Ptr, value:SImVec2)
	Function bmx_implot_style_get_color:SImVec4(handle:Byte Ptr, index:EImPlotCol)
	Function bmx_implot_style_set_color(handle:Byte Ptr, index:EImPlotCol, value:SImVec4)
	Function bmx_implot_style_get_colormap:Int(handle:Byte Ptr)
	Function bmx_implot_style_set_colormap(handle:Byte Ptr, value:Int)
	Function bmx_implot_style_get_use_local_time:Int(handle:Byte Ptr)
	Function bmx_implot_style_set_use_local_time(handle:Byte Ptr, value:Int)
	Function bmx_implot_style_get_use_iso_8601:Int(handle:Byte Ptr)
	Function bmx_implot_style_set_use_iso_8601(handle:Byte Ptr, value:Int)
	Function bmx_implot_style_get_use_24_hour_clock:Int(handle:Byte Ptr)
	Function bmx_implot_style_set_use_24_hour_clock(handle:Byte Ptr, value:Int)

End Extern

Public

Global IMPLOT_AUTO_COL:SImVec4 = New SImVec4(0.0, 0.0, 0.0, -1.0)

' enums

Enum EImAxis:Int
	_X2 = 1
	_X3 = 2
	_Y1 = 3
	_Y2 = 4
	_Y3 = 5
	_COUNT = 6
	_Auto = -1
End Enum

Enum EImPlotFlags Flags
	_None = 0
	_NoTitle = 1 Shl 0
	_NoLegend = 1 Shl 1
	_NoMouseText = 1 Shl 2
	_NoInputs = 1 Shl 3
	_NoMenus = 1 Shl 4
	_NoBoxSelect = 1 Shl 5
	_NoFrame = 1 Shl 6
	_Equal = 1 Shl 7
	_Crosshairs = 1 Shl 8
	_CanvasOnly = _NoTitle | _NoLegend | _NoMenus | _NoBoxSelect | _NoMouseText
End Enum

Enum EImPlotAxisFlags Flags
	_None = 0
	_NoLabel = 1 Shl 0
	_NoGridLines = 1 Shl 1
	_NoTickMarks = 1 Shl 2
	_NoTickLabels = 1 Shl 3
	_NoInitialFit = 1 Shl 4
	_NoMenus = 1 Shl 5
	_NoSideSwitch = 1 Shl 6
	_NoHighlight = 1 Shl 7
	_Opposite = 1 Shl 8
	_Foreground = 1 Shl 9
	_Invert = 1 Shl 10
	_AutoFit = 1 Shl 11
	_RangeFit = 1 Shl 12
	_PanStretch = 1 Shl 13
	_LockMin = 1 Shl 14
	_LockMax = 1 Shl 15
	_Lock = _LockMin | _LockMax
	_NoDecorations = _NoLabel | _NoGridLines | _NoTickMarks | _NoTickLabels
	_AuxDefault = _NoGridLines | _Opposite
End Enum

Enum EImPlotSubplotFlags Flags
	_None = 0
	_NoTitle = 1 Shl 0
	_NoLegend = 1 Shl 1
	_NoMenus = 1 Shl 2
	_NoResize = 1 Shl 3
	_NoAlign = 1 Shl 4
	_ShareItems = 1 Shl 5
	_LinkRows = 1 Shl 6
	_LinkCols = 1 Shl 7
	_LinkAllX = 1 Shl 8
	_LinkAllY = 1 Shl 9
	_ColMajor = 1 Shl 10
End Enum

Enum EImPlotLegendFlags Flags
	_None = 0
	_NoButtons = 1 Shl 0
	_NoHighlightItem = 1 Shl 1
	_NoHighlightAxis = 1 Shl 2
	_NoMenus = 1 Shl 3
	_Outside = 1 Shl 4
	_Horizontal = 1 Shl 5
	_Sort = 1 Shl 6
End Enum

Enum EImPlotMouseTextFlags Flags
	_None = 0
	_NoAuxAxes = 1 Shl 0
	_NoFormat = 1 Shl 1
	_ShowAlways = 1 Shl 2
End Enum

Enum EImPlotDragToolFlags Flags
	_None = 0
	_NoCursors = 1 Shl 0
	_NoFit = 1 Shl 1
	_NoInputs = 1 Shl 2
	_Delayed = 1 Shl 3
End Enum

Enum EImPlotCond
	_None = 0
	_Always = 1
	_Once = 2
End Enum

Enum EImPlotColormapScaleFlags Flags
	_None = 0
	_NoLabel = 1 Shl 0
	_Opposite = 1 Shl 1
	_Invert = 1 Shl 2
End Enum

Enum EImPlotItemFlags Flags
	_None = 0
	_NoLegend = 1 Shl 0
	_NoFit = 1 Shl 1
End Enum

Enum EImPlotLineFlags Flags
	_None = 0
	_Segments = 1 Shl 10
	_Loop = 1 Shl 11
	_SkipNaN = 1 Shl 12
	_NoClip = 1 Shl 13
	_Shaded = 1 Shl 14
End Enum

Enum EImPlotScatterFlags Flags
	_None = 0
	_NoClip = 1 Shl 10
End Enum

Enum EImPlotStairsFlags Flags
	_None = 0
	_PreStep = 1 Shl 10
	_Shaded = 1 Shl 11
End Enum

Enum EImPlotShadedFlags Flags
	_None = 0
End Enum

Enum EImPlotBarsFlags Flags
	_None = 0
	_Horizontal = 1 Shl 10
End Enum

Enum EImPlotBarGroupsFlags Flags
	_None = 0
	_Horizontal = 1 Shl 10
	_Stacked = 1 Shl 11
End Enum

Enum EImPlotErrorBarsFlags Flags
	_None = 0
	_Horizontal = 1 Shl 10
End Enum

Enum EImPlotStemsFlags Flags
	_None = 0
	_Horizontal = 1 Shl 10
End Enum

Enum EImPlotInfLinesFlags Flags
	_None = 0
	_Horizontal = 1 Shl 10
End Enum

Enum EImPlotPieChartFlags Flags
	_None = 0
	_Normalize = 1 Shl 10
	_IgnoreHidden = 1 Shl 11
	_Exploding = 1 Shl 12
End Enum

Enum EImPlotHeatmapFlags Flags
	_None = 0
	_ColMajor = 1 Shl 10
End Enum

Enum EImPlotHistogramFlags Flags
	_None = 0
	_Horizontal = 1 Shl 10
	_Cumulative = 1 Shl 11
	_Density = 1 Shl 12
	_NoOutliers = 1 Shl 13
	_ColMajor = 1 Shl 14
End Enum

Enum EImPlotDigitalFlags Flags
	_None = 0
End Enum

Enum EImPlotImageFlags Flags
	_None = 0
End Enum

Enum EImPlotTextFlags Flags
	_None = 0
	_Vertical = 1 Shl 10
End Enum

Enum EImPlotDummyFlags Flags
	_None = 0
End Enum

Enum EImPlotCol
	_FrameBg = 0
	_PlotBg = 1
	_PlotBorder = 2
	_LegendBg = 3
	_LegendBorder = 4
	_LegendText = 5
	_TitleText = 6
	_InlayText = 7
	_AxisText = 8
	_AxisGrid = 9
	_AxisTick = 10
	_AxisBg = 11
	_AxisBgHovered = 12
	_AxisBgActive = 13
	_Selection = 14
	_Crosshairs = 15
End Enum

Enum EImPlotStyleVar
	_PlotDefaultSize = 0
	_PlotMinSize = 1
	_PlotBorderSize = 2
	_MinorAlpha = 3
	_MajorTickLen = 4
	_MinorTickLen = 5
	_MajorTickSize = 6
	_MinorTickSize = 7
	_MajorGridSize = 8
	_MinorGridSize = 9
	_PlotPadding = 10
	_LabelPadding = 11
	_LegendPadding = 12
	_LegendInnerPadding = 13
	_LegendSpacing = 14
	_MousePosPadding = 15
	_AnnotationPadding = 16
	_FitPadding = 17
	_DigitalBitHeight = 18
	_DigitalBitGap = 19
End Enum

Enum EImPlotScale
	_Linear = 0
	_Time = 1
	_Log10 = 2
	_SymLog = 3
End Enum

Enum EImPlotMarker
	_None = -2
	_Auto = -1
	_Circle = 0
	_Square = 1
	_Diamond = 2
	_Up = 3
	_Down = 4
	_Left = 5
	_Right = 6
	_Cross = 7
	_Plus = 8
	_Asterisk = 9
End Enum

Enum EImPlotColormap
	_Deep = 0
	_Dark = 1
	_Pastel = 2
	_Paired = 3
	_Viridis = 4
	_Plasma = 5
	_Hot = 6
	_Cool = 7
	_Pink = 8
	_Jet = 9
	_Twilight = 10
	_RdBu = 11
	_BrBG = 12
	_PiYG = 13
	_Spectral = 14
	_Greys = 15
End Enum

Enum EImPlotLocation Flags
	_Center = 0
	_North = 1 Shl 0
	_South = 1 Shl 1
	_West = 1 Shl 2
	_East = 1 Shl 3
	_NorthWest = _North | _West
	_NorthEast = _North | _East
	_SouthWest = _South | _West
	_SouthEast = _South | _East
End Enum

Rem
bbdoc: Automatic histogram binning method - `k = sqrt(n)`
End Rem
Const ImPlotBin_Sqrt:Int = -1
Rem
bbdoc: Automatic histogram binning method - `k = log2(n) + 1`
End Rem
Const ImPlotBin_Sturges:Int = -2
Rem
bbdoc: Automatic histogram binning method - `k = 2 * cbrt(n)`
End Rem
Const ImPlotBin_Rice:Int = -3
Rem
bbdoc: Automatic histogram binning method -`w = 3.49 * sigma / cbrt(n)`
End Rem
Const ImPlotBin_Scott:Int = -4

' structs
Rem
bbdoc: Point in 2D space.
End Rem
Struct SImPlotPoint
	Field x:Double
	Field y:Double

	Method New(x:Double, y:Double)
		Self.x = x
		Self.y = y
	End Method
End Struct

Rem
bbdoc: Range defined by a min/max value.
End Rem
Struct SImPlotRange
	Field _min:Double
	Field _max:Double

	Method New(_min:Double, _max:Double)
		Self._min = _min
		Self._max = _max
	End Method

	Rem
	bbdoc: Returns #True if value is within the range.
	End Rem
	Method Contains:Int(value:Double)
		Return value >= _min And value <= _max
	End Method

	Rem
	bbdoc: Returns the size of the range.
	End Rem
	Method Size:Double()
		Return _max - _min
	End Method

	Rem
	bbdoc: Clamps a value to the range.
	End Rem
	Method Clamp:Double(value:Double)
		If value < _min Then
			Return _min
		Else If value > _max Then
			Return _max
		Else
			Return value
		End If
	End Method
End Struct

Rem
bbdoc: Combination of two range limits for X and Y axes.
about: Also an AABB defined by Minimum()/Maximum().
End Rem
Struct SImPlotRect
	Field x:SImPlotRange
	Field y:SImPlotRange

	Method New(x_min:Double, x_max:Double, y_min:Double, y_max:Double)
		Self.x._min = x_min
		Self.x._max = x_max
		Self.y._min = y_min
		Self.y._max = y_max
	End Method

	Rem
	bbdoc: Returns #True if the point is within the rectangle.
	End Rem
	Method Contains:Int(point:SImPlotPoint)
		Return Contains(point.x, point.y)
	End Method

	Rem
	bbdoc: Returns #True if the point is within the rectangle.
	End Rem
	Method Contains:Int(x:Double, y:Double)
		Return Self.x.Contains(x) And Self.y.Contains(y)
	End Method

	Rem
	bbdoc: Returns the size of the rectangle.
	End Rem
	Method Size:SImPlotPoint()
		Return New SImPlotPoint(Self.x.Size(), Self.y.Size())
	End Method

	Rem
	bbdoc: Clamps a point to the rectangle.
	End Rem
	Method Clamp:SImPlotPoint(x:Double, y:Double)
		Return New SImPlotPoint(Self.x.Clamp(x), Self.y.Clamp(y))
	End Method

	Rem
	bbdoc: Clamps a point to the rectangle.
	End Rem
	Method Clamp:SImPlotPoint(point:SImPlotPoint)
		Return Clamp(point.x, point.y)
	End Method

	Rem
	bbdoc: Returns the minimum point of the rectangle.
	End Rem
	Method Minimum:SImPlotPoint()
		Return New SImPlotPoint(Self.x._min, Self.y._min)
	End Method

	Rem
	bbdoc: Returns the maximum point of the rectangle.
	End Rem
	Method Maximum:SImPlotPoint()
		Return New SImPlotPoint(Self.x._max, Self.y._max)
	End Method
End Struct

Type TImPlotStyle
	Field stylePtr:Byte Ptr
	Field owner:Int

	Function Create:TImPlotStyle()
		Local style:TImPlotStyle = New TImPlotStyle()
		style.Init()
		Return style
	End Function

	Function _Create:TImPlotStyle(stylePtr:Byte Ptr)
		If stylePtr Then
			Local style:TImPlotStyle = New TImPlotStyle()
			style.stylePtr = stylePtr
			Return style
		End If
	End Function

	Method Init()
		If Not stylePtr
			stylePtr = bmx_implot_style_create()
			owner = True
		End If
	End Method

	Method Delete()
		If owner
			bmx_implot_style_delete(stylePtr)
		End If
	End Method
	
	Rem
	bbdoc: Gets the line thickness of border around plot area.
	about: The default value is 1.0.
	End Rem
	Method GetPlotBorderSize:Float()
		Return bmx_implot_style_get_plot_border_size(stylePtr)
	End Method

	Rem
	bbdoc: Sets the line thickness of border around plot area.
	about: The default value is 1.0.
	End Rem
	Method SetPlotBorderSize(size:Float)
		bmx_implot_style_set_plot_border_size(stylePtr, size)
	End Method

	Rem
	bbdoc: Returns the alpha multiplier applied to minor axis grid lines.
	about: The default value is 0.25.
	End Rem
	Method GetMinorAlpha:Float()
		Return bmx_implot_style_get_minor_alpha(stylePtr)
	End Method

	Rem
	bbdoc: Sets the alpha multiplier applied to minor axis grid lines.
	about: The default value is 0.25.
	End Rem
	Method SetMinorAlpha(alpha:Float)
		bmx_implot_style_set_minor_alpha(stylePtr, alpha)
	End Method

	Rem
	bbdoc: Gets the major tick lengths for X and Y axes.
	about: The default value is (10.0, 10.0).
	End Rem
	Method GetMajorTickLen:SImVec2()
		Return bmx_implot_style_get_major_tick_len(stylePtr)
	End Method

	Rem
	bbdoc: Sets the major tick lengths for X and Y axes.
	about: The default value is (10.0, 10.0).
	End Rem
	Method SetMajorTickLen(length:SImVec2)
		bmx_implot_style_set_major_tick_len(stylePtr, length)
	End Method

	Rem
	bbdoc: Gets the minor tick lengths for X and Y axes.
	about: The default value is (5.0, 5.0).
	End Rem
	Method GetMinorTickLen:SImVec2()
		Return bmx_implot_style_get_minor_tick_len(stylePtr)
	End Method

	Rem
	bbdoc: Sets the minor tick lengths for X and Y axes.
	about: The default value is (5.0, 5.0).
	End Rem
	Method SetMinorTickLen(length:SImVec2)
		bmx_implot_style_set_minor_tick_len(stylePtr, length)
	End Method

	Rem
	bbdoc: Gets the line thickness of major ticks.
	about: The default value is (1.0, 1.0).
	End Rem
	Method GetMajorTickSize:SImVec2()
		Return bmx_implot_style_get_major_tick_size(stylePtr)
	End Method

	Rem
	bbdoc: Sets the line thickness of major ticks.
	about: The default value is (1.0, 1.0).
	End Rem
	Method SetMajorTickSize(size:SImVec2)
		bmx_implot_style_set_major_tick_size(stylePtr, size)
	End Method

	Rem
	bbdoc: Gets the line thickness of minor ticks.
	about: The default value is (1.0, 1.0).
	End Rem
	Method GetMinorTickSize:SImVec2()
		Return bmx_implot_style_get_minor_tick_size(stylePtr)
	End Method

	Rem
	bbdoc: Sets the line thickness of minor ticks.
	about: The default value is (1.0, 1.0).
	End Rem
	Method SetMinorTickSize(size:SImVec2)
		bmx_implot_style_set_minor_tick_size(stylePtr, size)
	End Method

	Rem
	bbdoc: Gets the line thickness of major grid lines.
	about: The default value is (1.0, 1.0).
	End Rem
	Method GetMajorGridSize:SImVec2()
		Return bmx_implot_style_get_major_grid_size(stylePtr)
	End Method

	Rem
	bbdoc: Sets the line thickness of major grid lines.
	about: The default value is (1.0, 1.0).
	End Rem
	Method SetMajorGridSize(size:SImVec2)
		bmx_implot_style_set_major_grid_size(stylePtr, size)
	End Method

	Rem
	bbdoc: Returns the line thickness of minor grid lines.
	about: The default value is (1.0, 1.0).
	End Rem
	Method GetMinorGridSize:SImVec2()
		Return bmx_implot_style_get_minor_grid_size(stylePtr)
	End Method

	Rem
	bbdoc: Sets the line thickness of minor grid lines.
	about: The default value is (1.0, 1.0).
	End Rem
	Method SetMinorGridSize(size:SImVec2)
		bmx_implot_style_set_minor_grid_size(stylePtr, size)
	End Method

	Rem
	bbdoc: Gets the padding between widget frame and plot area, labels, or outside legends (i.e. main padding).
	about: The default value is (10.0, 10.0).
	End Rem
	Method GetPlotPadding:SImVec2()
		Return bmx_implot_style_get_plot_padding(stylePtr)
	End Method

	Rem
	bbdoc: Sets the padding between widget frame and plot area, labels, or outside legends (i.e. main padding).
	about: The default value is (10.0, 10.0).
	End Rem
	Method SetPlotPadding(padding:SImVec2)
		bmx_implot_style_set_plot_padding(stylePtr, padding)
	End Method

	Rem
	bbdoc: Gets the padding between axes labels, tick labels, and plot edge.
	about: The default value is (5.0, 5.0).
	End Rem
	Method GetLabelPadding:SImVec2()
		Return bmx_implot_style_get_label_padding(stylePtr)
	End Method

	Rem
	bbdoc: Sets the padding between axes labels, tick labels, and plot edge.
	about: The default value is (5.0, 5.0).
	End Rem
	Method SetLabelPadding(padding:SImVec2)
		bmx_implot_style_set_label_padding(stylePtr, padding)
	End Method

	Rem
	bbdoc: Gets the legend padding from plot edges.
	about: The default value is (10.0, 10.0).
	End Rem
	Method GetLegendPadding:SImVec2()
		Return bmx_implot_style_get_legend_padding(stylePtr)
	End Method

	Rem
	bbdoc: Sets the legend padding from plot edges.
	about: The default value is (10.0, 10.0).
	End Rem
	Method SetLegendPadding(padding:SImVec2)
		bmx_implot_style_set_legend_padding(stylePtr, padding)
	End Method

	Rem
	bbdoc: Gets the legend inner padding from legend edges.
	about: The default value is (5.0, 5.0).
	End Rem
	Method GetLegendInnerPadding:SImVec2()
		Return bmx_implot_style_get_legend_inner_padding(stylePtr)
	End Method

	Rem
	bbdoc: Sets the legend inner padding from legend edges.
	about: The default value is (5.0, 5.0).
	End Rem
	Method SetLegendInnerPadding(padding:SImVec2)
		bmx_implot_style_set_legend_inner_padding(stylePtr, padding)
	End Method

	Rem
	bbdoc: Gets the spacing between legend entries.
	about: The default value is (5.0, 0.0).
	End Rem
	Method GetLegendSpacing:SImVec2()
		Return bmx_implot_style_get_legend_spacing(stylePtr)
	End Method

	Rem
	bbdoc: Sets the spacing between legend entries.
	about: The default value is (5.0, 0.0).
	End Rem
	Method SetLegendSpacing(spacing:SImVec2)
		bmx_implot_style_set_legend_spacing(stylePtr, spacing)
	End Method

	Rem
	bbdoc: Gets the padding between plot edge and interior mouse location text.
	about: The default value is (10.0, 10.0).
	End Rem
	Method GetMousePosPadding:SImVec2()
		Return bmx_implot_style_get_mouse_pos_padding(stylePtr)
	End Method

	Rem
	bbdoc: Sets the padding between plot edge and interior mouse location text.
	about: The default value is (10.0, 10.0).
	End Rem
	Method SetMousePosPadding(padding:SImVec2)
		bmx_implot_style_set_mouse_pos_padding(stylePtr, padding)
	End Method

	Rem
	bbdoc: Gets the text padding around annotation labels.
	about: The default value is (2.0, 2.0).
	End Rem
	Method GetAnnotationPadding:SImVec2()
		Return bmx_implot_style_get_annotation_padding(stylePtr)
	End Method

	Rem
	bbdoc: Sets the text padding around annotation labels.
	about: The default value is (2.0, 2.0).
	End Rem
	Method SetAnnotationPadding(padding:SImVec2)
		bmx_implot_style_set_annotation_padding(stylePtr, padding)
	End Method

	Rem
	bbdoc: Gets the additional fit padding as a percentage of the fit extents.
	about: The default value is (0.0, 0.0).
	End Rem
	Method GetFitPadding:SImVec2()
		Return bmx_implot_style_get_fit_padding(stylePtr)
	End Method

	Rem
	bbdoc: Sets the additional fit padding as a percentage of the fit extents.
	about: The default value is (0.0, 0.0).
	End Rem
	Method SetFitPadding(padding:SImVec2)
		bmx_implot_style_set_fit_padding(stylePtr, padding)
	End Method

	Rem
	bbdoc: Gets the default size used when ImVec2(0,0) is passed to #ImPlot_BeginPlot.
	about: The default value is (400.0, 300.0).
	End Rem
	Method GetPlotDefaultSize:SImVec2()
		Return bmx_implot_style_get_plot_default_size(stylePtr)
	End Method

	Rem
	bbdoc: Sets the default size used when ImVec2(0,0) is passed to #ImPlot_BeginPlot.
	about: The default value is (400.0, 300.0).
	End Rem
	Method SetPlotDefaultSize(size:SImVec2)
		bmx_implot_style_set_plot_default_size(stylePtr, size)
	End Method

	Rem
	bbdoc: Gets the minimum size plot frame can be when shrunk.
	about: The default value is (200.0, 150.0).
	End Rem
	Method GetPlotMinSize:SImVec2()
		Return bmx_implot_style_get_plot_min_size(stylePtr)
	End Method

	Rem
	bbdoc: Sets the minimum size plot frame can be when shrunk.
	about: The default value is (200.0, 150.0).
	End Rem
	Method SetPlotMinSize(size:SImVec2)
		bmx_implot_style_set_plot_min_size(stylePtr, size)
	End Method

	Rem
	bbdoc: Returns the colov value for the specified color.
	End Rem
	Method GetColor:SImVec4(color:EImPlotCol)
		Return bmx_implot_style_get_color(stylePtr, color)
	End Method

	Rem
	bbdoc: Sets the color value for the specified color.
	End Rem
	Method SetColor(color:EImPlotCol, col:SImVec4)
		bmx_implot_style_set_color(stylePtr, color, col)
	End Method

	Rem
	bbdoc: Gets the current colormap.
	End Rem
	Method GetColormap:Int()
		Return bmx_implot_style_get_colormap(stylePtr)
	End Method

	Rem
	bbdoc: Sets the current colormap.
	End Rem
	Method SetColormap(colormap:Int)
		bmx_implot_style_set_colormap(stylePtr, colormap)
	End Method

	Rem
	bbdoc: Returns whether axis labels will be formatted for your timezone when #ImPlotAxisFlag_Time is enabled.
	about: The default value is #False.
	End Rem
	Method GetUseLocalTime:Int()
		Return bmx_implot_style_get_use_local_time(stylePtr)
	End Method

	Rem
	bbdoc: Sets whether axis labels will be formatted for your timezone when #ImPlotAxisFlag_Time is enabled.
	about: The default value is #False.
	End Rem
	Method SetUseLocalTime(use_local_time:Int)
		bmx_implot_style_set_use_local_time(stylePtr, use_local_time)
	End Method

	Rem
	bbdoc: Returns whether dates will be formatted according to ISO 8601 where applicable (e.g. YYYY-MM-DD, YYYY-MM, --MM-DD, etc.).
	about: The default value is #False.
	End Rem
	Method GetUseISO8601:Int()
		Return bmx_implot_style_get_use_iso_8601(stylePtr)
	End Method

	Rem
	bbdoc: Sets whether dates will be formatted according to ISO 8601 where applicable (e.g. YYYY-MM-DD, YYYY-MM, --MM-DD, etc.).
	about: The default value is #False.
	End Rem
	Method SetUseISO8601(use_iso_8601:Int)
		bmx_implot_style_set_use_iso_8601(stylePtr, use_iso_8601)
	End Method

	Rem
	bbdoc: Returns whether axis labels will be formatted for 24 hour clock.
	about: The default value is #False.
	End Rem
	Method GetUse24HourClock:Int()
		Return bmx_implot_style_get_use_24_hour_clock(stylePtr)
	End Method

	Rem
	bbdoc: Sets whether axis labels will be formatted for 24 hour clock.
	about: The default value is #False.
	End Rem
	Method SetUse24HourClock(use_24_hour_clock:Int)
		bmx_implot_style_set_use_24_hour_clock(stylePtr, use_24_hour_clock)
	End Method

End Type

Struct SImPlotSpec
	Field lineColor:SImVec4 = New SImVec4(0,0,0,-1)
	Field lineWeight:Float = 1.0
	Field fillColor:SImVec4 = New SImVec4(0,0,0,-1)
	Field fillAlpha:Float = 1.0
	Field marker:EImPlotMarker = EImPlotMarker._None
	Field markerSize:Float = 4.0
	Field markerLineColor:SImVec4 = New SImVec4(0,0,0,-1)
	Field markerFillColor:SImVec4 = New SImVec4(0,0,0,-1)
	Field size:Float = 4.0
	Field offset:Int = 0
	Field stride:Int = -1
	Field flags:EImPlotItemFlags = EImPlotItemFlags._None
End Struct
