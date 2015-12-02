" fix key code for working under screen
" note : ctrl+v under insert mode reveil actual key code, ex ^[[11
"map [11~ <F1>
"map [12~ <F2>
"imap [11~ <F1>
"imap [12~ <F2>

let mapleader=","

" for vundle
set nocompatible
filetype off
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'


" simplify opening files
Plugin 'Command-T'

Plugin 'The-NERD-tree'
nnoremap <silent> <Leader>1 :NERDTreeToggle<RETURN>

Plugin 'Valloric/YouCompleteMe'
nnoremap <silent> <Leader>j :YcmCompleter GoTo<CR>
let g:ycm_autoclose_preview_window_after_insertion = 0
nnoremap <silent> <Leader>d :YcmForceCompileAndDiagnostics<CR>

Plugin 'majutsushi/tagbar'
nnoremap <silent> <Leader>2 :TagbarToggle<CR>

call vundle#end()            " required
filetype plugin indent on    " required
" end vundle


" SYNTAX {{{ -----------------------------------------------
syn enable
syn sync maxlines=1000
filet plugin indent on
let php_sync_method = 0
let html_wrong_comments = 1

" syntax extensions
fu! s:SyntaxExtHTML()
	" HTML CDATA section
	syn region htmlCdataSection matchgroup=htmlCdataDecl start=+<!\[CDATA\[+ end=+\]\]>+
	syn cluster htmlTop add=htmlCdataSection
	hi def link htmlCdataDecl htmlTag
endf
" }}} ------------------------------------------------------




filetype plugin indent on

set showmatch
set ts=2
set sts=2
set sw=2
set autoindent
set smartindent
set smarttab
set expandtab
set number
set hlsearch

au FileType python set omnifunc=pythoncomplete$Complete
let g:SuperTabDefaultCompletionType = "context"

" end of configuration
finish

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2013-01-24  added vundle configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

