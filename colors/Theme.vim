" 'theme.vim' -- Vim color scheme.
" Maintainer:   Roosta (mail@roosta.sh)
" Description:  Colorscheme that focus ease of use and clearly defined contrasting colors with a slightly earthy tone.
" Original Source: https://github.com/morhetz/gruvbox

scriptencoding utf-8

if v:version > 580
  hi clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name='theme'

if !has('gui_running') && &t_Co != 256
  finish
endif

" Palette: {{{

let s:black          = ['#100f10', 0]
let s:red            = ['#e47777', 1]
let s:green          = ['#94d489', 2]
let s:yellow         = ['#fff88d', 3]
let s:blue           = ['#6f91d8', 4]
let s:magenta        = ['#c18cb9', 5]
let s:cyan           = ['#78ccc0', 6]
let s:white          = ['#a49981', 7]
let s:bright_black   = ['#141314', 8]
let s:bright_red     = ['#e47777', 9]
let s:bright_green   = ['#94d489', 10]
let s:bright_yellow  = ['#fff88d', 11]
let s:bright_blue    = ['#6f91d8', 12]
let s:bright_magenta = ['#c18cb9', 13]
let s:bright_cyan    = ['#78ccc0', 14]
let s:bright_white   = ['#e4d6b4', 15]

" xterm colors.
let s:orange        = ['#D75F00', 166]
let s:bright_orange = ['#FF8700', 208]
let s:hard_black    = ['#121212', 233]
let s:xgray1        = ['#262626', 235]
let s:xgray2        = ['#303030', 236]
let s:xgray3        = ['#3A3A3A', 237]
let s:xgray4        = ['#444444', 238]
let s:xgray5        = ['#4E4E4E', 239]

"}}}
" Setup Variables: {{{

let s:none = ['NONE', 'NONE']

if !exists('g:theme_bold')
  let g:theme_bold=1
endif

if !exists('g:theme_italic')
  if has('gui_running') || $TERM_ITALICS ==? 'true'
    let g:theme_italic=1
  else
    let g:theme_italic=0
  endif
endif

if !exists('g:theme_transparent_background')
  let g:theme_transparent_background=0
endif

if !exists('g:theme_undercurl')
  let g:theme_undercurl=1
endif

if !exists('g:theme_underline')
  let g:theme_underline=1
endif

if !exists('g:theme_inverse')
  let g:theme_inverse=1
endif

if !exists('g:theme_inverse_matches')
  let g:theme_inverse_matches=0
endif

if !exists('g:theme_inverse_match_paren')
  let g:theme_inverse_match_paren=0
endif

if !exists('g:theme_dim_lisp_paren')
  let g:theme_dim_lisp_paren=0
