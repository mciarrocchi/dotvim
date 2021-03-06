" General 
set nocompatible               " be iMproved

set history=256                " Number of things to remember in history.
set timeoutlen=250             " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed         " Yanks go on clipboard instead.
set pastetoggle=<F10>          " toggle between paste and normal: for 'safer' pasting from keyboard
set shiftround                 " round indent to multiple of 'shiftwidth'
set tags=./tags;$HOME          " walk directory tree upto $HOME looking for tags

set number
set modeline
set modelines=5                " default numbers of lines to read for modeline instructions

set autowrite                  " Writes on make/shell commands
set autoread

" Backups and Swap
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

set hidden                     " The current buffer can be put to the background without writing to disk

set hlsearch                   " highlight search
set ignorecase                 " be case insensitive when searching
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing

let g:is_posix = 1             " vim's default is archaic bourne shell, bring it up to the 90s
let mapleader = ','
let maplocalleader = '	'      " Tab as a local leader
" End General
 
" Formatting 
set fo+=o                      " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                      " Do not automatically insert a comment leader after an enter
set fo-=t                      " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0                " Don't wrap lines by default

set tabstop=2                  " tab size eql 2 spaces
set softtabstop=2
set shiftwidth=2               " default shift width for indents
set expandtab                  " replace tabs with ${tabstop} spaces
set smarttab                   "

set backspace=indent
set backspace+=eol
set backspace+=start

set autoindent
set cindent
set indentkeys-=0#            " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case
" End Formatting

" Visual 
syntax on                      " enable syntax

" set synmaxcol=250              " limit syntax highlighting to 128 columns

set mouse=a "enable mouse in GUI mode
set mousemodel=extend
set mousehide                 " Hide mouse after chars typed

set number                    " line numbers Off
set showmatch                 " Show matching brackets.
set matchtime=2               " Bracket blinking.

set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.

set completeopt+=preview

set novisualbell              " No blinking
set noerrorbells              " No noise.
set vb t_vb=                  " disable any beeps or flashes on error

set laststatus=2              " always show status line.
set shortmess=atI             " shortens messages
set showcmd                   " display an incomplete command in statusline

set statusline=%<%f\          " custom statusline
set stl+=[%{&ff}]             " show fileformat
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P


set foldenable                " Turn on folding
set foldmethod=marker         " Fold on the marker
set foldlevel=100             " Don't autofold anything (but I can still fold manually)

set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
set foldopen+=quickfix

set virtualedit=block

set splitbelow
set splitright

set list                      " display unprintable characters f12 - switches
set listchars=tab:\ ·,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
map <silent> <F12> :set invlist<CR>

" End Visual


" Scripts and Bundles " {{{
filetype off
runtime macros/matchit.vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Colorscheme
Bundle 'molokai'
Bundle 'nelstrom/vim-mac-classic-theme'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/ingretu'

if has("gui_running")
  colorscheme ingretu
endif

" Programming
Bundle 'anzaika/go.vim'
Bundle 'jQuery'

" Snippets
Bundle 'msanders/snipmate.vim'
Bundle 'honza/snipmate-snippets'

" Syntax highlight
Bundle 'gmarik/vim-markdown'
Bundle 'nvie/vim-flake8'

" Git integration
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

nnoremap <leader>W :Gwrite<CR>
nnoremap <leader>C :Gcommit -v<CR>
nnoremap <leader>S :Gstatus \| 7<CR>
inoremap <leader>W <Esc><leader>W
inoremap <leader>C <Esc><leader>C
inoremap <leader>S <Esc><leader>S

" (HT|X)ml tool
Bundle 'ragtag.vim'

" Utility
Bundle 'gmarik/sudo-gui.vim'
Bundle 'Gundo'

Bundle 'repeat.vim'
Bundle 'surround.vim'

Bundle 'SuperTab'
Bundle 'file-line'
Bundle 'Align'

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key='<LocalLeader>'

Bundle 'Indent-Guides'
let g:indent_guides_guide_size = 1

Bundle 'ZoomWin'
noremap <leader>o :ZoomWin<CR>
vnoremap <leader>o <C-C>:ZoomWin<CR>
inoremap <leader>o <C-O>:ZoomWin<CR>

" FuzzyFinder
Bundle 'L9'
Bundle 'FuzzyFinder'
" FuF customisations "{{{
let g:fuf_modesDisable = []
nnoremap <leader>h :FufHelp<CR>
nnoremap <leader>1  :FufTag<CR>
nnoremap <leader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <leader>@  :FufFile<CR>
nnoremap <leader>3  :FufBuffer<CR>
nnoremap <leader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <leader>$  :FufDir<CR>
nnoremap <leader>5  :FufChangeList<CR>
nnoremap <leader>6  :FufMruFile<CR>
nnoremap <leader>7  :FufLine<CR>
nnoremap <leader>9  :FufTaggedFile<CR>

nnoremap <leader>p :FufDir ~/src/<CR>
nnoremap <leader>ge :FufDir ~/.rvm/gems/<CR>

nnoremap <leader>gn :vnew \| :FufFile ~/src/notes/<CR>

" " }}}

" Command-T
" Bundle 'wincent/Command-T.git'
let g:CommandTMatchWindowAtTop=1 " show window at top
"burke's
nnoremap <leader>tv :CommandTFlush<cr>\|:CommandT app/views<cr>
nnoremap <leader>tc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
nnoremap <leader>tm :CommandTFlush<cr>\|:CommandT app/models<cr>
nnoremap <leader>tl :CommandTFlush<cr>\|:CommandT lib<cr>
nnoremap <leader>ta :CommandTFlush<cr>\|:CommandT app/assets<cr>
nnoremap <leader>tp :CommandTFlush<cr>\|:CommandT public<cr>
nnoremap <leader>tr :topleft :vsplit config/routes.rb<cr>
nnoremap <leader>tg :topleft :vsplit Gemfile<cr>

"
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>t'

Bundle 'rstacruz/sparkup.git', {'rtp': 'vim/'}
let g:sparkupExecuteMapping = '<c-e>'
let g:sparkupNextMapping = '<c-ee>'

filetype plugin indent on      " Automatically detect file types.

" " }}}

" Python stuff
"
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
