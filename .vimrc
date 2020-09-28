"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

syntax on
filetype plugin on
filetype indent on

" =============================================

" VIM PLUG:

" Automatic Installation of vim-plug.
" If this doesn't work make sure you got git.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('/home/maks/.vim/bundle')
Plug 'arecarn/vim-crunch'
Plug 'arecarn/vim-selection'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'dusans/vim-hardmode'
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'jceb/vim-orgmode'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-journal'
Plug 'kovetskiy/sxhkd-vim'
Plug 'kshenoy/vim-signature'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'metakirby5/codi.vim'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'roxma/vim-window-resize-easy'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'unblevable/quick-scope'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Temporarily on leave.
" Plug 'jpalardy/vim-slime'
" Plug 'RRethy/vim-illuminate'
" Plug 'skammer/vim-css-color'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'vim-syntastic/syntastic'
call plug#end()

" =============================================

" PERSONAL SETTINGS:

" Enable syntax highlighting.
syntax enable

" Leader.
let maplocalleader=',' " For vim-orgmode
let mapleader=' '
let g:mapleader=' '

" Helps when someone using this .vimrc somewhere else.
set nocompatible

" Sets how many line of history VIM has to remember.
set history=1000

" Set to auto read when a file is changed from the outside.
set autoread

" Show current position in bottom right corner.
set ruler

" Show active line for better visibility.
set cursorline

" Height of the command bar.
set cmdheight=1

" Something for buffers.
set hidden

" Something for regex.
set magic

" Use spaces instead of tabs.
set expandtab
set smarttab " And be smart about the tabs.

set shiftwidth=4 " how much >> shifts, if zero it equals tabstop.
set softtabstop=4
set tabstop=4

set smartindent
set autoindent

set wrap
set linebreak
set breakat=default
set textwidth=200
set wrapmargin=3

set number
set relativenumber

" Enables mouse usage
set mouse=a

" Search config.
set nohlsearch
set showmatch  " Highlight matching parens.
set mat=2      " Matching parens for 2 tenths of a sec.
set ignorecase " Ignore case while searching.
set smartcase  " Ignore case while searcing but not if caps.
set incsearch

" Redraw only when needed. Makes for faster macros on large number of lines.
set lazyredraw

" View substitutions as they happen.
set inccommand=nosplit

" Folding : cancel it with :set fdm=manual
" close all: zM || open all: zR
set foldmethod=indent
set nofoldenable " Open file unfolded.

" Improve visual-block behaviour.
set virtualedit=block

" =============================================

" PERSONAL MAPS:

" Antipatterns - stop doing these.
" Use <C-h> instead of backspace.
inoremap <BS> <NOP>
" PLUGIN:vim-hardmode - this one is here because it's special.
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Insert line below but dont move into it.
" By default <C-m> and <C-j> behave in the same way.
inoremap <C-j> <C-m><Up>

" Buffers and Tabs.
nnoremap <Leader>o :bnext<CR>
nnoremap <Leader>i :bprevious<CR>
nnoremap <Leader>p :cnext<CR>
nnoremap <Leader>u :cprevious<CR>
" Close the current buffer and move to the previous one - like closing a tab.
nnoremap <Leader>bq :bp <BAR> bd #<CR>
" Quickly find a buffer.
nnoremap gb :ls<CR>:b<Space>
" Useful mappings for managing tabs.
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove<CR>
map <leader>t<leader> :tabnext<CR>

" Move one visible line (if there is a break in the line).
nnoremap k gk
nnoremap j gj

" Clipboard for cross-terminal support.
set clipboard=unnamed
set clipboard^=unnamed

" Better undo.
nnoremap U <C-r>

" Better yank.
nmap Y y$

" Indent with ease.
map <leader>l >>
map <leader>h <<

" Better Scrolling.
noremap <C-j> <C-e>j
noremap <C-k> <C-y>k

" Improve marks.
nnoremap ' `
" nnoremap ` '

