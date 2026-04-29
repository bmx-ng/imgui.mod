' Copyright (c) 2026 Bruce A Henderson
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

Rem
bbdoc: A canvas for rendering HTML content in ImGui.
End Rem
Module ImGui.ImHtml

ModuleInfo "Version: 1.01"
ModuleInfo "License: MIT"
ModuleInfo "Copyright: ImHTML - 2025 Daniel Schmidt"
ModuleInfo "Copyright: BlitzMax wrapper - 2026 Bruce A Henderson"

ModuleInfo "History: 1.01"
ModuleInfo "History: Updated to ImHTML 0.4.0"
ModuleInfo "History: 1.00 Initial Release"

ModuleInfo "CPP_OPTS: -std=c++17"


Import "common.bmx"

Rem
bbdoc: Renders HTML content within an ImGui interface.
about: The canvas supports a subset of HTML and CSS, and can be configured with custom fonts and uses the image cache for loading and rendering images.
The @id should be unique within the ImGui context.
@html is the HTML content to render. It can be updated every frame if needed.
@width is an optional fixed width for the canvas. If 0, it will use the available width in the ImGui layout.
End Rem
Function ImHTML_Canvas:Int(id:String, html:String, width:Float = 0)
    Return _ImHTML_Canvas(id, html, width)
End Function

Rem
bbdoc: Renders HTML content within an ImGui interface with support for clickable URLs.
about: The canvas supports a subset of HTML and CSS, and can be configured with custom fonts and uses the image cache for loading and rendering images.
The @id should be unique within the ImGui context.
@html is the HTML content to render. It can be updated every frame if needed.
@width is a fixed width for the canvas. If 0, it will use the available width in the ImGui layout.
@clickedURL is an output parameter that will be set to the URL of any link that was clicked within the canvas during this frame. If no link was clicked, it will be set to an empty string.
When a link is clicked, the function will return #True.
End Rem
Function ImHTML_Canvas:Int(id:String, html:String, width:Float, clickedURL:String Var)
    Return _ImHTML_CanvasEx(id, html, width, clickedURL)
End Function

Rem
bbdoc: Gets the current #TImHTMLConfig used to configure the HTML rendering.
End Rem
Function ImHTML_GetConfig:TImHTMLConfig()
    Return New TImHTMLConfig(bmx_ImHTML_GetConfig())
End Function

Rem
bbdoc: Sets the current #TImHTMLConfig to be used for HTML rendering.
End Rem
Function ImHTML_SetConfig(config:TImHTMLConfig)
    bmx_ImHTML_SetConfig(config.configPtr)
End Function

Rem
bbdoc: Pushes a #TImHTMLConfig onto the config stack, making it the current config for all subsequent HTML rendering until it is popped.
End Rem
Function ImHTML_PushConfig(config:TImHTMLConfig)
    bmx_ImHTML_PushConfig(config.configPtr)
End Function

Rem
bbdoc: Pops the current #TImHTMLConfig from the config stack, reverting to the previous config for HTML rendering.
End Rem
Function ImHTML_PopConfig()
    bmx_ImHTML_PopConfig()
End Function

Rem
bbdoc: Creates a new #TImHTMLConfig with default settings.
about: The returned config should be freed with the #Free method when no longer needed.
It can be freed after setting/pushing it, as the config stack will maintain its own copy of the config data.
End Rem
Function ImHTML_CreateConfig:TImHTMLConfig()
    Return New TImHTMLConfig(bmx_ImHTML_CreateConfig())
End Function

Rem
bbdoc: Represents the configuration for HTML rendering in ImGui.
End Rem
Type TImHTMLConfig

    Field configPtr:Byte Ptr
    Global imageCache:TImGuiImageCache

    Global loadCSSCallback:String(src:String, baseUrl:String, user:Object)
    Global loadCSSUser:Object

    Global baseUrlCallback:String(url:String, user:Object)
    Global baseUrlUser:Object

Private
    Method New(configPtr:Byte Ptr)
        Self.configPtr = configPtr
    End Method