endif

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:theme_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:theme_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:theme_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:theme_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:theme_inverse == 0
  let s:inverse = ''
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let l:fg = a:fg

  " background
  if a:0 >= 1
    let l:bg = a:1
  else
    let l:bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let l:emstr = a:2
  else
    let l:emstr = 'NONE,'
  endif

  let l:histring = [ 'hi', a:group,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:emstr[:-2], 'cterm=' . l:emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(l:histring, 'guisp=' . a:3[0])
  endif

  execute join(l:histring, ' ')
endfunction
"}}}
" Theme Hi Groups: {{{

" memoize common hi groups
call s:HL('ThemeWhite', s:white)
call s:HL('ThemeRed', s:red)
call s:HL('ThemeGreen', s:green)
call s:HL('ThemeYellow', s:yellow)
call s:HL('ThemeBlue', s:blue)
call s:HL('ThemeMagenta', s:magenta)
call s:HL('ThemeCyan', s:cyan)
call s:HL('ThemeBlack', s:black)

call s:HL('ThemeRedBold', s:red, s:none, s:bold)
call s:HL('ThemeGreenBold', s:green, s:none, s:bold)
call s:HL('ThemeYellowBold', s:yellow, s:none, s:bold)
call s:HL('ThemeBlueBold', s:blue, s:none, s:bold)
call s:HL('ThemeMagentaBold', s:magenta, s:none, s:bold)
call s:HL('ThemeCyanBold', s:cyan, s:none, s:bold)

call s:HL('ThemeBrightRed', s:bright_red, s:none)
call s:HL('ThemeBrightGreen', s:bright_green, s:none)
call s:HL('ThemeBrightYellow', s:bright_yellow, s:none)
call s:HL('ThemeBrightBlue', s:bright_blue, s:none)
call s:HL('ThemeBrightMagenta', s:bright_magenta, s:none)
call s:HL('ThemeBrightCyan', s:bright_cyan, s:none)
call s:HL('ThemeBrightBlack', s:bright_black, s:none)
call s:HL('ThemeBrightWhite', s:bright_white)

" alternate bgs
call s:HL('ThemeWhiteAltBG', s:white, s:bright_black)
call s:HL('ThemeRedAltBG', s:red, s:bright_black)
call s:HL('ThemeGreenAltBG', s:green, s:bright_black)
call s:HL('ThemeYellowAltBG', s:yellow, s:bright_black)
call s:HL('ThemeBlueAltBG', s:blue, s:bright_black)
call s:HL('ThemeMagentaAltBG', s:magenta, s:bright_black)
call s:HL('ThemeCyanAltBG', s:cyan, s:bright_black)
call s:HL('ThemeBlackAltBG', s:black, s:bright_black)

call s:HL('ThemeRedBoldAltBG', s:red, s:bright_black, s:bold)
call s:HL('ThemeGreenBoldAltBG', s:green, s:bright_black, s:bold)
call s:HL('ThemeYellowBoldAltBG', s:yellow, s:bright_black, s:bold)
call s:HL('ThemeBlueBoldAltBG', s:blue, s:bright_black, s:bold)
call s:HL('ThemeMagentaBoldAltBG', s:magenta, s:bright_black, s:bold)
call s:HL('ThemeCyanBoldAltBG', s:cyan, s:bright_black, s:bold)

call s:HL('ThemeBrightRedAltBG', s:bright_red, s:bright_black)
call s:HL('ThemeBrightGreenAltBG', s:bright_green, s:bright_black)
call s:HL('ThemeBrightYellowAltBG', s:bright_yellow, s:bright_black)
call s:HL('ThemeBrightBlueAltBG', s:bright_blue, s:bright_black)
call s:HL('ThemeBrightMagentaAltBG', s:bright_magenta, s:bright_black)
call s:HL('ThemeBrightCyanAltBG', s:bright_cyan, s:bright_black)
call s:HL('ThemeBrightBlackAltBG', s:bright_black, s:bright_black)
call s:HL('ThemeBrightWhiteAltBG', s:bright_white)

call s:HL('ThemeColorBG', s:black, s:bright_red)

" special
call s:HL('ThemeOrange', s:orange)
call s:HL('ThemeBrightOrange', s:bright_orange)
call s:HL('ThemeOrangeBold', s:orange, s:none, s:bold)
call s:HL('ThemeHardBlack', s:hard_black)
call s:HL('ThemeXgray1', s:xgray1)
call s:HL('ThemeXgray2', s:xgray2)
call s:HL('ThemeXgray3', s:xgray3)
call s:HL('ThemeXgray4', s:xgray4)
call s:HL('ThemeXgray5', s:xgray5)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
"
if g:theme_transparent_background == 1 && !has('gui_running')
  call s:HL('Normal', s:bright_white, s:none)
 else
  call s:HL('Normal', s:bright_white, s:black)
endif

if v:version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bright_black)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine


  if g:theme_transparent_background == 1 && !has('gui_running')
    " Tab pages line filler
    call s:HL('TabLineFill', s:green, s:none)
    " Active tab page label
    call s:HL('TabLineSel', s:red, s:none, s:bold)
  else
    call s:HL('TabLineFill', s:white, s:bright_black)
    call s:HL('TabLineSel', s:red, s:bright_black, s:bold)
  endif

  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  "
  if g:theme_inverse_match_paren == 1
    call s:HL('MatchParen', s:bright_magenta, s:none, s:inverse . s:bold)
  else
    call s:HL('MatchParen', s:bright_magenta, s:none, s:bold)
  endif
endif

if v:version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:bright_black)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  if g:theme_transparent_background == 1 && !has('gui_running')
    call s:HL('CursorLineNr', s:bright_white, s:bright_black)
  else
    call s:HL('CursorLineNr', s:bright_white, s:bright_black, s:bold)
  endif

endif

hi! link NonText ThemeWhiteAlt
hi! link SpecialKey ThemeWhiteAlt

if g:theme_inverse == 1
  call s:HL('Visual', s:none, s:none, s:inverse)
