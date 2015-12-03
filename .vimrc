set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'davidhalter/jedi-vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'janko-m/vim-test'
Plugin 'klen/python-mode'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-dispatch.git'
Plugin 'tpope/vim-fugitive'

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
