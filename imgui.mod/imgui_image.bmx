SuperStrict

Import BRL.Pixmap
Import Collections.HashMap

Import "imgui_internal.bmx"


Enum EImGuiImageSource
	Unknown
	File
	Pixmap
	Stream
	ExternalTexture
	Surface
End Enum

Rem
bbdoc: Represents an image resource that can be used in ImGui rendering
about: Provides methods to retrieve the ImGui texture ID and dimensions, and to destroy the resource when no longer needed.
End Rem
Type TImGuiImageResource Abstract
	Method GetImTextureID:ULong() Abstract
	Method GetWidth:Int() Abstract
	Method GetHeight:Int() Abstract
	Method Destroy() Abstract
End Type

Rem
bbdoc: Represents an entry in the ImGui image cache, containing the image resource and associated metadata.
End Rem
Type TImGuiImageEntry
	Field key:String
	Field resource:TImGuiImageResource
	Field owned:Int
	Field sourceKind:EImGuiImageSource
	Field sourceName:String
	Field userData:Object

	Method IsValid:Int()
		Return resource <> Null
	End Method

	Method GetTextureRef:SImTextureRef()
		If resource Then
			Return New SImTextureRef(resource.GetImTextureID())
		End If
	End Method

	Method GetTextureID:ULong()
		If resource Then
			Return resource.GetImTextureID()
		End If
		Return 0
	End Method

	Method GetWidth:Int()
		If resource Then
			Return resource.GetWidth()
		End If
		Return 0
	End Method

	Method GetHeight:Int()
		If resource Then
			Return resource.GetHeight()
		End If
		Return 0
	End Method

	Method GetSize(width:Int Var, height:Int Var)
		If resource Then
			width = resource.GetWidth()
			height = resource.GetHeight()
		Else
			width = 0
			height = 0
		End If
	End Method
End Type

Rem
bbdoc: Abstract backend for managing image resources in ImGui.
End Rem
Type TImGuiImageBackend Abstract
	Method CreateResourceFromPixmap:TImGuiImageResource(pixmap:TPixmap, sourceName:String = "") Abstract
	Method NormalizeKey:String(key:String)
		Return key
	End Method
End Type


