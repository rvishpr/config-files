set number
"set wildmenu
"set wildmode=list:longest,full
set showmatch
set undolevels=100
set backspace=2
set noerrorbells
set smartindent
""case sensitive if upper case; insensitive if the search string
""is lower case
set ignorecase
set smartcase
set title

set vb
set t_vb=

""gg=G in vi autoindents the entire file
"" =<n>j indents the next <n> lines
"" == indents the current line

"paste, but preserve indent from original file
"set paste
nnoremap <C-p> :set invpaste paste?<CR>
set pastetoggle=<C-p>
set showmode
set showcmd

set hidden

"Move cursor to word while typing
set incsearch

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

"let g:clipbrdDefaultReg = '+'

set tabstop=8
set softtabstop=4
set shiftwidth=4
filetype indent on

set hlsearch
"set background=dark
"set mouse=a

"Responsible for menu - word completion
set completeopt=longest,menuone
set completeopt+=preview

syntax on
highlight Comment ctermfg=blue

"Auto insert closing braces
":inoremap ( ()<Esc>i
":inoremap { {}<Esc>i
":inoremap [ []<Esc>i
":inoremap " ""<Esc>i
":inoremap ' ''<Esc>i

"toggle mouse with Ctrl-\
nnoremap <C-\> :call ToggleMouse()<CR>
function! ToggleMouse()
  if &mouse == 'n'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=n
    echo "Mouse usage enabled"
  endif
endfunction
":nnoremap \ :set mouse=n<return>
":nnoremap <C-\> :set mouse=""<return>

 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \   exe "normal! g'\"" |
 \ endif

":noremap <LeftRelease> "+y<LeftRelease>
"set visualbell
"set autoindent smartindent

set nocompatible "break away from vi compatibility

source ~/cscope_map.vim

"set cul                                           " highlight current line

"miscellaneous mappings
" Find out which function you are in
nmap <C-f> ma][%b%b"x5yy`a:echo @x<CR>"
"Find out which function and go to function top
nmap <C-g> ][%b%b :echo @x<CR>
nmap <Tab> :buffers<CR>:buffer<space>
nmap <S-Tab> :bnext<CR>
nmap <leader>r :%s/<C-r><C-w>//gc<left><left><left>
nmap <leader>e :e#<CR>
nmap <leader>s <Esc>:w<CR>
nmap <leader>w <Esc>:wq<CR>
nmap <leader>q <Esc>:q<CR>
"yw - yank current word

"comment line
nmap <silent> <leader>c I//<Esc>
"un comment line - TODO perfect this. may not work as it is now
nmap <silent> <leader>dc I<Esc>xx
map  <silent> <C-h> :set invhlsearch<CR>
"nnoremap ; :
"nnoremap : ;


" set these only for python files
function! SetPyFileEnv()
        set expandtab
        set tabstop=4
        set shiftwidth=4
endfunction
autocmd BufEnter *.py call SetPyFileEnv()

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
"set statusline=\ %r%{v:insertmode}\ %F\ \ \(%l\ of\ %L\ V:%v\)\ %r%{getcwd()}\ %b\ %P
"set laststatus=2

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertChange * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * call InsertStatuslineColor('n')

" Highlight when a line exceeds 80 characters (only for .c and .h files)
" autocmd - execute automatically when reading/writing a file
" BufRead - when starting to edit a line
autocmd BufRead *.c,*.h highlight OverLength ctermbg=yellow ctermfg=white guibg=#592929
autocmd BufRead *.c,*.h match OverLength /\%81v.\+/

"highlight OverLength ctermbg=yellow ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" When starting to edit a file:
"   For *.c and *.h files set formatting of comments and set C-indenting on
"   For other files it is switched off
"   Don't change the sequence, it's important that the line with * comes first.
autocmd BufRead * set formatoptions=tcql nocindent comments&
autocmd BufRead *.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
