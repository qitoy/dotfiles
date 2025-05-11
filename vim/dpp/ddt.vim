" hook_add {{{
function s:ddt_start(...) abort
  call ddt#start(#{
  \ ui: 'terminal',
  \ uiParams: #{
  \   terminal: #{
  \     command: a:0 ? a:000 : ['zsh'],
  \   },
  \ },
  \})
endfunction
command! -nargs=* Ddt
\ call s:ddt_start(<f-args>)
" }}}

" hook_source {{{
call ddt#custom#patch_global(#{
\ uiParams: #{
\   terminal: #{
\     prompt_pattern: '% ',
\   },
\   shell: #{
\     userPrompt: '"| " .. fnamemodify(getcwd(), ":~")',
\   },
\ },
\})

tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <Tab> pum#visible() ?
\ '<Cmd>call pum#map#select_relative(+1, "loop")<CR>' : '<Tab>'
tnoremap <expr> <S-Tab> pum#visible() ?
\ '<Cmd>call pum#map#select_relative(-1, "loop")<CR>' : '<S-Tab>'
tnoremap <C-y> <Cmd>call pum#map#confirm()<CR>
" }}}

" ddt-terminal {{{
" }}}

" ddt-shell {{{
inoremap <buffer> <CR> <Cmd>call ddt#ui#do_action('executeLine')<CR>
inoremap <buffer> <C-l> <Cmd>call ddt#ui#do_action('redraw')<CR>
" }}}