Public
    Rem
    bbdoc: Frees the resources associated with this config.
    about: After calling this method, the config should not be used anymore.
    End Rem
    Method Free()
        If configPtr Then
             bmx_ImHTML_FreeConfig(configPtr)
             configPtr = Null
        End If
    End Method

    Method Delete()
        Free()
    End Method

    Rem
    bbdoc: Sets the image cache to be used for loading and rendering images in HTML content.
    about: The image cache should be set before rendering any HTML that contains images.
    The cache is global, so it will be used for all HTML rendering that relies on the image loading callbacks, regardless of which config is active.
    End Rem
    Function SetImageCache(cache:TImGuiImageCache)
        imageCache = cache
    End Function

    Rem
    bbdoc: Sets the callback function to be used for loading CSS content in HTML.
    about: The callback function should take a URL and a base URL as parameters, and return the CSS content as a string. This allows you to implement custom logic for loading CSS, such as fetching it from a file, a network resource, or generating it dynamically.
    The callback is global, so it will be used for all HTML rendering that relies on the CSS loading callback, regardless of which config is active.
    End Rem
    Function SetLoadCSSCallback(func:String(src:String, baseUrl:String, user:Object), user:Object = Null)
        loadCSSCallback = func
        loadCSSUser = user
    End Function

    Function SetBaseUrlCallback(func:String(url:String, user:Object), user:Object = Null)
        baseUrlCallback = func
        baseUrlUser = user
    End Function

    Rem
    bbdoc: Gets the base font size used for rendering HTML content.
    about: The base font size is used as the reference size for relative font sizes in HTML content.
    End Rem
    Method GetBaseFontSize:Float()
        Return bmx_ImHTML_Config_GetBaseFontSize(configPtr)
    End Method

    Rem
    bbdoc: Sets the base font size used for rendering HTML content.
    about: The base font size is used as the reference size for relative font sizes in HTML content.
    Changing this will affect the size of all text rendered in HTML, unless overridden by specific font settings or inline styles.
    End Rem
    Method SetBaseFontSize(size:Float)
        bmx_ImHTML_Config_SetBaseFontSize(configPtr, size)
    End Method

    Rem
    bbdoc: Gets the default font family used for rendering HTML content.
    about: The default font family is used for rendering text in HTML content that does not have a specific font family set.
    It provides the regular, bold, italic, and bold-italic fonts to be used for rendering text with different styles.

    If the default font family is not set, the renderer will fall back to using the default ImGui font for all text rendering in HTML content.
    End Rem
    Method GetDefaultFont:TImHTMLFontFamily()
        Return New TImHTMLFontFamily(bmx_ImHTML_Config_GetDefaultFont(configPtr))
    End Method

    Rem
    bbdoc: Sets the default font family used for rendering HTML content.
    about: The default font family is used for rendering text in HTML content that does not have a specific font family set.
    It provides the regular, bold, italic, and bold-italic fonts to be used for rendering text with different styles.

    If the default font family is not set, the renderer will fall back to using the default ImGui font for all text rendering in HTML content.
    End Rem
    Method SetDefaultFont(family:TImHTMLFontFamily)
        bmx_ImHTML_Config_SetDefaultFont(configPtr, family.familyPtr)
    End Method

    Rem
    bbdoc: Gets a named font family from the config, based on CSS font family names.
    about: The font family name should correspond to a CSS font family name. For example, 'serif', 'sans-serif', 'monospace', or any custom name you want to use in your HTML content.
    If a font family with the specified name does not exist in the config, this method will return #Null.
    End Rem
    Method GetFontFamily:TImHTMLFontFamily(name:String)
        Local famPtr:Byte Ptr = bmx_ImHTML_Config_GetFontFamily(configPtr, name)
        If famPtr Then
            Return New TImHTMLFontFamily(famPtr)
        End If
        Return Null
    End Method

    Rem
    bbdoc: Sets a named font family in the config, based on CSS font family names.
    about: The font family name should correspond to a CSS font family name. For example, 'serif', 'sans-serif', 'monospace', or any custom name you want to use in your HTML content.
    You can set multiple font families with different names, and then reference them in your HTML content using the 'font-family' CSS property.
    If you set a font family with a name that already exists in the config, it will overwrite the existing font family for that name.
    End Rem
    Method SetFontFamily(name:String, family:TImHTMLFontFamily)
        bmx_ImHTML_Config_SetFontFamily(configPtr, name, family.familyPtr)
    End Method

    Function _LoadImage(src:String, baseUrl:String) { nomangle }
        If Not imageCache Then
            Return
        End If

        If baseUrlCallback Then
            baseUrl = baseUrlCallback(baseUrl, baseUrlUser)
        End If

        If baseUrl Then
            src = TPath.FromString(baseUrl).Join(src).ToString()
        End If

        ' already loaded?
        If imageCache.Contains(src) Then
            Return
        End If

        imageCache.LoadFromFile(src, src)
    End Function

    Function _GetImageMeta:SImHTMLImageMeta(src:String, baseUrl:String) { nomangle }
        Local meta:SImHTMLImageMeta

        If Not imageCache Then
            Return meta
        End If

        If baseUrlCallback Then
            baseUrl = baseUrlCallback(baseUrl, baseUrlUser)
        End If

        If baseUrl Then
            src = TPath.FromString(baseUrl).Join(src).ToString()
        End If

        Local entry:TImGuiImageEntry
        If Not imageCache.TryGetValue(src, entry) Then
            Return meta
        End If

        meta.width = entry.GetWidth()
        meta.height = entry.GetHeight()

        Return meta
    End Function

    Function _GetImageTexture:ULong(src:String, baseUrl:String) { nomangle }
        If Not imageCache Then
            Return 0
        End If

        If baseUrlCallback Then
            baseUrl = baseUrlCallback(baseUrl, baseUrlUser)
        End If

        If baseUrl Then
            src = TPath.FromString(baseUrl).Join(src).ToString()
        End If

        Return imageCache.GetTextureID(src)
     End Function

     Function _LoadCSS:String(src:String, baseUrl:String) { nomangle }
        If loadCSSCallback Then
            Return loadCSSCallback(src, baseUrl, loadCSSUser)
        End If
        Return ""
     End Function

