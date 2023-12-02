lua if vim.loader then vim.loader.enable() end

augroup vimrc
  autocmd!
augroup END

let g:denops#deno = '~/.deno/bin/deno'->expand()

" dpp install
let s:cache = expand('~/.cache')
if !isdirectory(s:cache)
  call mkdir(s:cache, 'p')
endif

function InitPlugin(plugin)
  let dir = s:cache .. '/dpp/repos/github.com/' .. a:plugin
  if !dir->isdirectory()
    execute '!git clone https://github.com/' .. a:plugin dir
  endif
  execute 'set runtimepath^=' .. dir
endfunction

let $VIM_DIR = expand('~/.vim')
let $VIM_TOMLS = $VIM_DIR .. '/' .. 'tomls'
let $VIM_HOOKS = $VIM_DIR .. '/' .. 'hooks'

call InitPlugin('Shougo/dpp.vim')
" need to load lazy plugins
call InitPlugin('Shougo/dpp-ext-lazy')

if dpp#min#load_state(s:cache .. '/dpp')
  echohl WarningMsg | echomsg 'begin make state' | echohl NONE

  for s:plugin in [
  \ 'Shougo/dpp-ext-installer',
  \ 'Shougo/dpp-ext-toml',
  \ 'Shougo/dpp-protocol-git',
  \ 'vim-denops/denops.vim',
  \]
    call InitPlugin(s:plugin)
  endfor

  " NOTE: need manual load
  runtime! plugin/denops.vim

  autocmd vimrc User DenopsReady
  \ call dpp#make_state(s:cache .. '/dpp', '$VIM_HOOKS/dpp.ts'->expand())
else
  autocmd vimrc BufWritePost *.lua,*.vim,*.toml,*.ts,vimrc,.vimrc
  \ call dpp#check_files()
endif

autocmd vimrc User Dpp:makeStatePost
\ echohl WarningMsg | echomsg 'end make state' | echohl NONE

filetype plugin indent on
syntax enable