else
  call s:HL('Visual', s:none, s:bright_black, s:bold)
endif

hi! link VisualNOS Visual

if g:theme_inverse == 1 && g:theme_inverse_matches == 1
  call s:HL('Search', s:none, s:none, s:inverse)
  call s:HL('IncSearch', s:none, s:none, s:inverse)
else
  call s:HL('Search', s:none, s:xgray4, s:bold)
  call s:HL('IncSearch', s:none, s:xgray4, s:underline . s:bold)
endif

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bright_white, s:bright_black)

if g:theme_transparent_background == 1 && !has('gui_running')
  call s:HL('StatusLineNC', s:white, s:bright_black, s:underline)

  " The column separating vertically split windows
  call s:HL('VertSplit', s:bright_white, s:none)

  " Current match in wildmenu completion
  call s:HL('WildMenu', s:blue, s:none, s:bold)
else
  call s:HL('StatusLineNC', s:white, s:bright_black)
  call s:HL('VertSplit', s:bright_white, s:black)
  call s:HL('WildMenu', s:blue, s:black, s:bold)
endif

" Directory names, special names in listing
hi! link Directory ThemeBlueBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title ThemeGreenBold

" Error messages on the command line
call s:HL('ErrorMsg', s:bright_white, s:red)
" More prompt: -- More --
hi! link MoreMsg ThemeYellow
" Current mode message: -- INSERT --
hi! link ModeMsg ThemeColorBG
" 'Press enter' prompt and yes/no questions
hi! link Question ThemeOrangeBold
" Warning messages
hi! link WarningMsg ThemeRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:white, s:bright_black)

if g:theme_transparent_background == 1 && !has('gui_running')
  " Column where signs are displayed
  " TODO Possibly need to fix  SignColumn
  call s:HL('SignColumn', s:none, s:bright_black)
  " Line used for closed folds
  call s:HL('Folded', s:white, s:none, s:italic)
  " Column where folds are displayed
  call s:HL('FoldColumn', s:white, s:none)
else
  call s:HL('SignColumn', s:none, s:black)
  call s:HL('Folded', s:white, s:bright_black, s:italic)
  call s:HL('FoldColumn', s:white, s:black)
endif

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:black, s:yellow)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

hi! link Special ThemeYellow

call s:HL('Comment', s:white, s:none, s:italic)

if g:theme_transparent_background == 1 && !has('gui_running')
  call s:HL('Todo', s:bright_white, s:none, s:bold . s:italic)
else
  call s:HL('Todo', s:bright_white, s:black, s:bold . s:italic)
endif

call s:HL('Error', s:bright_white, s:red, s:bold)

" String constant: "this is a string"
call s:HL('String',  s:bright_green)

" Generic statement
hi! link Statement ThemeRed
" if, then, else, endif, switch, etc.
hi! link Conditional ThemeRed
" for, do, while, etc.
hi! link Repeat ThemeRed
" case, default, etc.
hi! link Label ThemeRed
" try, catch, throw
hi! link Exception ThemeRed
" sizeof, "+", "*", etc.
hi! link Operator ThemeCyan
" Any other keyword
hi! link Keyword ThemeRed

" Variable name
hi! link Identifier ThemeCyan
" Function name
hi! link Function ThemeYellow

" Generic preprocessor
hi! link PreProc ThemeCyan
" Preprocessor #include
hi! link Include ThemeCyan
" Preprocessor #define
hi! link Define ThemeCyan
" Same as Define
hi! link Macro ThemeYellow
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit ThemeCyan

" Generic constant
hi! link Constant ThemeBrightMagenta
" Character constant: 'c', '/n'
hi! link Character ThemeBrightMagenta
" Boolean constant: TRUE, false
hi! link Boolean ThemeBrightMagenta
" Number constant: 234, 0xff
hi! link Number ThemeBrightMagenta
" Floating point constant: 2.3e10
hi! link Float ThemeBrightMagenta

" Generic type
hi! link Type ThemeBrightBlue
" static, register, volatile, etc
hi! link StorageClass ThemeYellow
" struct, union, enum, etc.
hi! link Structure ThemeCyan
" typedef
hi! link Typedef ThemeMagenta

if g:theme_dim_lisp_paren == 1
  hi! link Delimiter ThemeXgray5
else
  hi! link Delimiter ThemeWhite
