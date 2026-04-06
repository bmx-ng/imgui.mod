SuperStrict

Framework BRL.StandardIO
Import ImGui.ImHTML
import ImGui.ImGuiSDL2Renderer
import SDL.sdlrendermax2d
Import Image.Jpg

Graphics 1424, 768,,,SDL_WINDOW_ALLOW_HIGHDPI

ImGui_CreateContext()

' Setup Dear ImGui style
ImGui_StyleColorsDark()

Local renderer:TSDLRenderer = SDLRenderMax2DDriver().GetRenderer()
Local window:TSDLWindow = SDLRenderMax2DDriver().GetWindow()

ImGui_ImplSDL2_InitForSDLRenderer(window, renderer)
ImGui_ImplSDLRenderer2_Init(renderer)

Local io:TImGuiIO = ImGui_GetIO()

Local fontAtlas:TImFontAtlas = io.Fonts()
' fontAtlas.AddFontDefault(Null)
Local uiFont:TImFont = fontAtlas.AddFontFromFileTTF("../imhtml/fonts/NotoSans-Regular.ttf", 18.0, Null, null)
Local editorFont:TImFont = fontAtlas.AddFontFromFileTTF("../imhtml/fonts/JetBrainsMono-Regular.ttf", 18.0, Null, null)

Local htmlConfig:TImHTMLConfig = ImHTML_GetConfig()
htmlConfig.SetBaseFontSize(20.0)

Local mono:TImHTMLFontFamily = TImHTMLFontFamily.Create()
mono.SetRegular(editorFont)
htmlConfig.SetFontFamily("monospace", mono)

Local imageBackend:TSDL2RenderImGuiImageBackend = New TSDL2RenderImGuiImageBackend(renderer)
Local imageCache:TImGuiImageCache = New TImGuiImageCache(imageBackend)

TimHtmlConfig.SetImageCache(imageCache)

While Not KeyHit(KEY_ESCAPE)

	Cls

	ImGui_ImplSDLRenderer2_NewFrame()
	ImGui_ImplSDL2_NewFrame()
	ImGui_NewFrame()

	ImGui_Begin("Html Demo", Null, EImGuiWindowFlags._None)

	ImHtml_Canvas("canvas1", """
	<html>
		<head>
			<style>
				body {
					font-family: Arial, sans-serif;
					background-color: #201010;
					padding: 20px;
				}
				h1 {
					color: #ddd;
				}
				p {
					color: #fff;
				}
				a {
					color: #007BFF;
					text-decoration: none;
				}
				a:hover {
					text-decoration: underline;
				}
				.code-block {
					font-family: monospace;
					color: #00FFFF;
				}
			</style>
		</head>
		<body>
			<h1>Hello, ImGui HTML!</h1>
			<p>This is a simple HTML canvas rendered within ImGui.</p>
			<img src="../imhtml/images/example.jpg" alt="Example Image" width="300">
			<p>Click <a href="https://www.example.com">here</a> to visit example.com.</p>
			<pre class="code-block">
				// Sample code block
				function greet() {
					console.log("Hello, world!");
				}
			</pre>
		</body>
	</html>
	""")
	ImGui_End()

	ImGui_Begin("Html Demo 2", Null, EImGuiWindowFlags._None)

	ImHtml_Canvas("canvas2", """
	<html>
		<head>
		<style>
			body {
			margin: 20px;
			font-family: sans-serif;
			background: #20242a;
			color: white;
			}

			.swatch {
			width: 320px;
			height: 100px;
			margin-bottom: 20px;
			padding: 12px;
			box-sizing: border-box;
			border: 2px solid #ffffff40;
			border-radius: 16px;
			color: white;
			font-size: 18px;
			}

			.horizontal {
			background: linear-gradient(to right, #ff4d4d, #4d79ff);
			}

			.vertical {
			background: linear-gradient(to bottom, #38b000, #ffd60a);
			}

			.diagonal {
			background: linear-gradient(45deg, #ff006e, #8338ec, #3a86ff);
			}

			.hard-stops {
			background: linear-gradient(
				to right,
				#ff0000 0%,
				#ff0000 33%,
				#00ff00 33%,
				#00ff00 66%,
				#0000ff 66%,
				#0000ff 100%
			);
			}

			.soft-multistop {
			background: linear-gradient(
				to right,
				#ff0000 0%,
				#ffff00 25%,
				#00ff00 50%,
				#00ffff 75%,
				#0000ff 100%
			);
			}

			.rounded-diagonal {
			width: 320px;
			height: 120px;
			padding: 12px;
			border: 2px solid #ffffff40;
			border-radius: 32px;
			background: linear-gradient(135deg, #f72585, #7209b7, #3a0ca3, #4361ee);
			color: white;
			font-size: 18px;
			}
		</style>
		</head>
		<body>
			<div class="swatch horizontal">Horizontal</div>
			<div class="swatch vertical">Vertical</div>
			<div class="swatch diagonal">Diagonal</div>
			<div class="swatch hard-stops">Hard stops</div>
			<div class="swatch soft-multistop">Soft multi-stop</div>
			<div class="rounded-diagonal">Rounded diagonal</div>
		</body>
	</html>
	""")

	ImHtml_Canvas("canvas4", """
	<html>
	<head>
	<style>
		body {
		margin: 20px;
		background: #20242a;
		color: white;
		font-family: sans-serif;
		}

		.swatch {
		width: 320px;
		height: 140px;
		margin-bottom: 20px;
		border: 2px solid #ffffff40;
		border-radius: 24px;
		padding: 12px;
		}

		.basic {
		background: radial-gradient(circle, red 0%, blue 100%);
		}

		.offset {
		background: radial-gradient(circle at 30% 30%, #ffff00, #ff00ff, #0000ff);
		}

		.ellipse {
		background: radial-gradient(ellipse at center, #00ffcc 0%, #0044ff 100%);
		}

		.hard {
		background: radial-gradient(circle, #ff0000 0%, #ff0000 35%, #00ff00 35%, #00ff00 70%, #0000ff 70%, #0000ff 100%);
		}
	</style>
	</head>
	<body>
	<div class="swatch basic">Basic</div>
	<div class="swatch offset">Offset</div>
	<div class="swatch ellipse">Ellipse</div>
	<div class="swatch hard">Hard</div>
	</body>
	</html>
	""")

	ImHtml_Canvas("canvas5", """
	<html>
	<head>
	<style>
		body {
		margin: 20px;
		background: #20242a;
		color: white;
		font-family: sans-serif;
		}

		.swatch {
		width: 240px;
		height: 240px;
		margin-bottom: 20px;
		border: 2px solid #ffffff40;
		border-radius: 28px;
		padding: 12px;
		}

		.basic {
		background: conic-gradient(red, yellow, lime, cyan, blue, magenta, red);
		}

		.offset {
		background: conic-gradient(from 45deg at 35% 35%, red, blue, green, red);
		}

		.hard {
		background: conic-gradient(red 0deg 120deg, green 120deg 240deg, blue 240deg 360deg);
		}

		.smooth {
		background: conic-gradient(from 90deg, #ff006e, #8338ec, #3a86ff, #06d6a0, #ffbe0b, #fb5607, #ff006e);
		}
	</style>
	</head>
	<body>
	<div class="swatch basic">Basic</div>
	<div class="swatch offset">Offset</div>
	<div class="swatch hard">Hard</div>
	<div class="swatch smooth">Smooth</div>
	</body>
	</html>
	""")

	ImGui_End()

	ImGui_Render()

	ImGui_ImplSDLRenderer2_RenderDrawData(ImGui_GetDrawData(), renderer)

	Flip
Wend
