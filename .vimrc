""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" Author: Kyle Ames
" Date: February 27, 2014
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This file isn't compatible with vi.
set nocompatible

"*******************************************************************
" Vundle Plugin Manager - github.com/gmarik/vundle
"*******************************************************************

" Vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Github Plugins
Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'

" Vundle is done, turn the file stuff back on
call vundle#end()
filetype plugin indent on

"*******************************************************************
" General Vim Settings
"*******************************************************************

" Don't have files trying to override this .vimrc:
set nomodeline

" Clear any existing autocommands
autocmd!

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
set shiftwidth=4    "4 is just too much, but you gotta match the code base ;-)"
set softtabstop=4   "4 is just too much, but you gotta match the code base ;-)"
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

" Enable mouse mode
if has('mouse')
  set mouse=vic
endif

" Split Management
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

" Set up an informative status line
if has('statusline')
  if version >= 700
    set statusline=%-02.2n\ %t\ %y\ %m\ %r\ %L\ lines%=%1L,%cC\ \(%P\)
    " Enable the status line
    set laststatus=2
  endif
endif

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
    "Map F4 to toggle search highlighting:
    map <silent> <F3> :set hlsearch!<CR>:set hlsearch?<CR>
    imap <silent> <F3> <C-O>:set hlsearch!<CR><C-O>:set hlsearch?<CR>
  endif
endif

" Tagbar - Visual for Ctags
set tags=./tags;/
nmap <F4> :TagbarToggle<CR>

" NERDTree - A file system browser for vim
map <F5> :NERDTreeToggle<CR>

" Go-lang: Adds go's vim bits
if exists("$GOROOT")
  set rtp+=$GOROOT/misc/vim
endif

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