endif

" }}}
" Completion Menu: {{{

if v:version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:bright_white, s:bright_black)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bright_white, s:magenta, s:bold)

  if g:theme_transparent_background == 1 && !has('gui_running')
    " Popup menu: scrollbar
    call s:HL('PmenuSbar', s:none, s:none)
    " Popup menu: scrollbar thumb
    call s:HL('PmenuThumb', s:none, s:none)
  else
    call s:HL('PmenuSbar', s:none, s:black)
    call s:HL('PmenuThumb', s:none, s:black)
  endif
endif

" }}}
" Diffs: {{{

if g:theme_transparent_background == 1 && !has('gui_running')
  call s:HL('DiffDelete', s:red, s:none)
  call s:HL('DiffAdd',    s:green, s:none)
  call s:HL('DiffChange', s:cyan, s:none)
  call s:HL('DiffText',   s:yellow, s:none)
else
  call s:HL('DiffDelete', s:red, s:black)
  call s:HL('DiffAdd',    s:green, s:black)
  call s:HL('DiffChange', s:cyan, s:black)
  call s:HL('DiffText',   s:yellow, s:black)
endif

" }}}
" Spelling: {{{

if has('spell')
  " Not capitalised word, or compile warnings
  call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:cyan)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:magenta)
endif

" }}}
" Terminal: {{{

if has('terminal')
  " Must set an explicit background as NONE won't work
  " Therefore not useful with transparent background option
  call s:HL('Terminal', s:bright_white, s:hard_black)
endif

