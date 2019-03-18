" 'init.vim' -- vimrc
" Description: Initial startup commands for neovim

let mapleader = ","
set encoding=UTF-8

" Change Behaviors: {{{
if &compatible
    set nocompatible
endif
set wildmode=longest,list,full " Text-completion
setlocal foldmethod=syntax     " Folding
set hlsearch                   " Highlight searched words
set incsearch                  " Search whilst typing
set splitbelow splitright      " Don't move panes weirdly
set hidden
set smartcase
" }}}

" Tabs: {{{
set vb t_vb=
set ts=4 sts=4 sw=4 expandtab
" }}}

" UI Appearance: {{{

" Syntax: {{{
syntax on
colorscheme Theme
set t_Co=256
"set showmatch
" }}}

" Status: {{{
set showmode
source ~/.config/nvim/statusline.vim
" }}}

" VisibleEOL: {{{
" set list
" set listchars=tab:▸\ ,eol:¬
" highlight ExtraWhitespace ctermbg=131
" highlight NonText ctermfg=7 ctermbg=none
" End of file tildes & end of line return character
" }}}

" Splits: {{{
set fillchars+=vert:\|
highlight vertsplit ctermfg=8 ctermbg=8
" }}}

" Ruler: {{{
set number
set relativenumber
set ruler

" Permanent Gutter: {{{
autocmd BufRead,BufNewFile * setlocal signcolumn=yes
autocmd FileType tagbar,nerdtree setlocal signcolumn=no
" }}}
" }}}

