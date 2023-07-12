" hook_add {{{
let s:gact10_dvp = {
\ "!": ["！"],
\ ",": ["、"],
\ "-": ["ー"],
\ ".": ["。"],
\ "/": ["・"],
\ ":": "abbrev",
\ ";.": ["……"],
\ ";\<Space>": ["\u3000"],
\ ";h": ["←"],
\ ";j": ["↓"],
\ ";k": ["↑"],
\ ";l": ["→"],
\ "?": ["？"],
\ "@": "katakana",
\ "[": ["「"],
\ "\<Space>": "henkanFirst",
\ "]": ["」"],
\ "^": "hankatakana",
\ "a": ["あ"],
\ "ba": ["ば"],
\ "be": ["べ"],
\ "bi": ["び"],
\ "bj": ["べん"],
\ "bk": ["ぶん"],
\ "bo": ["ぼ"],
\ "bp": ["ぶう"],
\ "bq": ["ぼん"],
\ "bu": ["ぶ"],
\ "bva": ["びゃ"],
\ "bve": ["びぇ"],
\ "bvi": ["びぃ"],
\ "bvj": ["びぇん"],
\ "bvk": ["びゅん"],
\ "bvo": ["びょ"],
\ "bvp": ["びゅう"],
\ "bvq": ["びょん"],
\ "bvu": ["びゅ"],
\ "bvx": ["びぃん"],
\ "bvy": ["びゅい"],
\ "bvz": ["びゃく"],
\ "bw": ["びゅう"],
\ "bx": ["びん"],
\ "by": ["ぶい"],
\ "bz": ["びょう"],
\ "ca": ["か"],
\ "cc": ["きゅう"],
\ "ce": ["け"],
\ "cga": ["きゃ"],
\ "cge": ["きぇ"],
\ "cgi": ["きぃ"],
\ "cgj": ["きぇん"],
\ "cgk": ["きゅん"],
\ "cgl": ["きゃく"],
\ "cgo": ["きょ"],
\ "cgp": ["きゅう"],
\ "cgq": ["きょん"],
\ "cgr": ["きょく"],
\ "cgu": ["きゅ"],
\ "cgx": ["きぃん"],
\ "cgy": ["きゅい"],
\ "ci": ["き"],
\ "cj": ["けん"],
\ "ck": ["くん"],
\ "cl": ["きょう"],
\ "co": ["こ"],
\ "cp": ["くう"],
\ "cq": ["こん"],
\ "cu": ["く"],
\ "cx": ["きん"],
\ "cy": ["くい"],
\ "da": ["だ"],
\ "dbi": ["でぃ"],
\ "dbk": ["でゅん"],
\ "dbo": ["どぅ"],
\ "dbu": ["でゅ"],
\ "dbx": ["でぃん"],
\ "de": ["で"],
\ "di": ["ぢ"],
\ "dj": ["でん"],
\ "dk": ["づん"],
\ "dna": ["ぢゃ"],
\ "dne": ["ぢぇ"],
\ "dni": ["ぢぃ"],
\ "dnj": ["ぢぇん"],
\ "dnk": ["ぢゅん"],
\ "dno": ["ぢょ"],
\ "dnp": ["ぢゅう"],
\ "dnq": ["ぢょん"],
\ "dnu": ["ぢゅ"],
\ "dnx": ["ぢぃん"],
\ "dny": ["ぢゅい"],
\ "do": ["ど"],
\ "dp": ["づう"],
\ "dq": ["どん"],
\ "du": ["づ"],
\ "dx": ["ぢん"],
\ "dy": ["づい"],
\ "e": ["え"],
\ "fa": ["や"],
\ "fk": ["ゆん"],
\ "fo": ["よ"],
\ "fp": ["ゆう"],
\ "fq": ["よん"],
\ "fu": ["ゆ"],
\ "fy": ["ゆい"],
\ "ga": ["が"],
\ "gc": ["ぎゅう"],
\ "ge": ["げ"],
\ "gi": ["ぎ"],
\ "gj": ["げん"],
\ "gk": ["ぐん"],
\ "gl": ["ぎょう"],
\ "go": ["ご"],
\ "gp": ["ぐう"],
\ "gq": ["ごん"],
\ "gra": ["ぎゃ"],
\ "gre": ["ぎぇ"],
\ "gri": ["ぎぃ"],
\ "grj": ["ぎぇん"],
\ "grk": ["ぎゅん"],
\ "grl": ["ぎゃく"],
\ "gro": ["ぎょ"],
\ "grp": ["ぎゅう"],
\ "grq": ["ぎょん"],
\ "grr": ["ぎょく"],
\ "gru": ["ぎゅ"],
\ "grx": ["ぎぃん"],
\ "gry": ["ぎゅい"],
\ "gu": ["ぐ"],
\ "gx": ["ぎん"],
\ "gy": ["ぐい"],
\ "ha": ["は"],
\ "he": ["へ"],
\ "hi": ["ひ"],
\ "hj": ["へん"],
\ "hk": ["ふん"],
\ "hna": ["ひゃ"],
\ "hne": ["ひぇ"],
\ "hni": ["ひぃ"],
\ "hnj": ["ひぇん"],
\ "hnk": ["ひゅん"],
\ "hno": ["ひょ"],
\ "hnp": ["ひゅう"],
\ "hnq": ["ひょん"],
\ "hns": ["ひゃく"],
\ "hnu": ["ひゅ"],
\ "hnx": ["ひぃん"],
\ "hny": ["ひゅい"],
\ "ho": ["ほ"],
\ "hp": ["ふう"],
\ "hq": ["ほん"],
\ "hs": ["ひょう"],
\ "ht": ["ひゅう"],
\ "hu": ["ふ"],
\ "hx": ["ひん"],
\ "hy": ["ふい"],
\ "i": ["い"],
\ "j": ["えん"],
\ "k": ["うん"],
\ "la": ["ぱ"],
\ "lc": ["ぴゅう"],
\ "le": ["ぺ"],
\ "lga": ["ぴゃ"],
\ "lge": ["ぴぇ"],
\ "lgi": ["ぴぃ"],
\ "lgj": ["ぴぇん"],
\ "lgk": ["ぴゅん"],
\ "lgl": ["ぴゃく"],
\ "lgo": ["ぴょ"],
\ "lgp": ["ぴゅう"],
\ "lgq": ["ぴょん"],
\ "lgu": ["ぴゅ"],
\ "lgx": ["ぴぃん"],
\ "lgy": ["ぴゅい"],
\ "li": ["ぴ"],
\ "lj": ["ぺん"],
\ "lk": ["ぷん"],
\ "ll": ["ぴょう"],
\ "lo": ["ぽ"],
\ "lp": ["ぷう"],
\ "lq": ["ぽん"],
\ "lu": ["ぷ"],
\ "lx": ["ぴん"],
\ "ly": ["ぷい"],
\ "ma": ["ま"],
\ "me": ["め"],
\ "mi": ["み"],
\ "mj": ["めん"],
\ "mk": ["むん"],
\ "mo": ["も"],
\ "mp": ["むう"],
\ "mq": ["もん"],
\ "mu": ["む"],
\ "mva": ["みゃ"],
\ "mve": ["みぇ"],
\ "mvi": ["みぃ"],
\ "mvj": ["みぇん"],
\ "mvk": ["みゅん"],
\ "mvo": ["みょ"],
\ "mvp": ["みゅー"],
\ "mvq": ["みょん"],
\ "mvu": ["みゅ"],
\ "mvv": ["みょく"],
\ "mvx": ["みぃん"],
\ "mvy": ["みゅい"],
\ "mvz": ["みゃく"],
\ "mw": ["みゅー"],
\ "mx": ["みん"],
\ "my": ["むい"],
\ "mz": ["みょう"],
\ "na": ["な"],
\ "ne": ["ね"],
\ "nha": ["にゃ"],
\ "nhe": ["にぇ"],
\ "nhi": ["にぃ"],
\ "nhj": ["にぇん"],
\ "nhk": ["にゅん"],
\ "nhn": ["にょく"],
\ "nho": ["にょ"],
\ "nhp": ["にゅう"],
\ "nhq": ["にょん"],
\ "nhs": ["にゃく"],
\ "nhu": ["にゅ"],
\ "nhx": ["にぃん"],
\ "nhy": ["にゅい"],
\ "ni": ["に"],
\ "nj": ["ねん"],
\ "nk": ["ぬん"],
\ "nn": ["ん"],
\ "no": ["の"],
\ "np": ["ぬう"],
\ "nq": ["のん"],
\ "ns": ["にょう"],
\ "nt": ["にゅう"],
\ "nu": ["ぬ"],
\ "nx": ["にん"],
\ "ny": ["ぬい"],
\ "o": ["お"],
\ "p": ["っ"],
\ "pa": ["ぁ"],
\ "pe": ["ぇ"],
\ "pfa": ["ゃ"],
\ "pfo": ["ょ"],
\ "pfu": ["ゅ"],
\ "pi": ["ぃ"],
\ "po": ["ぉ"],
\ "pp": ["っつ"],
\ "pu": ["ぅ"],
\ "pw": ["ゎ"],
\ "py": ["っち"],
\ "q": ["おん"],
\ "ra": ["ら"],
\ "rc": ["りゅう"],
\ "re": ["れ"],
\ "rga": ["りゃ"],
\ "rge": ["りぇ"],
\ "rgi": ["りぃ"],
\ "rgj": ["りぇん"],
\ "rgk": ["りゅん"],
\ "rgl": ["りゃく"],
\ "rgo": ["りょ"],
\ "rgp": ["りゅう"],
\ "rgq": ["りょん"],
\ "rgr": ["りょく"],
\ "rgu": ["りゅ"],
\ "rgx": ["りぃん"],
\ "rgy": ["りゅい"],
\ "ri": ["り"],
\ "rj": ["れん"],
\ "rk": ["るん"],
\ "rl": ["りょう"],
\ "ro": ["ろ"],
\ "rp": ["るう"],
\ "rq": ["ろん"],
\ "ru": ["る"],
\ "rx": ["りん"],
\ "ry": ["るい"],
\ "sa": ["さ"],
\ "se": ["せ"],
\ "sha": ["しゃ"],
\ "she": ["しぇ"],
\ "shh": ["しゅく"],
\ "shi": ["しぃ"],
\ "shj": ["しぇん"],
\ "shk": ["しゅん"],
\ "shn": ["しょく"],
\ "sho": ["しょ"],
\ "shp": ["しゅう"],
\ "shq": ["しょん"],
\ "shs": ["しゃく"],
\ "sht": ["しゅつ"],
\ "shu": ["しゅ"],
\ "shx": ["しぃん"],
\ "shy": ["しゅい"],
\ "si": ["し"],
\ "sj": ["せん"],
\ "sk": ["すん"],
\ "so": ["そ"],
\ "sp": ["すう"],
\ "sq": ["そん"],
\ "ss": ["しょう"],
\ "st": ["しゅう"],
\ "su": ["す"],
\ "sx": ["しん"],
\ "sy": ["すい"],
\ "ta": ["た"],
\ "te": ["て"],
\ "tha": ["ちゃ"],
\ "the": ["ちぇ"],
\ "thi": ["ちぃ"],
\ "thj": ["ちぇん"],
\ "thk": ["ちゅん"],
\ "thn": ["ちょく"],
\ "tho": ["ちょ"],
\ "thp": ["ちゅう"],
\ "thq": ["ちょん"],
\ "ths": ["ちゃく"],
\ "thu": ["ちゅ"],
\ "thx": ["ちぃん"],
\ "thy": ["ちゅい"],
\ "ti": ["ち"],
\ "tj": ["てん"],
\ "tk": ["つん"],
\ "to": ["と"],
\ "tp": ["つう"],
\ "tq": ["とん"],
\ "ts": ["ちょう"],
\ "tt": ["ちゅう"],
\ "tu": ["つ"],
\ "twi": ["てぃ"],
\ "twk": ["てゅん"],
\ "two": ["とぅ"],
\ "twu": ["てゅ"],
\ "twx": ["てぃん"],
\ "tx": ["ちん"],
\ "ty": ["つい"],
\ "u": ["う"],
\ "va": ["ふぁ"],
\ "ve": ["ふぇ"],
\ "vi": ["ふぃ"],
\ "vj": ["ふぇん"],
\ "vk": ["ふゅん"],
\ "vo": ["ふぉ"],
\ "vp": ["ふゅー"],
\ "vq": ["ふぉん"],
\ "vu": ["ふゅ"],
\ "vx": ["ふぃん"],
\ "vy": ["ふゅい"],
\ "wa": ["わ"],
\ "we": ["うぇ"],
\ "wi": ["うぃ"],
\ "wj": ["うぇん"],
\ "wo": ["を"],
\ "wq": ["うぉん"],
\ "wx": ["うぃん"],
\ "wz": ["うぉー"],
\ "x": ["いん"],
\ "ya": ["う゛ぁ"],
\ "ye": ["う゛ぇ"],
\ "yi": ["う゛ぃ"],
\ "yj": ["う゛ぇん"],
\ "yk": ["う゛ゅん"],
\ "yo": ["う゛ぉ"],
\ "yp": ["う゛ゅー"],
\ "yq": ["う゛ぉん"],
\ "yu": ["う゛ゅ"],
\ "yw": ["う゛ゅー"],
\ "yx": ["う゛ぃん"],
\ "yy": ["う゛ゅい"],
\ "yz": ["う゛ぉー"],
\ "za": ["ざ"],
\ "ze": ["ぜ"],
\ "zi": ["じ"],
\ "zj": ["ぜん"],
\ "zk": ["ずん"],
\ "zma": ["じゃ"],
\ "zme": ["じぇ"],
\ "zmi": ["じぃ"],
\ "zmj": ["じぇん"],
\ "zmk": ["じゅん"],
\ "zmm": ["じゅく"],
\ "zmo": ["じょ"],
\ "zmp": ["じゅう"],
\ "zmq": ["じょん"],
\ "zmu": ["じゅ"],
\ "zmv": ["じょく"],
\ "zmw": ["じゅつ"],
\ "zmx": ["じぃん"],
\ "zmy": ["じゅい"],
\ "zmz": ["じゃく"],
\ "zo": ["ぞ"],
\ "zp": ["ずう"],
\ "zq": ["ぞん"],
\ "zu": ["ず"],
\ "zw": ["じゅう"],
\ "zx": ["じん"],
\ "zy": ["ずい"],
\ "zz": ["じょう"],
\ "~": ["～"],
\}

