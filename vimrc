""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" Author: Kyle Ames
" Date: March 6, 2015
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This file isn't compatible with vi.
set nocompatible
set t_Co=256

"*******************************************************************
" Vim-Plug Plugin Manager - github.com/junegunn/vim-plug
"*******************************************************************
call plug#begin('~/.vim/bundle')

Plug 'gmarik/Vundle.vim'

" IDE Plugins
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'

" Git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'

" Integration w/ system
Plug 'edkolev/tmuxline.vim'

" Extended Shortcuts
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-commentary'

" Syntax/Languge Plugins
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'wting/rust.vim'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'

call plug#end()

"*******************************************************************
" General Vim Settings
"*******************************************************************

" The arrow keys are evil, don't let them be used
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Enable fzf as our fuzzy finder - HIGHLY RECOMMEND THIS, IT IS LIFE CHANGING
set rtp+=~/.fzf

" Clear any existing autocommands
autocmd!

" Don't have files trying to override this .vimrc:
set nomodeline

" Keep the cursor on the same column
set nostartofline

" Turn off spellcheck by default
if has ('spell')
  set nospell
endif

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
set shiftwidth=2    
set softtabstop=2   
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
set shiftround
set expandtab     
set autoindent      

" Highlight - gutter same as background
highlight clear SignColumn

" Other settings
set title           "Show the terminal title if possible"
set autowrite       "Save the buffer when performing commands"
set scrolloff=3     "Save three lines above and below"
set incsearch       "Show best search so far"

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

" Buffer Management
nnoremap gn :bn<CR>
nnoremap gN :bp<CR>

"*******************************************************************
" Programming Specific Settings - (Syntax, Plugins, Features, etc.)
"*******************************************************************

" Git-Gutter
let g:gitgutter_enabled = 0

" Folding - Enable folding if your snytax supports it. This does not start enabled by default when a file is opened.
if has('folding')
  set foldmethod=syntax
  set foldnestmax=10
  set foldenable
  set foldcolumn=0
  set foldlevel=255
endif

" Pebbble library
let g:syntastic_c_include_dirs = [ '/usr/local/Cellar/pebble-sdk/2.8.1/Pebble/include/' ]

" Python - Show whitespace so that we don't get burned
autocmd filetype Python set listchars=tab:>.,trail:.,extends:#,nbsp:.
"
" Vim-Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'

" Syntax and search highlighting support
if has('syntax')
  syntax on
  if has('extra_search')
    set hlsearch
  endif
endif

" Tagbar - Visual for Ctags
set tags=./tags;/

" vim-go - Golang plugins for vim
au FileType go nnoremap <Leader>gd <Plug>(go-doc)
au FileType go nnoremap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nnoremap <Leader>gb <Plug>(go-doc-browser)
au FileType go nnoremap gd <Plug>(go-def)
au FileType go nnoremap <Leader>ds <Plug>(go-def-split)
au FileType go nnoremap <Leader>dv <Plug>(go-def-vertical)
au FileType go nnoremap <Leader>gdt <Plug>(go-def-tab)
au FileType go nnoremap <Leader>r <Plug>(go-run)
au FileType go nnoremap <Leader>b <Plug>(go-build)
au FileType go nnoremap <Leader>t <Plug>(go-test)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"

"*******************************************************************
" Function Key Shortcut Remappings 
"       F1  - Help
"       F2  - Paste Mode
"       F3  - FZF
"       F4  - Tagbar
"       F5  - NERD Tree
"       F6  - Highlight Search
"       F7  - Git-Gutter
"       F8  - GitV
"       F9  - UNMAPPED
"       F10 - Spell Check
"       F11 - Fold/Unfold Block
"       F12 - Show/Hide Fold Column
"*******************************************************************
set pastetoggle=<F2>

noremap <F3> :FZF<CR>

noremap <F4> :TagbarToggle<CR>

noremap <F5> :NERDTreeToggle<CR>

noremap <silent> <F6> :set hlsearch!<CR>:set hlsearch?<CR>
inoremap <silent> <F6> <C-O>:set hlsearch!<CR><C-O>:set hlsearch?<CR>

noremap <F7> :GitGutterToggle<CR>

noremap <F8> :Gitv<CR>

noremap <silent> <F10> :set spell!<CR>:set spell?<CR>
inoremap <silent> <F10> <C-O>:set spell!<CR><C-O>:set spell?<CR>

noremap <F11> za
inoremap <F11> <C-O>za

noremap <F12> :call FoldColumnToggle()<CR>


"*******************************************************************
" Functions/Commands
"*******************************************************************

" A function to toggle the fold column
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction

" Toggle the Snytastic error window with Ctrl+E
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

" FZF Buffer Search
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf ' . keys[0]
  exec keys[1]
  normal! ^zz
endfunction

" FZF Buffer Search
function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})

"*******************************************************************
" Misc. Remappings
"*******************************************************************
let mapleader=","

" Breaking lines with \[enter] to save the awkward into insert and out
noremap <leader><cr> i<cr><Esc>

" For when I'm dumb and open a RO file without sudo
cnoremap sudow w !sudo tee % >/dev/null

" Toggle syntax errors with Ctrl+E
nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

" Search for 
nnoremap <leader><Space> :FZFLines<CR>


" Avoid some security problems with directory-specific vimrc files
" This should be the last line of the file
set secure
