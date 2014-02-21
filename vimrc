"######################
"Source: http://stevelosh.com/blog/2010/09/coming-home-to-vim/#why-i-came-back-to-vim
"######################

set nocompatible				" be iMproved
filetype off					" required! (not needed with VIM 7.3.340+)

syntax on
syntax enable

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle			" required!
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'scrooloose/syntastic'
Bundle 'kikijump/tslime.vim'
Bundle 'vim-pandoc/vim-pandoc'

" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-bundler.git'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'

" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" " ...

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundle

" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

filetype plugin indent on		" required!

let mapleader =","

"Colors
set background=dark
colorscheme desert

set nocompatible   " Turn off compatibility with VI.
set modelines=0    "Turn modelines off in files; turn on if needed.

"Set tab stops
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab

"From http://stevelosh.com/blog/2010/09/coming-home-to-vim/#why-i-came-back-to-vimset scrolloff=3
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set hidden
set wildmenu
set wildmode=list:longest
"set visualbell
set cursorline							"Add cursor line
set ttyfast

set ruler								"Set ruler
set showcmd

set backspace=indent,eol,start
set laststatus=2
set number						"set current line number on ruler
set relativenumber				"Set relative numbers on ruler
set undofile					"Create undo file for undoing even after closing file


set autowrite		    "Save buffers when I switch out of them?

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()

function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
    finally
        echohl None
    endtry
endfunction

"NERDTree mappings
map <leader>n :NERDTreeToggle<CR><CR>

"These help with search. Case ignored unless search string has
"uppercase anywhere

set ignorecase
set smartcase
set gdefault			"global search by default

"Highligh search as you type
set incsearch
set showmatch
set hlsearch

"Clear out search with leader space
nnoremap <leader><space> :noh<cr>

"Make tab key match bracket pairs
nnoremap <tab> %

"Handling long lines better
"set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85

"TextMate-style invisible characters
"set list
"set listchars=tab:▸\ ,eol:¬

"Saves file when focus is lost
"au FocusLost * :wa

"###########Mappings###########

"Remap exiting  instert mode (Esc)
inoremap jj <esc>

"Unrap the arrow keys (to get used to not using them in insert mode
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
"nnoremap  j gj
"nnoremap k gk

"##### Leader key mappings
"Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

"Strip all trailing whitespaces in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/='<CR>

"Use <leader>w to open a new vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" Ack
nnoremap <leader>a :Ack

" Map 'ft' to 'fold tag' function
nnoremap <leader>ft Vatzf

" Smort CSS with <leader>S
"nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" re-hardwrap paragraphs of text (like TextMate)
"nnoremap <leader>q gqip

" Use <leader>v to re-select the text that was just pasted
nnoremap <leader>v V`]

" Use <leader>ev to open up .vimrc in a vertical split for modifying on the fly
 nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>


" Vim Splits mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Vim Split - More natural split openings
set splitbelow
set splitright

