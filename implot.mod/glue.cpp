/*
Copyright (c) 2025-2026 Bruce A Henderson

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
#include "implot.h"
#include "brl.mod/blitz.mod/blitz.h"

typedef signed char         ImS8;   // 8-bit signed integer
typedef unsigned char       ImU8;   // 8-bit unsigned integer
typedef signed short        ImS16;  // 16-bit signed integer
typedef unsigned short      ImU16;  // 16-bit unsigned integer
typedef signed int          ImS32;  // 32-bit signed integer == int
typedef unsigned int        ImU32;  // 32-bit unsigned integer (often used to store packed colors)
typedef signed   long long  ImS64;  // 64-bit signed integer
typedef unsigned long long  ImU64;  // 64-bit unsigned integer

// begin extern "C" {
extern "C" {

void ImPlot_ShowDemoWindow(int * open) {
    bool op = *open;
    ImPlot::ShowDemoWindow(&op);
    *open = op;
}

///////////////////////////////////////////////////////////

ImPlotContext * ImPlot_CreateContext() {
    return ImPlot::CreateContext();
}

void ImPlot_DestroyContext(ImPlotContext * ctx) {
    ImPlot::DestroyContext(ctx);
}

void ImPlot_SetCurrentContext(ImPlotContext * ctx) {
    ImPlot::SetCurrentContext(ctx);
}

ImPlotContext * ImPlot_GetCurrentContext() {
    return ImPlot::GetCurrentContext();
}

///////////////////////////////////////////////////////////

typedef struct MaxVec2 {
    float x, y;
} MaxVec2;

typedef struct MaxVec4 {
    float x, y, z, w;
} MaxVec4;

typedef struct MaxPlotPoint {
    double x, y;
} MaxPlotPoint;

typedef struct MaxPlotRange {
    double min, max;
} MaxPlotRange;

typedef struct MaxPlotRect {
    MaxPlotRange x, y;
} MaxPlotRect;

static inline MaxVec2 ConvertFromCPP_MaxVec2(const ::ImVec2& src)
{
    MaxVec2 dest;
    dest.x = src.x;
    dest.y = src.y;
    return dest;
}

static inline ::ImVec2 ConvertToCPP_MaxVec2(const MaxVec2& src)
{
    ::ImVec2 dest;
    dest.x = src.x;
    dest.y = src.y;
    return dest;
}

static inline MaxVec4 ConvertFromCPP_MaxVec4(const ::ImVec4& src)
{
    MaxVec4 dest;
    dest.x = src.x;
    dest.y = src.y;
    dest.z = src.z;
    dest.w = src.w;
    return dest;
}

static inline ::ImVec4 ConvertToCPP_MaxVec4(const MaxVec4& src)
{
    ::ImVec4 dest;
    dest.x = src.x;
    dest.y = src.y;
    dest.z = src.z;
    dest.w = src.w;
    return dest;
}

static inline MaxPlotPoint ConvertFromCPP_MaxPlotPoint(const ImPlotPoint& src)
{
    MaxPlotPoint dest;
    dest.x = src.x;
    dest.y = src.y;
    return dest;
}

static inline ::ImPlotPoint ConvertToCPP_MaxPlotPoint(const MaxPlotPoint& src)
{
    ::ImPlotPoint dest;
    dest.x = src.x;
    dest.y = src.y;
    return dest;
}

static inline MaxPlotRange ConvertFromCPP_MaxPlotRange(const ImPlotRange& src)
{
    MaxPlotRange dest;
    dest.min = src.Min;
    dest.max = src.Max;
    return dest;
}

static inline ::ImPlotRange ConvertToCPP_MaxPlotRange(const MaxPlotRange& src)
{
    ::ImPlotRange dest;
    dest.Min = src.min;
    dest.Max = src.max;
    return dest;
}

static inline MaxPlotRect ConvertFromCPP_MaxPlotRect(const ImPlotRect& src)
{
    MaxPlotRect dest;
    dest.x = ConvertFromCPP_MaxPlotRange(src.X);
    dest.y = ConvertFromCPP_MaxPlotRange(src.Y);
    return dest;
}

static inline ::ImPlotRect ConvertToCPP_MaxPlotRect(const MaxPlotRect& src)
{
    ::ImPlotRect dest;
    dest.X = ConvertToCPP_MaxPlotRange(src.x);
    dest.Y = ConvertToCPP_MaxPlotRange(src.y);
    return dest;
}

///////////////////////////////////////////////////////////

int ImPlot_BeginPlotSize(BBString * title_id, MaxVec2 size, ImPlotFlags flags) {
    const char * v0 = (const char *)bbStringToUTF8String(title_id);
    int result = ImPlot::BeginPlot(v0, ConvertToCPP_MaxVec2(size), flags);
    bbMemFree((void*)v0);
    return result;
}

int ImPlot_BeginPlot(BBString * title_id, ImPlotFlags flags) {
    return ImPlot_BeginPlotSize(title_id, {-1, 0}, flags);
}

void ImPlot_EndPlot() {
    ImPlot::EndPlot();
}

///////////////////////////////////////////////////////////

int ImPlot_BeginSubplots(BBString * title_id, int rows, int cols, MaxVec2 size, ImPlotSubplotFlags flags, float * row_ratios, float * col_ratios) {
    const char * v0 = (const char *)bbStringToUTF8String(title_id);
    int result = ImPlot::BeginSubplots(v0, rows, cols, ConvertToCPP_MaxVec2(size), flags, row_ratios, col_ratios);
    bbMemFree((void*)v0);
    return result;
}

void ImPlot_EndSubplots() {
    ImPlot::EndSubplots();
}

///////////////////////////////////////////////////////////

void ImPlot_SetupAxis(ImAxis axis, BBString * label, ImPlotAxisFlags flags) {
    const char * v0;
    if ( label == &bbEmptyString ) {
        v0 = nullptr;
    } else {
        v0 = (const char *)bbStringToUTF8String(label);
    }
    ImPlot::SetupAxis(axis, v0, flags);
    bbMemFree((void*)v0);
}

void ImPlot_SetupAxisLimits(ImAxis axis, double v_min, double v_max, ImPlotCond cond) {
    ImPlot::SetupAxisLimits(axis, v_min, v_max, cond);
}

void ImPlot_SetupAxisLinks(ImAxis axis, double * link_min, double * link_max) {
    ImPlot::SetupAxisLinks(axis, link_min, link_max);
}

void ImPlot_SetupAxisFormat(ImAxis axis, BBString * fmt) {
    const char * v0;
    if ( fmt == &bbEmptyString ) {
        v0 = nullptr;
    } else {
        v0 = (const char *)bbStringToUTF8String(fmt);
    }
    ImPlot::SetupAxisFormat(axis, v0);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

typedef struct MaxPlotSpec {
    MaxVec4 lineColor;
    float lineWeight;
    MaxVec4 fillColor;
    float fillAlpha;
    ImPlotMarker marker;
    float markerSize;
    MaxVec4 markerLineColor;
    MaxVec4 markerFillColor;
    float size;
    int offset;
    int stride;
    ImPlotItemFlags flags;
} MaxPlotSpec;

static inline ::ImPlotSpec ConvertToCPP_MaxPlotSpec(const MaxPlotSpec& src)
{
    ::ImPlotSpec dest;
    dest.LineColor = ConvertToCPP_MaxVec4(src.lineColor);
    dest.LineWeight = src.lineWeight;
    dest.FillColor = ConvertToCPP_MaxVec4(src.fillColor);
    dest.FillAlpha = src.fillAlpha;
    dest.Marker = src.marker;
    dest.MarkerSize = src.markerSize;
    dest.MarkerLineColor = ConvertToCPP_MaxVec4(src.markerLineColor);
    dest.MarkerFillColor = ConvertToCPP_MaxVec4(src.markerFillColor);
    dest.Size = src.size;
    dest.Offset = src.offset;
    dest.Stride = src.stride;
    dest.Flags = src.flags;
    return dest;
}

// float
void ImPlot_PlotLineFloat(BBString * label, float * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineFloat_Spec(BBString * label, float * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYFloat(BBString * label, float * xs, float * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYFloat_Spec(BBString * label, float * xs, float * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// double
void ImPlot_PlotLineDouble(BBString * label, double * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineDouble_Spec(BBString * label, double * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYDouble(BBString * label, double * xs, double * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYDouble_Spec(BBString * label, double * xs, double * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// byte
void ImPlot_PlotLineByte(BBString * label, ImU8 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineByte_Spec(BBString * label, ImU8 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYByte(BBString * label, ImU8 * xs, ImU8 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// short
void ImPlot_PlotLineShort(BBString * label, ImU16 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineShort_Spec(BBString * label, ImU16 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYShort(BBString * label, ImU16 * xs, ImU16 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// int
void ImPlot_PlotLineInt(BBString * label, ImS32 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineInt_Spec(BBString * label, ImS32 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYInt(BBString * label, ImS32 * xs, ImS32 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// long
void ImPlot_PlotLineLong(BBString * label, ImS64 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineLong_Spec(BBString * label, ImS64 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYLong(BBString * label, ImS64 * xs, ImS64 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// uint
void ImPlot_PlotLineUInt(BBString * label, ImU32 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineUInt_Spec(BBString * label, ImU32 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYUInt(BBString * label, ImU32 * xs, ImU32 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// ulong
void ImPlot_PlotLineULong(BBString * label, ImU64 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineULong_Spec(BBString * label, ImU64 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYULong(BBString * label, ImU64 * xs, ImU64 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotLine(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotLineXYULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotLine(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

// float
void ImPlot_PlotScatterFloat(BBString * label, float * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterFloat_Spec(BBString * label, float * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYFloat(BBString * label, float * xs, float * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYFloat_Spec(BBString * label, float * xs, float * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// double
void ImPlot_PlotScatterDouble(BBString * label, double * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterDouble_Spec(BBString * label, double * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYDouble(BBString * label, double * xs, double * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYDouble_Spec(BBString * label, double * xs, double * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// byte
void ImPlot_PlotScatterByte(BBString * label, ImU8 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterByte_Spec(BBString * label, ImU8 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYByte(BBString * label, ImU8 * xs, ImU8 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// short
void ImPlot_PlotScatterShort(BBString * label, ImU16 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterShort_Spec(BBString * label, ImU16 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYShort(BBString * label, ImU16 * xs, ImU16 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// int
void ImPlot_PlotScatterInt(BBString * label, ImS32 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterInt_Spec(BBString * label, ImS32 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYInt(BBString * label, ImS32 * xs, ImS32 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// long
void ImPlot_PlotScatterLong(BBString * label, ImS64 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterLong_Spec(BBString * label, ImS64 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYLong(BBString * label, ImS64 * xs, ImS64 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// uint
void ImPlot_PlotScatterUInt(BBString * label, ImU32 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterUInt_Spec(BBString * label, ImU32 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYUInt(BBString * label, ImU32 * xs, ImU32 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// ulong
void ImPlot_PlotScatterULong(BBString * label, ImU64 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterULong_Spec(BBString * label, ImU64 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYULong(BBString * label, ImU64 * xs, ImU64 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotScatter(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotScatterXYULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotScatter(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

// float
void ImPlot_PlotStairsFloat(BBString * label, float * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsFloat_Spec(BBString * label, float * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYFloat(BBString * label, float * xs, float * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYFloat_Spec(BBString * label, float * xs, float * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// double
void ImPlot_PlotStairsDouble(BBString * label, double * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsDouble_Spec(BBString * label, double * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYDouble(BBString * label, double * xs, double * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYDouble_Spec(BBString * label, double * xs, double * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// byte
void ImPlot_PlotStairsByte(BBString * label, ImU8 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsByte_Spec(BBString * label, ImU8 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYByte(BBString * label, ImU8 * xs, ImU8 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// short
void ImPlot_PlotStairsShort(BBString * label, ImU16 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsShort_Spec(BBString * label, ImU16 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYShort(BBString * label, ImU16 * xs, ImU16 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// int
void ImPlot_PlotStairsInt(BBString * label, ImS32 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsInt_Spec(BBString * label, ImS32 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYInt(BBString * label, ImS32 * xs, ImS32 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// long
void ImPlot_PlotStairsLong(BBString * label, ImS64 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsLong_Spec(BBString * label, ImS64 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYLong(BBString * label, ImS64 * xs, ImS64 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// uint
void ImPlot_PlotStairsUInt(BBString * label, ImU32 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsUInt_Spec(BBString * label, ImU32 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYUInt(BBString * label, ImU32 * xs, ImU32 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// ulong
void ImPlot_PlotStairsULong(BBString * label, ImU64 * values, int count, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsULong_Spec(BBString * label, ImU64 * values, int count, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, values, count, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYULong(BBString * label, ImU64 * xs, ImU64 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStairs(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStairsXYULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStairs(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

// float
void ImPlot_PlotShadedFloat(BBString * label, float * values, int count, double yref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedFloat_Spec(BBString * label, float * values, int count, double yref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYFloat(BBString * label, float * xs, float * ys, int count, double yref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys, count, yref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYFloat_Spec(BBString * label, float * xs, float * ys, int count, double yref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys, count, yref, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYFloat(BBString * label, float * xs, float * ys1, float * ys2, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYFloat_Spec(BBString * label, float * xs, float * ys1, float * ys2, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count, cppSpec);
    bbMemFree((void*)v0);
}

// double
void ImPlot_PlotShadedDouble(BBString * label, double * values, int count, double yref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedDouble_Spec(BBString * label, double * values, int count, double yref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYDouble(BBString * label, double * xs, double * ys, int count, double yref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys, count, yref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYDouble_Spec(BBString * label, double * xs, double * ys, int count, double yref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys, count, yref, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYDouble(BBString * label, double * xs, double * ys1, double * ys2, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYDouble_Spec(BBString * label, double * xs, double * ys1, double * ys2, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count, cppSpec);
    bbMemFree((void*)v0);
}

// byte
void ImPlot_PlotShadedByte(BBString * label, ImU8 * values, int count, double yref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedByte_Spec(BBString * label, ImU8 * values, int count, double yref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYByte(BBString * label, ImU8 * xs, ImU8 * ys, int count, double yref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys, count, yref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys, int count, double yref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys, count, yref, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYByte(BBString * label, ImU8 * xs, ImU8 * ys1, ImU8 * ys2, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys1, ImU8 * ys2, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count, cppSpec);
    bbMemFree((void*)v0);
}

// short
void ImPlot_PlotShadedShort(BBString * label, ImU16 * values, int count, double yref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedShort_Spec(BBString * label, ImU16 * values, int count, double yref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYShort(BBString * label, ImU16 * xs, ImU16 * ys, int count, double yref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys, count, yref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys, int count, double yref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys, count, yref, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYShort(BBString * label, ImU16 * xs, ImU16 * ys1, ImU16 * ys2, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys1, ImU16 * ys2, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count, cppSpec);
    bbMemFree((void*)v0);
}

// int
void ImPlot_PlotShadedInt(BBString * label, ImS32 * values, int count, double yref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedInt_Spec(BBString * label, ImS32 * values, int count, double yref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYInt(BBString * label, ImS32 * xs, ImS32 * ys, int count, double yref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys, count, yref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys, int count, double yref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys, count, yref, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYInt(BBString * label, ImS32 * xs, ImS32 * ys1, ImS32 * ys2, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys1, ImS32 * ys2, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count, cppSpec);
    bbMemFree((void*)v0);
}

// long
void ImPlot_PlotShadedLong(BBString * label, ImS64 * values, int count, double yref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedLong_Spec(BBString * label, ImS64 * values, int count, double yref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYLong(BBString * label, ImS64 * xs, ImS64 * ys, int count, double yref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys, count, yref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys, int count, double yref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys, count, yref, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYLong(BBString * label, ImS64 * xs, ImS64 * ys1, ImS64 * ys2, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys1, ImS64 * ys2, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count, cppSpec);
    bbMemFree((void*)v0);
}

// uint
void ImPlot_PlotShadedUInt(BBString * label, ImU32 * values, int count, double yref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedUInt_Spec(BBString * label, ImU32 * values, int count, double yref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYUInt(BBString * label, ImU32 * xs, ImU32 * ys, int count, double yref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys, count, yref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys, int count, double yref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys, count, yref, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYUInt(BBString * label, ImU32 * xs, ImU32 * ys1, ImU32 * ys2, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys1, ImU32 * ys2, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count, cppSpec);
    bbMemFree((void*)v0);
}

// ulong
void ImPlot_PlotShadedULong(BBString * label, ImU64 * values, int count, double yref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedULong_Spec(BBString * label, ImU64 * values, int count, double yref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, values, count, yref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYULong(BBString * label, ImU64 * xs, ImU64 * ys, int count, double yref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys, count, yref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys, int count, double yref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys, count, yref, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYULong(BBString * label, ImU64 * xs, ImU64 * ys1, ImU64 * ys2, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotShadedXYYULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys1, ImU64 * ys2, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotShaded(v0, xs, ys1, ys2, count, cppSpec);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

// float
void ImPlot_PlotBarsFloat(BBString * label, float * values, int count, double bar_size, double shift) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, values, count, bar_size, shift);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsFloat_Spec(BBString * label, float * values, int count, double bar_size, double shift, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, values, count, bar_size, shift, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYFloat(BBString * label, float * xs, float * ys, int count, double bar_size) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYFloat_Spec(BBString * label, float * xs, float * ys, int count, double bar_size, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size, cppSpec);
    bbMemFree((void*)v0);
}

// double
void ImPlot_PlotBarsDouble(BBString * label, double * values, int count, double bar_size, double shift) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, values, count, bar_size, shift);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsDouble_Spec(BBString * label, double * values, int count, double bar_size, double shift, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, values, count, bar_size, shift, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYDouble(BBString * label, double * xs, double * ys, int count, double bar_size) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYDouble_Spec(BBString * label, double * xs, double * ys, int count, double bar_size, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size, cppSpec);
    bbMemFree((void*)v0);
}

// byte
void ImPlot_PlotBarsByte(BBString * label, ImU8 * values, int count, double bar_size, double shift) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, values, count, bar_size, shift);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsByte_Spec(BBString * label, ImU8 * values, int count, double bar_size, double shift, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, values, count, bar_size, shift, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYByte(BBString * label, ImU8 * xs, ImU8 * ys, int count, double bar_size) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys, int count, double bar_size, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size, cppSpec);
    bbMemFree((void*)v0);
}

// short
void ImPlot_PlotBarsShort(BBString * label, ImU16 * values, int count, double bar_size, double shift) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, values, count, bar_size, shift);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsShort_Spec(BBString * label, ImU16 * values, int count, double bar_size, double shift, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, values, count, bar_size, shift, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYShort(BBString * label, ImU16 * xs, ImU16 * ys, int count, double bar_size) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys, int count, double bar_size, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size, cppSpec);
    bbMemFree((void*)v0);
}

// int
void ImPlot_PlotBarsInt(BBString * label, ImS32 * values, int count, double bar_size, double shift) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, values, count, bar_size, shift);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsInt_Spec(BBString * label, ImS32 * values, int count, double bar_size, double shift, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, values, count, bar_size, shift, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYInt(BBString * label, ImS32 * xs, ImS32 * ys, int count, double bar_size) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys, int count, double bar_size, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size, cppSpec);
    bbMemFree((void*)v0);
}

// long
void ImPlot_PlotBarsLong(BBString * label, ImS64 * values, int count, double bar_size, double shift) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, values, count, bar_size, shift);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsLong_Spec(BBString * label, ImS64 * values, int count, double bar_size, double shift, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, values, count, bar_size, shift, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYLong(BBString * label, ImS64 * xs, ImS64 * ys, int count, double bar_size) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys, int count, double bar_size, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size, cppSpec);
    bbMemFree((void*)v0);
}

// uint
void ImPlot_PlotBarsUInt(BBString * label, ImU32 * values, int count, double bar_size, double shift) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, values, count, bar_size, shift);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsUInt_Spec(BBString * label, ImU32 * values, int count, double bar_size, double shift, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, values, count, bar_size, shift, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYUInt(BBString * label, ImU32 * xs, ImU32 * ys, int count, double bar_size) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys, int count, double bar_size, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size, cppSpec);
    bbMemFree((void*)v0);
}

// ulong
void ImPlot_PlotBarsULong(BBString * label, ImU64 * values, int count, double bar_size, double shift) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, values, count, bar_size, shift);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsULong_Spec(BBString * label, ImU64 * values, int count, double bar_size, double shift, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, values, count, bar_size, shift, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYULong(BBString * label, ImU64 * xs, ImU64 * ys, int count, double bar_size) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size);
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarsXYULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys, int count, double bar_size, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBars(v0, xs, ys, count, bar_size, cppSpec);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

char** bmx_bbStringArrayToUTF8StringArray(BBArray * arr) {
    int count = arr->scales[0];
	BBString **s=(BBString**)BBARRAYDATA( arr,arr->dims );

    char ** utf8_arr = (char **)bbMemAlloc(count * sizeof(char *));
    for (int i = 0; i < count; i++) {
        utf8_arr[i] = (char *)bbStringToUTF8String(s[i]);
    }
    return utf8_arr;
}

// float
void ImPlot_PlotBarGroupsFloat(BBArray * label_ids, float * values, int item_count, int group_count, double group_size, double shift) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarGroupsFloat_Spec(BBArray * label_ids, float * values, int item_count, int group_count, double group_size, double shift, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

// double
void ImPlot_PlotBarGroupsDouble(BBArray * label_ids, double * values, int item_count, int group_count, double group_size, double shift) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarGroupsDouble_Spec(BBArray * label_ids, double * values, int item_count, int group_count, double group_size, double shift, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

// byte
void ImPlot_PlotBarGroupsByte(BBArray * label_ids, ImU8 * values, int item_count, int group_count, double group_size, double shift) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarGroupsByte_Spec(BBArray * label_ids, ImU8 * values, int item_count, int group_count, double group_size, double shift, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

// short
void ImPlot_PlotBarGroupsShort(BBArray * label_ids, ImU16 * values, int item_count, int group_count, double group_size, double shift) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarGroupsShort_Spec(BBArray * label_ids, ImU16 * values, int item_count, int group_count, double group_size, double shift, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

// int
void ImPlot_PlotBarGroupsInt(BBArray * label_ids, ImS32 * values, int item_count, int group_count, double group_size, double shift) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarGroupsInt_Spec(BBArray * label_ids, ImS32 * values, int item_count, int group_count, double group_size, double shift, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

// long
void ImPlot_PlotBarGroupsLong(BBArray * label_ids, ImS64 * values, int item_count, int group_count, double group_size, double shift) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarGroupsLong_Spec(BBArray * label_ids, ImS64 * values, int item_count, int group_count, double group_size, double shift, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

// uint
void ImPlot_PlotBarGroupsUInt(BBArray * label_ids, ImU32 * values, int item_count, int group_count, double group_size, double shift) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarGroupsUInt_Spec(BBArray * label_ids, ImU32 * values, int item_count, int group_count, double group_size, double shift, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

// ulong
void ImPlot_PlotBarGroupsULong(BBArray * label_ids, ImU64 * values, int item_count, int group_count, double group_size, double shift) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

void ImPlot_PlotBarGroupsULong_Spec(BBArray * label_ids, ImU64 * values, int item_count, int group_count, double group_size, double shift, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotBarGroups(v0, values, item_count, group_count, group_size, shift, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

// float
void ImPlot_PlotErrorBarsFloat(BBString * label, float * xs, float * ys, float * err, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsFloat_Spec(BBString * label, float * xs, float * ys, float * err, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPFloat(BBString * label, float * xs, float * ys, float * neg, float * pos, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPFloat_Spec(BBString * label, float * xs, float * ys, float * neg, float * pos, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count, cppSpec);
    bbMemFree((void*)v0);
}

// double
void ImPlot_PlotErrorBarsDouble(BBString * label, double * xs, double * ys, double * err, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsDouble_Spec(BBString * label, double * xs, double * ys, double * err, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPDouble(BBString * label, double * xs, double * ys, double * neg, double * pos, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPDouble_Spec(BBString * label, double * xs, double * ys, double * neg, double * pos, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count, cppSpec);
    bbMemFree((void*)v0);
}

// byte
void ImPlot_PlotErrorBarsByte(BBString * label, ImU8 * xs, ImU8 * ys, ImU8 * err, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys, ImU8 * err, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPByte(BBString * label, ImU8 * xs, ImU8 * ys, ImU8 * neg, ImU8 * pos, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys, ImU8 * neg, ImU8 * pos, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count, cppSpec);
    bbMemFree((void*)v0);
}

// short
void ImPlot_PlotErrorBarsShort(BBString * label, ImU16 * xs, ImU16 * ys, ImU16 * err, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys, ImU16 * err, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPShort(BBString * label, ImU16 * xs, ImU16 * ys, ImU16 * neg, ImU16 * pos, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys, ImU16 * neg, ImU16 * pos, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count, cppSpec);
    bbMemFree((void*)v0);
}

// int
void ImPlot_PlotErrorBarsInt(BBString * label, ImS32 * xs, ImS32 * ys, ImS32 * err, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys, ImS32 * err, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPInt(BBString * label, ImS32 * xs, ImS32 * ys, ImS32 * neg, ImS32 * pos, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys, ImS32 * neg, ImS32 * pos, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count, cppSpec);
    bbMemFree((void*)v0);
}

// long
void ImPlot_PlotErrorBarsLong(BBString * label, ImS64 * xs, ImS64 * ys, ImS64 * err, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys, ImS64 * err, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPLong(BBString * label, ImS64 * xs, ImS64 * ys, ImS64 * neg, ImS64 * pos, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys, ImS64 * neg, ImS64 * pos, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count, cppSpec);
    bbMemFree((void*)v0);
}

// uint
void ImPlot_PlotErrorBarsUInt(BBString * label, ImU32 * xs, ImU32 * ys, ImU32 * err, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys, ImU32 * err, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPUInt(BBString * label, ImU32 * xs, ImU32 * ys, ImU32 * neg, ImU32 * pos, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys, ImU32 * neg, ImU32 * pos, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count, cppSpec);
    bbMemFree((void*)v0);
}

// ulong
void ImPlot_PlotErrorBarsULong(BBString * label, ImU64 * xs, ImU64 * ys, ImU64 * err, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys, ImU64 * err, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, err, count, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPULong(BBString * label, ImU64 * xs, ImU64 * ys, ImU64 * neg, ImU64 * pos, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotErrorBarsNPULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys, ImU64 * neg, ImU64 * pos, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotErrorBars(v0, xs, ys, neg, pos, count, cppSpec);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

// float
void ImPlot_PlotStemsFloat(BBString * label, float * values, int count, double ref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsFloat_Spec(BBString * label, float * values, int count, double ref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYFloat(BBString * label, float * xs, float * ys, int count, double ref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, xs, ys, count, ref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYFloat_Spec(BBString * label, float * xs, float * ys, int count, double ref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, xs, ys, count, ref, cppSpec);
    bbMemFree((void*)v0);
}

// double
void ImPlot_PlotStemsDouble(BBString * label, double * values, int count, double ref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsDouble_Spec(BBString * label, double * values, int count, double ref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYDouble(BBString * label, double * xs, double * ys, int count, double ref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, xs, ys, count, ref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYDouble_Spec(BBString * label, double * xs, double * ys, int count, double ref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, xs, ys, count, ref, cppSpec);
    bbMemFree((void*)v0);
}

// byte
void ImPlot_PlotStemsByte(BBString * label, ImU8 * values, int count, double ref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsByte_Spec(BBString * label, ImU8 * values, int count, double ref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYByte(BBString * label, ImU8 * xs, ImU8 * ys, int count, double ref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, xs, ys, count, ref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys, int count, double ref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, xs, ys, count, ref, cppSpec);
    bbMemFree((void*)v0);
}

// short
void ImPlot_PlotStemsShort(BBString * label, ImU16 * values, int count, double ref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsShort_Spec(BBString * label, ImU16 * values, int count, double ref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYShort(BBString * label, ImU16 * xs, ImU16 * ys, int count, double ref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, xs, ys, count, ref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys, int count, double ref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, xs, ys, count, ref, cppSpec);
    bbMemFree((void*)v0);
}

// int
void ImPlot_PlotStemsInt(BBString * label, ImS32 * values, int count, double ref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsInt_Spec(BBString * label, ImS32 * values, int count, double ref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYInt(BBString * label, ImS32 * xs, ImS32 * ys, int count, double ref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, xs, ys, count, ref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys, int count, double ref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, xs, ys, count, ref, cppSpec);
    bbMemFree((void*)v0);
}

// long
void ImPlot_PlotStemsLong(BBString * label, ImS64 * values, int count, double ref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsLong_Spec(BBString * label, ImS64 * values, int count, double ref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYLong(BBString * label, ImS64 * xs, ImS64 * ys, int count, double ref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, xs, ys, count, ref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys, int count, double ref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, xs, ys, count, ref, cppSpec);
    bbMemFree((void*)v0);
}

// uint
void ImPlot_PlotStemsUInt(BBString * label, ImU32 * values, int count, double ref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsUInt_Spec(BBString * label, ImU32 * values, int count, double ref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYUInt(BBString * label, ImU32 * xs, ImU32 * ys, int count, double ref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, xs, ys, count, ref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys, int count, double ref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, xs, ys, count, ref, cppSpec);
    bbMemFree((void*)v0);
}

// ulong
void ImPlot_PlotStemsULong(BBString * label, ImU64 * values, int count, double ref, double xscale, double xstart) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsULong_Spec(BBString * label, ImU64 * values, int count, double ref, double xscale, double xstart, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, values, count, ref, xscale, xstart, cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYULong(BBString * label, ImU64 * xs, ImU64 * ys, int count, double ref) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotStems(v0, xs, ys, count, ref);
    bbMemFree((void*)v0);
}

void ImPlot_PlotStemsXYULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys, int count, double ref, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotStems(v0, xs, ys, count, ref, cppSpec);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

// float
void ImPlot_PlotInfLinesFloat(BBString * label, float * values, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotInfLines(v0, values, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotInfLinesFloat_Spec(BBString * label, float * values, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotInfLines(v0, values, count, cppSpec);
    bbMemFree((void*)v0);
}

// double
void ImPlot_PlotInfLinesDouble(BBString * label, double * values, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotInfLines(v0, values, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotInfLinesDouble_Spec(BBString * label, double * values, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotInfLines(v0, values, count, cppSpec);
    bbMemFree((void*)v0);
}

// byte
void ImPlot_PlotInfLinesByte(BBString * label, ImU8 * values, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotInfLines(v0, values, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotInfLinesByte_Spec(BBString * label, ImU8 * values, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotInfLines(v0, values, count, cppSpec);
    bbMemFree((void*)v0);
}

// short
void ImPlot_PlotInfLinesShort(BBString * label, ImU16 * values, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotInfLines(v0, values, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotInfLinesShort_Spec(BBString * label, ImU16 * values, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotInfLines(v0, values, count, cppSpec);
    bbMemFree((void*)v0);
}

// int
void ImPlot_PlotInfLinesInt(BBString * label, ImS32 * values, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotInfLines(v0, values, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotInfLinesInt_Spec(BBString * label, ImS32 * values, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotInfLines(v0, values, count, cppSpec);
    bbMemFree((void*)v0);
}

// long
void ImPlot_PlotInfLinesLong(BBString * label, ImS64 * values, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotInfLines(v0, values, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotInfLinesLong_Spec(BBString * label, ImS64 * values, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotInfLines(v0, values, count, cppSpec);
    bbMemFree((void*)v0);
}

// uint
void ImPlot_PlotInfLinesUInt(BBString * label, ImU32 * values, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotInfLines(v0, values, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotInfLinesUInt_Spec(BBString * label, ImU32 * values, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotInfLines(v0, values, count, cppSpec);
    bbMemFree((void*)v0);
}

// ulong
void ImPlot_PlotInfLinesULong(BBString * label, ImU64 * values, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotInfLines(v0, values, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotInfLinesULong_Spec(BBString * label, ImU64 * values, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotInfLines(v0, values, count, cppSpec);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

// float
void ImPlot_PlotPieChartFloat(BBArray * label_ids, float * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotPieChartFloat_Spec(BBArray * label_ids, float * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// double
void ImPlot_PlotPieChartDouble(BBArray * label_ids, double * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotPieChartDouble_Spec(BBArray * label_ids, double * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// byte
void ImPlot_PlotPieChartByte(BBArray * label_ids, ImU8 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotPieChartByte_Spec(BBArray * label_ids, ImU8 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// short
void ImPlot_PlotPieChartShort(BBArray * label_ids, ImU16 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotPieChartShort_Spec(BBArray * label_ids, ImU16 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// int
void ImPlot_PlotPieChartInt(BBArray * label_ids, ImS32 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotPieChartInt_Spec(BBArray * label_ids, ImS32 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// long
void ImPlot_PlotPieChartLong(BBArray * label_ids, ImS64 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotPieChartLong_Spec(BBArray * label_ids, ImS64 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// uint
void ImPlot_PlotPieChartUInt(BBArray * label_ids, ImU32 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotPieChartUInt_Spec(BBArray * label_ids, ImU32 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// ulong
void ImPlot_PlotPieChartULong(BBArray * label_ids, ImU64 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotPieChartULong_Spec(BBArray * label_ids, ImU64 * values, int count, double x, double y, double radius, BBString * label_fmt, double angle0, MaxPlotSpec spec) {
    char ** v0 = bmx_bbStringArrayToUTF8StringArray(label_ids);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotPieChart(v0, values, count, x, y, radius, v1, angle0, cppSpec);
    for (int i = 0; i < label_ids->scales[0]; i++) {
        bbMemFree((void*)v0[i]);
    }
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

///////////////////////////////////////////////////////////

// float
void ImPlot_PlotHeatmapFloat(BBString * label, float * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max));
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotHeatmapFloat_Spec(BBString * label, float * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max), cppSpec);
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// double
void ImPlot_PlotHeatmapDouble(BBString * label, double * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max));
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotHeatmapDouble_Spec(BBString * label, double * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max), cppSpec);
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// byte
void ImPlot_PlotHeatmapByte(BBString * label, ImU8 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max));
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotHeatmapByte_Spec(BBString * label, ImU8 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max), cppSpec);
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// short
void ImPlot_PlotHeatmapShort(BBString * label, ImU16 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max));
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotHeatmapShort_Spec(BBString * label, ImU16 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max), cppSpec);
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// int
void ImPlot_PlotHeatmapInt(BBString * label, ImS32 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max));
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotHeatmapInt_Spec(BBString * label, ImS32 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max), cppSpec);
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// long
void ImPlot_PlotHeatmapLong(BBString * label, ImS64 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max));
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotHeatmapLong_Spec(BBString * label, ImS64 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max), cppSpec);
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// uint
void ImPlot_PlotHeatmapUInt(BBString * label, ImU32 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max));
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotHeatmapUInt_Spec(BBString * label, ImU32 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max), cppSpec);
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

// ulong
void ImPlot_PlotHeatmapULong(BBString * label, ImU64 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max));
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

void ImPlot_PlotHeatmapULong_Spec(BBString * label, ImU64 * values, int rows, int cols, double scale_min, double scale_max, BBString * label_fmt, MaxPlotPoint & bounds_min, MaxPlotPoint & bounds_max, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const char * v1 = label_fmt == &bbEmptyString ? nullptr : (const char *)bbStringToUTF8String(label_fmt);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotHeatmap(v0, values, rows, cols, scale_min, scale_max, v1, ConvertToCPP_MaxPlotPoint(bounds_min), ConvertToCPP_MaxPlotPoint(bounds_max), cppSpec);
    bbMemFree((void*)v0);
    bbMemFree((void*)v1);
}

///////////////////////////////////////////////////////////

// float
double ImPlot_PlotHistogramFloat(BBString * label, float * values, int count, int bins, double bar_scale, MaxPlotRange range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogramFloat_Spec(BBString * label, float * values, int count, int bins, double bar_scale, MaxPlotRange range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// double
double ImPlot_PlotHistogramDouble(BBString * label, double * values, int count, int bins, double bar_scale, MaxPlotRange range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogramDouble_Spec(BBString * label, double * values, int count, int bins, double bar_scale, MaxPlotRange range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// byte
double ImPlot_PlotHistogramByte(BBString * label, ImU8 * values, int count, int bins, double bar_scale, MaxPlotRange range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogramByte_Spec(BBString * label, ImU8 * values, int count, int bins, double bar_scale, MaxPlotRange range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// short
double ImPlot_PlotHistogramShort(BBString * label, ImU16 * values, int count, int bins, double bar_scale, MaxPlotRange range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogramShort_Spec(BBString * label, ImU16 * values, int count, int bins, double bar_scale, MaxPlotRange range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// int
double ImPlot_PlotHistogramInt(BBString * label, ImS32 * values, int count, int bins, double bar_scale, MaxPlotRange range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogramInt_Spec(BBString * label, ImS32 * values, int count, int bins, double bar_scale, MaxPlotRange range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// long
double ImPlot_PlotHistogramLong(BBString * label, ImS64 * values, int count, int bins, double bar_scale, MaxPlotRange range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogramLong_Spec(BBString * label, ImS64 * values, int count, int bins, double bar_scale, MaxPlotRange range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// uint
double ImPlot_PlotHistogramUInt(BBString * label, ImU32 * values, int count, int bins, double bar_scale, MaxPlotRange range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogramUInt_Spec(BBString * label, ImU32 * values, int count, int bins, double bar_scale, MaxPlotRange range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// ulong
double ImPlot_PlotHistogramULong(BBString * label, ImU64 * values, int count, int bins, double bar_scale, MaxPlotRange range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogramULong_Spec(BBString * label, ImU64 * values, int count, int bins, double bar_scale, MaxPlotRange range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram(v0, values, count, bins, bar_scale, ConvertToCPP_MaxPlotRange(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

///////////////////////////////////////////////////////////

// float
double ImPlot_PlotHistogram2DFloat(BBString * label, float * xs, float * ys, int count, int x_bins, int y_bins, MaxPlotRect range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogram2DFloat_Spec(BBString * label, float * xs, float * ys, int count, int x_bins, int y_bins, MaxPlotRect range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// double
double ImPlot_PlotHistogram2DDouble(BBString * label, double * xs, double * ys, int count, int x_bins, int y_bins, MaxPlotRect range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogram2DDouble_Spec(BBString * label, double * xs, double * ys, int count, int x_bins, int y_bins, MaxPlotRect range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// byte
double ImPlot_PlotHistogram2DByte(BBString * label, ImU8 * xs, ImU8 * ys, int count, int x_bins, int y_bins, MaxPlotRect range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogram2DByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys, int count, int x_bins, int y_bins, MaxPlotRect range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// short
double ImPlot_PlotHistogram2DShort(BBString * label, ImU16 * xs, ImU16 * ys, int count, int x_bins, int y_bins, MaxPlotRect range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogram2DShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys, int count, int x_bins, int y_bins, MaxPlotRect range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// int
double ImPlot_PlotHistogram2DInt(BBString * label, ImS32 * xs, ImS32 * ys, int count, int x_bins, int y_bins, MaxPlotRect range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogram2DInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys, int count, int x_bins, int y_bins, MaxPlotRect range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// long
double ImPlot_PlotHistogram2DLong(BBString * label, ImS64 * xs, ImS64 * ys, int count, int x_bins, int y_bins, MaxPlotRect range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogram2DLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys, int count, int x_bins, int y_bins, MaxPlotRect range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// uint
double ImPlot_PlotHistogram2DUInt(BBString * label, ImU32 * xs, ImU32 * ys, int count, int x_bins, int y_bins, MaxPlotRect range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogram2DUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys, int count, int x_bins, int y_bins, MaxPlotRect range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

// ulong
double ImPlot_PlotHistogram2DULong(BBString * label, ImU64 * xs, ImU64 * ys, int count, int x_bins, int y_bins, MaxPlotRect range) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range));
    bbMemFree((void*)v0);
    return result;
}

double ImPlot_PlotHistogram2DULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys, int count, int x_bins, int y_bins, MaxPlotRect range, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    double result = ImPlot::PlotHistogram2D(v0, xs, ys, count, x_bins, y_bins, ConvertToCPP_MaxPlotRect(range), cppSpec);
    bbMemFree((void*)v0);
    return result;
}

///////////////////////////////////////////////////////////

// float
void ImPlot_PlotDigitalFloat(BBString * label, float * xs, float * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotDigital(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotDigitalFloat_Spec(BBString * label, float * xs, float * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotDigital(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// double
void ImPlot_PlotDigitalDouble(BBString * label, double * xs, double * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotDigital(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotDigitalDouble_Spec(BBString * label, double * xs, double * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotDigital(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// byte
void ImPlot_PlotDigitalByte(BBString * label, ImU8 * xs, ImU8 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotDigital(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotDigitalByte_Spec(BBString * label, ImU8 * xs, ImU8 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotDigital(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// short
void ImPlot_PlotDigitalShort(BBString * label, ImU16 * xs, ImU16 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotDigital(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotDigitalShort_Spec(BBString * label, ImU16 * xs, ImU16 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotDigital(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// int
void ImPlot_PlotDigitalInt(BBString * label, ImS32 * xs, ImS32 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotDigital(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotDigitalInt_Spec(BBString * label, ImS32 * xs, ImS32 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotDigital(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// long
void ImPlot_PlotDigitalLong(BBString * label, ImS64 * xs, ImS64 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotDigital(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotDigitalLong_Spec(BBString * label, ImS64 * xs, ImS64 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotDigital(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// uint
void ImPlot_PlotDigitalUInt(BBString * label, ImU32 * xs, ImU32 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotDigital(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotDigitalUInt_Spec(BBString * label, ImU32 * xs, ImU32 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotDigital(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

// ulong
void ImPlot_PlotDigitalULong(BBString * label, ImU64 * xs, ImU64 * ys, int count) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotDigital(v0, xs, ys, count);
    bbMemFree((void*)v0);
}

void ImPlot_PlotDigitalULong_Spec(BBString * label, ImU64 * xs, ImU64 * ys, int count, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotDigital(v0, xs, ys, count, cppSpec);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

void ImPlot_PlotText(BBString * text, double x, double y, MaxVec2 pix_offset) {
    const char * v0 = (const char *)bbStringToUTF8String(text);
    ImPlot::PlotText(v0, x, y, ConvertToCPP_MaxVec2(pix_offset));
    bbMemFree((void*)v0);
}

void ImPlot_PlotText_Spec(BBString * text, double x, double y, MaxVec2 pix_offset, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(text);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotText(v0, x, y, ConvertToCPP_MaxVec2(pix_offset), cppSpec);
    bbMemFree((void*)v0);
}

void ImPlot_PlotDummy(BBString * label) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    ImPlot::PlotDummy(v0);
    bbMemFree((void*)v0);
}

void ImPlot_PlotDummy_Spec(BBString * label, MaxPlotSpec spec) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    const ::ImPlotSpec cppSpec = ConvertToCPP_MaxPlotSpec(spec);
    ImPlot::PlotDummy(v0, cppSpec);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

int ImPlot_DragPoint(int id, double * x, double * y, MaxVec4 col, float size, ImPlotDragToolFlags flags, int * out_clicked, int * out_hovered, int * held) {
    bool oc;
    bool oh;
    bool h;
    int res = ImPlot::DragPoint(id, x, y, ConvertToCPP_MaxVec4(col), size, flags, &oc, &oh, &h);
    if (out_clicked) *out_clicked = oc;
    if (out_hovered) *out_hovered = oh;
    if (held) *held = h;
    return res;
}

int ImPlot_DragLineX(int id, double * x, MaxVec4 col, float thickness, ImPlotDragToolFlags flags, int * out_clicked, int * out_hovered, int * held) {
    bool oc;
    bool oh;
    bool h;
    int res = ImPlot::DragLineX(id, x, ConvertToCPP_MaxVec4(col), thickness, flags, &oc, &oh, &h);
    if (out_clicked) *out_clicked = oc;
    if (out_hovered) *out_hovered = oh;
    if (held) *held = h;
    return res;
}

int ImPlot_DragLineY(int id, double * y, MaxVec4 col, float thickness, ImPlotDragToolFlags flags, int * out_clicked, int * out_hovered, int * held) {
    bool oc;
    bool oh;
    bool h;
    int res = ImPlot::DragLineY(id, y, ConvertToCPP_MaxVec4(col), thickness, flags, &oc, &oh, &h);
    if (out_clicked) *out_clicked = oc;
    if (out_hovered) *out_hovered = oh;
    if (held) *held = h;
    return res;
}

int ImPlot_DragRect(int id, double * x1, double * y1, double * x2, double * y2, MaxVec4 col, ImPlotDragToolFlags flags, int * out_clicked, int * out_hovered, int * held) {
    bool oc;
    bool oh;
    bool h;
    int res = ImPlot::DragRect(id, x1, y1, x2, y2, ConvertToCPP_MaxVec4(col), flags, &oc, &oh, &h);
    if (out_clicked) *out_clicked = oc;
    if (out_hovered) *out_hovered = oh;
    if (held) *held = h;
    return res;
}

void ImPlot_Annotation(double x, double y, MaxVec4 col, MaxVec2 pix_offset, int clamp, int round) {
    ImPlot::Annotation(x, y, ConvertToCPP_MaxVec4(col), ConvertToCPP_MaxVec2(pix_offset), clamp, round);
}

void ImPlot_AnnotationFmt(double x, double y, MaxVec4 col, MaxVec2 pix_offset, int clamp, BBString * fmt) {
    const char * v0 = (const char *)bbStringToUTF8String(fmt);
    ImPlot::Annotation(x, y, ConvertToCPP_MaxVec4(col), ConvertToCPP_MaxVec2(pix_offset), clamp, v0);
    bbMemFree((void*)v0);
}

void ImPlot_TagX(double x, MaxVec4 col, int round) {
    ImPlot::TagX(x, ConvertToCPP_MaxVec4(col), round);
}

void ImPlot_TagXFmt(double x, MaxVec4 col, BBString * fmt) {
    const char * v0 = (const char *)bbStringToUTF8String(fmt);
    ImPlot::TagX(x, ConvertToCPP_MaxVec4(col), v0);
    bbMemFree((void*)v0);
}

void ImPlot_TagY(double y, MaxVec4 col, int round) {
    ImPlot::TagY(y, ConvertToCPP_MaxVec4(col), round);
}

void ImPlot_TagYFmt(double y, MaxVec4 col, BBString * fmt) {
    const char * v0 = (const char *)bbStringToUTF8String(fmt);
    ImPlot::TagY(y, ConvertToCPP_MaxVec4(col), v0);
    bbMemFree((void*)v0);
}

///////////////////////////////////////////////////////////

void ImPlot_SetAxis(ImAxis axis) {
    ImPlot::SetAxis(axis);
}

void ImPlot_SetAxes(ImAxis x_axis, ImAxis y_axis) {
    ImPlot::SetAxes(x_axis, y_axis);
}

MaxPlotPoint ImPlot_PixelsToPlot(MaxVec2 pix, ImAxis x_axis, ImAxis y_axis) {
    return ConvertFromCPP_MaxPlotPoint(ImPlot::PixelsToPlot(ConvertToCPP_MaxVec2(pix), x_axis, y_axis));
}

MaxPlotPoint ImPlot_PixelsToPlotXY(float x, float y, ImAxis x_axis, ImAxis y_axis) {
    return ConvertFromCPP_MaxPlotPoint(ImPlot::PixelsToPlot(x, y, x_axis, y_axis));
}

MaxVec2 ImPlot_PlotToPixels(MaxPlotPoint plt, ImAxis x_axis, ImAxis y_axis) {
    return ConvertFromCPP_MaxVec2(ImPlot::PlotToPixels(ConvertToCPP_MaxPlotPoint(plt), x_axis, y_axis));
}

MaxVec2 ImPlot_PlotToPixelsXY(double x, double y, ImAxis x_axis, ImAxis y_axis) {
    return ConvertFromCPP_MaxVec2(ImPlot::PlotToPixels(x, y, x_axis, y_axis));
}

MaxVec2 ImPlot_GetPlotPos() {
    return ConvertFromCPP_MaxVec2(ImPlot::GetPlotPos());
}

MaxVec2 ImPlot_GetPlotSize() {
    return ConvertFromCPP_MaxVec2(ImPlot::GetPlotSize());
}

MaxPlotPoint ImPlot_GetPlotMousePos(ImAxis x_axis, ImAxis y_axis) {
    return ConvertFromCPP_MaxPlotPoint(ImPlot::GetPlotMousePos(x_axis, y_axis));
}

MaxPlotRect ImPlot_GetPlotLimits(ImAxis x_axis, ImAxis y_axis) {
    return ConvertFromCPP_MaxPlotRect(ImPlot::GetPlotLimits(x_axis, y_axis));
}

int ImPlot_IsPlotHovered() {
    return ImPlot::IsPlotHovered();
}

int ImPlot_IsAxisHovered(ImAxis axis) {
    return ImPlot::IsAxisHovered(axis);
}

int ImPlot_IsSubplotsHovered() {
    return ImPlot::IsSubplotsHovered();
}

int ImPlot_IsPlotSelected() {
    return ImPlot::IsPlotSelected();
}

MaxPlotRect ImPlot_GetPlotSelection(ImAxis x_axis, ImAxis y_axis) {
    return ConvertFromCPP_MaxPlotRect(ImPlot::GetPlotSelection(x_axis, y_axis));
}

void ImPlot_CancelPlotSelection() {
    ImPlot::CancelPlotSelection();
}

void ImPlot_HideNextItem(int hidden, ImPlotCond cond) {
    ImPlot::HideNextItem(hidden, cond);
}

int ImPlot_BeginAlignedPlots(BBString * group_id, int vertical) {
    const char * v0 = (const char *)bbStringToUTF8String(group_id);
    int result = ImPlot::BeginAlignedPlots(v0, vertical);
    bbMemFree((void*)v0);
    return result;
}

void ImPlot_EndAlignedPlots() {
    ImPlot::EndAlignedPlots();
}

int ImPlot_BeginLegendPopup(BBString * label_id, int mouse_button) {
    const char * v0 = (const char *)bbStringToUTF8String(label_id);
    int result = ImPlot::BeginLegendPopup(v0, mouse_button);
    bbMemFree((void*)v0);
    return result;
}

void ImPlot_EndLegendPopup() {
    ImPlot::EndLegendPopup();
}

int ImPlot_IsLegendEntryHovered(BBString * label_id) {
    const char * v0 = (const char *)bbStringToUTF8String(label_id);
    int result = ImPlot::IsLegendEntryHovered(v0);
    bbMemFree((void*)v0);
    return result;
}

int ImPlot_BeginDragDropTargetPlot() {
    return ImPlot::BeginDragDropTargetPlot();
}

int ImPlot_BeginDragDropTargetAxis(ImAxis axis) {
    return ImPlot::BeginDragDropTargetAxis(axis);
}

int ImPlot_BeginDragDropTargetLegend() {
    return ImPlot::BeginDragDropTargetLegend();
}

void ImPlot_EndDragDropTarget() {
    ImPlot::EndDragDropTarget();
}

int ImPlot_BeginDragDropSourcePlot(int flags) {
    return ImPlot::BeginDragDropSourcePlot(flags);
}

int ImPlot_BeginDragDropSourceAxis(ImAxis axis, int flags) {
    return ImPlot::BeginDragDropSourceAxis(axis, flags);
}

int ImPlot_BeginDragDropSourceItem(BBString * label_id, int flags) {
    const char * v0 = (const char *)bbStringToUTF8String(label_id);
    int result = ImPlot::BeginDragDropSourceItem(v0, flags);
    bbMemFree((void*)v0);
    return result;
}

void ImPlot_EndDragDropSource() {
    ImPlot::EndDragDropSource();
}

///////////////////////////////////////////////////////////

ImPlotStyle * bmx_implot_style_create() {
    return new ImPlotStyle();
}

void bmx_implot_style_delete(ImPlotStyle * style) {
    delete style;
}

float bmx_implot_style_get_plot_border_size(ImPlotStyle * style) {
    return style->PlotBorderSize;
}

void bmx_implot_style_set_plot_border_size(ImPlotStyle * style, float plot_border_size) {
    style->PlotBorderSize = plot_border_size;
}

float bmx_implot_style_get_minor_alpha(ImPlotStyle * style) {
    return style->MinorAlpha;
}

void bmx_implot_style_set_minor_alpha(ImPlotStyle * style, float minor_alpha) {
    style->MinorAlpha = minor_alpha;
}

MaxVec2 bmx_implot_style_get_major_tick_len(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->MajorTickLen);
}

void bmx_implot_style_set_major_tick_len(ImPlotStyle * style, MaxVec2 major_tick_len) {
    style->MajorTickLen = ConvertToCPP_MaxVec2(major_tick_len);
}

MaxVec2 bmx_implot_style_get_minor_tick_len(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->MinorTickLen);
}

void bmx_implot_style_set_minor_tick_len(ImPlotStyle * style, MaxVec2 minor_tick_len) {
    style->MinorTickLen = ConvertToCPP_MaxVec2(minor_tick_len);
}

MaxVec2 bmx_implot_style_get_major_tick_size(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->MajorTickSize);
}

void bmx_implot_style_set_major_tick_size(ImPlotStyle * style, MaxVec2 major_tick_size) {
    style->MajorTickSize = ConvertToCPP_MaxVec2(major_tick_size);
}

MaxVec2 bmx_implot_style_get_minor_tick_size(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->MinorTickSize);
}

void bmx_implot_style_set_minor_tick_size(ImPlotStyle * style, MaxVec2 minor_tick_size) {
    style->MinorTickSize = ConvertToCPP_MaxVec2(minor_tick_size);
}

MaxVec2 bmx_implot_style_get_major_grid_size(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->MajorGridSize);
}

void bmx_implot_style_set_major_grid_size(ImPlotStyle * style, MaxVec2 major_grid_size) {
    style->MajorGridSize = ConvertToCPP_MaxVec2(major_grid_size);
}

MaxVec2 bmx_implot_style_get_minor_grid_size(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->MinorGridSize);
}

void bmx_implot_style_set_minor_grid_size(ImPlotStyle * style, MaxVec2 minor_grid_size) {
    style->MinorGridSize = ConvertToCPP_MaxVec2(minor_grid_size);
}

MaxVec2 bmx_implot_style_get_plot_padding(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->PlotPadding);
}

void bmx_implot_style_set_plot_padding(ImPlotStyle * style, MaxVec2 plot_padding) {
    style->PlotPadding = ConvertToCPP_MaxVec2(plot_padding);
}

MaxVec2 bmx_implot_style_get_label_padding(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->LabelPadding);
}

void bmx_implot_style_set_label_padding(ImPlotStyle * style, MaxVec2 label_padding) {
    style->LabelPadding = ConvertToCPP_MaxVec2(label_padding);
}

MaxVec2 bmx_implot_style_get_legend_padding(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->LegendPadding);
}

void bmx_implot_style_set_legend_padding(ImPlotStyle * style, MaxVec2 legend_padding) {
    style->LegendPadding = ConvertToCPP_MaxVec2(legend_padding);
}

MaxVec2 bmx_implot_style_get_legend_inner_padding(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->LegendInnerPadding);
}

void bmx_implot_style_set_legend_inner_padding(ImPlotStyle * style, MaxVec2 legend_inner_padding) {
    style->LegendInnerPadding = ConvertToCPP_MaxVec2(legend_inner_padding);
}

MaxVec2 bmx_implot_style_get_legend_spacing(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->LegendSpacing);
}

void bmx_implot_style_set_legend_spacing(ImPlotStyle * style, MaxVec2 legend_spacing) {
    style->LegendSpacing = ConvertToCPP_MaxVec2(legend_spacing);
}

MaxVec2 bmx_implot_style_get_mouse_pos_padding(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->MousePosPadding);
}

void bmx_implot_style_set_mouse_pos_padding(ImPlotStyle * style, MaxVec2 mouse_pos_padding) {
    style->MousePosPadding = ConvertToCPP_MaxVec2(mouse_pos_padding);
}

MaxVec2 bmx_implot_style_get_annotation_padding(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->AnnotationPadding);
}

void bmx_implot_style_set_annotation_padding(ImPlotStyle * style, MaxVec2 annotation_padding) {
    style->AnnotationPadding = ConvertToCPP_MaxVec2(annotation_padding);
}

MaxVec2 bmx_implot_style_get_fit_padding(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->FitPadding);
}

void bmx_implot_style_set_fit_padding(ImPlotStyle * style, MaxVec2 fit_padding) {
    style->FitPadding = ConvertToCPP_MaxVec2(fit_padding);
}

MaxVec2 bmx_implot_style_get_plot_default_size(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->PlotDefaultSize);
}

void bmx_implot_style_set_plot_default_size(ImPlotStyle * style, MaxVec2 plot_default_size) {
    style->PlotDefaultSize = ConvertToCPP_MaxVec2(plot_default_size);
}

MaxVec2 bmx_implot_style_get_plot_min_size(ImPlotStyle * style) {
    return ConvertFromCPP_MaxVec2(style->PlotMinSize);
}

void bmx_implot_style_set_plot_min_size(ImPlotStyle * style, MaxVec2 plot_min_size) {
    style->PlotMinSize = ConvertToCPP_MaxVec2(plot_min_size);
}

MaxVec4 bmx_implot_style_get_color(ImPlotStyle * style, int index) {
    return ConvertFromCPP_MaxVec4(style->Colors[index]);
}

void bmx_implot_style_set_color(ImPlotStyle * style, int index, MaxVec4 color) {
    style->Colors[index] = ConvertToCPP_MaxVec4(color);
}

int bmx_implot_style_get_colormap(ImPlotStyle * style) {
    return style->Colormap;
}

void bmx_implot_style_set_colormap(ImPlotStyle * style, int colormap) {
    style->Colormap = colormap;
}

int bmx_implot_style_get_use_local_time(ImPlotStyle * style) {
    return style->UseLocalTime;
}

void bmx_implot_style_set_use_local_time(ImPlotStyle * style, int use_local_time) {
    style->UseLocalTime = use_local_time;
}

int bmx_implot_style_get_use_iso_8601(ImPlotStyle * style) {
    return style->UseISO8601;
}

void bmx_implot_style_set_use_iso_8601(ImPlotStyle * style, int use_iso_8601) {
    style->UseISO8601 = use_iso_8601;
}

int bmx_implot_style_get_use_24_hour_clock(ImPlotStyle * style) {
    return style->Use24HourClock;
}

void bmx_implot_style_set_use_24_hour_clock(ImPlotStyle * style, int use_24_hour_clock) {
    style->Use24HourClock = use_24_hour_clock;
}

///////////////////////////////////////////////////////////

ImPlotStyle * ImPlot_GetStyle() {
    return &ImPlot::GetStyle();
}

void ImPlot_StyleColorsAuto(ImPlotStyle * dst) {
    ImPlot::StyleColorsAuto(dst);
}

void ImPlot_StyleColorsClassic(ImPlotStyle * dst) {
    ImPlot::StyleColorsClassic(dst);
}

void ImPlot_StyleColorsDark(ImPlotStyle * dst) {
    ImPlot::StyleColorsDark(dst);
}

void ImPlot_StyleColorsLight(ImPlotStyle * dst) {
    ImPlot::StyleColorsLight(dst);
}

// IMPLOT_API void PushStyleColor(ImPlotCol idx, ImU32 col);
void ImPlot_PushStyleColor(ImPlotCol idx, unsigned int col) {
    ImPlot::PushStyleColor(idx, col);
}

void ImPlot_PushStyleColorVec4(ImPlotCol idx, MaxVec4 col) {
    ImPlot::PushStyleColor(idx, ConvertToCPP_MaxVec4(col));
}

void ImPlot_PopStyleColor(int count) {
    ImPlot::PopStyleColor(count);
}

void ImPlot_PushStyleVar(ImPlotStyleVar idx, float val) {
    ImPlot::PushStyleVar(idx, val);
}

void ImPlot_PushStyleVarInt(ImPlotStyleVar idx, int val) {
    ImPlot::PushStyleVar(idx, val);
}

void ImPlot_PushStyleVarVec2(ImPlotStyleVar idx, MaxVec2 val) {
    ImPlot::PushStyleVar(idx, ConvertToCPP_MaxVec2(val));
}

void ImPlot_PopStyleVar(int count) {
    ImPlot::PopStyleVar(count);
}

MaxVec4 ImPlot_GetLastItemColor() {
    return ConvertFromCPP_MaxVec4(ImPlot::GetLastItemColor());
}

BBString * ImPlot_GetStyleColorName(ImPlotCol idx) {
    const char * name = ImPlot::GetStyleColorName(idx);
    BBString * result = bbStringFromUTF8String((unsigned char*)name);
    return result;
}

BBString * ImPlot_GetMarkerName(ImPlotMarker idx) {
    const char * name = ImPlot::GetMarkerName(idx);
    BBString * result = bbStringFromUTF8String((unsigned char*)name);
    return result;
}

int ImPlot_NextMarker() {
    return ImPlot::NextMarker();
}

///////////////////////////////////////////////////////////

int ImPlot_ShowStyleSelector(BBString * label) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    int result = ImPlot::ShowStyleSelector(v0);
    bbMemFree((void*)v0);
    return result;
}

int ImPlot_ShowColormapSelector(BBString * label) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    int result = ImPlot::ShowColormapSelector(v0);
    bbMemFree((void*)v0);
    return result;
}

int ImPlot_ShowInputMapSelector(BBString * label) {
    const char * v0 = (const char *)bbStringToUTF8String(label);
    int result = ImPlot::ShowInputMapSelector(v0);
    bbMemFree((void*)v0);
    return result;
}

void ImPlot_ShowStyleEditor(ImPlotStyle * ref) {
    ImPlot::ShowStyleEditor(ref);
}

void ImPlot_ShowUserGuide() {
    ImPlot::ShowUserGuide();
}

void ImPlot_ShowMetricsWindow(int * p_popen) {
    bool op = *p_popen;
    ImPlot::ShowMetricsWindow(&op);
    *p_popen = op;
}

//  end extern "C"
}
