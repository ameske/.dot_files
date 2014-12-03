""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" Author: Kyle Ames
" Date: June 19, 2014
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This file isn't compatible with vi.
set nocompatible
set t_Co=256

"*******************************************************************
" Vundle Plugin Manager - github.com/gmarik/vundle
"*******************************************************************

" Vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Github Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'gregsexton/gitv'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
" Plugin 'valloric/YouCompleteMe'
" Plugin 'sirver/ultisnips'

" Vundle is done, turn the file stuff back on
call vundle#end()
filetype plugin indent on

"*******************************************************************
" General Vim Settings
"*******************************************************************

" Clear any existing autocommands
autocmd!

" Don't have files trying to override this .vimrc:
set nomodeline

" WTF happened to backspace with vim 7.4. on RHEL?
set backspace=indent,eol,start

" Show numbers, don't beep at me, and save 50 lines of history
set number
set visualbell
set history=50

" Make searches case-insensitive, unless they contain upper-case
set ignorecase
set smartcase

" Matching braces and visual line-wrapping
set showmatch
set nowrap

" Tab and Space stuff
set shiftwidth=2    "4 is just too much"
set softtabstop=2   "4 is just too much"
set shiftround      "Round to mod shiftwidth"
set expandtab       "Spaces instead of tabs"
set autoindent      "Match previous level of indentation"

" Other settings
set title       "Show the terminal title if possible"
set autowrite   "Save the buffer when performing commands"
set scrolloff=3 "Save three lines above and below"
set incsearch   "Show best search so far"

" Command line info
if has('cmdline_info')
  set showmode
  set showcmd
  set ruler
endif

" Split Management - Makes things a whole lot easier to navigate
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Some variables for convenience
let mac_font = "Source Code Pro:h11"
let gui_scheme = "solarized"
let console_scheme = "default"

" Set the default size of GVIM
if has('gui_running')
  set lines=60
  set columns=80
endif

" Set up Mac specific settings
if has('mac') || has('macvim')
  if has("gui_running")
    exec "set guifont"=.mac_font
  endif
endif

" GUI Options
if has('gui_running')
  set guioptions-=T
  exec "colorscheme ".gui_scheme
  set background=dark
else
  exec "colorscheme ".console_scheme
endif


"*******************************************************************
" Programming Specific Settings - (Syntax, Plugins, Features, etc.)
"*******************************************************************

" Vim-Airline
set laststatus=2
let g:airline_theme='murmur'

" Enable spell-checking, if we have it.
if has ('spell')
  set nospell
  map <silent> <F2> :set spell!<CR>:set spell?<CR>
  imap <silent> <F2> <C-O>:set spell!<CR><C-O>:set spell?<CR>
endif

" Syntax and search highlighting support
if has('syntax')
  syntax on
  if has('extra_search')
    set hlsearch
    "Map F3 to toggle search highlighting:
    map <silent> <F3> :set hlsearch!<CR>:set hlsearch?<CR>
    imap <silent> <F3> <C-O>:set hlsearch!<CR><C-O>:set hlsearch?<CR>
  endif
endif

" Tagbar - Visual for Ctags
set tags=./tags;/
nmap <F4> :TagbarToggle<CR>

" NERDTree - A file system browser for vim
map <F5> :NERDTreeToggle<CR>

" Syntastic
map <F6> :Errors<CR>

" vim-go - Golang plugins for vim
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1

" Folding - Enable folding if your snytax supports it. This does not start enabled by default when a file is opened.
if has('folding')
  set foldmethod=syntax
  set foldnestmax=10
  set foldenable
  set foldcolumn=0
  set foldlevel=255

  " This toggles the nearest fold open/close
  map <F11> za
  imap <F11> <C-O>za

  " A function to toggle the fold column
  map <F12> :call FoldColumnToggle()<CR>
  function! FoldColumnToggle()
    if &foldcolumn
      setlocal foldcolumn=0
    else
      setlocal foldcolumn=4
    endif
  endfunction
endif

" Train me to not use the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Breaking lines with \[enter] to save the awkward into insert and out
nmap <leader><cr> i<cr><Esc>

" Avoid some security problems with directory-specific vimrc files
" This should be the last line of the file
set secure
