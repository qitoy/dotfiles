" hook_add {{{
let s:gact10 = {
\ "!": ["！"],
\ "'": ["あん"],
\ ",": ["、"],
\ "-": ["ー"],
\ ".": ["。"],
\ "..": ["……"],
\ "/": ["・"],
\ ":": "abbrev",
\ ";": "henkanPoint",
\ "?": ["？"],
\ "@": "katakana",
\ "[": ["「"],
\ "\<Space>": "henkanFirst",
\ "]": ["」"],
\ "a": ["あ"],
\ "b'": ["ばん"],
\ "b,": ["ぼう"],
\ "b.": ["べい"],
\ "b;": ["ばい"],
\ "ba": ["ば"],
\ "be": ["べ"],
\ "bi": ["び"],
\ "bj": ["べん"],
\ "bk": ["ぶん"],
\ "bo": ["ぼ"],
\ "bp": ["ぶう"],
\ "bq": ["ぼん"],
\ "bu": ["ぶ"],
\ "bv'": ["びゃん"],
\ "bv,": ["びょう"],
\ "bv.": ["びぇい"],
\ "bv;": ["びゃい"],
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
\ "c'": ["かん"],
\ "c,": ["こう"],
\ "c.": ["けい"],
\ "c;": ["かい"],
\ "ca": ["か"],
\ "cc": ["きゅう"],
\ "ce": ["け"],
\ "cg'": ["きゃん"],
\ "cg,": ["きょう"],
\ "cg.": ["きぇい"],
\ "cg;": ["きゃい"],
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
\ "d'": ["だん"],
\ "d,": ["どう"],
\ "d.": ["でい"],
\ "d;": ["だい"],
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
\ "dn'": ["ぢゃん"],
\ "dn,": ["ぢょう"],
\ "dn.": ["ぢぇい"],
\ "dn;": ["ぢゃい"],
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
\ "f'": ["やん"],
\ "f,": ["よう"],
\ "f;": ["やい"],
\ "fa": ["や"],
\ "fk": ["ゆん"],
\ "fo": ["よ"],
\ "fp": ["ゆう"],
\ "fq": ["よん"],
\ "fu": ["ゆ"],
\ "fy": ["ゆい"],
\ "g'": ["がん"],
\ "g,": ["ごう"],
\ "g.": ["げい"],
\ "g;": ["がい"],
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
\ "gr'": ["ぎゃん"],
\ "gr,": ["ぎょう"],
\ "gr.": ["ぎぇい"],
\ "gr;": ["ぎゃい"],
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
\ "h'": ["はん"],
\ "h,": ["ほう"],
\ "h.": ["へい"],
\ "h;": ["はい"],
\ "ha": ["は"],
\ "he": ["へ"],
\ "hi": ["ひ"],
\ "hj": ["へん"],
\ "hk": ["ふん"],
\ "hn'": ["ひゃん"],
\ "hn,": ["ひょう"],
\ "hn.": ["ひぇい"],
\ "hn;": ["ひゃい"],
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
\ "l'": ["ぱん"],
\ "l,": ["ぽう"],
\ "l.": ["ぺい"],
\ "l;": ["ぱい"],
\ "la": ["ぱ"],
\ "lc": ["ぴゅう"],
\ "le": ["ぺ"],
\ "lg'": ["ぴゃん"],
\ "lg,": ["ぴょう"],
\ "lg.": ["ぴぇい"],
\ "lg;": ["ぴゃい"],
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
\ "m'": ["まん"],
\ "m,": ["もう"],
\ "m.": ["めい"],
\ "m;": ["まい"],
\ "ma": ["ま"],
\ "me": ["め"],
\ "mi": ["み"],
\ "mj": ["めん"],
\ "mk": ["むん"],
\ "mo": ["も"],
\ "mp": ["むう"],
\ "mq": ["もん"],
\ "mu": ["む"],
\ "mv'": ["みゃん"],
\ "mv,": ["みょう"],
\ "mv.": ["みぇい"],
\ "mv;": ["みゃい"],
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
\ "n'": ["なん"],
\ "n,": ["のう"],
\ "n.": ["ねい"],
\ "n;": ["ない"],
\ "na": ["な"],
\ "ne": ["ね"],
\ "nh'": ["にゃん"],
\ "nh,": ["にょう"],
\ "nh.": ["にぇい"],
\ "nh;": ["にゃい"],
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
\ "p,": ["っと"],
\ "p.": ["って"],
\ "p;": ["った"],
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
\ "r'": ["らん"],
\ "r,": ["ろう"],
\ "r.": ["れい"],
\ "r;": ["らい"],
\ "ra": ["ら"],
\ "rc": ["りゅう"],
\ "re": ["れ"],
\ "rg'": ["りゃん"],
\ "rg,": ["りょう"],
\ "rg.": ["りぇい"],
\ "rg;": ["りゃい"],
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
\ "s'": ["さん"],
\ "s,": ["そう"],
\ "s.": ["せい"],
\ "s;": ["さい"],
\ "sa": ["さ"],
\ "se": ["せ"],
\ "sh'": ["しゃん"],
\ "sh,": ["しょう"],
\ "sh.": ["しぇい"],
\ "sh;": ["しゃい"],
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
\ "t'": ["たん"],
\ "t,": ["とう"],
\ "t.": ["てい"],
\ "t;": ["たい"],
\ "ta": ["た"],
\ "te": ["て"],
\ "th'": ["ちゃん"],
\ "th,": ["ちょう"],
\ "th.": ["ちぇい"],
\ "th;": ["ちゃい"],
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
\ "v'": ["ふぁん"],
\ "v,": ["ふぉー"],
\ "v.": ["ふぇい"],
\ "v;": ["ふぁい"],
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
\ "w'": ["わん"],
\ "w,": ["うぉー"],
\ "w.": ["うぇい"],
\ "w;": ["わい"],
\ "wa": ["わ"],
\ "we": ["うぇ"],
\ "wi": ["うぃ"],
\ "wj": ["うぇん"],
\ "wo": ["を"],
\ "wq": ["うぉん"],
\ "wx": ["うぃん"],
\ "wz": ["うぉー"],
\ "x": ["いん"],
\ "y'": ["う゛ぁん"],
\ "y,": ["う゛ぉー"],
\ "y.": ["う゛ぇい"],
\ "y;": ["う゛ぁい"],
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
\ "z'": ["ざん"],
\ "z,": ["ぞう"],
\ "z.": ["ぜい"],
\ "z;": ["ざい"],
\ "za": ["ざ"],
\ "ze": ["ぜ"],
\ "zi": ["じ"],
\ "zj": ["ぜん"],
\ "zk": ["ずん"],
\ "zm'": ["じゃん"],
\ "zm,": ["じょう"],
\ "zm.": ["じぇい"],
\ "zm;": ["じゃい"],
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

imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

function s:skkeleton_init() abort
  call skkeleton#register_kanatable('gact10', s:gact10, v:true)
  call skkeleton#config(#{
  \ eggLikeNewline: v:true,
  \ globalDictionaries: [
  \   ['/usr/share/skk/SKK-JISYO.L', 'euc-jp'],
  \   '~/.skk/SKK-JISYO.emoji.utf8',
  \   '~/.skk/SKK-JISYO.edict'
  \ ],
  \ userJisyo: "~/.skkeleton",
  \ selectCandidateKeys: 'aoeuhtn',
  \ kanaTable: 'gact10',
  \})
endfunction

augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END

function s:skkeleton_set_keymap() abort
  lnoremap <buffer> " <Cmd>call skkeleton#handle('handleKey', #{key: ';'})<CR><Cmd>call skkeleton#handle('handleKey', #{key: ''''})<CR>
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
