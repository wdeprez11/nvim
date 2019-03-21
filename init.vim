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
" }}}

" Permanent Gutter: {{{
autocmd BufRead,BufNewFile * setlocal signcolumn=yes
autocmd FileType tagbar,nerdtree setlocal signcolumn=no
" }}}

" Cursor: {{{
"let &t_SI = "\e[5 q"
"let &t_EI = "\e[1 q"
set ttimeoutlen=0
set modeline
set mouse=a
set cursorline

if exists('$TMUX')
    let &t_SI = "\ePtmux;\e\e[5 q\e\\"
    let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[1 q"
endif
" }}}

" Filetype: {{{
filetype plugin on
filetype on
" }}}

" Plugins: {{{
set runtimepath+=~/.config/nvim/dein

" Dein: {{{
" Required:
set runtimepath+=/home/wd/.config/nvim/dein-cache/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/wd/.config/nvim/dein-cache')
    call dein#begin('/home/wd/.config/nvim/dein-cache')
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
    call dein#add('sebastianmarkow/deoplete-rust')
    call dein#add('fszymanski/deoplete-emoji')
    call dein#add('wokalski/autocomplete-flow')
    call dein#add('deoplete-plugins/deoplete-clang')
    call dein#add('deoplete-plugins/deoplete-go')
    call dein#add('deoplete-plugins/deoplete-jedi')

    " Git: {{{
    call dein#add('jreybert/vimagit')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('tpope/vim-fugitive')
    " }}}

    call dein#add('thaerkh/vim-workspace')


    call dein#add('vimwiki/vimwiki')

    " Linting Assistance And Highlighting: {{{
    call dein#add('sheerun/vim-polyglot')
    call dein#add('w0rp/ale')
    call dein#add('octol/vim-cpp-enhanced-highlight')
    call dein#add('reedes/vim-pencil')
    call dein#add('rhysd/vim-grammarous')
    " }}}

    " UI Navigation: {{{
    call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
    call dein#add('junegunn/fzf.vim')
    "call dein#add('christoomey/vim-tmux-navigator')
    " }}}

    " Appearance: {{{
    call dein#add('Chiel92/vim-autoformat')
    call dein#add('yggdroot/indentline')
    " }}}

    " InText Navigation: {{{
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('tpope/vim-surround')
    call dein#add('Raimondi/delimitMate')
    call dein#add('justinmk/vim-sneak')
    call dein#add('mattn/emmet-vim')
    call dein#add('chaoren/vim-wordmotion')
    call dein#add('scrooloose/nerdcommenter')
    " }}}

    "" Untested: {{{
    "call dein#add('hecal3/vim-leader-guide')
    "call dein#add('svermeulen/vim-yoink')
    "call dein#add('chrisbra/unicode.vim')
    "call dein#add('zefei/vim-wintabs')
    call dein#add('terryma/vim-smooth-scroll')
    "call dein#add('jceb/vim-orgmode')
    "call dein#add('tpope/vim-obsession')
    call dein#add('gcmt/wildfire.vim')
    "call dein#add('sodapopcan/vim-twiggy')
    "call dein#add('terryma/vim-expand-region')
    "call dein#add('kristijanhusak/defx-icons')
    "call dein#add('ryanoasis/vim-devicons')
    "call dein#add(Shougo/defx.nvim')
    "call dein#add('junegunn/gv.vim')
    "call dein#add('dhruvasagar/vim-zoom')
    "call dein#add('machakann/vim-sandwich')
    "call dein#add('kana/vim-textobj-function')
    "call dein#add('rhysd/vim-operator-surround')
    "call dein#add('Konfekt/FastFold')
    "call dein#add('lambdalisue/suda.vim')
    "call dein#add('gcmt/taboo.vim')
    "call dein#add('rhysd/clever-f.vim')
    "call dein#add('kana/vim-textobj-user')
    "call dein#add('tpope/vim-repeat')
    "call dein#add('chaoren/vim-wordmotion')
    call dein#add('skywind3000/quickmenu.vim')
    "call dein#add('honza/vim-snippets')
    "call dein#add('SirVer/ultisnips')
    "" }}}

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


"   Split movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"   Refresh
map <leader>r :so ~/.config/nvim/init.vim \| Autoformat<CR>

"   Spell-check | GUI FAGS BTFO | orthography
map <leader>o :setlocal spell! spelllang=en_us,es,fr \| GrammarousCheck<CR>

"   Bibliography | Need to read into this more
map <leader>b :vsp<space>$BIB<CR>

"   URLView
map <leader>u :w<Home> silent <End> !urlview<CR>

"   Compile doc
map <leader>c :w! \| !compiler <c-r>%<CR><CR>

"   Open relative .pdf, .html, etc......
map <leader>p :!opout <c-r>%<CR><CR>

"   Fm toggle
map <leader>b :Defx<CR>

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

"   Pasting Rebinds
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-v> "+P

"   Smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Wildfire: {{{
" This selects the next closest text object.
map <SPACE> <Plug>(wildfire-fuel)

" This selects the previous closest text object.
vmap <C-SPACE> <Plug>(wildfire-water)
" }}}

inoremap {<CR> {<CR>}<ESC>O
