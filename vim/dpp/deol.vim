" hook_add {{{
function s:deol_start(...) abort
  call deol#start(a:0 ? #{ command: a:000 } : {})
endfunction
command! -nargs=* Deol
\ call s:deol_start(<f-args>)
" }}}

" hook_source {{{
let g:deol#shell_history_path = '~/.zsh-history'
let g:deol#prompt_pattern = '% '

tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <Tab> pum#visible() ?
\ '<Cmd>call pum#map#select_relative(+1, "loop")<CR>' : '<Tab>'
tnoremap <expr> <S-Tab> pum#visible() ?
\ '<Cmd>call pum#map#select_relative(-1, "loop")<CR>' : '<S-Tab>'
tnoremap <C-y> <Cmd>call pum#map#confirm()<CR>
" }}}

" deol {{{
nnoremap <buffer> gf
\ <Cmd>Ddu file_point -sync -ui-param-ff-ignoreEmpty
\ -ui-param-ff-immediateAction=open<CR>
nnoremap <buffer> <C-n>  <Plug>(deol_next_prompt)
nnoremap <buffer> <C-p>  <Plug>(deol_previous_prompt)
nnoremap <buffer> <CR>   <Plug>(deol_execute_line)
nnoremap <buffer> A      <Plug>(deol_start_append_last)
nnoremap <buffer> I      <Plug>(deol_start_insert_first)
nnoremap <buffer> a      <Plug>(deol_start_append)
nnoremap <buffer> e      <Plug>(deol_edit)
nnoremap <buffer> i      <Plug>(deol_start_insert)
nnoremap <buffer> q      <Plug>(deol_quit)
" }}}
