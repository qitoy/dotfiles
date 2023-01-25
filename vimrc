if &compatible
  set nocompatible               " Be iMproved
endif

" dein install
let s:cache = expand('~/.cache')
if !isdirectory(s:cache)
  call mkdir(s:cache, 'p')
endif

let s:dein = s:cache . '/dein/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein
endif
execute 'set runtimepath^=' . s:dein

let g:dein#auto_recache = v:true
let g:dein#install_progress_type = 'floating'
let g:dein#install_check_diff = v:true
let g:dein#install_github_api_token = $DEIN_INSTALL_GITHUB_API_TOKEN

let s:vim_dir = expand('~/.vim/')

let s:toml           = s:vim_dir . 'dein.toml'
let s:toml_lazy      = s:vim_dir . 'dein_lazy.toml'
let s:ddc_toml       = s:vim_dir . 'ddc.toml'
let s:ddu_toml       = s:vim_dir . 'ddu.toml'
let s:filetype_toml  = s:vim_dir . 'filetype.toml'

let g:dein#inline_vimrcs = [s:vim_dir . 'settings.vim']

if dein#load_state(s:cache . '/dein')
  " Required:
  call dein#begin(s:cache . '/dein', [
  \ expand('<sfile>'), s:toml, s:toml_lazy, s:ddc_toml, s:ddu_toml, s:filetype_toml
  \])

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})
  call dein#load_toml(s:ddc_toml, {'lazy': 1})
  call dein#load_toml(s:ddu_toml, {'lazy': 1})
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