for [key, value] in items({
\ "b": ["ばい"],
\ "bv": ["びゃい"],
\ "c": ["かい"],
\ "cg": ["きゃい"],
\ "d": ["だい"],
\ "dn": ["ぢゃい"],
\ "f": ["やい"],
\ "g": ["がい"],
\ "gr": ["ぎゃい"],
\ "h": ["はい"],
\ "hn": ["ひゃい"],
\ "l": ["ぱい"],
\ "lg": ["ぴゃい"],
\ "m": ["まい"],
\ "mv": ["みゃい"],
\ "n": ["ない"],
\ "nh": ["にゃい"],
\ "p": ["った"],
\ "r": ["らい"],
\ "rg": ["りゃい"],
\ "s": ["さい"],
\ "sh": ["しゃい"],
\ "t": ["たい"],
\ "th": ["ちゃい"],
\ "v": ["ふぁい"],
\ "w": ["わい"],
\ "y": ["う゛ぁい"],
\ "z": ["ざい"],
\ "zm": ["じゃい"],
\})
  let s:gact10_dvp[key .. ";"] = value
  let s:gact10_dvp[key .. ":"] = value
endfor

for [key, value] in items({
\ "b": ["ぼう"],
\ "bv": ["びょう"],
\ "c": ["こう"],
\ "cg": ["きょう"],
\ "d": ["どう"],
\ "dn": ["ぢょう"],
\ "f": ["よう"],
\ "g": ["ごう"],
\ "gr": ["ぎょう"],
\ "h": ["ほう"],
\ "hn": ["ひょう"],
\ "l": ["ぽう"],
\ "lg": ["ぴょう"],
\ "m": ["もう"],
\ "mv": ["みょう"],
\ "n": ["のう"],
\ "nh": ["にょう"],
\ "p": ["っと"],
\ "r": ["ろう"],
\ "rg": ["りょう"],
\ "s": ["そう"],
\ "sh": ["しょう"],
\ "t": ["とう"],
\ "th": ["ちょう"],
\ "v": ["ふぉー"],
\ "w": ["うぉー"],
\ "y": ["う゛ぉー"],
\ "z": ["ぞう"],
\ "zm": ["じょう"],
\})
  let s:gact10_dvp[key .. ","] = value
  let s:gact10_dvp[key .. "<"] = value