Rem
bbdoc: A cache for images used in ImGui rendering, supporting loading from files and pixmaps, and registration of externally managed resources.
about: 
End Rem
Type TImGuiImageCache
	Field backend:TImGuiImageBackend
	Field entries:THashMap<String, TImGuiImageEntry>

	Rem
	bbdoc: Creates a new image cache with the specified backend.
	End Rem
	Method New(backend:TImGuiImageBackend)
		If backend = Null Then
			Throw "TImGuiImageCache requires a backend"
		End If

		Self.backend = backend
		entries = New THashMap<String, TImGuiImageEntry>
	End Method

	Method NormalizeKey:String(key:String)
		Return backend.NormalizeKey(key)
	End Method

	Rem
	bbdoc: Checks if an image with the specified key exists in the cache.
	End Rem
	Method Contains:Int(key:String)
		key = NormalizeKey(key)
		Return entries.ContainsKey(key)
	End Method

	Rem
	bbdoc: Retrieves the image entry associated with the specified key, or Null if not found.
	End Rem
	Method Get:TImGuiImageEntry(key:String)
		key = NormalizeKey(key)
		Local entry:TImGuiImageEntry
		If entries.TryGetValue(key, entry) Then
			Return entry
		End If
		Return Null
	End Method

	Rem
	bbdoc: Attempts to retrieve the image entry for the specified key, returning #True if found, and populating the provided @entry with the entry.
	End Rem
	Method TryGetValue:Int(key:String, entry:TImGuiImageEntry Var)
		key = NormalizeKey(key)
		Return entries.TryGetValue(key, entry)
	End Method

	Rem
	bbdoc: Retrieves the ImGui texture ID associated with the specified key, or 0 if not found.
	End Rem
	Method GetTextureID:ULong(key:String)
		Local entry:TImGuiImageEntry
		If entries.TryGetValue(NormalizeKey(key), entry) Then
			Return entry.GetTextureID()
		End If
		Return 0
	End Method

	Rem
	bbdoc: Returns the width of the image associated with the specified key, or 0 if not found.
	End Rem
	Method GetWidth:Int(key:String)
		Local entry:TImGuiImageEntry
		If entries.TryGetValue(NormalizeKey(key), entry) Then
			Return entry.GetWidth()
		End If
		Return 0
	End Method

	Rem
	bbdoc: Returns the height of the image associated with the specified key, or 0 if not found.
	End Rem
	Method GetHeight:Int(key:String)
		Local entry:TImGuiImageEntry
		If entries.TryGetValue(NormalizeKey(key), entry) Then
			Return entry.GetHeight()
		End If
		Return 0
	End Method

	Rem
	bbdoc: Retrieves the width and height of the image associated with the specified key, or 0 for both if not found.
	End Rem
	Method GetSize(key:String, width:Int Var, height:Int Var)
		Local entry:TImGuiImageEntry
		If entries.TryGetValue(NormalizeKey(key), entry) Then
			entry.GetSize(width, height)
		Else
			width = 0
			height = 0
		End If
	End Method

	Rem
	bbdoc: Loads an image from a file and adds it to the cache, returning the image entry.
	about: The @path parameter specifies the file path to load the image from.
	The optional @cacheKey parameter allows specifying a custom key for caching; if not provided, the file path will be used as the key.
	End Rem
	Method LoadFromFile:TImGuiImageEntry(path:String, cacheKey:String = "")
		If Not path Then
			Return Null
		End If

		If cacheKey = "" Then
			cacheKey = "file:" + path
		End If

		cacheKey = NormalizeKey(cacheKey)

		Local existing:TImGuiImageEntry
		If entries.TryGetValue(cacheKey, existing) Then
			Return existing
		End If

		Local pixmap:TPixmap = LoadPixmap(path)
		If pixmap = Null Then
			Return Null
		End If

		Local resource:TImGuiImageResource = backend.CreateResourceFromPixmap(pixmap, path)
		If resource = Null Then
			Return Null
		End If

		Local entry:TImGuiImageEntry = New TImGuiImageEntry
		entry.key = cacheKey
		entry.resource = resource
		entry.owned = True
		entry.sourceKind = EImGuiImageSource.File
		entry.sourceName = path

		entries.Add(cacheKey, entry) ' throws on duplicate, but we already checked for that above, so should be safe

		Return entry
	End Method

	Rem
	bbdoc: Loads an image from a pixmap and adds it to the cache, returning the image entry.
	End Rem
	Method LoadFromPixmap:TImGuiImageEntry(key:String, pixmap:TPixmap, sourceName:String = "")
		If pixmap = Null Then
			Return Null
		End If

		key = NormalizeKey(key)
		If key = "" Then
			Return Null
		End If

		Local existing:TImGuiImageEntry
		If entries.TryGetValue(key, existing) Then
			Return existing
		End If

		Local resource:TImGuiImageResource = backend.CreateResourceFromPixmap(pixmap, sourceName)
		If resource = Null Then
			Return Null
		End If

		Local entry:TImGuiImageEntry = New TImGuiImageEntry
		entry.key = key
		entry.resource = resource
		entry.owned = True
		entry.sourceKind = EImGuiImageSource.Pixmap
		entry.sourceName = sourceName

		entries.Add(key, entry) ' throws on duplicate, but we already checked for that above, so should be safe
		Return entry
	End Method

	Rem
	bbdoc: Registers an externally managed image resource with the cache, returning the image entry.
	End Rem
	Method RegisterResource:TImGuiImageEntry(key:String, resource:TImGuiImageResource, owned:Int = False, sourceKind:EImGuiImageSource = EImGuiImageSource.Unknown, sourceName:String = "")
		If resource = Null Then
			Return Null
		End If

		key = NormalizeKey(key)
		If key = "" Then
			Return Null
		End If

		Local existing:TImGuiImageEntry
		If entries.TryGetValue(key, existing) Then
			Return existing
		End If

		Local entry:TImGuiImageEntry = New TImGuiImageEntry
		entry.key = key
		entry.resource = resource
		entry.owned = owned
		entry.sourceKind = sourceKind
		entry.sourceName = sourceName

		entries.Add(key, entry) ' throws on duplicate, but we already checked for that above, so should be safe
		Return entry
	End Method

	Rem
	bbdoc: Removes the image associated with the specified key from the cache, destroying its resource if owned.
	about: Returns #True if the entry was found and removed, or #False if not found.
	End Rem
	Method Remove:Int(key:String)
		key = NormalizeKey(key)

		Local entry:TImGuiImageEntry = Get(key)
		If entry = Null Then
			Return False
		End If

		If entry.owned And entry.resource Then
			entry.resource.Destroy()
		End If

		entries.Remove(key)
		Return True
	End Method

	Rem
	bbdoc: Clears all entries from the cache, destroying resources for any owned entries.
	End Rem
	Method Clear()
		For Local key:String = Eachin entries.Keys()
			Local entry:TImGuiImageEntry
			If entries.TryGetValue(key, entry) Then
				If entry And entry.owned And entry.resource Then
					entry.resource.Destroy()
				End If
			End If
		Next

		entries.Clear()
	End Method

	Rem
	bbdoc: Returns the number of entries currently in the cache.
	End Rem
	Method Count:Int()
		Return entries.Count()
	End Method

	Method Delete()
		Clear()
	End Method

End Type