" Cursor: {{{
"let &t_SI = "\e[5 q"
"let &t_EI = "\e[1 q"
set ttimeoutlen=0
set modeline
set mouse=a
"  set mouse=
set cursorline

if exists('$TMUX')
    let &t_SI = "\ePtmux;\e\e[5 q\e\\"
    let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[1 q"
endif
" }}}
" }}}

" Filetype: {{{
filetype plugin on
filetype on
" }}}

" Plugins: {{{
set runtimepath+=~/.config/nvim/dein

"dein Scripts-----------------------------
" Required:
set runtimepath+=/home/wd/.config/nvim/dein-cache/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/wd/.config/nvim/dein-cache')
    call dein#begin('/home/wd/.config/nvim/dein-cache')

    " Let dein manage dein
    " Required:
    call dein#add('/home/wd/.config/nvim/dein-cache/repos/github.com/Shougo/dein.vim')

    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    let g:deoplete#enable_at_startup = 1
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/defx.nvim')
    call dein#add('deoplete-plugins/deoplete-clang')
    call dein#add('deoplete-plugins/deoplete-go')
    call dein#add('deoplete-plugins/deoplete-jedi')

    call dein#add('Chiel92/vim-autoformat')
    call dein#add('yggdroot/indentline')

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

if has('nvim')
    " Call: {{{
    "call plug#begin('~/.config/nvim/plugged')
    "" Deoplete: {{{
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "Plug 'Shougo/neoinclude.vim'
    ""Plug 'Shougo/deoplete-clangx'
    "Plug 'sebastianmarkow/deoplete-rust'
    "Plug 'fszymanski/deoplete-emoji'
    "Plug 'wokalski/autocomplete-flow'
    "Plug 'Shougo/neco-vim'
    "" }}}

    "" Linting And Highlighting: {{{
    "Plug 'sheerun/vim-polyglot'
    "Plug 'w0rp/ale'
    "Plug 'octol/vim-cpp-enhanced-highlight'
    "" }}}

    "" Git: {{{
    "Plug 'jreybert/vimagit'
    "Plug 'airblade/vim-gitgutter'
    "Plug 'tpope/vim-fugitive'
    "" }}}

    "" UI Navigation: {{{
    "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    "Plug 'junegunn/fzf.vim'
    ""Plug 'scrooloose/nerdtree'

    "Plug 'christoomey/vim-tmux-navigator'
    "" }}}

    "" Appearance: {{{
    "Plug 'Chiel92/vim-autoformat'
    "Plug 'yggdroot/indentline'
    "Plug 'google/vim-searchindex'
    ""Plug 'mhinz/vim-startify' " Kinda cool -- keep an eye on -- use once more robust
    "" }}}

    "" InText Navigation: {{{
    "Plug 'scrooloose/nerdcommenter'
    "Plug 'terryma/vim-multiple-cursors'
    "Plug 'tpope/vim-surround'
    "Plug 'Raimondi/delimitMate'
    "Plug 'justinmk/vim-sneak'
    "Plug 'mattn/emmet-vim'
    "Plug 'chaoren/vim-wordmotion'
    "" }}}

    "" Other: {{{
    "Plug 'vimwiki/vimwiki'
    "" }}}

    "" Untested: {{{
    ""Plug 'hecal3/vim-leader-guide'
    ""Plug 'svermeulen/vim-yoink'
    ""Plug 'chrisbra/unicode.vim'
    ""Plug 'zefei/vim-wintabs'
    ""Plug 'terryma/vim-smooth-scroll'
    ""Plug 'jceb/vim-orgmode'
    ""Plug 'thaerkh/vim-workspace'
    ""Plug 'tpope/vim-obsession'
    ""Plug 'gcmt/wildfire.vim'
    ""Plug 'sodapopcan/vim-twiggy'
    ""Plug 'terryma/vim-expand-region'
    ""Plug 'kristijanhusak/defx-icons'
    ""Plug 'ryanoasis/vim-devicons'
    "Plug 'Shougo/defx.nvim'
    ""Plug 'reedes/vim-pencil'
    ""Plug 'junegunn/gv.vim'
    ""Plug 'dhruvasagar/vim-zoom'
    ""Plug 'machakann/vim-sandwich'
    ""Plug 'kana/vim-textobj-function'
    ""Plug 'rhysd/vim-operator-surround'
    ""Plug 'Konfekt/FastFold'
    ""Plug 'lambdalisue/suda.vim'
    ""Plug 'gcmt/taboo.vim'
    ""Plug 'rhysd/clever-f.vim'
    ""Plug 'kana/vim-textobj-user'
    ""Plug 'tpope/vim-repeat'
    ""Plug 'chaoren/vim-wordmotion'
    ""Plug 'skywind3000/quickmenu.vim'
    ""Plug 'honza/vim-snippets'
    "Plug 'SirVer/ultisnips'
    "" }}}

    "call plug#end()
    " }}}

    " Configs: {{{
    let NERDTreeShowHidden=1 " Show hidden files
    let g:deoplete#enable_at_startup = 1
    "let g:deoplete#disable_auto_complete = 1

    "call deoplete#custom#option({
    "\ 'auto_complete_delay': 0,
    "\ 'smart_case': v:true,
    "\ })
    let g:indentLine_color_term = 7
    let g:indentLine_setColors = 7
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    " }}}
endif
" }}}

"   Split movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"   Refresh
map <leader>r :so ~/.config/nvim/init.vim \| Autoformat<CR>

"   Spell-check | GUI FAGS BTFO | orthography
map <leader>o :setlocal spell! spelllang=en_us<CR>

"   Bibliography | Need to read into this more
map <leader>b :vsp<space>$BIB<CR>

"   URLView
map <leader>u :w<Home> silent <End> !urlview<CR>

"   Compile doc
map <leader>c :w! \| !compiler <c-r>%<CR><CR>

"   Open relative .pdf, .html, etc......
map <leader>p :!opout <c-r>%<CR><CR>

"   NERDTree toggle
" map <leader>b :NERDTreeToggle<CR>

"   Toggle Pasting
set pastetoggle=<leader>v

"   GTFO Ugly Shidd!!
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd VimLeave *.tex !texclear %

"   Delete Trailing Whitespace
autocmd BufWritePre * %s/\s\+$//e

"   Format Code
autocmd BufWrite * :Autoformat

"   Disable Arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"   INSERT macros
"inoremap " ""<left>
"inoremap ' ''<left>

"inoremap ( ()<left>
"inoremap () ()
"inoremap (<CR> (<CR>)<ESC>O
"inoremap (;<CR> (<CR>);<ESC>O
"inoremap (,<CR> (<CR>),<ESC>O

"inoremap { {}<left>
"inoremap {} {}
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
"inoremap {,<CR> {<CR>},<ESC>O

"inoremap [ []<left>
"inoremap [] []
"inoremap [<CR> [<CR>]<ESC>O
"inoremap [;<CR> [<CR>];<ESC>O
"inoremap [,<CR> [<CR>],<ESC>O