endfor

for [key, value] in items({
\ "b": ["べい"],
\ "bv": ["びぇい"],
\ "c": ["けい"],
\ "cg": ["きぇい"],
\ "d": ["でい"],
\ "dn": ["ぢぇい"],
\ "g": ["げい"],
\ "gr": ["ぎぇい"],
\ "h": ["へい"],
\ "hn": ["ひぇい"],
\ "l": ["ぺい"],
\ "lg": ["ぴぇい"],
\ "m": ["めい"],
\ "mv": ["みぇい"],
\ "n": ["ねい"],
\ "nh": ["にぇい"],
\ "p": ["って"],
\ "r": ["れい"],
\ "rg": ["りぇい"],
\ "s": ["せい"],
\ "sh": ["しぇい"],
\ "t": ["てい"],
\ "th": ["ちぇい"],
\ "v": ["ふぇい"],
\ "w": ["うぇい"],
\ "y": ["う゛ぇい"],
\ "z": ["ぜい"],
\ "zm": ["じぇい"],
\})
  let s:gact10_dvp[key .. "."] = value
  let s:gact10_dvp[key .. ">"] = value
endfor

let s:henkanPoint = "\<F1>"
let s:gact10_dvp[s:henkanPoint] = "henkanPoint"
let s:gact10_dvp["'"] = ["あん"]
for [key, value] in items({
\ "b": ["ばん"],
\ "bv": ["びゃん"],
\ "c": ["かん"],
\ "cg": ["きゃん"],
\ "d": ["だん"],
\ "dn": ["ぢゃん"],
\ "f": ["やん"],
\ "g": ["がん"],
\ "gr": ["ぎゃん"],
\ "h": ["はん"],
\ "hn": ["ひゃん"],
\ "l": ["ぱん"],
\ "lg": ["ぴゃん"],
\ "m": ["まん"],
\ "mv": ["みゃん"],
\ "n": ["なん"],
\ "nh": ["にゃん"],
\ "r": ["らん"],
\ "rg": ["りゃん"],
\ "s": ["さん"],
\ "sh": ["しゃん"],
\ "t": ["たん"],
\ "th": ["ちゃん"],
\ "v": ["ふぁん"],
\ "w": ["わん"],
\ "y": ["う゛ぁん"],
\ "z": ["ざん"],
\ "zm": ["じゃん"],
\})
  let s:gact10_dvp[key .. "'"] = value
  let s:gact10_dvp[key .. s:henkanPoint .. "'"] = value
endfor

imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)
" tmap <C-j> <Plug>(skkeleton-toggle)

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
  \})
endfunction

augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END

function s:skkeleton_set_keymap() abort
  lnoremap <buffer> " <Cmd>call skkeleton#handle('handleKey', #{key: '<F1>'})<CR><Cmd>call skkeleton#handle('handleKey', #{key: ''''})<CR>
endfunction

function s:skkeleton_del_keymap() abort
  " lunmap <buffer> "
endfunction

augroup skkeleton-enable-post
  autocmd!
  autocmd User skkeleton-enable-post call s:skkeleton_set_keymap()
augroup END

augroup skkeleton-disable-post
  autocmd!
  autocmd User skkeleton-disable-post call s:skkeleton_del_keymap()
augroup END
" }}}
