""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" Author: Kyle Ames
" Date: March 11, 2015
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set t_Co=256
set background=light

let mapleader=","
filetype plugin indent on

"*******************************************************************
" Vim-Plug Plugin Manager - github.com/junegunn/vim-plug
"*******************************************************************
call plug#begin('~/.vim/bundle')

" IDE Plugins
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'chazy/cscope_maps'

" Git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'

" Extended Shortcuts
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/vim-peekaboo'

" Syntax/Languge Plugins
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

call plug#end()

"*******************************************************************
" General Vim Settings
"*******************************************************************

" Use Sauce Code Pro 12 in the GUI as well 
if has('gui_running')
  set guifont=Sauce\ Code\ Powerline:h12
endif

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
set shiftround
set expandtab     
set autoindent      

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

" Split below and to the right when creating new splits
set splitbelow
set splitright

"*******************************************************************
" Programming Specific Settings - (Syntax, Plugins, Features, etc.)
"*******************************************************************

" cscope and ctags integration
if has("cscope")
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  set csto=0

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  " emulates 'find the ctags' file for cscope
  function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
      let path = strpart(db, 0, match(db, "/cscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
    endif
  endfunction
  call LoadCscope()
endif

" ctags
set tags=./tags;/

" Git-Gutter
let g:gitgutter_enabled = 0
highlight clear SignColumn

" Folding - Enable folding if your snytax supports it. This does not start enabled by default when a file is opened.
if has('folding')
  set foldmethod=syntax
  set foldnestmax=10
  set foldenable
  set foldcolumn=0
  set foldlevel=255
endif

" Python - Show whitespace so that we don't get burned
au filetype Python set listchars=tab:>.,trail:.,extends:#,nbsp:.
au FileType python set shiftwidth=4
au FileType python set softtabstop=4

" Vim-Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Syntax and search highlighting support
if has('syntax')
  syntax on
  if has('extra_search')
    set hlsearch
  endif
endif

" vim-go - Golang plugins for vim
let g:go_bin_path = $HOME."/.gobin/"
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gdt <Plug>(go-def-tab)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>s <Plug>(go-implements)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" rust - use cargo check
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

"*******************************************************************
" Function Key Shortcut Remappings 
"       F1  - Help
"       F2  - Paste Mode
"       F3  - Highlight Search
"       F4  - Tagbar
"       F5  - NERD Tree
"       F6  - FZF
"       F7  - FZF Grep
"       F8  - FZF Tag Search
"       F9  - Perforce Edit / Git-V
"       F10 - Gitv
"       F11 - Fold/Unfold Block
"       F12 - Show/Hide Fold Column
"*******************************************************************
set pastetoggle=<F2>

nnoremap <silent> <F3> :set hlsearch!<CR>:set hlsearch?<CR>
inoremap <silent> <F3> <C-O>:set hlsearch!<CR><C-O>:set hlsearch?<CR>

nnoremap <F4> :TagbarToggle<CR>
inoremap <F5> <esc>:TagbarToggle<CR>

nnoremap <F5> :NERDTreeToggle<CR>
inoremap <F5> <esc>:NERDTreeToggle<CR>

nnoremap <F6> :FZF ~<CR>
inoremap <F6> <esc>:FZF ~<CR>

nnoremap <F7> :FZFLines<CR>
inoremap <F7> <esc>:FZFLines<CR>

nnoremap <silent> <F8> :FZFTags
inoremap <silent> <F8> <esc>:FZFTags

nnoremap <F9> :GitGutterToggle <CR>
inoremap <F9> <esc>:GitGutterToggle <CR>

nnoremap <F10> :Gitv
inoremap <F10> <esc>:Gitv

nnoremap <F11> za
inoremap <F11> <C-O>za

nnoremap <F12> :call FoldColumnToggle()<CR>
inoremap <F12> <esc>:call FoldColumnToggle()<CR>

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
" FZFTags
"
" Performs an fzf search of a project's tags file
"*******************************************************************
command! -bar FZFTags if !empty(tagfiles()) | call fzf#run({
\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
\   'sink':   'tag',
\ }) | else | echo 'Preparing tags' | call system('ctags -R') | FZFTag | endif


"*******************************************************************
" FZFTags
"
" Performs an fzf search of a project's tags file
"*******************************************************************
command! FZFTagFile if !empty(tagfiles()) | call fzf#run({
\   'source': "cat " . tagfiles()[0] . ' | grep "' . expand('%:@') . '"' . " | sed -e '/^\\!/d;s/\t.*//' ". ' |  uniq',
\   'sink':   'tag',
\   'options':  '+m',
\   'left':     60,
\ }) | else | echo 'No tags' | endif


"*******************************************************************
" Custom Mappings 
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

" Buffer Management
nnoremap gn :bn<CR>
nnoremap gN :bp<CR>

" Tab Management
nnoremap gnt :tabnext<CR>
nnoremap gNt :tabprev<CR>

" Breaking lines with ,[enter] to save the awkward into insert and out
noremap <leader><cr> i<cr><Esc>

" For when I'm dumb and open a RO file without sudo
cnoremap sudow w !sudo tee % >/dev/null

" Toggle syntax errors with Ctrl+E
nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

" Search the file using the fuzzy finder
nnoremap <leader><Space> :FZFLines<CR>

" Avoid some security problems with directory-specific vimrc files
" This should be the last line of the file
set secure
