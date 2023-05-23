if &compatible
  set nocompatible               " Be iMproved
endif

if has('nvim')
  lua if vim.loader then vim.loader.enable() end
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

let $VIM_DIR = expand('~/.vim')

let g:dein#inline_vimrcs = ['$VIM_DIR/settings.vim']

if dein#load_state(s:cache . '/dein')
  " Required:
  call dein#begin(s:cache . '/dein', expand('<sfile>'))

  call dein#load_toml('$VIM_DIR/dein.toml', {'lazy': 0})
  call dein#load_toml('$VIM_DIR/dein_lazy.toml', {'lazy': 1})
  if has('nvim')
    call dein#load_toml('$VIM_DIR/nvim.toml', {'lazy': 1})
  else
    call dein#load_toml('$VIM_DIR/vim.toml', {'lazy': 1})
  endif
  call dein#load_toml('$VIM_DIR/ddc.toml', {'lazy': 1})
  call dein#load_toml('$VIM_DIR/ddu.toml', {'lazy': 1})
  call dein#load_toml('$VIM_DIR/filetype.toml')

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