End Type

Struct SImHTMLImageMeta
    Field width:Int
    Field height:Int
End Struct

Rem
bbdoc: Represents a font family used for rendering text in HTML content.
about: It contains the regular, bold, italic, and bold-italic fonts that can be used for rendering text with different styles.
End Rem
Type TImHTMLFontFamily

    Field familyPtr:Byte Ptr
Private
    Method New(familyPtr:Byte Ptr)
        Self.familyPtr = familyPtr
    End Method
Public
    Method Delete()
        If familyPtr Then
             bmx_ImHTML_FontFamily_Free(familyPtr)
             familyPtr = Null
        End If
    End Method
    
    Rem
    bbdoc: Creates a new #TImHTMLFontFamily with empty font slots.
    End Rem
    Function Create:TImHTMLFontFamily()
        Return New TImHTMLFontFamily(bmx_ImHTML_FontFamily_Create())
    End Function

    Rem
    bbdoc: Gets the font used for regular text style in this font family.
    End Rem
    Method GetRegular:TImFont()
        Local fontPtr:Byte Ptr = bmx_ImHTML_FontFamily_GetRegular(familyPtr)
        If fontPtr Then
            Return TImFont._Create(fontPtr)
        End If
        Return Null
    End Method

    Rem
    bbdoc: Gets the font used for bold text style in this font family.
    End Rem
    Method GetBold:TImFont()
        Local fontPtr:Byte Ptr = bmx_ImHTML_FontFamily_GetBold(familyPtr)
        If fontPtr Then
            Return TImFont._Create(fontPtr)
        End If
        Return Null
    End Method

    Rem
    bbdoc: Gets the font used for italic text style in this font family.
    End Rem
    Method GetItalic:TImFont()
        Local fontPtr:Byte Ptr = bmx_ImHTML_FontFamily_GetItalic(familyPtr)
        If fontPtr Then
            Return TImFont._Create(fontPtr)
        End If
        Return Null
    End Method

    Rem
    bbdoc: Gets the font used for bold-italic text style in this font family.
    End Rem
    Method GetBoldItalic:TImFont()
        Local fontPtr:Byte Ptr = bmx_ImHTML_FontFamily_GetBoldItalic(familyPtr)
        If fontPtr Then
            Return TImFont._Create(fontPtr)
        End If
        Return Null
    End Method

    Rem
    bbdoc: Sets the font used for regular text style in this font family.
    about: If #Null is passed, it will clear the regular font slot for this family.
    End Rem
    Method SetRegular(font:TImFont)
        If font Then
            bmx_ImHTML_FontFamily_SetRegular(familyPtr, font.handle)
        Else
            bmx_ImHTML_FontFamily_SetRegular(familyPtr, Null)
        End If
    End Method

    Rem
    bbdoc: Sets the font used for bold text style in this font family.
    about: If #Null is passed, it will clear the bold font slot for this family.
    End Rem
    Method SetBold(font:TImFont)
        If font Then
            bmx_ImHTML_FontFamily_SetBold(familyPtr, font.handle)
        Else
            bmx_ImHTML_FontFamily_SetBold(familyPtr, Null)
        End If
    End Method

    Rem
    bbdoc: Sets the font used for italic text style in this font family.
    about: If #Null is passed, it will clear the italic font slot for this family.
    End Rem
    Method SetItalic(font:TImFont)
        If font Then
            bmx_ImHTML_FontFamily_SetItalic(familyPtr, font.handle)
        Else
            bmx_ImHTML_FontFamily_SetItalic(familyPtr, Null)
        End If
    End Method

    Rem
    bbdoc: Sets the font used for bold-italic text style in this font family.
    about: If #Null is passed, it will clear the bold-italic font slot for this family.
    End Rem
    Method SetBoldItalic(font:TImFont)
        If font Then
            bmx_ImHTML_FontFamily_SetBoldItalic(familyPtr, font.handle)
        Else
            bmx_ImHTML_FontFamily_SetBoldItalic(familyPtr, Null)
        End If
    End Method

End Type