" }}}
" CtrlP: "{{{
hi! link CtrlPMatch ThemeMagenta
hi! link CtrlPLinePre ThemeBrightGreen
call s:HL('CtrlPMode1', s:bright_white, s:xgray2)
call s:HL('CtrlPMode2', s:bright_white, s:xgray4)
call s:HL('CtrlPStats', s:yellow, s:bright_black)
" }}}

" Plugin specific -------------------------------------------------------------
" Sneak: {{{

hi! link SneakPluginTarget Search
hi! link SneakStreakTarget Search
call s:HL('SneakStreakMask', s:yellow, s:yellow)
hi! link SneakStreakStatusLine Search

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue',  '#2C78BF'], ['166',  '#D75F00'],
      \ ['red',  '#EF2F27'], ['magenta', '#E02C6D']
    \ ]
endif

let g:rainbow_guifgs = [ '#E02C6D', '#EF2F27', '#D75F00', '#2C78BF']
let g:rainbow_ctermfgs = [ 'magenta', 'red', '166', 'blue' ]

if !exists('g:rainbow_conf')
  let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
  let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
  let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd ThemeGreenAltBG
hi! link GitGutterChange ThemeYellowAltBG
hi! link GitGutterDelete ThemeRedAltBG
hi! link GitGutterChangeDelete ThemeYellowAltBG

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile ThemeGreen
hi! link gitcommitDiscardedFile ThemeRed

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign ThemeRedAltBG
hi! link ALEWarningSign ThemeYellowAltBG
hi! link ALEInfoSign ThemeBlueAltBG

" }}}
" vim-indent-guides: {{{

call s:HL('IndentGuidesEven', s:none, s:xgray2)
call s:HL('IndentGuidesOdd',  s:none, s:xgray3)

" }}}
" vim-startify {{{

hi! link StartifyNumber Statement
hi! link StartifyFile Normal
hi! link StartifyPath String
hi! link StartifySlash Normal
hi! link StartifyBracket Comment
hi! link StartifyHeader Type
hi! link StartifyFooter Normal
hi! link StartifySpecial Comment
hi! link StartifySection Identifier

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded ThemeGreen
hi! link diffRemoved ThemeRed
hi! link diffChanged ThemeCyan

hi! link diffFile ThemeOrange
hi! link diffNewFile ThemeYellow

hi! link diffLine ThemeBlue

" }}}
" Html: {{{

hi! link htmlTag ThemeBlue
hi! link htmlEndTag ThemeBlue

hi! link htmlTagName ThemeBlue
hi! link htmlTag ThemeWhite
hi! link htmlArg ThemeYellow

hi! link htmlScriptTag ThemeRed
hi! link htmlTagN ThemeBlue
hi! link htmlSpecialTagName ThemeBlue

call s:HL('htmlLink', s:bright_white, s:none, s:underline)

hi! link htmlSpecialChar ThemeYellow

if g:theme_transparent_background == 1 && !has('gui_running')
  call s:HL('htmlBold', s:bright_white, s:none, s:bold)
  call s:HL('htmlBoldUnderline', s:bright_white, s:none, s:bold . s:underline)
  call s:HL('htmlBoldItalic', s:bright_white, s:none, s:bold . s:italic)
  call s:HL('htmlBoldUnderlineItalic', s:bright_white, s:none, s:bold . s:underline . s:italic)
  call s:HL('htmlUnderline', s:bright_white, s:none, s:underline)
  call s:HL('htmlUnderlineItalic', s:bright_white, s:none, s:underline . s:italic)
  call s:HL('htmlItalic', s:bright_white, s:none, s:italic)
else
  call s:HL('htmlBold', s:bright_white, s:black, s:bold)
  call s:HL('htmlBoldUnderline', s:bright_white, s:black, s:bold . s:underline)
  call s:HL('htmlBoldItalic', s:bright_white, s:black, s:bold . s:italic)
  call s:HL('htmlBoldUnderlineItalic', s:bright_white, s:black, s:bold . s:underline . s:italic)
  call s:HL('htmlUnderline', s:bright_white, s:black, s:underline)
  call s:HL('htmlUnderlineItalic', s:bright_white, s:black, s:underline . s:italic)
  call s:HL('htmlItalic', s:bright_white, s:black, s:italic)
endif


" }}}
" Xml: {{{

hi! link xmlTag ThemeBlue
hi! link xmlEndTag ThemeBlue
hi! link xmlTagName ThemeBlue
hi! link xmlEqual ThemeBlue
hi! link docbkKeyword ThemeCyanBold

hi! link xmlDocTypeDecl ThemeWhite
hi! link xmlDocTypeKeyword ThemeMagenta
hi! link xmlCdataStart ThemeWhite
hi! link xmlCdataCdata ThemeMagenta
hi! link dtdFunction ThemeWhite
hi! link dtdTagName ThemeMagenta

hi! link xmlAttrib ThemeCyan
hi! link xmlProcessingDelim ThemeWhite
hi! link dtdParamEntityPunct ThemeWhite
hi! link dtdParamEntityDPunct ThemeWhite
hi! link xmlAttribPunct ThemeWhite

hi! link xmlEntity ThemeYellow
hi! link xmlEntityPunct ThemeYellow
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:bright_white, s:none, s:bold . s:italic)

hi! link vimNotation ThemeYellow
hi! link vimBracket ThemeYellow
hi! link vimMapModKey ThemeYellow
hi! link vimFuncSID ThemeBrightWhite
hi! link vimSetSep ThemeBrightWhite
hi! link vimSep ThemeBrightWhite
hi! link vimContinue ThemeBrightWhite

" }}}
" Lisp dialects: {{{
if g:theme_dim_lisp_paren == 1
  hi! link schemeParentheses ThemeXgray5
  hi! link clojureParen ThemeXgray5
else
  hi! link schemeParentheses ThemeWhite
  hi! link clojureParen ThemeWhite
endif

hi! link clojureKeyword ThemeBlue
hi! link clojureCond ThemeRed
hi! link clojureSpecial ThemeRed
hi! link clojureDefine ThemeRed

hi! link clojureFunc ThemeYellow
hi! link clojureRepeat ThemeYellow
hi! link clojureCharacter ThemeCyan
hi! link clojureStringEscape ThemeCyan
hi! link clojureException ThemeRed

hi! link clojureRegexp ThemeCyan
hi! link clojureRegexpEscape ThemeCyan
call s:HL('clojureRegexpCharClass', s:bright_white, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureAnonArg ThemeYellow
hi! link clojureVariable ThemeBlue
hi! link clojureMacro ThemeOrangeBold

hi! link clojureMeta ThemeYellow
hi! link clojureDeref ThemeYellow
hi! link clojureQuote ThemeYellow
hi! link clojureUnquote ThemeYellow
" }}}
" C: {{{

hi! link cOperator ThemeMagenta
hi! link cStructure ThemeYellow

" }}}
" Python: {{{

hi! link pythonBuiltin ThemeYellow
hi! link pythonBuiltinObj ThemeYellow
hi! link pythonBuiltinFunc ThemeYellow
hi! link pythonFunction ThemeCyan
hi! link pythonDecorator ThemeRed
hi! link pythonInclude ThemeBlue
hi! link pythonImport ThemeBlue
hi! link pythonRun ThemeBlue
hi! link pythonCoding ThemeBlue
hi! link pythonOperator ThemeRed
hi! link pythonExceptions ThemeMagenta
hi! link pythonBoolean ThemeMagenta
hi! link pythonDot ThemeBrightWhite

" }}}
" CSS/SASS: {{{

hi! link cssBraces ThemeBrightWhite
hi! link cssFunctionName ThemeYellow
hi! link cssIdentifier ThemeBlue
hi! link cssClassName ThemeBlue
hi! link cssClassNameDot ThemeBlue
hi! link cssColor ThemeBrightMagenta
hi! link cssSelectorOp ThemeBlue
hi! link cssSelectorOp2 ThemeBlue
hi! link cssImportant ThemeGreen
hi! link cssVendor ThemeBlue
hi! link cssMediaProp ThemeYellow
hi! link cssBorderProp ThemeYellow
hi! link cssAttrComma ThemeBrightWhite

hi! link cssTextProp ThemeYellow
hi! link cssAnimationProp ThemeYellow
hi! link cssUIProp ThemeYellow
hi! link cssTransformProp ThemeYellow
hi! link cssTransitionProp ThemeYellow
hi! link cssPrintProp ThemeYellow
hi! link cssPositioningProp ThemeYellow
hi! link cssBoxProp ThemeYellow
hi! link cssFontDescriptorProp ThemeYellow
hi! link cssFlexibleBoxProp ThemeYellow
hi! link cssBorderOutlineProp ThemeYellow
hi! link cssBackgroundProp ThemeYellow
hi! link cssMarginProp ThemeYellow
hi! link cssListProp ThemeYellow
hi! link cssTableProp ThemeYellow
hi! link cssFontProp ThemeYellow
hi! link cssPaddingProp ThemeYellow
hi! link cssDimensionProp ThemeYellow
hi! link cssRenderProp ThemeYellow
hi! link cssColorProp ThemeYellow
hi! link cssGeneratedContentProp ThemeYellow
hi! link cssTagName ThemeBrightBlue

" SASS
hi! link sassClass ThemeBlue
hi! link sassClassChar ThemeBlue
hi! link sassVariable ThemeCyan
hi! link sassIdChar ThemeBrightBlue

" }}}
" JavaScript: {{{

hi! link javaScriptMember ThemeBlue
hi! link javaScriptNull ThemeMagenta

" }}}
" YAJS: {{{

hi! link javascriptParens ThemeBrightCyan
hi! link javascriptFuncArg Normal
hi! link javascriptDocComment ThemeGreen
hi! link javascriptArrayMethod Function
hi! link javascriptReflectMethod Function
hi! link javascriptStringMethod Function
hi! link javascriptObjectMethod Function
hi! link javascriptObjectStaticMethod Function
hi! link javascriptObjectLabel ThemeBlue

hi! link javascriptProp ThemeBlue

hi! link javascriptVariable ThemeBrightBlue
hi! link javascriptOperator ThemeBrightCyan
hi! link javascriptFuncKeyword ThemeBrightRed
hi! link javascriptFunctionMethod ThemeYellow
hi! link javascriptReturn ThemeBrightRed
hi! link javascriptEndColons Normal

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp ThemeBrightWhite
hi! link coffeeSpecialOp ThemeBrightWhite
hi! link coffeeCurly ThemeYellow
hi! link coffeeParen ThemeBrightWhite
hi! link coffeeBracket ThemeYellow

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter ThemeGreen
hi! link rubyInterpolationDelimiter ThemeCyan
hi! link rubyDefine Keyword

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier ThemeRed
hi! link objcDirective ThemeBlue

" }}}
" Go: {{{

hi! link goDirective ThemeCyan
hi! link goConstants ThemeMagenta
hi! link goDeclaration ThemeRed
hi! link goDeclType ThemeBlue
hi! link goBuiltins ThemeYellow

" }}}
" Lua: {{{

hi! link luaIn ThemeRed
hi! link luaFunction ThemeCyan
hi! link luaTable ThemeYellow

" }}}
" MoonScript: {{{

hi! link moonSpecialOp ThemeBrightWhite
hi! link moonExtendedOp ThemeBrightWhite
hi! link moonFunction ThemeBrightWhite
hi! link moonObject ThemeYellow

" }}}
" Java: {{{

hi! link javaAnnotation ThemeBlue
hi! link javaDocTags ThemeCyan
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen ThemeBrightWhite
hi! link javaParen1 ThemeBrightWhite
hi! link javaParen2 ThemeBrightWhite
hi! link javaParen3 ThemeBrightWhite
hi! link javaParen4 ThemeBrightWhite
hi! link javaParen5 ThemeBrightWhite
hi! link javaOperator ThemeYellow

hi! link javaVarArg ThemeGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter ThemeGreen
hi! link elixirInterpolationDelimiter ThemeCyan

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition ThemeBlue
hi! link scalaCaseFollowing ThemeBlue
hi! link scalaCapitalWord ThemeBlue
hi! link scalaTypeExtension ThemeBlue

hi! link scalaKeyword ThemeRed
hi! link scalaKeywordModifier ThemeRed

hi! link scalaSpecial ThemeCyan
hi! link scalaOperator ThemeBlue

hi! link scalaTypeDeclaration ThemeYellow
hi! link scalaTypeTypePostDeclaration ThemeYellow

hi! link scalaInstanceDeclaration ThemeBlue
hi! link scalaInterpolation ThemeCyan

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:bright_white, s:none, s:italic)

hi! link markdownH1 ThemeGreenBold
hi! link markdownH2 ThemeGreenBold
hi! link markdownH3 ThemeYellowBold
hi! link markdownH4 ThemeYellowBold
hi! link markdownH5 ThemeYellow
hi! link markdownH6 ThemeYellow

hi! link markdownCode ThemeCyan
hi! link markdownCodeBlock ThemeCyan
hi! link markdownCodeDelimiter ThemeCyan

hi! link markdownBlockquote ThemeWhite
hi! link markdownListMarker ThemeWhite
hi! link markdownOrderedListMarker ThemeWhite
hi! link markdownRule ThemeWhite
hi! link markdownHeadingRule ThemeWhite

hi! link markdownUrlDelimiter ThemeBrightWhite
hi! link markdownLinkDelimiter ThemeBrightWhite
hi! link markdownLinkTextDelimiter ThemeBrightWhite

hi! link markdownHeadingDelimiter ThemeYellow
hi! link markdownUrl ThemeMagenta
hi! link markdownUrlTitleDelimiter ThemeGreen

call s:HL('markdownLinkText', s:white, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType ThemeYellow
" hi! link haskellOperators ThemeYellow
" hi! link haskellConditional ThemeCyan
" hi! link haskellLet ThemeYellow
"
hi! link haskellType ThemeBlue
hi! link haskellIdentifier ThemeBlue
hi! link haskellSeparator ThemeBlue
hi! link haskellDelimiter ThemeBrightWhite
hi! link haskellOperators ThemeBlue
"
hi! link haskellBacktick ThemeYellow
hi! link haskellStatement ThemeYellow
hi! link haskellConditional ThemeYellow

hi! link haskellLet ThemeCyan
hi! link haskellDefault ThemeCyan
hi! link haskellWhere ThemeCyan
hi! link haskellBottom ThemeCyan
hi! link haskellBlockKeywords ThemeCyan
hi! link haskellImportKeywords ThemeCyan
hi! link haskellDeclKeyword ThemeCyan
hi! link haskellDeriving ThemeCyan
hi! link haskellAssocType ThemeCyan

hi! link haskellNumber ThemeMagenta
hi! link haskellPragma ThemeMagenta

hi! link haskellString ThemeGreen
hi! link haskellChar ThemeGreen

" }}}
" Json: {{{

hi! link jsonKeyword ThemeGreen
hi! link jsonQuote ThemeGreen
hi! link jsonBraces ThemeBlue
hi! link jsonString ThemeBlue

" }}}
" Rust: {{{
"https://github.com/rust-lang/rust.vim/blob/master/syntax/rust.vim
hi! link rustCommentLineDoc ThemeGreen
hi! link rustModPathSep ThemeWhite
" }}}
" Make: {{{
hi! link makePreCondit ThemeRed
hi! link makeCommands ThemeBrightWhite
hi! link makeTarget ThemeYellow
" }}}
" Misc: {{{
call s:HL('shParenError', s:bright_white, s:bright_red)
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker :

