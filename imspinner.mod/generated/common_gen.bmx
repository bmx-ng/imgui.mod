'
' This file is generated. Do not modify it manually.
' Generated from imspinner.h header file.
'
SuperStrict

Import "../../imgui.mod/imgui/*.h"
Import "../imspinner/*.h"
Import "glue_gen.cpp"


Const COLOR_WHITE:UInt = $FFFFFFFF:UInt
Const COLOR_HALF_WHITE:UInt = $80FFFFFF:UInt
Const COLOR_RED:UInt = $FF0000FF:UInt
	


Function ImSpinner_Rainbow(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, ang_min:Float = 0.0, ang_max:Float = 360, arcs:Int = 1, mode:Int = 0)
	_ImSpinner_Rainbow(label, radius, thickness, color, speed, ang_min, ang_max, arcs, mode)
End Function

Function ImSpinner_RainbowMix(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, ang_min:Float = 0.0, ang_max:Float = 360, arcs:Int = 1, mode:Int = 0)
	_ImSpinner_RainbowMix(label, radius, thickness, color, speed, ang_min, ang_max, arcs, mode)
End Function

Function ImSpinner_RotatingHeart(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, ang_min:Float = 0.0)
	_ImSpinner_RotatingHeart(label, radius, thickness, color, speed, ang_min)
End Function

Function ImSpinner_Ang(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_WHITE, speed:Float = 2.8, angle:Float = 180, mode:Int = 0)
	_ImSpinner_Ang(label, radius, thickness, color, bg, speed, angle, mode)
End Function

Function ImSpinner_Ang8(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_WHITE, speed:Float = 2.8, angle:Float = 180, mode:Int = 0, rkoef:Float = 0.5)
	_ImSpinner_Ang8(label, radius, thickness, color, bg, speed, angle, mode, rkoef)
End Function

Function ImSpinner_AngMix(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, angle:Float = 180, arcs:Int = 4, mode:Int = 0)
	_ImSpinner_AngMix(label, radius, thickness, color, speed, angle, arcs, mode)
End Function

Function ImSpinner_LoadingRing(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, segments:Int = 5)
	_ImSpinner_LoadingRing(label, radius, thickness, color, bg, speed, segments)
End Function

Function ImSpinner_Clock(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8)
	_ImSpinner_Clock(label, radius, thickness, color, bg, speed)
End Function

Function ImSpinner_Pulsar(label:String, radius:Float, thickness:Float, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, sequence:Int = True, angle:Float = 0.0, mode:Int = 0)
	_ImSpinner_Pulsar(label, radius, thickness, bg, speed, sequence, angle, mode)
End Function

Function ImSpinner_DoubleFadePulsar(label:String, radius:Float, thickness:Float, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8)
	_ImSpinner_DoubleFadePulsar(label, radius, thickness, bg, speed)
End Function

Function ImSpinner_TwinPulsar(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, rings:Int = 2, mode:Int = 0)
	_ImSpinner_TwinPulsar(label, radius, thickness, color, speed, rings, mode)
End Function

Function ImSpinner_FadePulsar(label:String, radius:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, rings:Int = 2, mode:Int = 0)
	_ImSpinner_FadePulsar(label, radius, color, speed, rings, mode)
End Function

Function ImSpinner_FadePulsarSquare(label:String, radius:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, rings:Int = 2, mode:Int = 0)
	_ImSpinner_FadePulsarSquare(label, radius, color, speed, rings, mode)
End Function

Function ImSpinner_CircularLines(label:String, radius:Float, color:UInt = COLOR_WHITE, speed:Float = 1.8, lines:Int = 8, mode:Int = 0)
	_ImSpinner_CircularLines(label, radius, color, speed, lines, mode)
End Function

Function ImSpinner_Dots(label:String, nextdot:Float Ptr, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Size_T = 12, minth:Float = -1.0, mode:Int = 0)
	_ImSpinner_Dots(label, nextdot, radius, thickness, color, speed, dots, minth, mode)
End Function

Function ImSpinner_VDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bgcolor:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Size_T = 12, mdots:Size_T = 6, mode:Int = 0)
	_ImSpinner_VDots(label, radius, thickness, color, bgcolor, speed, dots, mdots, mode)
End Function

Function ImSpinner_BounceDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Size_T = 3, mode:Int = 0)
	_ImSpinner_BounceDots(label, radius, thickness, color, speed, dots, mode)
End Function

Function ImSpinner_ZipDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Size_T = 5)
	_ImSpinner_ZipDots(label, radius, thickness, color, speed, dots)
End Function

Function ImSpinner_DotsToPoints(label:String, radius:Float, thickness:Float, offset_k:Float, color:UInt = COLOR_WHITE, speed:Float = 1.8, dots:Size_T = 5)
	_ImSpinner_DotsToPoints(label, radius, thickness, offset_k, color, speed, dots)
End Function

Function ImSpinner_DotsToBar(label:String, radius:Float, thickness:Float, offset_k:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Size_T = 5)
	_ImSpinner_DotsToBar(label, radius, thickness, offset_k, color, speed, dots)
End Function

Function ImSpinner_WaveDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, lt:Int = 8)
	_ImSpinner_WaveDots(label, radius, thickness, color, speed, lt)
End Function

Function ImSpinner_FadeDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, lt:Int = 8, mode:Int = 0)
	_ImSpinner_FadeDots(label, radius, thickness, color, speed, lt, mode)
End Function

Function ImSpinner_ThreeDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, lt:Int = 8)
	_ImSpinner_ThreeDots(label, radius, thickness, color, speed, lt)
End Function

Function ImSpinner_FiveDots(label:String, radius:Float, thickness:Float, color:UInt = $fffffff, speed:Float = 2.8, lt:Int = 8)
	_ImSpinner_FiveDots(label, radius, thickness, color, speed, lt)
End Function

Function ImSpinner_4Caleidospcope(label:String, radius:Float, thickness:Float, color:UInt = $fffffff, speed:Float = 2.8, lt:Int = 8)
	_ImSpinner_4Caleidospcope(label, radius, thickness, color, speed, lt)
