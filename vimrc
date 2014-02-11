set number
"set wildmenu
"set wildmode=list:longest,full
set showmatch
set undolevels=100
set ruler
set backspace=2
set noerrorbells
set smartindent
""case sensitive if upper case; insensitive if the search string
""is lower case
set ignorecase
set smartcase
set title

""gg=G in vi autoindents the entire file
"" =<n>j indents the next <n> lines
"" == indents the current line

"Move cursor to word while typing
set incsearch

set tabstop=8
"set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on

set hlsearch
"set background=dark
"set mouse=a

"Responsible for menu - word completion
set completeopt=longest,menuone

syntax on
highlight Comment ctermfg=blue


"Auto insert closing braces
":inoremap ( ()<Esc>i
":inoremap { {}<Esc>i
":inoremap [ []<Esc>i
":inoremap " ""<Esc>i
":inoremap ' ''<Esc>i

:nnoremap \ :set mouse=n<return>
:nnoremap <C-\> :set mouse=""<return>

 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \   exe "normal! g'\"" |
 \ endif

":noremap <LeftRelease> "+y<LeftRelease>
"set visualbell
"set autoindent smartindent

source ~/cscope_map.vim

" Find out which function you are in
nmap <C-f> ma][%b%b"x5yy`a:echo @x<CR>"
"Find out which function and go to function top
nmap <C-g> ][%b%b :echo @x<CR>

"
" Invert a cololrcolumn at 81 character
"
"set columns=80
"function! InvColorColumn()
"       if &colorcolumn == 0
"          set colorcolumn=81
"       else
"          set colorcolumn=0
"       endif
"endfunction
"map <silent> <C-p> :call InvColorColumn()<CR>

map  <silent> <C-h> :set invhlsearch<CR>

function! InsertStatuslineColor(m)
  if a:m == 'i'
    hi statusline ctermbg=6 ctermfg=0 guibg=magenta
        set statusline=\ INSERT\ %F\ \ \(%l\ of\ %L\ V:%v\)\ %r%{getcwd()}\ %b\ %P\ mouse=%r%{&mouse}
  elseif a:m == 'r'
        hi statusline ctermbg=0 ctermfg=6 guibg=blue
        set statusline=\ REPLACE\ %F\ \ \(%l\ of\ %L\ V:%v\)\ %r%{getcwd()}\ %b\ %P\ mouse=%r%{&mouse}
  else
        hi statusline ctermbg=3 ctermfg=0 guibg=red
        set statusline=\ NORMAL\ %F\ \ \(%l\ of\ %L\ V:%v\)\ %r%{getcwd()}\ %b\ %P\ mouse=%r%{&mouse}
  endif
endfunction

hi statusline ctermbg=6 ctermfg=0 guibg=magenta
set statusline=\ %r%{v:insertmode}\ %F\ \ \(%l\ of\ %L\ V:%v\)\ %r%{getcwd()}\ %b\ %P
set laststatus=2

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertStatuslineColor('n')

