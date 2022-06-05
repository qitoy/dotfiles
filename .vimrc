" {{{1 dein Scripts-----------------------------
scriptencoding utf-8

if &compatible
  set nocompatible               " Be iMproved
endif

let g:dein#auto_recache = v:true
let g:dein#install_progress_type = 'floating'
let g:dein#install_check_diff = v:true

source ~/.vim/secret.vim

let s:vim_dir = fnamemodify(expand('<sfile>'), ':h') . '/.vim/'

let s:toml           = s:vim_dir . 'dein.toml'
let s:toml_lazy      = s:vim_dir . 'dein_lazy.toml'
let s:ddc_toml       = s:vim_dir . 'ddc.toml'
let s:ddu_toml       = s:vim_dir . 'ddu.toml'
let s:skkeleton_toml = s:vim_dir . 'skkeleton.toml'
let s:filetype_toml  = s:vim_dir . 'filetype.toml'

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let g:dein#inline_vimrcs = [s:vim_dir . 'settings.vim']

if dein#load_state('~/.cache/dein')
  " Required:
  call dein#begin('~/.cache/dein')

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})
  call dein#load_toml(s:ddc_toml, {'lazy': 1})
  call dein#load_toml(s:ddu_toml, {'lazy': 1})
  call dein#load_toml(s:skkeleton_toml, {'lazy': 1})
  call dein#load_toml(s:filetype_toml)

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

" }}}1 End dein Scripts-------------------------
