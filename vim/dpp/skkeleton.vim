" hook_add {{{
const s:gact10_dvp = "$VIM_DPP/skk/keymap.json"
\->expand()->readfile()->json_decode()
const s:skk_dict = dpp#get('skk-dict').path

imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

function s:skkeleton_init() abort
  call skkeleton#register_kanatable('gact10_dvp', s:gact10_dvp, v:true)
  call skkeleton#register_keymap('henkan', 'x', '')
  call skkeleton#register_keymap('henkan', 'X', '')
  call skkeleton#register_keymap('henkan', ';', 'henkanBackward')
  call skkeleton#register_keymap('henkan', ':', 'purgeCandidate')
  call skkeleton#config(#{
  \ eggLikeNewline: v:true,
  \ sources: ["deno_kv"],
  \ databasePath: '~/.skkeleton/db'->expand(),
  \ globalDictionaries: [
  \   [s:skk_dict .. "/SKK-JISYO.L", 'euc-jp'],
  \   "$VIM_DPP/skk/myJisyo.yaml"->expand(),
  \ ],
  \ userDictionary: '~/.skkeleton/userDictionary'->expand(),
  \ selectCandidateKeys: 'aoeuhtn',
  \ kanaTable: 'gact10_dvp',
  \ keepState: v:true,
  \ markerHenkan: "",
  \ markerHenkanSelect: "",
  \})
endfunction

augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END

" from https://zenn.dev/vim_jp/articles/my-azik-is-burning
let s:okuris = [
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

function s:skk_dq() abort
  if g:skkeleton#state.phase ==# 'input:okurinasi'
  \ && g:skkeleton#mode !=# 'abbrev'
  \ && skkeleton#vim_status().prevInput =~# '\a$'
    call skkeleton#handle('handleKey', #{key: 'aNn'->split('\zs')})
  elseif g:skkeleton#state.phase ==# 'input'
  \ && g:skkeleton#mode !=# 'zenkaku'
  \ && g:skkeleton#mode !=# 'abbrev'
    call skkeleton#handle('handleKey', #{key: 'Ann'->split('\zs')})
  else
    call skkeleton#handle('handleKey', #{key: '"'})
  endif
endfunction

augroup skkeleton-keymap
  autocmd!
  for [s:input, s:feed] in s:okuris
    call s:map_okuri(s:input, s:feed)
  endfor
  for s:mode in 'ic'->split('\zs')
    execute s:mode->printf('autocmd User skkeleton-enable-post %smap <buffer> " <Cmd>call <SID>skk_dq()<CR>')
  endfor
augroup END
" }}}
