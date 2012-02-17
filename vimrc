" disable beep
set noeb vb t_vb=

set nocompatible

" setup Pathogen
call pathogen#infect()

syntax on
if has("autocmd")
  filetype plugin indent on
endif
set autoindent
set smartindent
set tabstop=8
set shiftwidth=4
set softtabstop=4
set background=light
set expandtab
set guioptions=agim
"set nowrap

" color scheme
colorscheme solarized

" Shortcut to rapidly toggle `set list`
let mapleader = ","
let g:mapleader=","
nmap <leader>l :set list!<CR>
 
" Fast saving with leader + w
nmap <leader>w :w!<cr>

" Starts vim with numbers
set number

" toggle numbers
nmap <leader>n :set number!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

set incsearch "find the next match as we type the search
set hlsearch "hilight searches by default

set wrap "dont wrap lines
set linebreak "wrap lines at convenient points

"hide buffers when not displayed
set hidden

"statusline setup
set statusline=%f "tail of the filename

" hotkey to edit .vimrc
nmap <leader>v :tabedit /home/jorge/.vimrc<CR>

" Bubble single lines (normal map)
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines (visual map)
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Indentation
nmap <S-Tab> <<
nmap <Tab> >>
vmap <S-Tab> <gv
vmap <Tab> >gv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" add new line below the current line (like eclipse)
imap <S-CR> <Esc>o
nmap <S-CR> o

" switching tabs ala firefox
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
map <M-0> :tablast<CR>

imap <M-1> <Esc>1gt
imap <M-2> <Esc>2gt
imap <M-3> <Esc>3gt
imap <M-4> <Esc>4gt
imap <M-5> <Esc>5gt
imap <M-6> <Esc>6gt
imap <M-7> <Esc>7gt
imap <M-8> <Esc>8gt
imap <M-9> <Esc>9gt
imap <M-0> <Esc>:tablast<CR>

" Ctrl-S save (works in command and insert mode)
map <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>

" PYTHON
" Execute Python file being edited with <Shift> + e:
nnoremap E w:<CR>:!python % <CR>

" Shortcut to Close quickfix window with leader+c
nnoremap <leader>c <CR>:cclose<CR>

"remove trailing whitespace
"http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.c++ :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.pl :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e

" NERDTree
" Open NERDTree when vim starts up
autocmd vimenter * if !argc() | NERDTree | endif

" ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']

" Use leader + . for opening File Explorer
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMouseMode=3
let g:NERDTreeWinSize=30

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRU shorcuts
nmap <c-e> :MRU<CR>

" sparkup plugin
"let g:sparkupNextMapping = '<c-n>'
let g:sparkupExecuteMapping = '<c-j>'

" ^X ^O
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set omnifunc=pysmell#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType htmldjango set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" tab and spaces
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=2 sw=2 noexpandtab

"autocmd FileType python setlocal omnifunc=pysmell#Complete