" Bracket config.
nnoremap dir di[
nnoremap cir ci[
nnoremap dia di<
nnoremap cia ci<

" Default gR mapping also replaces text with tabs. Now it works when pressing R.
nnoremap gR R
nnoremap R gR

" Moving between windows.
nnoremap <leader>sh :split<CR>
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wo :only<CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>w
nnoremap <leader>wk <C-w>W
nnoremap <leader>wl <C-w>l

" Neovim Terminal.
tnoremap <ESC> <C-\><C-n>
tnoremap <C-f> <C-\><C-n>
tnoremap fd <C-\><C-n>

" =============================================

" PERSONAL COMMANDS:

" Compile and run c.
command GccRun !gcc % && ./a.out

" Show me where the cursor is.
command Show :set cursorcolumn! "cursorline!

" Folds - toggle them with za.
command Fold :set foldmethod=indent

" Memeology commands.
command -range=% Vaporize <line1>,<line2>s/\w/& /g | <line1>,<line2>normal $x
command -range=% MomIsHome <line1>,<line2>s/\(\w\) /\1/g
command -range=% Jaydenize <line1>,<line2>s/\<\w\+\>/\u\L&/g
command -range=% Smart <line1>,<line2>s/\(.\)\(.\)\?/\L\1\U\2/g

" :W sudo saves the file and prompts for password- no more permission denied.
command W w !sudo tee % > /dev/null

" Distill 4chan source into links for scraping.
function Distill_function()
  :%s/>/>\r/g
  :v/File: /d
  :%s/^.*href="/https:/
  :%s/".*$//
endfunction
command Distill :call Distill_function()

" =============================================

" PLUGIN CONFIGS:

" PLUGIN:vim-minimap
let g:minimap_toggle='<leader>mm'

" PLUGIN:python-mode
let g:pymode_python='python3'
let g:pymode_syntax=1
let g:pymode_syntax_all=1

" PLUGIN:vim-indent-guides
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_default_mapping = 0
nnoremap <leader>IG :IndentGuidesToggle<CR>

" PLUGIN:deoplete
let g:deoplete#enable_at_startup = 1

" PLUGIN:vim-sandwich
runtime macros/sandwich/keymap/surround.vim
runtime macros/sandwich/ftplugin/tex.vim
" NOTE: for latex use 'e' for Environment : ysiweequation<C-j>

" PLUGIN:quick-scope - helps with movement to chars
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" PLUGIN:vim-highlightedyank
let g:highlightedyank_highlight_duration = 450

" PLUGIN:vim-latex-live-preview
let g:livepreview_previewer = 'zathura'
set updatetime=1000

" PLUGIN:vim-airline
" Fonts.
let g:airline_powerline_fonts = 1
" Enable the list of buffers.
let g:airline#extensions#tabline#enabled = 1
" Show just the filename.
let g:airline#extensions#tabline#fnamemod = ':t'

" PLUGIN:gruvbox : https://github.com/morhetz/gruvbox/wiki/Configuration
colorscheme gruvbox
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_contrast_light="medium"
let g:gruvbox_bold=1
" let g:gruvbox_italic=1
" let g:gruvbox_italicize_comments=1
let g:gruvbox_invert_selection=0 " If 1 selection bg is color of text and vice versa
let &t_Co=256
set termguicolors
set background=dark

" PLUGIN:vim-better-whitespace
command FixWhitespace :StripWhitespace
hi ExtraWhitespace guibg=#fb4934

" PLUGIN:nerdcommenter
" Add spaces after comment delimeter by default.
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments - don't get what this actually does
let g:NERDCompactSexyComs = 1
" Align comment delimeters flush left
let g:NERDDefaultAlign = 'both'
" Allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1
" Trim residual trailing whitespace after uncommenting
let g:NERDTrimTrailingWhitespace = 1
map <leader>ca <Plug>NERDCommenterAppend
map <leader>cA <Plug>NERDCommenterAltDelims
map <leader>c<leader> <Plug>NERDCommenterToggle
vmap <leader>c<leader> <Plug>NERDCommenterToggle<CR>gv
" <C-_> is actually <C-/> but vim recognizes them as the same.
map <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" PLUGIN:vim-multiple-cursors
" Quick guide: go to word, click C-n, highlight words,  C-x skips one...
" if you want a, i press v before, if you want c, s, A, I, you can do them immediately
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" PLUGIN:vim-easymotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 "this makes the up/down in line with cursor
omap <Leader>/ <Plug>(easymotion-overwin-tn)
vmap <Leader>/ <Plug>(easymotion-overwin-tn)
nmap <Leader>/ <Plug>(easymotion-overwin-tn)
map  <Leader>/ <Plug>(easymotion-sn)
vmap s <Plug>(easymotion-s2)
nmap S <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>f <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" PLUGIN:vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" PLUGIN:fzf
nnoremap <C-p> :FZF

" PLUGIN:incsearch
nmap / <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)

" PLUGIN:ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/.vim/bundle/mySnippets']
let g:UltiSnipsEditSplit="horizontal"
let g:snips_author="Maks Kamnikar"
let g:snips_email="maks.kamnikar@protonmail.com"
let g:snips_github="https://github.com/mkamnikar"

" PLUGIN:vim-window-resize-easy
" keys: < > - + = _ |
nmap <leader>w <C-w>

" PLUGIN:vim-illuminate
let g:Illuminate_highlightUnderCursor=1
let g:Illuminate_delay=150

" PLUGIN:nerdtree
" nnoremap <leader>nt :NERDTreeToggle<CR>

" =============================================

" PERSISTENT UNDO:
if has("autocmd")
  au BufReadPost * if line("'\'") > 1 && line("'\'") <= line("$") | exe "normal! g'\"" | endif
endif

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

" =============================================

" PERSONAL FILETYPE SPECIFIC CONFIG:

" TEX:
" Make new tex files with skeleton.
augroup TeX
  au BufNewFile *.tex 0r ~/.vim/skeletons/skeleton_tex
augroup end
" Enable the use of tags.
autocmd BufNewFile,BufRead *.tex imap ,, <Esc>/(<++>)<CR>"_c6l
" Don't mess around with plaintex and tex and whatnot.
let g:tex_flavor='latex'
autocmd FileType plaintex set ft=tex
" TeX tabs are only 2 spaces long.
autocmd FileType html setlocal tabstop=2 shiftwidth=2

" C:
" Make new c files with skeleton.
augroup C
  au BufNewFile *.c 0r ~/.vim/skeletons/skeleton_c
augroup end
" Enable the use of tags.
autocmd BufNewFile,BufRead *.c imap ,, <Esc>/(<++>)<CR>"_c6l
" Save, compile and execute.
autocmd BufNewFile,BufRead *.c nnoremap <Leader>R :w<CR>:!gcc % && ./%.out<CR>
" Save and compile
autocmd BufNewFile,BufRead *.c nnoremap <Leader>c :w<CR>:!gcc % -o %.out<CR>
" Execute
autocmd BufNewFile,BufRead *.c nnoremap <Leader>r :!./%.out<CR>

" C++:
" Make new cpp files with skeleton.
augroup CPP
  au BufNewFile *.cpp 0r ~/.vim/skeletons/skeleton_cpp
augroup end
" Save, compile and execute.
autocmd BufNewFile,BufRead *.cpp nnoremap <Leader>R :w<CR>:!g++ % && ./%.out<CR>
" Save and compile
autocmd BufNewFile,BufRead *.cpp nnoremap <Leader>c :w<CR>:!g++ % -o %.out<CR>
" Execute
autocmd BufNewFile,BufRead *.cpp nnoremap <Leader>r :!./%.out<CR>

" HTML:
augroup html
  au BufNewFile *.html 0r ~/.vim/skeletons/skeleton_html
augroup end
" HTML tab are only 2 spaces long.
autocmd FileType html setlocal tabstop=2 shiftwidth=2

" PYTHON:
let g:python3_host_prog='/usr/bin/python3'
autocmd FileType python let g:NERDSpaceDelims = 0

" CALENDAR:
" Filetype setting is needed for calendar specific ulti-snips.
autocmd BufRead *.calendar set filetype=calendar

" CONF: (=plaintext files without file extension.)
" Prevents inserting comments on newline after comment.
autocmd FileType conf set formatoptions-=cro

" VIM: .vimrc's filetype
autocmd FileType vim set formatoptions-=cro
" Tabs are only 2 spaces long.
autocmd FileType vim setlocal tabstop=2 shiftwidth=2

" JOURNAL: Tasks and Notes
" Set specific filetype only for Notes and Tasks.
autocmd BufRead,BufNewFile ~/Documents/Tasks/* set filetype=journal
autocmd BufRead,BufNewFile ~/Documents/Notes/* set filetype=journal

" ORG: Tasks, TODOs, agendas
autocmd BufRead *.org nnoremap <leader>ep :OrgExportToPDF<CR>

" VIMCLIP: Edit in vim buffer instead of in web boxes.
" Open the vim buffer already in insert mode.
autocmd BufRead vimclip* start

" =============================================

" AUTOMATICALLY RUNS COMMANDS AFTER CERTAIN FILES ARE SAVED:

" Fix trailing whitespace before exiting and saving.
" This could be completed without plugins but it's pretty hacky
autocmd BufWritePre * StripWhitespace

" Source after saving .zshrc
autocmd BufWritePost ~/.zshrc !source ~/.zshrc

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 -x sxhkd

" Update i3blocks after a task/todo is saved.
autocmd BufWritePost ~/Documents/Tasks/* !pkill -RTMIN+1 i3blocks

" Reload i3 config after saving.
autocmd BufWritePost ~/.config/i3/config !i3 reload

" =============================================

" TEST CONFIGURATION:
