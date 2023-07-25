" hook_source {{{
let g:deol#shell_history_path = '~/.zsh-history'
let g:deol#prompt_pattern = '\$ '

tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <Tab> pum#visible() ?
\ '<Cmd>call pum#map#select_relative(+1, "loop")<CR>' : '<Tab>'
tnoremap <expr> <S-Tab> pum#visible() ?
\ '<Cmd>call pum#map#select_relative(-1, "loop")<CR>' : '<S-Tab>'
tnoremap <C-y> <Cmd>call pum#map#confirm()<CR>
" }}}

" deol {{{
nnoremap <buffer> gf
\ <Cmd>Ddu file_point -sync -ui-param-ignoreEmpty
\ -ui-param-immediateAction=open<CR>
" }}}
