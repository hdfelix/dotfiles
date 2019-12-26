set t_Co=256

" ==========================================================
" Vundle settings
" ==========================================================
set nocompatible				" be iMproved
filetype off

" Using only for Vim indent guidelines (not available via vundle)
execute pathogen#infect()

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle								" required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim.git'
Plugin 'tpope/vim-markdown'
Plugin 'rhysd/vim-gfm-syntax'
Plugin 'tpope/vim-rails'
Plugin 'int3/vim-extradite'
Plugin 'Lucius'
Plugin 'chriskempson/base16-vim'
Plugin 'Tagbar'

" refactoring in vim
" Plugin 'LucHermitte/lh-vim-lib'
" Plugin 'LucHermitte/lh-tags'
" Plugin 'LucHermitte/lh-dev'
" Plugin 'LucHermitte/lh-brackets'
" Plugin 'LucHermitte/vim-refactor'

Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'christoomey/vim-tmux-runner'
Plugin 'pdbradley/vim-tmux-runner'
Plugin 'mattn/emmet-vim'
" Plugin 'WebAPI.vim'
Plugin 'AutoTag'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'scrooloose/syntastic'
Plugin 'kana/vim-fakeclip'
Plugin 'jgdavey/tslime.vim'
" Plugin 'vim-pandoc/vim-pandoc'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'vim-ruby/vim-ruby'
Plugin 'ngmy/vim-rubocop'
Plugin 'flazz/vim-colorschemes'
Plugin 'rizzatti/dash.vim'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'JSON.vim'
Plugin 'ruby-matchit'
Plugin 'matchit.zip'

" JS, React
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
" Plugin 'textobj-rubyblock'
" Plugin 'godlygeek/tabular'

" vim-scripts repos
" Plugin 'L9'
" Plugin 'FuzzyFinder'

" non-GitHub repos
Plugin 'git://git.wincent.com/command-t.git'

" All this stuff is for snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundle

" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Vundle commands are not allowed.

" All plugins must be added before the following line
call vundle#end()						" required
filetype plugin indent on		" required

" ==========================================================
" General settings
" ==========================================================
syntax on
syntax enable

"Colors
set background=dark
colorscheme oceandeep "lucius 3DGlasses, Tomorrow-Night

autocmd BufWritePre *.py :%s/\s\+$//e "auto remove trailing spaces on save
let mapleader =","

" fakeclip settings
let g:fakeclip_terminal_multiplexer_type = 'tmux'

" ctrl_p ignore folders
let g:ctrlp_custom_ignore =  'tags\|bin\|tmp\|log\:coverage'

" rubocop settings
let g:vimrubocop_keymap = 0
let g:vimrubocop_config = '.rubocop.yml'

" vim indent guides
let g:indent_guides_guide_size = 2

nmap <Leader>r :RuboCop -D<CR>

" use Ack instead of grep
"set grepprg=ack "\ -k

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"using ag (the silver searcher) with ack.vim
" let g:ackprg = 'ag --nogroup --nocolor --column'

" ===== ELM support =====================================
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>

" Compiling the current file on write:
:au BufWritePost *.elm ElmMakeCurrentFile

" Usually more useful: Compiling a specific file, e.g. "Main.elm", on file write to any file in the project:
:au BufWritePost *.elm ElmMakeFile("Main.elm")
" =========================================================

" Easily convert files to Unix format
noremap <leader>u :update<CR> :e ++ff=dos<CR> :setlocal<CR> ff=unix

" Pretify JSON
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>
au BufRead,BufNewFile *.json set filetype=json

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 6
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_ruby_haml_args = "-c .haml-lint.yml"

" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColum
nmap <Leader>el :!npm run -- 

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Emmet
let g:user_emmet_leader_key='<C-e>'
"custom snippets
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

" zoom in/out of vim window
map <Leader>z <C-w>o

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R --exclude=./vendor .<CR>

""""""""""""""""""""""
" Git
""""""""""""""""""""""

" Commits
autocmd Filetype gitcommit setlocal spell textwidth=100

