set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'L9'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'Rykka/InstantRst'
"Plugin 'Rykka/riv.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'Townk/vim-autoclose'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'asux/vim-capybara'
"Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'ervandew/supertab'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'fundon/vim-mou'
Plugin 'garbas/vim-snipmate'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'gmarik/vundle'
"Plugin 'godlygeek/tabular'
"Plugin 'henrik/vim-indexed-search'
Plugin 'honza/vim-snippets'
"Plugin 'itspriddle/vim-jquery'
Plugin 'janko-m/vim-test'
"Plugin 'jmcantrell/vim-virtualenv'
"Plugin 'jnwhiteh/vim-golang'
"Plugin 'johnsyweb/vim-makeshift'
"Plugin 'junegunn/vim-emoji'
"Plugin 'junegunn/vim-github-dashboard'
"Plugin 'justinmk/vim-sneak'
"Plugin 'kana/vim-textobj-user'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'kien/ctrlp.vim'
"Plugin 'kien/rainbow_parentheses.vim'
Plugin 'klen/python-mode'
"Plugin 'lilydjwg/colorizer'
"Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
"Plugin 'mileszs/ack.vim'
"Plugin 'mustache/vim-mustache-handlebars'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'nelstrom/vim-textobj-rubyblock'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'powerline/powerline'
"Plugin 'rhysd/vim-clang-format'
"Plugin 'rking/ag.vim'
"Plugin 'rking/vim-ruby-refactoring'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
"Plugin 'sukima/xmledit'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-dispatch.git'
"Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-haml'
"Plugin 'tpope/vim-ragtag'
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-sensible'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'tsaleh/vim-matchit'
"Plugin 'vim-scripts/CSApprox'
"Plugin 'vim-scripts/ColorX'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"colorscheme PaperColor
colorscheme blue
"colorscheme desert256
"colorscheme evening
"colorscheme inkpot
"colorscheme koehler
filetype indent plugin on
filetype on
let python_highlight_all = 1
set autoindent
"set background=dark
"set columns=80
set cursorline
set dictionary=/usr/share/dict/american-english
set encoding=utf-8
set expandtab
"set foldcolumn=4
"set foldmethod=indent
"set foldmethod=syntax
set hlsearch
set incsearch
set modeline
set number
set ruler
set shiftwidth=4
set showmatch
set softtabstop=4
set t_Co=256
set tabstop=4
set textwidth=80
set wildignore=*.o,*.bak,*~
source $VIMRUNTIME/ftplugin/man.vim
syntax on


au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

au BufNewFile,BufRead *.asciidoc,*.txt,README,TODO,CHANGELOG,NOTES  setfiletype asciidoc
"au BufRead *.txt,README,TODO,CHANGELOG,NOTES call s:FTasciidoc()

" This function checks for a valid AsciiDoc document title after first
" skipping any leading comments.
function! s:FTasciidoc()
  let in_comment_block = 0
  let n = 1
  while n < 50
    let line = getline(n)
    let n = n + 1
    if line =~ '^/\{4,}$'
      if ! in_comment_block
        let in_comment_block = 1
      else
        let in_comment_block = 0
      endif
      continue
    endif
    if in_comment_block
      continue
    endif
    if line !~ '\(^//\)\|\(^\s*$\)'
      break
    endif
  endwhile
  if line !~ '.\{3,}'
    return
  endif
  let len = len(line)
  let line = getline(n)
  if line !~ '[-=]\{3,}'
    return
  endif
  if len < len(line) - 3 || len > len(line) + 3
    return
  endif
  setfiletype asciidoc
endfunction



if exists('+colorcolumn')
  set colorcolumn=80
else
  "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  "highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  "match OverLength /\%81v.\+/
  "ctermbg=darkred" and "guibg=#FFD9D9"
  "
  highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
  match OverLength /\%81v.\+/
endif

"autocmd FileType python compiler pylint
map <F2> :cnext<CR>
map <F3> :cnext<CR>
map <F12> :NERDTreeToggle<CR>

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#python#runner = 'djangotest'
let test#strategy = "dispatch"
"let test#strategy = "tmux"
"let test#strategy = "iterm"
let test#python#djangotest#file_pattern = 'tests'
