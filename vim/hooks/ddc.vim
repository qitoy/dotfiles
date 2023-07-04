" hook_source {{{
call ddc#custom#load_config('$VIM_HOOKS/ddc.ts'->expand())

call ddc#custom#patch_global('sourceParams', #{
\ nvim-lsp: #{
\   snippetEngine: denops#callback#register({
\     body -> UltiSnips#Anon(body)
\   }),
\ },
\})

inoremap <silent><expr> <TAB>
\ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1, "loop")<CR>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1, 'loop')<CR>
inoremap <C-Y> <Cmd>call pum#map#confirm()<CR>

" Use terminal ddc
call ddc#enable_terminal_completion()

" Use ddc.
call ddc#enable(#{ context_filetype: has('nvim') ? 'treesitter' : 'context_filetype' })
" }}}

" hook_add {{{
nnoremap : <Cmd>call CommandlinePre()<CR>:

function! CommandlinePre() abort
  " Note: It disables default command line completion!
  cnoremap <expr> <Tab>
  \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1, "loop")<CR>' :
  \ ddc#map#manual_complete()
  cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1, 'loop')<CR>

  autocmd User DDCCmdlineLeave ++once call CommandlinePost()

  " Enable command line completion
  call ddc#enable_cmdline_completion()
endfunction
function! CommandlinePost() abort
  silent! cunmap <Tab>
  silent! cunmap <S-Tab>
endfunction
" }}}