" blame
map <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Open edit command at current directory
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Fix indents on entire file
map <Leader>ii mmgg=G`m<CR>

" Paste from clipboard with proper indentation
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Set up vim to copy text
map <Leader>co :set nonu nornu<CR>,n<CR>

" ...
map <Leader>nco :set nu rnu<CR>,n<CR>

" Timelapse?
map <leader>h :call TimeLapse() <cr>

" tmux-runner

"from Chris Toomey's dotfiles (test these out)
let g:VtrClearBeforeSend = 0
let g:VtrUseVtrMaps = 1
let g:VtrGitCdUpOnOpen = 0
let g:VtrPercentage = 30
let g:VtrOrientation = 'h'
let g:VtfClearOnReatach = 0

" nnoremap <leader>sd :VtrSendCommand<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>va :VtrAttachToPane<cr>

nmap <leader>fs :VtrFlushCommand<cr>:VtrSendCommandToRunner<cr>
nmap <C-f> :VtrSendLineToRunner<cr>
vmap <C-f> <Esc>:VtrSendSelectedToRunner<cr>

nnoremap <leader>rj :VtrSendCommandToRunner be rake konacha<cr>
nnoremap <leader>rs :VtrSendCommandToRunner rake<cr>

nmap <leader>osr :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>
map <leader>x :VtrSendFile<cr>

nnoremap <leader>sd :VtrSendCTRLD<cr>
nnoremap <leader>q :VtrSendCommandToRunner <cr>
nnoremap <leader>sf :w<cr>:call SendFileViaVtr()<cr>
nnoremap <leader>sl :VtrSendCommandToRunner <cr>

function! SendFileViaVtr()
 let runners = {
    \ 'haskell': 'ghci',
    \ 'ruby': 'ruby',
    \ 'javascript': 'node',
    \ 'python': 'python',
    \ 'sh': 'sh'
    \ }

  if has_key(runners, &filetype)
    let runner = runners[&filetype]
    let local_file_path = expand('%')
    execute join(['VtrSendCommandToRunner', runner, local_file_path])
  else
    echoerr 'Unable to determine runner'
  endif
endfunction

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" vim-rspec config
" zsh version
" let g:rspec_command = \"VtrSendCommandToRunner! bundle exec rspec -fp -t ~skip {spec}"
" let g:rspec_command = \"VtrSendCommandToRunner! bundle exec rspec -fp -t ~skip {spec}"
" let g:rspec_command = 'call VimuxRunCommand("bundle exec rspec {spec}\n")'

" bash version
" let g:rspec_command = \"VtrSendCommandToRunner! rspec -fp -t ~skip {spec}"
" let g:rspec_command = \"VtrSendCommandToRunner! rspec -fp -t ~skip {spec}"

" vim-rspec mappings
map <Leader>f :call RunCurrentSpecFile()<CR> 
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>g :call RunAllSpecs()<CR>

" vim-test mappings
" nmap <silent> <leader>s :TestNearest<CR>
" nmap <silent> <leader>t :TestFile<CR>
" nmap <silent> <leader>a :testSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :testVisit<CR>

" let test#strategy = 'tslime'

map <Leader>st :!npm %
" opens the quickfix file and window
let g:rspec_command = 'call VimuxRunCommand("bin/rspec --format progress --require ~/code/rspec_support/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out {spec}\n")'
:map <leader>q :cg quickfix.out \| cwindow<CR>


" 2017 Youtube video tests: https://www.youtube.com/watch?v=XA2WjJbmmoM&list=WL&index=37&t=3385s
set path+=** " search all paths; use :find [filename] wihtout path to find files
command! Maketags !ctags -R .
""""""

" To run in last session of current iTerm terminal
let g:rspec_runner = "os_x_iterm2"

set noswapfile " remove swap file feature

set history=500

set nocompatible   " Turn off compatibility with VI.
set modelines=0    "Turn modelines off in files; turn on if needed.

" Windows - give new window largest "focus"
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

"Set tab stops
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"From http://stevelosh.com/blog/2010/09/coming-home-to-vim/#why-i-came-back-to-vimset scrolloff=3
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set hidden
set wildmenu
set wildignore+=*/.git/*,*/tmp/*
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

" Switch between number and relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    set number
    set relativenumber
  endif
endfunction

nnoremap <C-n> :call NumberToggle()<cr>

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
set textwidth=120
"set formatoptions=qrn1
set colorcolumn=120
highlight ColorColumn ctermbg=DarkGrey

"TextMate-style invisible characters
"set list
"set listchars=tab:▸\ ,eol:¬

"Saves file when focus is lost
"au FocusLost * :wa

"###########Mappings###########

"Remap exiting  instert mode (Esc)
inoremap jj <esc>

map <Up> k
map <Down> j
map <Left> h
map <Right> l

" Unrap the arrow keys (to get used to not using them in insert mode)
" no <down> <Nop>
" no <left> <Nop>
" no <right> <Nop>
" no <up> <Nop>
" 
" ino <down> <Nop>
" ino <left> <Nop>
" ino <right> <Nop>
" ino <up> <Nop>
"nnoremap  j gj
"nnoremap k gk

"##### Leader key mappings
"Shortcut to rapidly toggle 'set list'
nmap <leader>li :set list!<CR>

"Strip all trailing whitespaces in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/='<CR>

"Use <leader>w to open a new vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" Ack
nnoremap <leader>a :Ack 

" Map 'ft' to 'fold tag' function
nnoremap <leader>ft Vatzf

" Smart CSS with <leader>S
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

" Vim macros
let @b = 'f{xiRoleType.where(f,xi).first_or_create!xxi!(f}lxr)0j'
set list
set listchars=tab:>-
