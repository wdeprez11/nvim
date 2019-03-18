function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?''.l:branchname.'':''
endfunction

function! GetFileType()
    return strlen(&filetype) != 0 ? &filetype : "no ft"
endfunction

function! GetMode()
    return "      "
endfunction

"function! s:RefreshStatus()
"  for nr in range(1, winnr('$'))
"    call setwinvar(nr, '&statusline', '%!Status(' . nr . ')')
"  endfor
"endfunction

"augroup status
"  autocmd!
"  autocmd VimEnter,WinEnter,BufWinEnter * call <SID>RefreshStatus()
"augroup END

"let active = a:winnum == winnr()

set laststatus=2

hi bright_group ctermfg=0 ctermbg=15
hi pale_group ctermfg=0 ctermbg=7
hi cut_group ctermfg=7 ctermbg=8
hi color ctermfg=0 ctermbg=6

"set statusline=%#color#
"set statusline+=\ " SPACE
"set statusline+=%{GetMode()}
"set statusline+=\ " SPACE
set statusline=%#bright_group#
set statusline+=\ " SPACE
set statusline+=%f%R%H%m
set statusline+=\ " SPACE
set statusline+=%#cut_group#
set statusline+=\ %{StatuslineGit()}
set statusline+=\ " SPACE
set statusline+=\%= " Right Justify
set statusline+=%#pale_group#
set statusline+=\ " SPACE
set statusline+=%{&ff}
set statusline+=\ \|" SPACE
set statusline+=\ " SPACE
set statusline+=\%{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \|" SPACE
set statusline+=\ " SPACE
set statusline+=%{GetFileType()}
"set statusline+=%y
set statusline+=\ " SPACE
set statusline+=%#bright_group#
set statusline+=\ " SPACE
set statusline+=%P
set statusline+=\ %l:%c " Line and Column Number
set statusline+=\ " SPACE

