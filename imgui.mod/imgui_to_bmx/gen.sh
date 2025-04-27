
python3 ../dear_bindings/dear_bindings.py -o dcimgui --imgui-include-dir ../imgui/ ../imgui/imgui.h
python3 ../dear_bindings/dear_bindings.py --backend --include ../imgui/imgui.h --imconfig-path ../imgui/imconfig.h -o backends/dcimgui_impl_sdlrenderer2 ../imgui/backends/imgui_impl_sdlrenderer2.h
python3 ../dear_bindings/dear_bindings.py --backend --include ../imgui/imgui.h --imconfig-path ../imgui/imconfig.h -o backends/dcimgui_impl_sdl2 ../imgui/backends/imgui_impl_sdl2.h
