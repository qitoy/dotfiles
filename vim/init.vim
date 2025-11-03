lua if vim.loader then vim.loader.enable() end

augroup vimrc
  autocmd!
augroup END

" dpp install
const s:cache = expand('~/.cache')
if !isdirectory(s:cache)
  call mkdir(s:cache, 'p')
endif
const s:dpp_cache = s:cache .. '/dpp'

function InitPlugin(plugin)
  let dir = s:cache .. '/dpp/repos/github.com/' .. a:plugin
  if !dir->isdirectory()
    execute '!git clone https://github.com/' .. a:plugin dir
  endif
  execute 'set runtimepath^=' .. dir
endfunction

let $VIM_DIR = expand('<script>:p:h')
let $VIM_DPP = $VIM_DIR .. '/dpp'

call InitPlugin('Shougo/dpp.vim')
" need to load lazy plugins
call InitPlugin('Shougo/dpp-ext-lazy')

if dpp#min#load_state(s:cache .. '/dpp')
  echohl WarningMsg | echomsg 'begin make state' | echohl NONE

  for s:plugin in [
  \ 'Shougo/dpp-ext-installer',
  \ 'Shougo/dpp-ext-toml',
  \ 'Shougo/dpp-ext-local',
  \ 'Shougo/dpp-protocol-git',
  \ 'vim-denops/denops.vim',
  \]
    call InitPlugin(s:plugin)
  endfor

  call denops#server#wait_async({
  \-> dpp#make_state(s:dpp_cache, '$VIM_DPP/dpp.ts'->expand())
  \})
else
  autocmd vimrc BufWritePost *.lua,*.vim,*.toml,*.ts,vimrc,.vimrc
  \: if !dpp#check_files(s:dpp_cache)->empty()
  \| call dpp#make_state(s:dpp_cache, '$VIM_DPP/dpp.ts'->expand())
  \| endif
endif

autocmd vimrc User Dpp:makeStatePost
\ echohl WarningMsg | echomsg 'end make state' | echohl NONE

filetype plugin indent on
syntax enable

" hack: https://zenn.dev/vim_jp/articles/20240304_ekiden_disable_plugin
let s:save_rtp = &runtimepath
set rtp-=$VIMRUNTIME
autocmd SourcePre */plugin/* ++once let &runtimepath = s:save_rtp
