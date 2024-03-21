" hook_add {{{
nnoremap gs <Cmd>GinStatus<CR>
nnoremap gl <Cmd>GinLog --graph --oneline<CR>

autocmd vimrc Filetype gin-* nnoremap <buffer> q <Cmd>bdelete<CR>
" }}}

" gin-status {{{
nnoremap <buffer> h <Plug>(gin-action-stage)
vnoremap <buffer> h <Plug>(gin-action-stage)
nnoremap <buffer> l <Plug>(gin-action-unstage)
vnoremap <buffer> l <Plug>(gin-action-unstage)
nnoremap <buffer> cc <Cmd>Gin commit<CR>
nnoremap <buffer> ca <Cmd>Gin commit --amend<CR>
" }}}
