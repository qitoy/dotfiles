" hook_add {{{
let s:gact10_dvp = {'bva': ['びゃ'], 'hnu': ['ひゅ'], 'bve': ['びぇ'], 'hnx': ['ひぃん'], 'hny': ['ひゅい'], 'bvi': ['びぃ'], 'bvj': ['びぇん'], 'bvk': ['びゅん'], 'po': ['ぉ'], 'bvo': ['びょ'], 'bvp': ['びゅう'], 'bvq': ['びょん'], 'bvu': ['びゅ'], 'bvx': ['びぃん'], 'bvy': ['びゅい'], 'bvz': ['びゃく'], 'nhi': ['にぃ'], 'ya': ['う゛ぁ'], ' ': 'henkanFirst', '!': ['！'], 'ye': ['う゛ぇ'], 'yi': ['う゛ぃ'], 'yj': ['う゛ぇん'], '(': ['（'], ')': ['）'], ',': ['、'], '-': ['ー'], '.': ['。'], '/': ['・'], 'vx': ['ふぃん'], 'yw': ['う゛ゅー'], 'yx': ['う゛ぃん'], 'yy': ['う゛ゅい'], 'yz': ['う゛ぉー'], '?': ['？'], '@': 'katakana', 'z''': ['ざん'], 'nhq': ['にょん'], 'wo': ['を'], 'z,': ['ぞう'], 'z.': ['ぜい'], 'dn''': ['ぢゃん'], 'dn,': ['ぢょう'], 'dn.': ['ぢぇい'], 'no': ['の'], '[': ['「'], 'p,': ['っと'], ']': ['」'], '^': 'hankatakana', 'cg,': ['きょう'], 'a': ['あ'], 'e': ['え'], 'i': ['い'], 'j': ['えん'], 'k': ['うん'], 'p.': ['って'], 'nh''': ['にゃん'], 'z;': ['ざい'], 'o': ['お'], 'p': ['っ'], 'q': ['おん'], 'nh,': ['にょう'], 'nh.': ['にぇい'], 'u': ['う'], 'ro': ['ろ'], 'x': ['いん'], 'f;': ['やい'], '~': ['～'], 'nh;': ['にゃい'], 'wx': ['うぃん'], 'ze': ['ぜ'], 'rg''': ['りゃん'], 'dna': ['ぢゃ'], 'zj': ['ぜん'], 'zk': ['ずん'], 'dne': ['ぢぇ'], 'lga': ['ぴゃ'], 'pa': ['ぁ'], 'zp': ['ずう'], 'dni': ['ぢぃ'], 'dnj': ['ぢぇん'], 'dnk': ['ぢゅん'], 'nq': ['のん'], 'zu': ['ず'], 'lgi': ['ぴぃ'], 'lgj': ['ぴぇん'], 'dnp': ['ぢゅう'], 'dnq': ['ぢょん'], 'zz': ['じょう'], 'lgo': ['ぴょ'], 'dnu': ['ぢゅ'], 'lgq': ['ぴょん'], 'mo': ['も'], 'dnx': ['ぢぃん'], 'dny': ['ぢゅい'], 'lgu': ['ぴゅ'], 'pu': ['ぅ'], 'zm;': ['じゃい'], 'lgx': ['ぴぃん'], 'lgy': ['ぴゅい'], 'fk': ['ゆん'], 'nhe': ['にぇ'], 'fo': ['よ'], 'fp': ['ゆう'], 'fq': ['よん'], 'nhj': ['にぇん'], 'nhk': ['にゅん'], 'fu': ['ゆ'], 'nhn': ['にょく'], 'nho': ['にょ'], 'nhp': ['にゅう'], 'fy': ['ゆい'], 'nhs': ['にゃく'], 'thy': ['ちゅい'], 'nhu': ['にゅ'], 'mq': ['もん'], 'nhx': ['にぃん'], 'nhy': ['にゅい'], 'mv.': ['みぇい'], 'g''': ['がん'], 'gr.': ['ぎぇい'], 'zma': ['じゃ'], 'rx': ['りん'], 'twk': ['てゅん'], 'zme': ['じぇ'], 'mw': ['みゅー'], 'ns': ['にょう'], 'zmi': ['じぃ'], 'zmj': ['じぇん'], 'zmk': ['じゅん'], 'mx': ['みん'], 'zmm': ['じゅく'], 'zmo': ['じょ'], 'zmp': ['じゅう'], 'zmq': ['じょん'], 'my': ['むい'], 'g;': ['がい'], 'zmu': ['じゅ'], 'zmv': ['じょく'], 'zmw': ['じゅつ'], 'mz': ['みょう'], 'za': ['ざ'], 'zmz': ['じゃく'], 'g.': ['げい'], 'ry': ['るい'], 'yk': ['う゛ゅん'], 'rg,': ['りょう'], 'y''': ['う゛ぁん'], 'pw': ['ゎ'], 'rg;': ['りゃい'], 'ga': ['が'], 'gc': ['ぎゅう'], 'ge': ['げ'], 'yo': ['う゛ぉ'], 'gi': ['ぎ'], 'gj': ['げん'], 'gk': ['ぐん'], 'gl': ['ぎょう'], 'go': ['ご'], 'gp': ['ぐう'], 'gq': ['ごん'], 'yq': ['う゛ぉん'], 'gu': ['ぐ'], 'l''': ['ぱん'], 'gx': ['ぎん'], 'gy': ['ぐい'], 'f''': ['やん'], 'r''': ['らん'], 'lge': ['ぴぇ'], 'r,': ['ろう'], 'r.': ['れい'], 'yu': ['う゛ゅ'], 'h''': ['はん'], 'th,': ['ちょう'], 'h,': ['ほう'], 'r;': ['らい'], 'h.': ['へい'], 'py': ['っち'], 'h;': ['はい'], 's.': ['せい'], 'zmx': ['じぃん'], 't;': ['たい'], 'zmy': ['じゅい'], 'ra': ['ら'], 'rc': ['りゅう'], 're': ['れ'], 'ri': ['り'], 'rj': ['れん'], 'rk': ['るん'], 'rl': ['りょう'], 'ha': ['は'], 'rp': ['るう'], 'rq': ['ろん'], 'bv,': ['びょう'], 'he': ['へ'], 'ru': ['る'], 'gr''': ['ぎゃん'], 'hi': ['ひ'], 'hj': ['へん'], 'hk': ['ふん'], 'gr,': ['ぎょう'], 'ho': ['ほ'], 'hp': ['ふう'], 'hq': ['ほん'], 'hs': ['ひょう'], 'ht': ['ひゅう'], 'hu': ['ふ'], 'hx': ['ひん'], 'hy': ['ふい'], 'gr;': ['ぎゃい'], 's''': ['さん'], 'th;': ['ちゃい'], 'we': ['うぇ'], 'g,': ['ごう'], 'bv''': ['びゃん'], 's;': ['さい'], 'shp': ['しゅう'], 'gra': ['ぎゃ'], 'gre': ['ぎぇ'], 'pfo': ['ょ'], 'twi': ['てぃ'], 'gri': ['ぎぃ'], 'grj': ['ぎぇん'], 'grk': ['ぎゅん'], 'grl': ['ぎゃく'], 'two': ['とぅ'], 'gro': ['ぎょ'], 'grp': ['ぎゅう'], 'grq': ['ぎょん'], 'grr': ['ぎょく'], 'twu': ['てゅ'], 'gru': ['ぎゅ'], 'twx': ['てぃん'], 'sa': ['さ'], 'grx': ['ぎぃん'], 'gry': ['ぎゅい'], 'se': ['せ'], 'si': ['し'], 'sj': ['せん'], 'sk': ['すん'], 'so': ['そ'], 'sp': ['すう'], 'sq': ['そん'], 'ss': ['しょう'], 'pfu': ['ゅ'], 'su': ['す'], 'sx': ['しん'], 'sy': ['すい'], 've': ['ふぇ'], 't''': ['たん'], 'cga': ['きゃ'], 't,': ['とう'], 't.': ['てい'], 'cge': ['きぇ'], 'cgi': ['きぃ'], 'cgj': ['きぇん'], 'cgk': ['きゅん'], 'cgl': ['きゃく'], 'vq': ['ふぉん'], 'cgo': ['きょ'], 'cgp': ['きゅう'], 'cgq': ['きょん'], 'cgr': ['きょく'], 'cgu': ['きゅ'], 'lg''': ['ぴゃん'], 'cgx': ['きぃん'], 'cgy': ['きゅい'], 'mv''': ['みゃん'], 'rgj': ['りぇん'], 'mv,': ['みょう'], 'rg.': ['りぇい'], 'lg,': ['ぴょう'], 'ta': ['た'], 'rgl': ['りゃく'], 'te': ['て'], 'vy': ['ふゅい'], 'ti': ['ち'], 'tj': ['てん'], 'tk': ['つん'], 'm.': ['めい'], 'to': ['と'], 'tp': ['つう'], 'tq': ['とん'], 'sh,': ['しょう'], 'ts': ['ちょう'], 'tt': ['ちゅう'], 'tu': ['つ'], 'tx': ['ちん'], 'ty': ['つい'], 'hn''': ['ひゃん'], 'lo': ['ぽ'], 'shj': ['しぇん'], 'mva': ['みゃ'], 'mve': ['みぇ'], 'mvi': ['みぃ'], 'mvj': ['みぇん'], 'mvk': ['みゅん'], 'dn;': ['ぢゃい'], 'mvo': ['みょ'], 'mvp': ['みゅー'], 'mvq': ['みょん'], 'zm''': ['じゃん'], 'mvu': ['みゅ'], 'mvv': ['みょく'], 'mvx': ['みぃん'], 'lgp': ['ぴゅう'], 'mvz': ['みゃく'], 'tha': ['ちゃ'], 'sh;': ['しゃい'], 'lx': ['ぴん'], 'f,': ['よう'], 'lg;': ['ぴゃい'], 'ly': ['ぷい'], 'p;': ['った'], 'the': ['ちぇ'], 'zo': ['ぞ'], 'mvy': ['みゅい'], '<s-.>': ['＞'], '<s-,>': ['＜'], 'zy': ['ずい'], 'mv;': ['みゃい'], 'w''': ['わん'], 'vo': ['ふぉ'], 'thk': ['ちゅん'], 'lg.': ['ぴぇい'], 'hn,': ['ひょう'], 'v''': ['ふぁん'], 'cg;': ['きゃい'], 'v,': ['ふぉー'], 'w,': ['うぉー'], 'v.': ['ふぇい'], 'tho': ['ちょ'], 'w.': ['うぇい'], 'l,': ['ぽう'], 'v;': ['ふぁい'], 'l.': ['ぺい'], 'yp': ['う゛ゅー'], 'b''': ['ばん'], 'cg''': ['きゃん'], 'y,': ['う゛ぉー'], '''': ['あん'], 'b,': ['ぼう'], 'l;': ['ぱい'], 'b.': ['べい'], 'ths': ['ちゃく'], 'pe': ['ぇ'], 'd;': ['だい'], 'b;': ['ばい'], 'thu': ['ちゅ'], 'hn.': ['ひぇい'], 'cg.': ['きぇい'], 'va': ['ふぁ'], 'vk': ['ふゅん'], 'st': ['しゅう'], 'y;': ['う゛ぁい'], 'vi': ['ふぃ'], 'vj': ['ふぇん'], 'thx': ['ちぃん'], 'zw': ['じゅう'], 'la': ['ぱ'], 'vp': ['ふゅー'], 'lc': ['ぴゅう'], 'le': ['ぺ'], 'vu': ['ふゅ'], 'hns': ['ひゃく'], 'li': ['ぴ'], 'lj': ['ぺん'], 'lk': ['ぷん'], 'll': ['ぴょう'], 'ba': ['ば'], 'lp': ['ぷう'], 'lq': ['ぽん'], 'be': ['べ'], 'lu': ['ぷ'], 'bi': ['び'], 'bj': ['べん'], 'bk': ['ぶん'], 'dbk': ['でゅん'], 'bo': ['ぼ'], 'bp': ['ぶう'], 'bq': ['ぼん'], 'th''': ['ちゃん'], 'bu': ['ぶ'], 'bw': ['びゅう'], 'bx': ['びん'], 'by': ['ぶい'], 'bz': ['びょう'], 'm''': ['まん'], 'm,': ['もう'], 'w;': ['わい'], 'dbo': ['どぅ'], 'nx': ['にん'], 'c''': ['かん'], 'zm.': ['じぇい'], 'ny': ['ぬい'], 'm;': ['まい'], 'c.': ['けい'], 'sh.': ['しぇい'], 'zi': ['じ'], 'c;': ['かい'], 'dbu': ['でゅ'], 'wa': ['わ'], 'y.': ['う゛ぇい'], 'pi': ['ぃ'], 'sha': ['しゃ'], 'wi': ['うぃ'], 'wj': ['うぇん'], 'ma': ['ま'], 'c,': ['こう'], 'wq': ['うぉん'], 'me': ['め'], '; ': ['　'], 'mi': ['み'], 'mj': ['めん'], 'mk': ['むん'], 'wz': ['うぉー'], 'ca': ['か'], 'mp': ['むう'], 'cc': ['きゅう'], 'zq': ['ぞん'], 'ce': ['け'], ';.': ['……'], 'mu': ['む'], 'sht': ['しゅつ'], 'ci': ['き'], 'cj': ['けん'], 'ck': ['くん'], 'cl': ['きょう'], 'co': ['こ'], 'cp': ['くう'], 'cq': ['こん'], 'shh': ['しゅく'], 'cu': ['く'], 'cx': ['きん'], 'cy': ['くい'], 'shi': ['しぃ'], 'th.': ['ちぇい'], 'zm,': ['じょう'], 'n''': ['なん'], 'pfa': ['ゃ'], 'sh''': ['しゃん'], 'n,': ['のう'], 'n.': ['ねい'], 'shu': ['しゅ'], 'zx': ['じん'], 'dno': ['ぢょ'], 'd''': ['だん'], 'lgk': ['ぴゅん'], 'd,': ['どう'], 'n;': ['ない'], 'd.': ['でい'], 'lgl': ['ぴゃく'], 'rga': ['りゃ'], 'rge': ['りぇ'], '<s-;>': 'abbrev', 'rgi': ['りぃ'], ';h': ['←'], 'rgk': ['りゅん'], ';j': ['↓'], ';k': ['↑'], ';l': ['→'], 'rgo': ['りょ'], 'rgp': ['りゅう'], 'rgq': ['りょん'], 'rgr': ['りょく'], 'rgu': ['りゅ'], 'fa': ['や'], 's,': ['そう'], 'rgx': ['りぃん'], 'rgy': ['りゅい'], 'pp': ['っつ'], 'bv;': ['びゃい'], 'thi': ['ちぃ'], 'thj': ['ちぇん'], 'na': ['な'], 'hn;': ['ひゃい'], 'thn': ['ちょく'], 'ne': ['ね'], 'thp': ['ちゅう'], 'thq': ['ちょん'], 'bv.': ['びぇい'], 'ni': ['に'], 'nj': ['ねん'], 'nk': ['ぬん'], 'nn': ['ん'], 'da': ['だ'], 'np': ['ぬう'], 'dbi': ['でぃ'], 'de': ['で'], 'nt': ['にゅう'], 'nu': ['ぬ'], 'di': ['ぢ'], 'dj': ['でん'], 'dk': ['づん'], 'do': ['ど'], 'dp': ['づう'], 'dq': ['どん'], 'dbx': ['でぃん'], 'she': ['しぇ'], 'du': ['づ'], 'nha': ['にゃ'], 'dx': ['ぢん'], 'dy': ['づい'], 'shk': ['しゅん'], 'hna': ['ひゃ'], 'shn': ['しょく'], 'sho': ['しょ'], 'hne': ['ひぇ'], 'shq': ['しょん'], 'shs': ['しゃく'], 'hni': ['ひぃ'], 'hnj': ['ひぇん'], 'hnk': ['ひゅん'], 'shx': ['しぃん'], 'shy': ['しゅい'], 'hno': ['ひょ'], 'hnp': ['ひゅう'], 'hnq': ['ひょん']}

