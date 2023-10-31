" hook_source {{{
call lexima#add_rule(#{
\ char: '<CR>',
\ input: '<CR>',
\ input_after: '<CR>endsnippet',
\ at: 'snippet\>.*\%#$',
\ filetype: 'snippets',
\})

let s:lexima_cpp_rules = [
\ ]

for rule in s:lexima_cpp_rules
  let rule.filetype = 'cpp'
  call lexima#add_rule(rule)
endfor

let s:lexima_tex_rules = [
\ #{ char: '[',    at: '\\\%#',                    input: '[<CR>',        input_after: '<CR>\]'                        },
\
\ #{ char: '{',    at: '\\\%#',                                           input_after: '\}'                            },
\ #{ char: '<BS>', at: '\\{\%#\\}',                input: '<BS><BS>',                              delete: 2           },
\
\ #{ char: '(',    at: '\\left\%#',                                       input_after: '\right)'                       },
\ #{ char: ')',    at: '\%#\\right)',                                                                         leave: 7 },
\ #{ char: '[',    at: '\\left\%#',                                       input_after: '\right]'                       },
\ #{ char: ']',    at: '\%#\\right]',                                                                         leave: 7 },
\ #{ char: '{',    at: '\\left\\\%#',                                     input_after: '\right\}'                      },
\ #{ char: '}',    at: '\\\%#\\right\\}',          input: '<BS>\right\}',                          delete: 8           },
\
\ #{ char: '$',                                                           input_after: '$'                             },
\ #{ char: '$',    at: '\\\%#'},
\ #{ char: '$',    at: '\%#\$',                                                                               leave: 1 },
\ #{ char: '<BS>', at: '\$\%#\$',                                                                  delete: 1           },
\ #{ char: '<CR>', at: '\$\%#\$',                                         input_after: '<CR>'                          },
\]

for rule in s:lexima_tex_rules
  let rule.filetype = 'tex'
  call lexima#add_rule(rule)
endfor
" }}}
