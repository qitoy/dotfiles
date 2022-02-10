" {{{1 dein Scripts-----------------------------

let s:toml = '~/.vim/dein.toml'
let s:toml_lazy = '~/.vim/dein_lazy.toml'
let s:ddc_toml = '~/.vim/ddc.toml'

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein')

call dein#load_toml(s:toml, {'lazy': 0})
call dein#load_toml(s:toml_lazy, {'lazy': 1})
call dein#load_toml(s:ddc_toml, {'lazy': 1})

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

" }}}1 End dein Scripts-------------------------

" LaTeX
let g:tex_flavor = "latex"
let g:tex_conceal=''
aug LaTeX
	au!
	au FileType tex inoremap <buffer> <Bslash>[ <Bslash>[<Bslash>]<Left><Left><CR><CR><Up><C-F>
	au BufNewFile *.tex 0r $HOME/.vim/template/LaTeX.tex
	au BufNewFile *.tex %s/Title_Here/\=expand("%:r")/
	au InsertLeave *.tex w
aug END

" AtCoder C++
augroup AtCoder
	autocmd!
	autocmd BufEnter ~/AtCoder/*.cpp,~/AtCoder/*.hpp runtime! init/AtCoder.vim
augroup END

" 行番号を表示
set number

" tabの幅
set tabstop=4
set shiftwidth=4

" コマンド表示
set showcmd

" 括弧補完
inoremap {<CR> {}<Left><CR><CR><Up><C-f>

" レジスタ関連
nnoremap x "_x
vnoremap x "_x
set clipboard+=unnamed

" 移動関連
nnoremap j gj
nnoremap k gk
set scrolloff=10

" 折りたたみ
set foldmethod=marker
aug folding
	au!
	au BufWinLeave ?* mkview
	au BufWinEnter ?* silent loadview
aug END
set viewoptions-=options

" map関連
let maplocalleader=' '

set autowrite
set laststatus=2
