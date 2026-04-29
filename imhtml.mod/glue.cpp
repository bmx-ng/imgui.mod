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
#include "imhtml.hpp"
#include "brl.mod/blitz.mod/blitz.h"

#if defined(_WIN32) || defined(_WIN64)
#undef LoadImage
#endif

class MaxImHtmlFontFamily;
class MaxImHtmlConfig;

extern "C" {

    void imgui_imhtml_TImHTMLConfig__LoadImage(BBString * src, BBString * baseUrl);
    ImHTML::ImageMeta imgui_imhtml_TImHTMLConfig__GetImageMeta(BBString * src, BBString * baseUrl);
    ImTextureID imgui_imhtml_TImHTMLConfig__GetImageTexture(BBString * src, BBString * baseUrl);
    BBString * imgui_imhtml_TImHTMLConfig__LoadCSS(BBString * url, BBString * baseUrl);

    int bmx_ImHTML_Canvas(BBString * id, BBString *html, float width);
    int bmx_ImHTML_CanvasEx(BBString * id, BBString *html, float width, BBString **clickedURL);
    MaxImHtmlConfig * bmx_ImHTML_GetConfig();
    void bmx_ImHTML_SetConfig(MaxImHtmlConfig * config);
    void bmx_ImHTML_PushConfig(MaxImHtmlConfig * config);
    void bmx_ImHTML_PopConfig();
    MaxImHtmlConfig * bmx_ImHTML_CreateConfig();
    void bmx_ImHTML_FreeConfig(MaxImHtmlConfig * config);
    float bmx_ImHTML_Config_GetBaseFontSize(MaxImHtmlConfig * config);
    void bmx_ImHTML_Config_SetBaseFontSize(MaxImHtmlConfig * config, float size);
    MaxImHtmlFontFamily * bmx_ImHTML_Config_GetDefaultFont(MaxImHtmlConfig * config);
    void bmx_ImHTML_Config_SetDefaultFont(MaxImHtmlConfig * config, MaxImHtmlFontFamily * family);
    MaxImHtmlFontFamily * bmx_ImHTML_Config_GetFontFamily(MaxImHtmlConfig * config, BBString * name);
    void bmx_ImHTML_Config_SetFontFamily(MaxImHtmlConfig * config, BBString * name, MaxImHtmlFontFamily * family);
    ImFont * bmx_ImHTML_FontFamily_GetRegular(MaxImHtmlFontFamily * family);
    ImFont * bmx_ImHTML_FontFamily_GetBold(MaxImHtmlFontFamily * family);
    ImFont * bmx_ImHTML_FontFamily_GetItalic(MaxImHtmlFontFamily * family);
    ImFont * bmx_ImHTML_FontFamily_GetBoldItalic(MaxImHtmlFontFamily * family);
    void bmx_ImHTML_FontFamily_SetRegular(MaxImHtmlFontFamily * family, ImFont * font);
    void bmx_ImHTML_FontFamily_SetBold(MaxImHtmlFontFamily * family, ImFont * font);
    void bmx_ImHTML_FontFamily_SetItalic(MaxImHtmlFontFamily * family, ImFont * font);
    void bmx_ImHTML_FontFamily_SetBoldItalic(MaxImHtmlFontFamily * family, ImFont * font);
    MaxImHtmlFontFamily * bmx_ImHTML_FontFamily_Create();
    void bmx_ImHTML_FontFamily_Free(MaxImHtmlFontFamily * family);
}

///////////////////////////////////////////////////////////

class MaxImHtmlFontFamily
{
public:
    MaxImHtmlFontFamily()
        : target_(&owned_) {
    }

    explicit MaxImHtmlFontFamily(const ImHTML::FontFamily& family)
        : owned_(family), target_(&owned_) {
    }

    explicit MaxImHtmlFontFamily(ImHTML::FontFamily* family)
        : target_(family) {
    }

    ImFont* Regular() const {
        return target_->Regular;
    }

    ImFont* Bold() const {
        return target_->Bold;
    }

    ImFont* Italic() const {
        return target_->Italic;
    }

    ImFont* BoldItalic() const {
        return target_->BoldItalic;
    }

    void SetRegular(ImFont* font) {
        target_->Regular = font;
    }

    void SetBold(ImFont* font) {
        target_->Bold = font;
    }

    void SetItalic(ImFont* font) {
        target_->Italic = font;
    }

