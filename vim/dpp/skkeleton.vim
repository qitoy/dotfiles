" hook_add {{{
const s:gact10_dvp = "$VIM_DPP/skk/gact10_dvp.json"
\->expand()->readfile()->json_decode()
const s:tsuki_dvp = "$VIM_DPP/skk/tsuki_dvp.json"
\->expand()->readfile()->json_decode()
const s:skk_dict = dpp#get('skk-dict').path

inoremap <C-j> <Plug>(skkeleton-toggle)
cnoremap <C-j> <Plug>(skkeleton-toggle)
tnoremap <C-j> <Plug>(skkeleton-toggle)

function s:skkeleton_init() abort
  call mkdir('~/.skkeleton'->expand(), 'p')
  call skkeleton#register_kanatable('gact10_dvp', s:gact10_dvp, v:true)
  call skkeleton#register_kanatable('tsuki_dvp', s:tsuki_dvp, v:true)
  call skkeleton#register_keymap('henkan', 'x', '')
  call skkeleton#register_keymap('henkan', 'X', '')
  call skkeleton#register_keymap('henkan', ';', 'henkanBackward')
  call skkeleton#register_keymap('henkan', ':', 'purgeCandidate')
  call skkeleton#config(#{
  \ eggLikeNewline: v:true,
  \ sources: ["deno_kv"],
  \ databasePath: '~/.skkeleton/db'->expand(),
  \ globalDictionaries: [
  \   [s:skk_dict .. '/share/skk/SKK-JISYO.L', 'euc-jp'],
  \   "$VIM_DPP/skk/myJisyo.yaml"->expand(),
  \ ],
  \ userDictionary: '~/.skkeleton/userDictionary'->expand(),
  \ lowercaseMap: {
  \   '"': '''',
  \   '<': ',',
  \   '>': '.',
  \ },
  \ selectCandidateKeys: 'aoeuhtn',
  \ kanaTable: 'gact10_dvp',
  \ keepState: v:true,
  \})
endfunction

augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END

" from https://zenn.dev/vim_jp/articles/my-azik-is-burning
let s:okuris = [
\ ['"', 'aNn'],
\ ['Q', 'oNn'],
\ ['J', 'eNn'],
\ ['K', 'uNn'],
\ ['X', 'iNn'],
\
\ [':', 'aI'],
\ ['<', 'oU'],
\ ['>', 'eI'],
\ ['P', 'uU'],
\ ['Y', 'uI'],
\]

function s:map_okuri(input, feed) abort
  for mode in ['i', 'c']
    call skkeleton#internal#map#save(mode)
    execute printf(
    \ 'autocmd User skkeleton-enable-post %smap <buffer> %s <Cmd>call <SID>okuri(''%s'', ''%s'')<CR>',
    \ mode, a:input, a:input, a:feed
    \)
    " unmapについてはskkeleton側がうまくやってくれる
  endfor
endfunction

function s:okuri(input, feed) abort
  if g:skkeleton#state.phase ==# 'input:okurinasi'
  \ && g:skkeleton#mode !=# 'abbrev'
  \ && skkeleton#vim_status().prevInput =~# '\a$'
    call skkeleton#handle('handleKey', #{key: a:feed->split('\zs')})
  else
    call skkeleton#handle('handleKey', #{key: a:input})
  endif
endfunction

augroup skkeleton-keymap
  autocmd!
  for [s:input, s:feed] in s:okuris
    call s:map_okuri(s:input, s:feed)
  endfor
augroup END
" }}}
