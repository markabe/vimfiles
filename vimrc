"Behave somewhat like windows app.
source $VIMRUNTIME/mswin.vim

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"arrow or motion over line breaks
set whichwrap=<,>,h,l,[,] 

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set ignorecase  "case insensitive search
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

set nowrap      "dont wrap lines
set linebreak   "wrap lines at convenient points
set number      "line numbers

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"display tabs and trailing spaces
set list
set listchars=tab:?·,trail:·,nbsp:·

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

let g:CSApprox_loaded = 1

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <C-B> :BufExplorer<cr>

"new tab
nnoremap <C-t> :tabnew<CR>

"make Y consistent with C and D
nnoremap Y y$

" Quick, jump out of insert mode while no one is looking
imap ii <Esc>

" Remap F1 from Help to ESC.  No more accidents
nmap <F1> <Esc>
map! <F1> <Esc>

" Insert current date.
iab <expr> ddate strftime("%m/%d/%Y")
iab <expr> sdate strftime("*%m/%d/%Y*")
iab d: Done: 

" Indent visual block
" The tab version throws errors on startup
vnoremap > >gv
vnoremap < <gv

let mapleader = ","
map <silent> <leader>d :NERDTreeToggle<cr>
map <silent> <leader>f :FuzzyFinderTextMate<CR>
map <silent> <leader>t :TlistToggle<CR>
map <silent> <leader>b :BufExplorerHorizontalSplit<CR>
map <silent> <leader>bb :BufExplorerHorizontalSplit<CR>
map <silent> <leader>k :bd<CR>
nmap <silent> <Leader>cd :cd %:p:h<CR>

" Switch to last buffer
nnoremap <C-Tab> :b#<CR>
inoremap <C-Tab> <Esc>:b#<CR>

" Use motions to move between windows.
nnoremap <C-h> <C-w><Left>
inoremap <C-h> <Esc><C-w><Left>
" <c-l> will also clear highlights.
nnoremap <C-l> :nohls<CR><ESC><C-w><Right>
inoremap <C-l> <C-O>:nohls<CR><Esc><C-w><Right>
inoremap <C-k> <Esc><C-w><Up>
nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
inoremap <C-j> <Esc><C-w><Down>

" Scroll rather than the default PageUp and PageDown.
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

" Switch between tabs left and right.
map L :tabn<CR>
map H :tabp<CR>
" Stop accidents.
map K <Esc>
" Alternte method.
map <C-A-Right> :tabn<CR>
vmap <C-A-Right> <Esc>:tabn<CR>
imap <C-A-Right> <Esc>:tabn<CR>
map <C-A-Left> :tabp<CR>
vmap <C-A-Left> <Esc>:tabp<CR>
imap <C-A-Left> <Esc>:tabp<CR>

"set diffexpr=MyDiff()
" Expand or shrink window.
if bufwinnr(1)
  map + <C-W>+
  map _ <C-W>-
endif

" Auto close braces.
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Omni-completion.
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

" * Load external config
runtime! custom/fuzzy_finder_config.vim
runtime! custom/statusbar_config.vim
runtime! custom/syntastic_config.vim
runtime! custom/taglist_config.vim
runtime! custom/vimshell_config.vim

au BufNewFile,BufRead *.txt setfiletype txt
