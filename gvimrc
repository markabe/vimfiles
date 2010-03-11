" Scrollbar is always off.
set guioptions-=rL

" Keep the horizontal one though.
set guioptions+=b

" Hide toolbar and menus.
set guioptions-=T

" Don't flick cursor.
set guicursor=a:blinkon0

" Color scheme.
colorscheme vividchalk

" Font
if has("gui_gnome")
  set guifont=DejaVu\ Sans\ Mono\ bold\ 11
endif

if has("gui_mac") || has("gui_macvim")
  set guifont=Monaco:h16
endif

if has("gui_win32") || has("gui_win32s")
  set guifont=Consolas:h13:b
  "set enc=utf-8
endif
