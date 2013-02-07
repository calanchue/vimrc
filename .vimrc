"" originaly created by lifthrasiir's .vimrc file (r21, 2008-11-16)
"" originaly written by Kang Seonghoon <lifthrasiir@gmail.com>
"" This file is placed in the public domain.
"" edited by Hwang JinHwan 
"" =========================================================


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


" vundle option
" launch vim, run :BundleInstall

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" simplify opening files
Bundle 'Command-T'

Bundle 'The-NERD-tree'
nmap <silent> <special> <F1> :NERDTreeToggle<RETURN>
nmap <silent> <special> <F2> :NERDTreeFind<RETURN>

"Bundle 'scrooloose/syntastic'

Bundle 'pathogen.vim'

Bundle 'SuperTab'
"Bundle 'davidhalter/jedi-vim'


filetype plugin indent on

set showmatch
set ts=4
set sts=4
set sw=4
set autoindent
set smartindent
set smarttab
set expandtab
set number

au FileType python set omnifunc=pythoncomplete$Complete
let g:SuperTabDefaultCompletionType = "context"

" end of configuration
finish

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2013-01-24  added vundle configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