    void SetBoldItalic(ImFont* font) {
        target_->BoldItalic = font;
    }

    ImHTML::FontFamily owned_{};
    ImHTML::FontFamily* target_ = nullptr;
};

class MaxImHtmlConfig
{
public:
    // Creates a new standalone config
    MaxImHtmlConfig()
            : target_(&owned_) {
        InitCallbacks();
    }

    // Creates a standalone config copied from an existing one
    explicit MaxImHtmlConfig(const ImHTML::Config& config)
            : owned_(config), target_(&owned_) {
        InitCallbacks();
    }

    // Wraps an existing config in-place
    explicit MaxImHtmlConfig(ImHTML::Config* config)
            : target_(config) {
        InitCallbacks();
    }

    float GetBaseFontSize() const {
        return target_->BaseFontSize;
    }

    void SetBaseFontSize(float size) {
        target_->BaseFontSize = size;
    }

    MaxImHtmlFontFamily * GetDefaultFont() const {
        return new MaxImHtmlFontFamily(&target_->DefaultFont);
    }

    void SetDefaultFont(MaxImHtmlFontFamily *family) {
        if (family) {
            target_->DefaultFont = *(family->target_);
        }
    }

    MaxImHtmlFontFamily * GetFontFamily(BBString * name) const {
        if (name == &bbEmptyString) {
            return nullptr;
        }

        char * n = (char*)bbStringToUTF8String(name);
        auto it = target_->FontFamilies.find(n);
        bbMemFree(n);
        if (it != target_->FontFamilies.end()) {
            return new MaxImHtmlFontFamily(&it->second);
        }
        return nullptr;
    }

    void SetFontFamily(BBString * name, MaxImHtmlFontFamily *family) {
        if (name == &bbEmptyString) {
            return;
        }

        char * n = (char*)bbStringToUTF8String(name);
        if (family) {
            target_->FontFamilies[n] = *(family->target_);
        } else {
            target_->FontFamilies.erase(n);
        }
        bbMemFree(n);
    }

    void InitCallbacks() {
        target_->LoadImage = [this](const char *src, const char *baseurl) {
            BBString * bSrc = src ? bbStringFromUTF8String((unsigned char *)src) : &bbEmptyString;
            BBString * bBaseUrl = baseurl ? bbStringFromUTF8String((unsigned char *)baseurl) : &bbEmptyString;
            imgui_imhtml_TImHTMLConfig__LoadImage(bSrc, bBaseUrl);
        };
        target_->GetImageMeta = [](const char *src, const char *baseurl) {
            BBString * bSrc = src ? bbStringFromUTF8String((unsigned char *)src) : &bbEmptyString;
            BBString * bBaseUrl = baseurl ? bbStringFromUTF8String((unsigned char *)baseurl) : &bbEmptyString;
            return imgui_imhtml_TImHTMLConfig__GetImageMeta(bSrc, bBaseUrl);
        };
        target_->GetImageTexture = [](const char *src, const char *baseurl) {
            BBString * bSrc = src ? bbStringFromUTF8String((unsigned char *)src) : &bbEmptyString;
            BBString * bBaseUrl = baseurl ? bbStringFromUTF8String((unsigned char *)baseurl) : &bbEmptyString;
            return imgui_imhtml_TImHTMLConfig__GetImageTexture(bSrc, bBaseUrl);
        };
        target_->LoadCSS = [](const char *url, const char *baseurl) {
            BBString * bUrl = url ? bbStringFromUTF8String((unsigned char *)url) : &bbEmptyString;
            BBString * bBaseUrl = baseurl ? bbStringFromUTF8String((unsigned char *)baseurl) : &bbEmptyString;
            BBString * res = imgui_imhtml_TImHTMLConfig__LoadCSS(bUrl, bBaseUrl);
            if (res == &bbEmptyString) {
                return std::string();
            }
            char * css =(char*)bbStringToUTF8String(res);
            std::string cssStr(css);
            bbMemFree(css);
            return cssStr;
        };
    }

    ImHTML::Config owned_{};
    ImHTML::Config* target_ = nullptr;
};

///////////////////////////////////////////////////////////

int bmx_ImHTML_Canvas(BBString * id, BBString *html, float width) {
    char * i = (char*)bbStringToUTF8String(id);
    char * h = (char*)bbStringToUTF8String(html);

    bool res = ImHTML::Canvas(i ? i : "", h ? h : "", width);

    bbMemFree(i);
    bbMemFree(h);
    return res ? 1 : 0;
}