End Function

Function ImSpinner_MultiFadeDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, lt:Int = 8)
	_ImSpinner_MultiFadeDots(label, radius, thickness, color, speed, lt)
End Function

Function ImSpinner_ThickToSin(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, nt:Int = 1, lt:Int = 8, mode:Int = 0)
	_ImSpinner_ThickToSin(label, radius, thickness, color, speed, nt, lt, mode)
End Function

Function ImSpinner_ScaleDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, lt:Int = 8)
	_ImSpinner_ScaleDots(label, radius, thickness, color, speed, lt)
End Function

Function ImSpinner_SquareSpins(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_SquareSpins(label, radius, thickness, color, speed)
End Function

Function ImSpinner_MovingDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Size_T = 3)
	_ImSpinner_MovingDots(label, radius, thickness, color, speed, dots)
End Function

Function ImSpinner_RotateDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Int = 2, mode:Int = 0)
	_ImSpinner_RotateDots(label, radius, thickness, color, speed, dots, mode)
End Function

Function ImSpinner_OrionDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Int = 4)
	_ImSpinner_OrionDots(label, radius, thickness, color, speed, arcs)
End Function

Function ImSpinner_GalaxyDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Int = 4)
	_ImSpinner_GalaxyDots(label, radius, thickness, color, speed, arcs)
End Function

Function ImSpinner_TwinAng(label:String, radius1:Float, radius2:Float, thickness:Float, color1:UInt = COLOR_WHITE, color2:UInt = COLOR_RED, speed:Float = 2.8, angle:Float = 180, mode:Int = 0)
	_ImSpinner_TwinAng(label, radius1, radius2, thickness, color1, color2, speed, angle, mode)
End Function

Function ImSpinner_Filling(label:String, radius:Float, thickness:Float, color1:UInt = COLOR_WHITE, color2:UInt = COLOR_RED, speed:Float = 2.8)
	_ImSpinner_Filling(label, radius, thickness, color1, color2, speed)
End Function

Function ImSpinner_FillingMem(label:String, radius:Float, thickness:Float, color:UInt, colorbg:UInt, speed:Float)
	_ImSpinner_FillingMem(label, radius, thickness, color, colorbg, speed)
End Function

Function ImSpinner_Topup(label:String, radius1:Float, radius2:Float, color:UInt = COLOR_RED, fg:UInt = COLOR_WHITE, bg:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_Topup(label, radius1, radius2, color, fg, bg, speed)
End Function

Function ImSpinner_TwinAng180(label:String, radius1:Float, radius2:Float, thickness:Float, color1:UInt = COLOR_WHITE, color2:UInt = COLOR_RED, speed:Float = 2.8, angle:Float = 45, mode:Int = 0)
	_ImSpinner_TwinAng180(label, radius1, radius2, thickness, color1, color2, speed, angle, mode)
End Function

Function ImSpinner_TwinAng360(label:String, radius1:Float, radius2:Float, thickness:Float, color1:UInt = COLOR_WHITE, color2:UInt = COLOR_RED, speed1:Float = 2.8, speed2:Float = 2.5, mode:Int = 0)
	_ImSpinner_TwinAng360(label, radius1, radius2, thickness, color1, color2, speed1, speed2, mode)
End Function

Function ImSpinner_IncDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Size_T = 6)
	_ImSpinner_IncDots(label, radius, thickness, color, speed, dots)
End Function

Function ImSpinner_IncFullDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Size_T = 4)
	_ImSpinner_IncFullDots(label, radius, thickness, color, speed, dots)
End Function

Function ImSpinner_FadeBars(label:String, w:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, bars:Size_T = 3, scale:Int = False)
	_ImSpinner_FadeBars(label, w, color, speed, bars, scale)
End Function

Function ImSpinner_FadeTris(label:String, radius:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dim:Size_T = 2, scale:Int = False, mode:Int = 0)
	_ImSpinner_FadeTris(label, radius, color, speed, dim, scale, mode)
End Function

Function ImSpinner_BarsRotateFade(label:String, rmin:Float, rmax:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, bars:Size_T = 6)
	_ImSpinner_BarsRotateFade(label, rmin, rmax, thickness, color, speed, bars)
End Function

Function ImSpinner_BarsScaleMiddle(label:String, w:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, bars:Size_T = 3)
	_ImSpinner_BarsScaleMiddle(label, w, color, speed, bars)
End Function

Function ImSpinner_AngTwin(label:String, radius1:Float, radius2:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, angle:Float = 180, arcs:Size_T = 1, mode:Int = 0)
	_ImSpinner_AngTwin(label, radius1, radius2, thickness, color, bg, speed, angle, arcs, mode)
End Function

Function ImSpinner_ArcRotation(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4, mode:Int = 0)
	_ImSpinner_ArcRotation(label, radius, thickness, color, speed, arcs, mode)
End Function

Function ImSpinner_ArcFade(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4, mode:Int = 0)
	_ImSpinner_ArcFade(label, radius, thickness, color, speed, arcs, mode)
End Function

