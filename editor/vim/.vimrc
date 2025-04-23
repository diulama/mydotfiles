" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" nocompatible makes vim more 'useful'
set nocompatible

" Use the OS clipboard by default (on versions compiled with +clipboard)
set clipboard=unnamed

" Enable mouse in all modes
set mouse=a

" Show "invisible" characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" set list

set number     
set title
set noerrorbells
set hlsearch
set tabstop=2
set showcmd
set ruler
set showmode
set nostartofline

syntax on

imap jk <ESC>