nmap <C-j> i<Plug>(skkeleton-enable)
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)
tmap <C-j> <Plug>(skkeleton-toggle)

function s:skkeleton_init() abort
  call skkeleton#register_kanatable('gact10_dvp', s:gact10_dvp, v:true)
  call skkeleton#config(#{
  \ eggLikeNewline: v:true,
  \ globalDictionaries: [
  \   ['/usr/share/skk/SKK-JISYO.L', 'euc-jp'],
  \   '~/.skk/SKK-JISYO.emoji.utf8',
  \   '~/.skk/SKK-JISYO.edict'
  \ ],
  \ userJisyo: "~/.skkeleton",
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
  for mode in ['i', 'c', 't']
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
  for s:mode in 'ict'->split('\zs')
    execute s:mode->printf('autocmd User skkeleton-enable-post %smap <buffer> " <Cmd>call <SID>skk_dq()<CR>')
  endfor
augroup END

" https://github.com/kuuote/dotvim/commit/4e7fd8fa99b6550414b0dc1a6f26bbc8a2389e98
" 変換ポイント切ってる時だけcursorlineを表示する
let s:cursorline_phase = {
\   'input:okurinasi': v:true,
\   'input:okuriari': v:true,
\   'henkan': v:true,
\ }

function s:cursorline() abort
  let phase = g:skkeleton#state.phase
  if has_key(s:cursorline_phase, phase)
    setlocal cursorline
  else
    setlocal nocursorline
  endif
endfunction

autocmd User skkeleton-handled call s:cursorline()
autocmd User skkeleton-disable-post setlocal nocursorline
" }}}
