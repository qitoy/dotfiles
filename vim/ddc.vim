" hook_source {{{
call ddc#custom#patch_global('sources', [
\  has('nvim') ? 'nvim-lsp' : 'vim-lsp',
\  'around',
\  'ultisnips',
\])

call ddc#custom#patch_global('cmdlineSources',
\  ['cmdline', 'cmdline-history', 'around'])

call ddc#custom#patch_global('sourceOptions', #{
\  _: #{
\    ignoreCase: v:true,
\    matchers: ['matcher_fuzzy'],
\    sorters: ['sorter_fuzzy'],
\    converters: ['converter_fuzzy'],
\  },
\  vim-lsp: #{
\    mark: '| LSP',
\    forceCompletionPattern: '(\.|:|->|"\w+/*).?',
\  },
\  nvim-lsp: #{
\    mark: '| LSP',
\    forceCompletionPattern: '(\.|:|->|"\w+/*).?',
\  },
\  ultisnips: #{ mark: '| US' },
\  around: #{ mark: '| A' },
\  necovim: #{ mark: '| vim' },
\  nvim-lua: #{ mark: '| lua' },
\  mocword: #{
\    mark: '| mocword',
\    minAutoCompleteLength: 3,
\    isVolatile: v:true,
\  },
\  cmdline: #{
\    ignoreCase: v:false,
\    mark: '| cmd',
\    forceCompletionPattern: '\S/\S*',
\  },
\  cmdline-history: #{
\    mark: '| history',
\  },
\})

call ddc#custom#patch_global('filterParams', #{
\  converter_fuzzy: #{
\    hlGroup: 'CursorLine'
\  },
\})

call ddc#custom#patch_filetype(
\ ['vim'], 'sources', [
\  'necovim',
\  'around',
\  'ultisnips',
\ ])

call ddc#custom#patch_filetype(
\ ['lua'], 'sources', [
\  'nvim-lua',
\  'around',
\  'ultisnips',
\ ])

call ddc#custom#patch_filetype(
\ ['markdown'], 'sources', [
\ 'mocword',
\ 'around',
\ ])

" Use pum.vim
call ddc#custom#patch_global('ui', 'pum')

inoremap <silent><expr> <TAB>
\ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-Y> <Cmd>call pum#map#confirm()<CR>

" Use cmdline ddc
call ddc#custom#patch_global('autoCompleteEvents', [
\  'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged',
\])

" Use ddc.
call ddc#enable()
" }}}

" hook_add {{{
nnoremap : <Cmd>call CommandlinePre()<CR>:

function! CommandlinePre() abort
  " Note: It disables default command line completion!
  cnoremap <expr> <Tab>
  \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
  \ ddc#map#manual_complete()
  cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>

  autocmd User DDCCmdlineLeave ++once call CommandlinePost()

  " Enable command line completion
  call ddc#enable_cmdline_completion()
endfunction
function! CommandlinePost() abort
  silent! cunmap <Tab>
  silent! cunmap <S-Tab>
endfunction
" }}}