Function ImSpinner_SimpleArcFade(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_SimpleArcFade(label, radius, thickness, color, speed)
End Function

Function ImSpinner_SquareStrokeFade(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_SquareStrokeFade(label, radius, thickness, color, speed)
End Function

Function ImSpinner_AsciiSymbolPoints(label:String, text:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_AsciiSymbolPoints(label, text, radius, thickness, color, speed)
End Function

Function ImSpinner_TextFading(label:String, text:String, radius:Float, fsize:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_TextFading(label, text, radius, fsize, color, speed)
End Function

Function ImSpinner_SevenSegments(label:String, text:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_SevenSegments(label, text, radius, thickness, color, speed)
End Function

Function ImSpinner_SquareStrokeFill(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_SquareStrokeFill(label, radius, thickness, color, speed)
End Function

Function ImSpinner_SquareStrokeLoading(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_SquareStrokeLoading(label, radius, thickness, color, speed)
End Function

Function ImSpinner_SquareLoading(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_SquareLoading(label, radius, thickness, color, speed)
End Function

Function ImSpinner_FilledArcFade(label:String, radius:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4, mode:Int = 0)
	_ImSpinner_FilledArcFade(label, radius, color, speed, arcs, mode)
End Function

Function ImSpinner_PointsRoller(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, points:Size_T = 8, circles:Int = 2, rspeed:Float = 1.0)
	_ImSpinner_PointsRoller(label, radius, thickness, color, speed, points, circles, rspeed)
End Function

Function ImSpinner_PointsArcBounce(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, points:Size_T = 4, circles:Int = 2, rspeed:Float = 0.0)
	_ImSpinner_PointsArcBounce(label, radius, thickness, color, speed, points, circles, rspeed)
End Function

Function ImSpinner_FilledArcColor(label:String, radius:Float, color:UInt = COLOR_RED, bg:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4)
	_ImSpinner_FilledArcColor(label, radius, color, bg, speed, arcs)
End Function

Function ImSpinner_FilledArcRing(label:String, radius:Float, thickness:Float, color:UInt = COLOR_RED, bg:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4)
	_ImSpinner_FilledArcRing(label, radius, thickness, color, bg, speed, arcs)
End Function

Function ImSpinner_ArcWedges(label:String, radius:Float, color:UInt = COLOR_RED, speed:Float = 2.8, arcs:Size_T = 4, mode:Int = 0)
	_ImSpinner_ArcWedges(label, radius, color, speed, arcs, mode)
End Function

Function ImSpinner_TwinBall(label:String, radius1:Float, radius2:Float, thickness:Float, b_thickness:Float, ball:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, balls:Size_T = 2, mode:Int = 0)
	_ImSpinner_TwinBall(label, radius1, radius2, thickness, b_thickness, ball, bg, speed, balls, mode)
End Function

Function ImSpinner_SolarBalls(label:String, radius:Float, thickness:Float, ball:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, balls:Size_T = 4)
	_ImSpinner_SolarBalls(label, radius, thickness, ball, bg, speed, balls)
End Function

Function ImSpinner_SolarScaleBalls(label:String, radius:Float, thickness:Float, ball:UInt = COLOR_WHITE, speed:Float = 2.8, balls:Size_T = 4)
	_ImSpinner_SolarScaleBalls(label, radius, thickness, ball, speed, balls)
End Function

Function ImSpinner_SolarArcs(label:String, radius:Float, thickness:Float, ball:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, balls:Size_T = 4)
	_ImSpinner_SolarArcs(label, radius, thickness, ball, bg, speed, balls)
End Function

Function ImSpinner_MovingArcs(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4)
	_ImSpinner_MovingArcs(label, radius, thickness, color, speed, arcs)
End Function

Function ImSpinner_RainbowCircle(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4, mode:Float = 1)
	_ImSpinner_RainbowCircle(label, radius, thickness, color, speed, arcs, mode)
End Function

Function ImSpinner_BounceBall(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Int = 1, shadow:Int = False)
	_ImSpinner_BounceBall(label, radius, thickness, color, speed, dots, shadow)
End Function

Function ImSpinner_PulsarBall(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, shadow:Int = False, mode:Int = 0)
	_ImSpinner_PulsarBall(label, radius, thickness, color, speed, shadow, mode)
End Function

Function ImSpinner_IncScaleDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Size_T = 6, angle:Float = 0.0, mode:Int = 0)
	_ImSpinner_IncScaleDots(label, radius, thickness, color, speed, dots, angle, mode)
End Function

Function ImSpinner_SomeScaleDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, dots:Size_T = 6, mode:Int = 0)
	_ImSpinner_SomeScaleDots(label, radius, thickness, color, speed, dots, mode)
End Function

Function ImSpinner_AngTriple(label:String, radius1:Float, radius2:Float, radius3:Float, thickness:Float, c1:UInt = COLOR_WHITE, c2:UInt = COLOR_HALF_WHITE, c3:UInt = COLOR_WHITE, speed:Float = 2.8, angle:Float = 180)
	_ImSpinner_AngTriple(label, radius1, radius2, radius3, thickness, c1, c2, c3, speed, angle)
End Function

Function ImSpinner_AngEclipse(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, angle:Float = 180)
	_ImSpinner_AngEclipse(label, radius, thickness, color, speed, angle)
End Function

Function ImSpinner_IngYang(label:String, radius:Float, thickness:Float, reverse:Int, yang_detlta_r:Float, colorI:UInt = COLOR_WHITE, colorY:UInt = COLOR_WHITE, speed:Float = 2.8, angle:Float = 180 * 0.7, mode:Int = 0)
	_ImSpinner_IngYang(label, radius, thickness, reverse, yang_detlta_r, colorI, colorY, speed, angle, mode)
End Function

Function ImSpinner_GooeyBalls(label:String, radius:Float, color:UInt, speed:Float, mode:Int = 0)
	_ImSpinner_GooeyBalls(label, radius, color, speed, mode)
End Function

Function ImSpinner_DotsLoading(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float)
	_ImSpinner_DotsLoading(label, radius, thickness, color, bg, speed)
End Function

Function ImSpinner_RotateGooeyBalls(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, balls:Int, mode:Int = 0)
	_ImSpinner_RotateGooeyBalls(label, radius, thickness, color, speed, balls, mode)
End Function

Function ImSpinner_HerbertBalls(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, balls:Int)
	_ImSpinner_HerbertBalls(label, radius, thickness, color, speed, balls)
End Function

Function ImSpinner_HerbertBalls3D(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)
	_ImSpinner_HerbertBalls3D(label, radius, thickness, color, speed)
End Function

Function ImSpinner_RotateTriangles(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, tris:Int, mode:Int = 0)
	_ImSpinner_RotateTriangles(label, radius, thickness, color, speed, tris, mode)
End Function

Function ImSpinner_RotateShapes(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, shapes:Int, pnt:Int)
	_ImSpinner_RotateShapes(label, radius, thickness, color, speed, shapes, pnt)
End Function

Function ImSpinner_SinSquares(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, mode:Int = 0)
	_ImSpinner_SinSquares(label, radius, thickness, color, speed, mode)
End Function

Function ImSpinner_MoonLine(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_RED, speed:Float = 2.8, angle:Float = 180)
	_ImSpinner_MoonLine(label, radius, thickness, color, bg, speed, angle)
End Function

Function ImSpinner_CircleDrop(label:String, radius:Float, thickness:Float, thickness_drop:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, angle:Float = 180)
	_ImSpinner_CircleDrop(label, radius, thickness, thickness_drop, color, bg, speed, angle)
End Function

Function ImSpinner_SurroundedIndicator(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8)
	_ImSpinner_SurroundedIndicator(label, radius, thickness, color, bg, speed)
End Function

Function ImSpinner_WifiIndicator(label:String, radius:Float, thickness:Float, color:UInt = COLOR_RED, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, cangle:Float = 0.0, dots:Int = 3)
	_ImSpinner_WifiIndicator(label, radius, thickness, color, bg, speed, cangle, dots)
End Function

Function ImSpinner_TrianglesSelector(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, bars:Size_T = 8)
	_ImSpinner_TrianglesSelector(label, radius, thickness, color, bg, speed, bars)
End Function

Function ImSpinner_Camera(label:String, radius:Float, thickness:Float, leaf_color:UInt(userData:Object, i:Int), userData:Object, speed:Float = 2.8, bars:Size_T = 8, mode:Int = 0)
	_ImSpinner_Camera(label, radius, thickness, leaf_color, userData, speed, bars, mode)
End Function

Function ImSpinner_FlowingGradient(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_RED, speed:Float = 2.8, angle:Float = 180)
	_ImSpinner_FlowingGradient(label, radius, thickness, color, bg, speed, angle)
End Function

Function ImSpinner_RotateSegments(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4, layers:Size_T = 1, mode:Int = 0)
	_ImSpinner_RotateSegments(label, radius, thickness, color, speed, arcs, layers, mode)
End Function

Function ImSpinner_Lemniscate(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, angle:Float = 180 / 2.0)
	_ImSpinner_Lemniscate(label, radius, thickness, color, speed, angle)
End Function

Function ImSpinner_RotateGear(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, pins:Size_T = 12)
	_ImSpinner_RotateGear(label, radius, thickness, color, speed, pins)
End Function

Function ImSpinner_RotateWheel(label:String, radius:Float, thickness:Float, bg_color:UInt = COLOR_WHITE, color:UInt = COLOR_WHITE, speed:Float = 2.8, pins:Size_T = 12)
	_ImSpinner_RotateWheel(label, radius, thickness, bg_color, color, speed, pins)
End Function

Function ImSpinner_Atom(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, elipses:Int = 3)
	_ImSpinner_Atom(label, radius, thickness, color, speed, elipses)
End Function

Function ImSpinner_PatternRings(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, elipses:Int = 3)
	_ImSpinner_PatternRings(label, radius, thickness, color, speed, elipses)
End Function

Function ImSpinner_PatternEclipse(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, elipses:Int = 3, delta_a:Float = 2.0, delta_y:Float = 0.0)
	_ImSpinner_PatternEclipse(label, radius, thickness, color, speed, elipses, delta_a, delta_y)
End Function

Function ImSpinner_PatternSphere(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, elipses:Int = 3)
	_ImSpinner_PatternSphere(label, radius, thickness, color, speed, elipses)
End Function

Function ImSpinner_RingSynchronous(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, elipses:Int = 3)
	_ImSpinner_RingSynchronous(label, radius, thickness, color, speed, elipses)
End Function

Function ImSpinner_RingWatermarks(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, elipses:Int = 3)
	_ImSpinner_RingWatermarks(label, radius, thickness, color, speed, elipses)
End Function

Function ImSpinner_RotatedAtom(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, elipses:Int = 3, mode:Int = 0)
	_ImSpinner_RotatedAtom(label, radius, thickness, color, speed, elipses, mode)
End Function

Function ImSpinner_RainbowBalls(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, balls:Int = 5, mode:Int = 0, rings:Int = 1, mx:Int = 1)
	_ImSpinner_RainbowBalls(label, radius, thickness, color, speed, balls, mode, rings, mx)
End Function

Function ImSpinner_RainbowShot(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, balls:Int = 5, mode:Int = 0)
	_ImSpinner_RainbowShot(label, radius, thickness, color, speed, balls, mode)
End Function

Function ImSpinner_Spiral(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4)
	_ImSpinner_Spiral(label, radius, thickness, color, speed, arcs)
End Function

Function ImSpinner_SpiralEye(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_SpiralEye(label, radius, thickness, color, speed)
End Function

Function ImSpinner_BarChartSine(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, bars:Int = 5, mode:Int = 0)
	_ImSpinner_BarChartSine(label, radius, thickness, color, speed, bars, mode)
End Function

Function ImSpinner_BarChartAdvSine(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, mode:Int = 0)
	_ImSpinner_BarChartAdvSine(label, radius, thickness, color, speed, mode)
End Function

Function ImSpinner_BarChartAdvSineFade(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, mode:Int = 0)
	_ImSpinner_BarChartAdvSineFade(label, radius, thickness, color, speed, mode)
End Function

Function ImSpinner_BarChartRainbow(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, bars:Int = 5, mode:Int = 0)
	_ImSpinner_BarChartRainbow(label, radius, thickness, color, speed, bars, mode)
End Function

Function ImSpinner_Blocks(label:String, radius:Float, thickness:Float, bg:UInt, color:UInt, speed:Float)
	_ImSpinner_Blocks(label, radius, thickness, bg, color, speed)
End Function

Function ImSpinner_TwinBlocks(label:String, radius:Float, thickness:Float, bg:UInt, color:UInt, speed:Float)
	_ImSpinner_TwinBlocks(label, radius, thickness, bg, color, speed)
End Function

Function ImSpinner_SquareRandomDots(label:String, radius:Float, thickness:Float, bg:UInt, color:UInt, speed:Float)
	_ImSpinner_SquareRandomDots(label, radius, thickness, bg, color, speed)
End Function

Function ImSpinner_ScaleBlocks(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, mode:Int = 0)
	_ImSpinner_ScaleBlocks(label, radius, thickness, color, speed, mode)
End Function

Function ImSpinner_ScaleSquares(label:String, radius:Float, thikness:Float, color:UInt, speed:Float)
	_ImSpinner_ScaleSquares(label, radius, thikness, color, speed)
End Function

Function ImSpinner_SquishSquare(label:String, radius:Float, color:UInt, speed:Float)
	_ImSpinner_SquishSquare(label, radius, color, speed)
End Function

Function ImSpinner_Fluid(label:String, radius:Float, color:UInt, speed:Float, bars:Int = 3)
	_ImSpinner_Fluid(label, radius, color, speed, bars)
End Function

Function ImSpinner_FluidPoints(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Size_T = 6, delta:Float = 0.35)
	_ImSpinner_FluidPoints(label, radius, thickness, color, speed, dots, delta)
End Function

Function ImSpinner_ArcPolarFade(label:String, radius:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4, mode:Int = 0)
	_ImSpinner_ArcPolarFade(label, radius, color, speed, arcs, mode)
End Function

Function ImSpinner_ArcPolarRadius(label:String, radius:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4, mode:Int = 0)
	_ImSpinner_ArcPolarRadius(label, radius, color, speed, arcs, mode)
End Function

Function ImSpinner_Caleidoscope(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 6, mode:Int = 0)
	_ImSpinner_Caleidoscope(label, radius, thickness, color, speed, arcs, mode)
End Function

Function ImSpinner_HboDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, minfade:Float = 0.0, ryk:Float = 0.0, speed:Float = 1.1, dots:Size_T = 6, mode:Int = 0)
	_ImSpinner_HboDots(label, radius, thickness, color, minfade, ryk, speed, dots, mode)
End Function

Function ImSpinner_MoonDots(label:String, radius:Float, thickness:Float, first:UInt, second:UInt, speed:Float = 1.1)
	_ImSpinner_MoonDots(label, radius, thickness, first, second, speed)
End Function

Function ImSpinner_TwinHboDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, minfade:Float = 0.0, ryk:Float = 0.0, speed:Float = 1.1, dots:Size_T = 6, delta:Float = 0.0)
	_ImSpinner_TwinHboDots(label, radius, thickness, color, minfade, ryk, speed, dots, delta)
End Function

Function ImSpinner_ThreeDotsStar(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, minfade:Float = 0.0, ryk:Float = 0.0, speed:Float = 1.1, delta:Float = 0.0)
	_ImSpinner_ThreeDotsStar(label, radius, thickness, color, minfade, ryk, speed, delta)
End Function

Function ImSpinner_SineArcs(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_SineArcs(label, radius, thickness, color, speed)
End Function

Function ImSpinner_TrianglesShift(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, bars:Size_T = 8)
	_ImSpinner_TrianglesShift(label, radius, thickness, color, bg, speed, bars)
End Function

Function ImSpinner_PointsShift(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_HALF_WHITE, speed:Float = 2.8, bars:Size_T = 8)
	_ImSpinner_PointsShift(label, radius, thickness, color, bg, speed, bars)
End Function

Function ImSpinner_SwingDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8)
	_ImSpinner_SwingDots(label, radius, thickness, color, speed)
End Function

Function ImSpinner_CircularPoints(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 1.8, lines:Int = 8)
	_ImSpinner_CircularPoints(label, radius, thickness, color, speed, lines)
End Function

Function ImSpinner_CurvedCircle(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, circles:Size_T = 1)
	_ImSpinner_CurvedCircle(label, radius, thickness, color, speed, circles)
End Function

Function ImSpinner_ModCircle(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, ang_min:Float = 1.0, ang_max:Float = 1.0, speed:Float = 2.8)
	_ImSpinner_ModCircle(label, radius, thickness, color, ang_min, ang_max, speed)
End Function

Function ImSpinner_DnaDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, lt:Int = 8, delta:Float = 0.5, mode:Int = 0)
	_ImSpinner_DnaDots(label, radius, thickness, color, speed, lt, delta, mode)
End Function

Function ImSpinner_3SmuggleDots(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 4.8, lt:Int = 8, delta:Float = 0.5, mode:Int = 0)
	_ImSpinner_3SmuggleDots(label, radius, thickness, color, speed, lt, delta, mode)
End Function

Function ImSpinner_RotateSegmentsPulsar(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, speed:Float = 2.8, arcs:Size_T = 4, layers:Size_T = 1)
	_ImSpinner_RotateSegmentsPulsar(label, radius, thickness, color, speed, arcs, layers)
End Function

Function ImSpinner_SplineAng(label:String, radius:Float, thickness:Float, color:UInt = COLOR_WHITE, bg:UInt = COLOR_WHITE, speed:Float = 2.8, angle:Float = 180, mode:Int = 0)
	_ImSpinner_SplineAng(label, radius, thickness, color, bg, speed, angle, mode)
End Function

Extern
	Function _ImSpinner_Rainbow(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, ang_min:Float, ang_max:Float, arcs:Int, mode:Int)="ImSpinner_Rainbow"
	Function _ImSpinner_RainbowMix(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, ang_min:Float, ang_max:Float, arcs:Int, mode:Int)="ImSpinner_RainbowMix"
	Function _ImSpinner_RotatingHeart(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, ang_min:Float)="ImSpinner_RotatingHeart"
	Function _ImSpinner_Ang(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, angle:Float, mode:Int)="ImSpinner_Ang"
	Function _ImSpinner_Ang8(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, angle:Float, mode:Int, rkoef:Float)="ImSpinner_Ang8"
	Function _ImSpinner_AngMix(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, angle:Float, arcs:Int, mode:Int)="ImSpinner_AngMix"
	Function _ImSpinner_LoadingRing(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, segments:Int)="ImSpinner_LoadingRing"
	Function _ImSpinner_Clock(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float)="ImSpinner_Clock"
	Function _ImSpinner_Pulsar(label:String, radius:Float, thickness:Float, bg:UInt, speed:Float, sequence:Int, angle:Float, mode:Int)="ImSpinner_Pulsar"
	Function _ImSpinner_DoubleFadePulsar(label:String, radius:Float, thickness:Float, bg:UInt, speed:Float)="ImSpinner_DoubleFadePulsar"
	Function _ImSpinner_TwinPulsar(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, rings:Int, mode:Int)="ImSpinner_TwinPulsar"
	Function _ImSpinner_FadePulsar(label:String, radius:Float, color:UInt, speed:Float, rings:Int, mode:Int)="ImSpinner_FadePulsar"
	Function _ImSpinner_FadePulsarSquare(label:String, radius:Float, color:UInt, speed:Float, rings:Int, mode:Int)="ImSpinner_FadePulsarSquare"
	Function _ImSpinner_CircularLines(label:String, radius:Float, color:UInt, speed:Float, lines:Int, mode:Int)="ImSpinner_CircularLines"
	Function _ImSpinner_Dots(label:String, nextdot:Float Ptr, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Size_T, minth:Float, mode:Int)="ImSpinner_Dots"
	Function _ImSpinner_VDots(label:String, radius:Float, thickness:Float, color:UInt, bgcolor:UInt, speed:Float, dots:Size_T, mdots:Size_T, mode:Int)="ImSpinner_VDots"
	Function _ImSpinner_BounceDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Size_T, mode:Int)="ImSpinner_BounceDots"
	Function _ImSpinner_ZipDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Size_T)="ImSpinner_ZipDots"
	Function _ImSpinner_DotsToPoints(label:String, radius:Float, thickness:Float, offset_k:Float, color:UInt, speed:Float, dots:Size_T)="ImSpinner_DotsToPoints"
	Function _ImSpinner_DotsToBar(label:String, radius:Float, thickness:Float, offset_k:Float, color:UInt, speed:Float, dots:Size_T)="ImSpinner_DotsToBar"
	Function _ImSpinner_WaveDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, lt:Int)="ImSpinner_WaveDots"
	Function _ImSpinner_FadeDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, lt:Int, mode:Int)="ImSpinner_FadeDots"
	Function _ImSpinner_ThreeDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, lt:Int)="ImSpinner_ThreeDots"
	Function _ImSpinner_FiveDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, lt:Int)="ImSpinner_FiveDots"
	Function _ImSpinner_4Caleidospcope(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, lt:Int)="ImSpinner_4Caleidospcope"
	Function _ImSpinner_MultiFadeDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, lt:Int)="ImSpinner_MultiFadeDots"
	Function _ImSpinner_ThickToSin(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, nt:Int, lt:Int, mode:Int)="ImSpinner_ThickToSin"
	Function _ImSpinner_ScaleDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, lt:Int)="ImSpinner_ScaleDots"
	Function _ImSpinner_SquareSpins(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_SquareSpins"
	Function _ImSpinner_MovingDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Size_T)="ImSpinner_MovingDots"
	Function _ImSpinner_RotateDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Int, mode:Int)="ImSpinner_RotateDots"
	Function _ImSpinner_OrionDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, arcs:Int)="ImSpinner_OrionDots"
	Function _ImSpinner_GalaxyDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, arcs:Int)="ImSpinner_GalaxyDots"
	Function _ImSpinner_TwinAng(label:String, radius1:Float, radius2:Float, thickness:Float, color1:UInt, color2:UInt, speed:Float, angle:Float, mode:Int)="ImSpinner_TwinAng"
	Function _ImSpinner_Filling(label:String, radius:Float, thickness:Float, color1:UInt, color2:UInt, speed:Float)="ImSpinner_Filling"
	Function _ImSpinner_FillingMem(label:String, radius:Float, thickness:Float, color:UInt, colorbg:UInt, speed:Float)="ImSpinner_FillingMem"
	Function _ImSpinner_Topup(label:String, radius1:Float, radius2:Float, color:UInt, fg:UInt, bg:UInt, speed:Float)="ImSpinner_Topup"
	Function _ImSpinner_TwinAng180(label:String, radius1:Float, radius2:Float, thickness:Float, color1:UInt, color2:UInt, speed:Float, angle:Float, mode:Int)="ImSpinner_TwinAng180"
	Function _ImSpinner_TwinAng360(label:String, radius1:Float, radius2:Float, thickness:Float, color1:UInt, color2:UInt, speed1:Float, speed2:Float, mode:Int)="ImSpinner_TwinAng360"
	Function _ImSpinner_IncDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Size_T)="ImSpinner_IncDots"
	Function _ImSpinner_IncFullDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Size_T)="ImSpinner_IncFullDots"
	Function _ImSpinner_FadeBars(label:String, w:Float, color:UInt, speed:Float, bars:Size_T, scale:Int)="ImSpinner_FadeBars"
	Function _ImSpinner_FadeTris(label:String, radius:Float, color:UInt, speed:Float, dim:Size_T, scale:Int, mode:Int)="ImSpinner_FadeTris"
	Function _ImSpinner_BarsRotateFade(label:String, rmin:Float, rmax:Float, thickness:Float, color:UInt, speed:Float, bars:Size_T)="ImSpinner_BarsRotateFade"
	Function _ImSpinner_BarsScaleMiddle(label:String, w:Float, color:UInt, speed:Float, bars:Size_T)="ImSpinner_BarsScaleMiddle"
	Function _ImSpinner_AngTwin(label:String, radius1:Float, radius2:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, angle:Float, arcs:Size_T, mode:Int)="ImSpinner_AngTwin"
	Function _ImSpinner_ArcRotation(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, arcs:Size_T, mode:Int)="ImSpinner_ArcRotation"
	Function _ImSpinner_ArcFade(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, arcs:Size_T, mode:Int)="ImSpinner_ArcFade"
	Function _ImSpinner_SimpleArcFade(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_SimpleArcFade"
	Function _ImSpinner_SquareStrokeFade(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_SquareStrokeFade"
	Function _ImSpinner_AsciiSymbolPoints(label:String, text:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_AsciiSymbolPoints"
	Function _ImSpinner_TextFading(label:String, text:String, radius:Float, fsize:Float, color:UInt, speed:Float)="ImSpinner_TextFading"
	Function _ImSpinner_SevenSegments(label:String, text:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_SevenSegments"
	Function _ImSpinner_SquareStrokeFill(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_SquareStrokeFill"
	Function _ImSpinner_SquareStrokeLoading(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_SquareStrokeLoading"
	Function _ImSpinner_SquareLoading(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_SquareLoading"
	Function _ImSpinner_FilledArcFade(label:String, radius:Float, color:UInt, speed:Float, arcs:Size_T, mode:Int)="ImSpinner_FilledArcFade"
	Function _ImSpinner_PointsRoller(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, points:Size_T, circles:Int, rspeed:Float)="ImSpinner_PointsRoller"
	Function _ImSpinner_PointsArcBounce(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, points:Size_T, circles:Int, rspeed:Float)="ImSpinner_PointsArcBounce"
	Function _ImSpinner_FilledArcColor(label:String, radius:Float, color:UInt, bg:UInt, speed:Float, arcs:Size_T)="ImSpinner_FilledArcColor"
	Function _ImSpinner_FilledArcRing(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, arcs:Size_T)="ImSpinner_FilledArcRing"
	Function _ImSpinner_ArcWedges(label:String, radius:Float, color:UInt, speed:Float, arcs:Size_T, mode:Int)="ImSpinner_ArcWedges"
	Function _ImSpinner_TwinBall(label:String, radius1:Float, radius2:Float, thickness:Float, b_thickness:Float, ball:UInt, bg:UInt, speed:Float, balls:Size_T, mode:Int)="ImSpinner_TwinBall"
	Function _ImSpinner_SolarBalls(label:String, radius:Float, thickness:Float, ball:UInt, bg:UInt, speed:Float, balls:Size_T)="ImSpinner_SolarBalls"
	Function _ImSpinner_SolarScaleBalls(label:String, radius:Float, thickness:Float, ball:UInt, speed:Float, balls:Size_T)="ImSpinner_SolarScaleBalls"
	Function _ImSpinner_SolarArcs(label:String, radius:Float, thickness:Float, ball:UInt, bg:UInt, speed:Float, balls:Size_T)="ImSpinner_SolarArcs"
	Function _ImSpinner_MovingArcs(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, arcs:Size_T)="ImSpinner_MovingArcs"
	Function _ImSpinner_RainbowCircle(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, arcs:Size_T, mode:Float)="ImSpinner_RainbowCircle"
	Function _ImSpinner_BounceBall(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Int, shadow:Int)="ImSpinner_BounceBall"
	Function _ImSpinner_PulsarBall(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, shadow:Int, mode:Int)="ImSpinner_PulsarBall"
	Function _ImSpinner_IncScaleDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Size_T, angle:Float, mode:Int)="ImSpinner_IncScaleDots"
	Function _ImSpinner_SomeScaleDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Size_T, mode:Int)="ImSpinner_SomeScaleDots"
	Function _ImSpinner_AngTriple(label:String, radius1:Float, radius2:Float, radius3:Float, thickness:Float, c1:UInt, c2:UInt, c3:UInt, speed:Float, angle:Float)="ImSpinner_AngTriple"
	Function _ImSpinner_AngEclipse(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, angle:Float)="ImSpinner_AngEclipse"
	Function _ImSpinner_IngYang(label:String, radius:Float, thickness:Float, reverse:Int, yang_detlta_r:Float, colorI:UInt, colorY:UInt, speed:Float, angle:Float, mode:Int)="ImSpinner_IngYang"
	Function _ImSpinner_GooeyBalls(label:String, radius:Float, color:UInt, speed:Float, mode:Int)="ImSpinner_GooeyBalls"
	Function _ImSpinner_DotsLoading(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float)="ImSpinner_DotsLoading"
	Function _ImSpinner_RotateGooeyBalls(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, balls:Int, mode:Int)="ImSpinner_RotateGooeyBalls"
	Function _ImSpinner_HerbertBalls(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, balls:Int)="ImSpinner_HerbertBalls"
	Function _ImSpinner_HerbertBalls3D(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_HerbertBalls3D"
	Function _ImSpinner_RotateTriangles(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, tris:Int, mode:Int)="ImSpinner_RotateTriangles"
	Function _ImSpinner_RotateShapes(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, shapes:Int, pnt:Int)="ImSpinner_RotateShapes"
	Function _ImSpinner_SinSquares(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, mode:Int)="ImSpinner_SinSquares"
	Function _ImSpinner_MoonLine(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, angle:Float)="ImSpinner_MoonLine"
	Function _ImSpinner_CircleDrop(label:String, radius:Float, thickness:Float, thickness_drop:Float, color:UInt, bg:UInt, speed:Float, angle:Float)="ImSpinner_CircleDrop"
	Function _ImSpinner_SurroundedIndicator(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float)="ImSpinner_SurroundedIndicator"
	Function _ImSpinner_WifiIndicator(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, cangle:Float, dots:Int)="ImSpinner_WifiIndicator"
	Function _ImSpinner_TrianglesSelector(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, bars:Size_T)="ImSpinner_TrianglesSelector"
	Function _ImSpinner_Camera(label:String, radius:Float, thickness:Float, leaf_color:UInt(userData:Object, i:Int), userData:Object, speed:Float, bars:Size_T, mode:Int)="ImSpinner_Camera"
	Function _ImSpinner_FlowingGradient(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, angle:Float)="ImSpinner_FlowingGradient"
	Function _ImSpinner_RotateSegments(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, arcs:Size_T, layers:Size_T, mode:Int)="ImSpinner_RotateSegments"
	Function _ImSpinner_Lemniscate(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, angle:Float)="ImSpinner_Lemniscate"
	Function _ImSpinner_RotateGear(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, pins:Size_T)="ImSpinner_RotateGear"
	Function _ImSpinner_RotateWheel(label:String, radius:Float, thickness:Float, bg_color:UInt, color:UInt, speed:Float, pins:Size_T)="ImSpinner_RotateWheel"
	Function _ImSpinner_Atom(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, elipses:Int)="ImSpinner_Atom"
	Function _ImSpinner_PatternRings(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, elipses:Int)="ImSpinner_PatternRings"
	Function _ImSpinner_PatternEclipse(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, elipses:Int, delta_a:Float, delta_y:Float)="ImSpinner_PatternEclipse"
	Function _ImSpinner_PatternSphere(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, elipses:Int)="ImSpinner_PatternSphere"
	Function _ImSpinner_RingSynchronous(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, elipses:Int)="ImSpinner_RingSynchronous"
	Function _ImSpinner_RingWatermarks(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, elipses:Int)="ImSpinner_RingWatermarks"
	Function _ImSpinner_RotatedAtom(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, elipses:Int, mode:Int)="ImSpinner_RotatedAtom"
	Function _ImSpinner_RainbowBalls(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, balls:Int, mode:Int, rings:Int, mx:Int)="ImSpinner_RainbowBalls"
	Function _ImSpinner_RainbowShot(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, balls:Int, mode:Int)="ImSpinner_RainbowShot"
	Function _ImSpinner_Spiral(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, arcs:Size_T)="ImSpinner_Spiral"
	Function _ImSpinner_SpiralEye(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_SpiralEye"
	Function _ImSpinner_BarChartSine(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, bars:Int, mode:Int)="ImSpinner_BarChartSine"
	Function _ImSpinner_BarChartAdvSine(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, mode:Int)="ImSpinner_BarChartAdvSine"
	Function _ImSpinner_BarChartAdvSineFade(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, mode:Int)="ImSpinner_BarChartAdvSineFade"
	Function _ImSpinner_BarChartRainbow(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, bars:Int, mode:Int)="ImSpinner_BarChartRainbow"
	Function _ImSpinner_Blocks(label:String, radius:Float, thickness:Float, bg:UInt, color:UInt, speed:Float)="ImSpinner_Blocks"
	Function _ImSpinner_TwinBlocks(label:String, radius:Float, thickness:Float, bg:UInt, color:UInt, speed:Float)="ImSpinner_TwinBlocks"
	Function _ImSpinner_SquareRandomDots(label:String, radius:Float, thickness:Float, bg:UInt, color:UInt, speed:Float)="ImSpinner_SquareRandomDots"
	Function _ImSpinner_ScaleBlocks(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, mode:Int)="ImSpinner_ScaleBlocks"
	Function _ImSpinner_ScaleSquares(label:String, radius:Float, thikness:Float, color:UInt, speed:Float)="ImSpinner_ScaleSquares"
	Function _ImSpinner_SquishSquare(label:String, radius:Float, color:UInt, speed:Float)="ImSpinner_SquishSquare"
	Function _ImSpinner_Fluid(label:String, radius:Float, color:UInt, speed:Float, bars:Int)="ImSpinner_Fluid"
	Function _ImSpinner_FluidPoints(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, dots:Size_T, delta:Float)="ImSpinner_FluidPoints"
	Function _ImSpinner_ArcPolarFade(label:String, radius:Float, color:UInt, speed:Float, arcs:Size_T, mode:Int)="ImSpinner_ArcPolarFade"
	Function _ImSpinner_ArcPolarRadius(label:String, radius:Float, color:UInt, speed:Float, arcs:Size_T, mode:Int)="ImSpinner_ArcPolarRadius"
	Function _ImSpinner_Caleidoscope(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, arcs:Size_T, mode:Int)="ImSpinner_Caleidoscope"
	Function _ImSpinner_HboDots(label:String, radius:Float, thickness:Float, color:UInt, minfade:Float, ryk:Float, speed:Float, dots:Size_T, mode:Int)="ImSpinner_HboDots"
	Function _ImSpinner_MoonDots(label:String, radius:Float, thickness:Float, first:UInt, second:UInt, speed:Float)="ImSpinner_MoonDots"
	Function _ImSpinner_TwinHboDots(label:String, radius:Float, thickness:Float, color:UInt, minfade:Float, ryk:Float, speed:Float, dots:Size_T, delta:Float)="ImSpinner_TwinHboDots"
	Function _ImSpinner_ThreeDotsStar(label:String, radius:Float, thickness:Float, color:UInt, minfade:Float, ryk:Float, speed:Float, delta:Float)="ImSpinner_ThreeDotsStar"
	Function _ImSpinner_SineArcs(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_SineArcs"
	Function _ImSpinner_TrianglesShift(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, bars:Size_T)="ImSpinner_TrianglesShift"
	Function _ImSpinner_PointsShift(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, bars:Size_T)="ImSpinner_PointsShift"
	Function _ImSpinner_SwingDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float)="ImSpinner_SwingDots"
	Function _ImSpinner_CircularPoints(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, lines:Int)="ImSpinner_CircularPoints"
	Function _ImSpinner_CurvedCircle(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, circles:Size_T)="ImSpinner_CurvedCircle"
	Function _ImSpinner_ModCircle(label:String, radius:Float, thickness:Float, color:UInt, ang_min:Float, ang_max:Float, speed:Float)="ImSpinner_ModCircle"
	Function _ImSpinner_DnaDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, lt:Int, delta:Float, mode:Int)="ImSpinner_DnaDots"
	Function _ImSpinner_3SmuggleDots(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, lt:Int, delta:Float, mode:Int)="ImSpinner_3SmuggleDots"
	Function _ImSpinner_RotateSegmentsPulsar(label:String, radius:Float, thickness:Float, color:UInt, speed:Float, arcs:Size_T, layers:Size_T)="ImSpinner_RotateSegmentsPulsar"
	Function _ImSpinner_SplineAng(label:String, radius:Float, thickness:Float, color:UInt, bg:UInt, speed:Float, angle:Float, mode:Int)="ImSpinner_SplineAng"
End Extern
