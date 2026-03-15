//
// This file is generated. Do not modify it manually.
// Generated from imspinner.h header file.
//
#include "imspinner.h"
#include "brl.mod/blitz.mod/blitz.h"

extern "C" {
	inline static float degToRad(float deg) { return deg * (IM_PI / 180.0f); }

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


	void ImSpinner_Rainbow(BBString * label, float radius, float thickness, ImU32 color, float speed, float ang_min, float ang_max, int arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRainbow(c0, radius, thickness, col0, speed, degToRad(ang_min), degToRad(ang_max), arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_RainbowMix(BBString * label, float radius, float thickness, ImU32 color, float speed, float ang_min, float ang_max, int arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRainbowMix(c0, radius, thickness, col0, speed, degToRad(ang_min), degToRad(ang_max), arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_RotatingHeart(BBString * label, float radius, float thickness, ImU32 color, float speed, float ang_min) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRotatingHeart(c0, radius, thickness, col0, speed, degToRad(ang_min));
		bbMemFree(c0);
	}

	void ImSpinner_Ang(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, float angle, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerAng(c0, radius, thickness, ImColor(color), ImColor(bg), speed, degToRad(angle), mode);
		bbMemFree(c0);
	}

	void ImSpinner_Ang8(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, float angle, int mode, float rkoef) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerAng8(c0, radius, thickness, ImColor(color), ImColor(bg), speed, degToRad(angle), mode, rkoef);
		bbMemFree(c0);
	}

	void ImSpinner_AngMix(BBString * label, float radius, float thickness, ImU32 color, float speed, float angle, int arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerAngMix(c0, radius, thickness, ImColor(color), speed, degToRad(angle), arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_LoadingRing(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, int segments) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerLoadingRing(c0, radius, thickness, ImColor(color), ImColor(bg), speed, segments);
		bbMemFree(c0);
	}

	void ImSpinner_Clock(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerClock(c0, radius, thickness, ImColor(color), ImColor(bg), speed);
		bbMemFree(c0);
	}

	void ImSpinner_Pulsar(BBString * label, float radius, float thickness, ImU32 bg, float speed, int sequence, float angle, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(bg);
		ImSpinner::SpinnerPulsar(c0, radius, thickness, ImColor(bg), speed, (bool)sequence, degToRad(angle), mode);
		bbMemFree(c0);
	}

	void ImSpinner_DoubleFadePulsar(BBString * label, float radius, float thickness, ImU32 bg, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(bg);
		ImSpinner::SpinnerDoubleFadePulsar(c0, radius, thickness, ImColor(bg), speed);
		bbMemFree(c0);
	}

	void ImSpinner_TwinPulsar(BBString * label, float radius, float thickness, ImU32 color, float speed, int rings, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerTwinPulsar(c0, radius, thickness, ImColor(color), speed, rings, mode);
		bbMemFree(c0);
	}

	void ImSpinner_FadePulsar(BBString * label, float radius, ImU32 color, float speed, int rings, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerFadePulsar(c0, radius, ImColor(color), speed, rings, mode);
		bbMemFree(c0);
	}

	void ImSpinner_FadePulsarSquare(BBString * label, float radius, ImU32 color, float speed, int rings, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerFadePulsarSquare(c0, radius, ImColor(color), speed, rings, mode);
		bbMemFree(c0);
	}

	void ImSpinner_CircularLines(BBString * label, float radius, ImU32 color, float speed, int lines, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerCircularLines(c0, radius, ImColor(color), speed, lines, mode);
		bbMemFree(c0);
	}

	void ImSpinner_Dots(BBString * label, float* nextdot, float radius, float thickness, ImU32 color, float speed, size_t dots, float minth, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerDots(c0, nextdot, radius, thickness, ImColor(color), speed, dots, minth, mode);
		bbMemFree(c0);
	}

	void ImSpinner_VDots(BBString * label, float radius, float thickness, ImU32 color, ImU32 bgcolor, float speed, size_t dots, size_t mdots, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bgcolor);
		ImSpinner::SpinnerVDots(c0, radius, thickness, ImColor(color), ImColor(bgcolor), speed, dots, mdots, mode);
		bbMemFree(c0);
	}

	void ImSpinner_BounceDots(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t dots, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerBounceDots(c0, radius, thickness, ImColor(color), speed, dots, mode);
		bbMemFree(c0);
	}

	void ImSpinner_ZipDots(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t dots) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerZipDots(c0, radius, thickness, ImColor(color), speed, dots);
		bbMemFree(c0);
	}

	void ImSpinner_DotsToPoints(BBString * label, float radius, float thickness, float offset_k, ImU32 color, float speed, size_t dots) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerDotsToPoints(c0, radius, thickness, offset_k, ImColor(color), speed, dots);
		bbMemFree(c0);
	}

	void ImSpinner_DotsToBar(BBString * label, float radius, float thickness, float offset_k, ImU32 color, float speed, size_t dots) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerDotsToBar(c0, radius, thickness, offset_k, ImColor(color), speed, dots);
		bbMemFree(c0);
	}

	void ImSpinner_WaveDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int lt) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerWaveDots(c0, radius, thickness, ImColor(color), speed, lt);
		bbMemFree(c0);
	}

	void ImSpinner_FadeDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int lt, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerFadeDots(c0, radius, thickness, ImColor(color), speed, lt, mode);
		bbMemFree(c0);
	}

	void ImSpinner_ThreeDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int lt) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerThreeDots(c0, radius, thickness, ImColor(color), speed, lt);
		bbMemFree(c0);
	}

	void ImSpinner_FiveDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int lt) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerFiveDots(c0, radius, thickness, ImColor(color), speed, lt);
		bbMemFree(c0);
	}

	void ImSpinner_4Caleidospcope(BBString * label, float radius, float thickness, ImU32 color, float speed, int lt) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::Spinner4Caleidospcope(c0, radius, thickness, ImColor(color), speed, lt);
		bbMemFree(c0);
	}

	void ImSpinner_MultiFadeDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int lt) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerMultiFadeDots(c0, radius, thickness, ImColor(color), speed, lt);
		bbMemFree(c0);
	}

	void ImSpinner_ThickToSin(BBString * label, float radius, float thickness, ImU32 color, float speed, int nt, int lt, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerThickToSin(c0, radius, thickness, ImColor(color), speed, nt, lt, mode);
		bbMemFree(c0);
	}

	void ImSpinner_ScaleDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int lt) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerScaleDots(c0, radius, thickness, ImColor(color), speed, lt);
		bbMemFree(c0);
	}

	void ImSpinner_SquareSpins(BBString * label, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSquareSpins(c0, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
	}

	void ImSpinner_MovingDots(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t dots) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerMovingDots(c0, radius, thickness, ImColor(color), speed, dots);
		bbMemFree(c0);
	}

	void ImSpinner_RotateDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int dots, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRotateDots(c0, radius, thickness, ImColor(color), speed, dots, mode);
		bbMemFree(c0);
	}

	void ImSpinner_OrionDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int arcs) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerOrionDots(c0, radius, thickness, ImColor(color), speed, arcs);
		bbMemFree(c0);
	}

	void ImSpinner_GalaxyDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int arcs) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerGalaxyDots(c0, radius, thickness, ImColor(color), speed, arcs);
		bbMemFree(c0);
	}

	void ImSpinner_TwinAng(BBString * label, float radius1, float radius2, float thickness, ImU32 color1, ImU32 color2, float speed, float angle, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color1);
		ImColor col1 = ImColor(color2);
		ImSpinner::SpinnerTwinAng(c0, radius1, radius2, thickness, ImColor(color1), ImColor(color2), speed, degToRad(angle), mode);
		bbMemFree(c0);
	}

	void ImSpinner_Filling(BBString * label, float radius, float thickness, ImU32 color1, ImU32 color2, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color1);
		ImColor col1 = ImColor(color2);
		ImSpinner::SpinnerFilling(c0, radius, thickness, ImColor(color1), ImColor(color2), speed);
		bbMemFree(c0);
	}

	void ImSpinner_FillingMem(BBString * label, float radius, float thickness, ImU32 color, ImU32 colorbg, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(colorbg);
		ImSpinner::SpinnerFillingMem(c0, radius, thickness, col0, col1, speed);
		bbMemFree(c0);
	}

	void ImSpinner_Topup(BBString * label, float radius1, float radius2, ImU32 color, ImU32 fg, ImU32 bg, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(fg);
		ImColor col2 = ImColor(bg);
		ImSpinner::SpinnerTopup(c0, radius1, radius2, ImColor(color), ImColor(fg), ImColor(bg), speed);
		bbMemFree(c0);
	}

	void ImSpinner_TwinAng180(BBString * label, float radius1, float radius2, float thickness, ImU32 color1, ImU32 color2, float speed, float angle, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color1);
		ImColor col1 = ImColor(color2);
		ImSpinner::SpinnerTwinAng180(c0, radius1, radius2, thickness, ImColor(color1), ImColor(color2), speed, degToRad(angle), mode);
		bbMemFree(c0);
	}

	void ImSpinner_TwinAng360(BBString * label, float radius1, float radius2, float thickness, ImU32 color1, ImU32 color2, float speed1, float speed2, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color1);
		ImColor col1 = ImColor(color2);
		ImSpinner::SpinnerTwinAng360(c0, radius1, radius2, thickness, ImColor(color1), ImColor(color2), speed1, speed2, mode);
		bbMemFree(c0);
	}

	void ImSpinner_IncDots(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t dots) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerIncDots(c0, radius, thickness, ImColor(color), speed, dots);
		bbMemFree(c0);
	}

	void ImSpinner_IncFullDots(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t dots) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerIncFullDots(c0, radius, thickness, ImColor(color), speed, dots);
		bbMemFree(c0);
	}

	void ImSpinner_FadeBars(BBString * label, float w, ImU32 color, float speed, size_t bars, int scale) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerFadeBars(c0, w, ImColor(color), speed, bars, (bool)scale);
		bbMemFree(c0);
	}

	void ImSpinner_FadeTris(BBString * label, float radius, ImU32 color, float speed, size_t dim, int scale, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerFadeTris(c0, radius, ImColor(color), speed, dim, (bool)scale, mode);
		bbMemFree(c0);
	}

	void ImSpinner_BarsRotateFade(BBString * label, float rmin, float rmax, float thickness, ImU32 color, float speed, size_t bars) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerBarsRotateFade(c0, rmin, rmax, thickness, ImColor(color), speed, bars);
		bbMemFree(c0);
	}

	void ImSpinner_BarsScaleMiddle(BBString * label, float w, ImU32 color, float speed, size_t bars) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerBarsScaleMiddle(c0, w, ImColor(color), speed, bars);
		bbMemFree(c0);
	}

	void ImSpinner_AngTwin(BBString * label, float radius1, float radius2, float thickness, ImU32 color, ImU32 bg, float speed, float angle, size_t arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerAngTwin(c0, radius1, radius2, thickness, ImColor(color), ImColor(bg), speed, degToRad(angle), arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_ArcRotation(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerArcRotation(c0, radius, thickness, ImColor(color), speed, arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_ArcFade(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerArcFade(c0, radius, thickness, ImColor(color), speed, arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_SimpleArcFade(BBString * label, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSimpleArcFade(c0, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
	}

	void ImSpinner_SquareStrokeFade(BBString * label, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSquareStrokeFade(c0, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
	}

	void ImSpinner_AsciiSymbolPoints(BBString * label, BBString * text, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		char* c1 = (char*)bbStringToUTF8String(text);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerAsciiSymbolPoints(c0, c1, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
		bbMemFree(c1);
	}

	void ImSpinner_TextFading(BBString * label, BBString * text, float radius, float fsize, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		char* c1 = (char*)bbStringToUTF8String(text);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerTextFading(c0, c1, radius, fsize, ImColor(color), speed);
		bbMemFree(c0);
		bbMemFree(c1);
	}

	void ImSpinner_SevenSegments(BBString * label, BBString * text, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		char* c1 = (char*)bbStringToUTF8String(text);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSevenSegments(c0, c1, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
		bbMemFree(c1);
	}

	void ImSpinner_SquareStrokeFill(BBString * label, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSquareStrokeFill(c0, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
	}

	void ImSpinner_SquareStrokeLoading(BBString * label, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSquareStrokeLoading(c0, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
	}

	void ImSpinner_SquareLoading(BBString * label, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSquareLoading(c0, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
	}

	void ImSpinner_FilledArcFade(BBString * label, float radius, ImU32 color, float speed, size_t arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerFilledArcFade(c0, radius, ImColor(color), speed, arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_PointsRoller(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t points, int circles, float rspeed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerPointsRoller(c0, radius, thickness, ImColor(color), speed, points, circles, rspeed);
		bbMemFree(c0);
	}

	void ImSpinner_PointsArcBounce(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t points, int circles, float rspeed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerPointsArcBounce(c0, radius, thickness, ImColor(color), speed, points, circles, rspeed);
		bbMemFree(c0);
	}

	void ImSpinner_FilledArcColor(BBString * label, float radius, ImU32 color, ImU32 bg, float speed, size_t arcs) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerFilledArcColor(c0, radius, ImColor(color), ImColor(bg), speed, arcs);
		bbMemFree(c0);
	}

	void ImSpinner_FilledArcRing(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, size_t arcs) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerFilledArcRing(c0, radius, thickness, ImColor(color), ImColor(bg), speed, arcs);
		bbMemFree(c0);
	}

	void ImSpinner_ArcWedges(BBString * label, float radius, ImU32 color, float speed, size_t arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerArcWedges(c0, radius, ImColor(color), speed, arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_TwinBall(BBString * label, float radius1, float radius2, float thickness, float b_thickness, ImU32 ball, ImU32 bg, float speed, size_t balls, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(ball);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerTwinBall(c0, radius1, radius2, thickness, b_thickness, ImColor(ball), ImColor(bg), speed, balls, mode);
		bbMemFree(c0);
	}

	void ImSpinner_SolarBalls(BBString * label, float radius, float thickness, ImU32 ball, ImU32 bg, float speed, size_t balls) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(ball);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerSolarBalls(c0, radius, thickness, ImColor(ball), ImColor(bg), speed, balls);
		bbMemFree(c0);
	}

	void ImSpinner_SolarScaleBalls(BBString * label, float radius, float thickness, ImU32 ball, float speed, size_t balls) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(ball);
		ImSpinner::SpinnerSolarScaleBalls(c0, radius, thickness, ImColor(ball), speed, balls);
		bbMemFree(c0);
	}

	void ImSpinner_SolarArcs(BBString * label, float radius, float thickness, ImU32 ball, ImU32 bg, float speed, size_t balls) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(ball);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerSolarArcs(c0, radius, thickness, ImColor(ball), ImColor(bg), speed, balls);
		bbMemFree(c0);
	}

	void ImSpinner_MovingArcs(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t arcs) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerMovingArcs(c0, radius, thickness, ImColor(color), speed, arcs);
		bbMemFree(c0);
	}

	void ImSpinner_RainbowCircle(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t arcs, float mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRainbowCircle(c0, radius, thickness, ImColor(color), speed, arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_BounceBall(BBString * label, float radius, float thickness, ImU32 color, float speed, int dots, int shadow) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerBounceBall(c0, radius, thickness, ImColor(color), speed, dots, (bool)shadow);
		bbMemFree(c0);
	}

	void ImSpinner_PulsarBall(BBString * label, float radius, float thickness, ImU32 color, float speed, int shadow, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerPulsarBall(c0, radius, thickness, ImColor(color), speed, (bool)shadow, mode);
		bbMemFree(c0);
	}

	void ImSpinner_IncScaleDots(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t dots, float angle, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerIncScaleDots(c0, radius, thickness, ImColor(color), speed, dots, degToRad(angle), mode);
		bbMemFree(c0);
	}

	void ImSpinner_SomeScaleDots(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t dots, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSomeScaleDots(c0, radius, thickness, ImColor(color), speed, dots, mode);
		bbMemFree(c0);
	}

	void ImSpinner_AngTriple(BBString * label, float radius1, float radius2, float radius3, float thickness, ImU32 c1, ImU32 c2, ImU32 c3, float speed, float angle) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(c1);
		ImColor col1 = ImColor(c2);
		ImColor col2 = ImColor(c3);
		ImSpinner::SpinnerAngTriple(c0, radius1, radius2, radius3, thickness, ImColor(c1), ImColor(c2), ImColor(c3), speed, degToRad(angle));
		bbMemFree(c0);
	}

	void ImSpinner_AngEclipse(BBString * label, float radius, float thickness, ImU32 color, float speed, float angle) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerAngEclipse(c0, radius, thickness, ImColor(color), speed, degToRad(angle));
		bbMemFree(c0);
	}

	void ImSpinner_IngYang(BBString * label, float radius, float thickness, int reverse, float yang_detlta_r, ImU32 colorI, ImU32 colorY, float speed, float angle, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(colorI);
		ImColor col1 = ImColor(colorY);
		ImSpinner::SpinnerIngYang(c0, radius, thickness, (bool)reverse, yang_detlta_r, ImColor(colorI), ImColor(colorY), speed, degToRad(angle), mode);
		bbMemFree(c0);
	}

	void ImSpinner_GooeyBalls(BBString * label, float radius, ImU32 color, float speed, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerGooeyBalls(c0, radius, col0, speed, mode);
		bbMemFree(c0);
	}

	void ImSpinner_DotsLoading(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerDotsLoading(c0, radius, thickness, col0, col1, speed);
		bbMemFree(c0);
	}

	void ImSpinner_RotateGooeyBalls(BBString * label, float radius, float thickness, ImU32 color, float speed, int balls, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRotateGooeyBalls(c0, radius, thickness, col0, speed, balls, mode);
		bbMemFree(c0);
	}

	void ImSpinner_HerbertBalls(BBString * label, float radius, float thickness, ImU32 color, float speed, int balls) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerHerbertBalls(c0, radius, thickness, col0, speed, balls);
		bbMemFree(c0);
	}

	void ImSpinner_HerbertBalls3D(BBString * label, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerHerbertBalls3D(c0, radius, thickness, col0, speed);
		bbMemFree(c0);
	}

	void ImSpinner_RotateTriangles(BBString * label, float radius, float thickness, ImU32 color, float speed, int tris, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRotateTriangles(c0, radius, thickness, col0, speed, tris, mode);
		bbMemFree(c0);
	}

	void ImSpinner_RotateShapes(BBString * label, float radius, float thickness, ImU32 color, float speed, int shapes, int pnt) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRotateShapes(c0, radius, thickness, col0, speed, shapes, pnt);
		bbMemFree(c0);
	}

	void ImSpinner_SinSquares(BBString * label, float radius, float thickness, ImU32 color, float speed, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSinSquares(c0, radius, thickness, col0, speed, mode);
		bbMemFree(c0);
	}

	void ImSpinner_MoonLine(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, float angle) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerMoonLine(c0, radius, thickness, ImColor(color), ImColor(bg), speed, degToRad(angle));
		bbMemFree(c0);
	}

	void ImSpinner_CircleDrop(BBString * label, float radius, float thickness, float thickness_drop, ImU32 color, ImU32 bg, float speed, float angle) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerCircleDrop(c0, radius, thickness, thickness_drop, ImColor(color), ImColor(bg), speed, degToRad(angle));
		bbMemFree(c0);
	}

	void ImSpinner_SurroundedIndicator(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerSurroundedIndicator(c0, radius, thickness, ImColor(color), ImColor(bg), speed);
		bbMemFree(c0);
	}

	void ImSpinner_WifiIndicator(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, float cangle, int dots) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerWifiIndicator(c0, radius, thickness, ImColor(color), ImColor(bg), speed, degToRad(cangle), dots);
		bbMemFree(c0);
	}

	void ImSpinner_TrianglesSelector(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, size_t bars) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerTrianglesSelector(c0, radius, thickness, ImColor(color), ImColor(bg), speed, bars);
		bbMemFree(c0);
	}

	void ImSpinner_Camera(BBString * label, float radius, float thickness, LeafColorFuncEx leaf_color, void* userData, float speed, size_t bars, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		LeafColorContext ctx { leaf_color, userData };
		LeafColorContext* prev = g_leaf_ctx;
		g_leaf_ctx = &ctx;
		ImSpinner::SpinnerCamera(c0, radius, thickness, LeafColorThunk, speed, bars, mode);
		bbMemFree(c0);
	}

	void ImSpinner_FlowingGradient(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, float angle) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerFlowingGradient(c0, radius, thickness, ImColor(color), ImColor(bg), speed, degToRad(angle));
		bbMemFree(c0);
	}

	void ImSpinner_RotateSegments(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t arcs, size_t layers, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRotateSegments(c0, radius, thickness, ImColor(color), speed, arcs, layers, mode);
		bbMemFree(c0);
	}

	void ImSpinner_Lemniscate(BBString * label, float radius, float thickness, ImU32 color, float speed, float angle) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerLemniscate(c0, radius, thickness, ImColor(color), speed, degToRad(angle));
		bbMemFree(c0);
	}

	void ImSpinner_RotateGear(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t pins) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRotateGear(c0, radius, thickness, ImColor(color), speed, pins);
		bbMemFree(c0);
	}

	void ImSpinner_RotateWheel(BBString * label, float radius, float thickness, ImU32 bg_color, ImU32 color, float speed, size_t pins) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(bg_color);
		ImColor col1 = ImColor(color);
		ImSpinner::SpinnerRotateWheel(c0, radius, thickness, ImColor(bg_color), ImColor(color), speed, pins);
		bbMemFree(c0);
	}

	void ImSpinner_Atom(BBString * label, float radius, float thickness, ImU32 color, float speed, int elipses) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerAtom(c0, radius, thickness, ImColor(color), speed, elipses);
		bbMemFree(c0);
	}

	void ImSpinner_PatternRings(BBString * label, float radius, float thickness, ImU32 color, float speed, int elipses) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerPatternRings(c0, radius, thickness, ImColor(color), speed, elipses);
		bbMemFree(c0);
	}

	void ImSpinner_PatternEclipse(BBString * label, float radius, float thickness, ImU32 color, float speed, int elipses, float delta_a, float delta_y) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerPatternEclipse(c0, radius, thickness, ImColor(color), speed, elipses, delta_a, delta_y);
		bbMemFree(c0);
	}

	void ImSpinner_PatternSphere(BBString * label, float radius, float thickness, ImU32 color, float speed, int elipses) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerPatternSphere(c0, radius, thickness, ImColor(color), speed, elipses);
		bbMemFree(c0);
	}

	void ImSpinner_RingSynchronous(BBString * label, float radius, float thickness, ImU32 color, float speed, int elipses) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRingSynchronous(c0, radius, thickness, ImColor(color), speed, elipses);
		bbMemFree(c0);
	}

	void ImSpinner_RingWatermarks(BBString * label, float radius, float thickness, ImU32 color, float speed, int elipses) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRingWatermarks(c0, radius, thickness, ImColor(color), speed, elipses);
		bbMemFree(c0);
	}

	void ImSpinner_RotatedAtom(BBString * label, float radius, float thickness, ImU32 color, float speed, int elipses, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRotatedAtom(c0, radius, thickness, ImColor(color), speed, elipses, mode);
		bbMemFree(c0);
	}

	void ImSpinner_RainbowBalls(BBString * label, float radius, float thickness, ImU32 color, float speed, int balls, int mode, int rings, int mx) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRainbowBalls(c0, radius, thickness, col0, speed, balls, mode, rings, mx);
		bbMemFree(c0);
	}

	void ImSpinner_RainbowShot(BBString * label, float radius, float thickness, ImU32 color, float speed, int balls, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRainbowShot(c0, radius, thickness, col0, speed, balls, mode);
		bbMemFree(c0);
	}

	void ImSpinner_Spiral(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t arcs) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSpiral(c0, radius, thickness, ImColor(color), speed, arcs);
		bbMemFree(c0);
	}

	void ImSpinner_SpiralEye(BBString * label, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSpiralEye(c0, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
	}

	void ImSpinner_BarChartSine(BBString * label, float radius, float thickness, ImU32 color, float speed, int bars, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerBarChartSine(c0, radius, thickness, col0, speed, bars, mode);
		bbMemFree(c0);
	}

	void ImSpinner_BarChartAdvSine(BBString * label, float radius, float thickness, ImU32 color, float speed, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerBarChartAdvSine(c0, radius, thickness, col0, speed, mode);
		bbMemFree(c0);
	}

	void ImSpinner_BarChartAdvSineFade(BBString * label, float radius, float thickness, ImU32 color, float speed, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerBarChartAdvSineFade(c0, radius, thickness, col0, speed, mode);
		bbMemFree(c0);
	}

	void ImSpinner_BarChartRainbow(BBString * label, float radius, float thickness, ImU32 color, float speed, int bars, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerBarChartRainbow(c0, radius, thickness, col0, speed, bars, mode);
		bbMemFree(c0);
	}

	void ImSpinner_Blocks(BBString * label, float radius, float thickness, ImU32 bg, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(bg);
		ImColor col1 = ImColor(color);
		ImSpinner::SpinnerBlocks(c0, radius, thickness, col0, col1, speed);
		bbMemFree(c0);
	}

	void ImSpinner_TwinBlocks(BBString * label, float radius, float thickness, ImU32 bg, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(bg);
		ImColor col1 = ImColor(color);
		ImSpinner::SpinnerTwinBlocks(c0, radius, thickness, col0, col1, speed);
		bbMemFree(c0);
	}

	void ImSpinner_SquareRandomDots(BBString * label, float radius, float thickness, ImU32 bg, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(bg);
		ImColor col1 = ImColor(color);
		ImSpinner::SpinnerSquareRandomDots(c0, radius, thickness, col0, col1, speed);
		bbMemFree(c0);
	}

	void ImSpinner_ScaleBlocks(BBString * label, float radius, float thickness, ImU32 color, float speed, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerScaleBlocks(c0, radius, thickness, col0, speed, mode);
		bbMemFree(c0);
	}

	void ImSpinner_ScaleSquares(BBString * label, float radius, float thikness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerScaleSquares(c0, radius, thikness, col0, speed);
		bbMemFree(c0);
	}

	void ImSpinner_SquishSquare(BBString * label, float radius, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSquishSquare(c0, radius, col0, speed);
		bbMemFree(c0);
	}

	void ImSpinner_Fluid(BBString * label, float radius, ImU32 color, float speed, int bars) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerFluid(c0, radius, col0, speed, bars);
		bbMemFree(c0);
	}

	void ImSpinner_FluidPoints(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t dots, float delta) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerFluidPoints(c0, radius, thickness, col0, speed, dots, delta);
		bbMemFree(c0);
	}

	void ImSpinner_ArcPolarFade(BBString * label, float radius, ImU32 color, float speed, size_t arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerArcPolarFade(c0, radius, ImColor(color), speed, arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_ArcPolarRadius(BBString * label, float radius, ImU32 color, float speed, size_t arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerArcPolarRadius(c0, radius, ImColor(color), speed, arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_Caleidoscope(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t arcs, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerCaleidoscope(c0, radius, thickness, ImColor(color), speed, arcs, mode);
		bbMemFree(c0);
	}

	void ImSpinner_HboDots(BBString * label, float radius, float thickness, ImU32 color, float minfade, float ryk, float speed, size_t dots, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerHboDots(c0, radius, thickness, ImColor(color), minfade, ryk, speed, dots, mode);
		bbMemFree(c0);
	}

	void ImSpinner_MoonDots(BBString * label, float radius, float thickness, ImU32 first, ImU32 second, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(first);
		ImColor col1 = ImColor(second);
		ImSpinner::SpinnerMoonDots(c0, radius, thickness, col0, col1, speed);
		bbMemFree(c0);
	}

	void ImSpinner_TwinHboDots(BBString * label, float radius, float thickness, ImU32 color, float minfade, float ryk, float speed, size_t dots, float delta) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerTwinHboDots(c0, radius, thickness, ImColor(color), minfade, ryk, speed, dots, delta);
		bbMemFree(c0);
	}

	void ImSpinner_ThreeDotsStar(BBString * label, float radius, float thickness, ImU32 color, float minfade, float ryk, float speed, float delta) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerThreeDotsStar(c0, radius, thickness, ImColor(color), minfade, ryk, speed, delta);
		bbMemFree(c0);
	}

	void ImSpinner_SineArcs(BBString * label, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSineArcs(c0, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
	}

	void ImSpinner_TrianglesShift(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, size_t bars) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerTrianglesShift(c0, radius, thickness, ImColor(color), ImColor(bg), speed, bars);
		bbMemFree(c0);
	}

	void ImSpinner_PointsShift(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, size_t bars) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerPointsShift(c0, radius, thickness, ImColor(color), ImColor(bg), speed, bars);
		bbMemFree(c0);
	}

	void ImSpinner_SwingDots(BBString * label, float radius, float thickness, ImU32 color, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerSwingDots(c0, radius, thickness, ImColor(color), speed);
		bbMemFree(c0);
	}

	void ImSpinner_CircularPoints(BBString * label, float radius, float thickness, ImU32 color, float speed, int lines) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerCircularPoints(c0, radius, thickness, ImColor(color), speed, lines);
		bbMemFree(c0);
	}

	void ImSpinner_CurvedCircle(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t circles) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerCurvedCircle(c0, radius, thickness, ImColor(color), speed, circles);
		bbMemFree(c0);
	}

	void ImSpinner_ModCircle(BBString * label, float radius, float thickness, ImU32 color, float ang_min, float ang_max, float speed) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerModCircle(c0, radius, thickness, ImColor(color), degToRad(ang_min), degToRad(ang_max), speed);
		bbMemFree(c0);
	}

	void ImSpinner_DnaDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int lt, float delta, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerDnaDots(c0, radius, thickness, ImColor(color), speed, lt, delta, (bool)mode);
		bbMemFree(c0);
	}

	void ImSpinner_3SmuggleDots(BBString * label, float radius, float thickness, ImU32 color, float speed, int lt, float delta, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::Spinner3SmuggleDots(c0, radius, thickness, ImColor(color), speed, lt, delta, (bool)mode);
		bbMemFree(c0);
	}

	void ImSpinner_RotateSegmentsPulsar(BBString * label, float radius, float thickness, ImU32 color, float speed, size_t arcs, size_t layers) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImSpinner::SpinnerRotateSegmentsPulsar(c0, radius, thickness, ImColor(color), speed, arcs, layers);
		bbMemFree(c0);
	}

	void ImSpinner_SplineAng(BBString * label, float radius, float thickness, ImU32 color, ImU32 bg, float speed, float angle, int mode) {
		char* c0 = (char*)bbStringToUTF8String(label);
		ImColor col0 = ImColor(color);
		ImColor col1 = ImColor(bg);
		ImSpinner::SpinnerSplineAng(c0, radius, thickness, ImColor(color), ImColor(bg), speed, degToRad(angle), mode);
		bbMemFree(c0);
	}

} // extern "C"
