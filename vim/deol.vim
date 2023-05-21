" hook_source {{{
let g:deol#shell_history_path = '~/.zsh-history'

tnoremap <expr> <Tab> pum#visible() ?
\ '<Cmd>call pum#map#insert_relative(+1)<CR>' : '<Tab>'
tnoremap <expr> <S-Tab> pum#visible() ?
\ '<Cmd>call pum#map#insert_relative(-1)<CR>' : '<S-Tab>'
" }}}