int bmx_ImHTML_CanvasEx(BBString * id, BBString *html, float width, BBString **clickedURL) {
    char * i = (char*)bbStringToUTF8String(id);
    char * h = (char*)bbStringToUTF8String(html);
    std::string clicked;

    bool res = ImHTML::Canvas(i ? i : "", h ? h : "", width, &clicked);

    bbMemFree(i);
    bbMemFree(h);
    if (clickedURL) {
        *clickedURL = bbStringFromUTF8String((unsigned char*)clicked.c_str());
    }
    return res ? 1 : 0;
}

MaxImHtmlConfig * bmx_ImHTML_GetConfig() {
    return new MaxImHtmlConfig(ImHTML::GetConfig());
}

void bmx_ImHTML_SetConfig(MaxImHtmlConfig * config) {
    if (config) {
        ImHTML::SetConfig(*(config->target_));
    }
}

void bmx_ImHTML_PushConfig(MaxImHtmlConfig * config) {
    if (config) {
        ImHTML::PushConfig(*(config->target_));
    }
}

void bmx_ImHTML_PopConfig() {
    ImHTML::PopConfig();
}

MaxImHtmlConfig * bmx_ImHTML_CreateConfig() {
    return new MaxImHtmlConfig();
}

void bmx_ImHTML_FreeConfig(MaxImHtmlConfig * config) {
    delete config;
}

float bmx_ImHTML_Config_GetBaseFontSize(MaxImHtmlConfig * config) {
    if (config) {
        return config->GetBaseFontSize();
    }
    return 0.0f;
}

void bmx_ImHTML_Config_SetBaseFontSize(MaxImHtmlConfig * config, float size) {
    if (config) {
        config->SetBaseFontSize(size);
    }
}

MaxImHtmlFontFamily * bmx_ImHTML_Config_GetDefaultFont(MaxImHtmlConfig * config) {
    if (config) {
        return config->GetDefaultFont();
    }
    return nullptr;
}

void bmx_ImHTML_Config_SetDefaultFont(MaxImHtmlConfig * config, MaxImHtmlFontFamily * family) {
    if (config) {
        config->SetDefaultFont(family);
    }
}

MaxImHtmlFontFamily * bmx_ImHTML_Config_GetFontFamily(MaxImHtmlConfig * config, BBString * name) {
    if (config) {
        return config->GetFontFamily(name);
    }
    return nullptr;
}

void bmx_ImHTML_Config_SetFontFamily(MaxImHtmlConfig * config, BBString * name, MaxImHtmlFontFamily * family) {
    if (config) {
        config->SetFontFamily(name, family);
    }
}

ImFont * bmx_ImHTML_FontFamily_GetRegular(MaxImHtmlFontFamily * family) {
    if (family) {
        return family->Regular();
    }
    return nullptr;
}

ImFont * bmx_ImHTML_FontFamily_GetBold(MaxImHtmlFontFamily * family) {
    if (family) {
        return family->Bold();
    }
    return nullptr;
}

ImFont * bmx_ImHTML_FontFamily_GetItalic(MaxImHtmlFontFamily * family) {
    if (family) {
        return family->Italic();
    }
    return nullptr;
}

ImFont * bmx_ImHTML_FontFamily_GetBoldItalic(MaxImHtmlFontFamily * family) {
    if (family) {
        return family->BoldItalic();
    }
    return nullptr;
}

void bmx_ImHTML_FontFamily_SetRegular(MaxImHtmlFontFamily * family, ImFont * font) {
    if (family) {
        family->SetRegular(font);
    }
}

void bmx_ImHTML_FontFamily_SetBold(MaxImHtmlFontFamily * family, ImFont * font) {
    if (family) {
        family->SetBold(font);
    }
}

void bmx_ImHTML_FontFamily_SetItalic(MaxImHtmlFontFamily * family, ImFont * font) {
    if (family) {
        family->SetItalic(font);
    }
}

void bmx_ImHTML_FontFamily_SetBoldItalic(MaxImHtmlFontFamily * family, ImFont * font) {
    if (family) {
        family->SetBoldItalic(font);
    }
}

MaxImHtmlFontFamily * bmx_ImHTML_FontFamily_Create() {
    return new MaxImHtmlFontFamily();
}

void bmx_ImHTML_FontFamily_Free(MaxImHtmlFontFamily * family) {
    delete family;
}
