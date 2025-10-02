" from https://github.com/tttmmmyyyy/fixlang_syntaxhighlight MIT

if exists("b:current_syntax")
  finish
endif

syntax region fixComment start="//" end="$"
syntax region fixComment start="/\*" end="\*/"
highlight default link fixComment Comment

syntax keyword fixConditional if else do let in eval match
highlight default link fixConditional Conditional

syntax match fixOperator "=\|:"
syntax match fixOperator "==\|!=\|<=\|>=\|<[^<]\|>[^>]"
syntax match fixOperator "+\|-\|*\|/[^/*]\|%"
syntax match fixFunctional "\.\|\$\|>>\|<<"
syntax match fixOperator "->"
highlight default link fixOperator Operator
highlight default link fixFunctional Operator

syntax keyword fixImport import
highlight default link fixImport Include

syntax keyword fixConstant true false nullptr
syntax match fixNumeric "\<-\?[0-9]\+\%(\.[0-9]\+\)\?\%(e[+-]\?[0-9]\+\)\?\%([IUF][0-9]\+\)\?\>"
highlight default link fixConstant Boolean
highlight default link fixNumeric Number

syntax region fixString start=/"/ end=/"/ contains=fixEscape
syntax match fixEscape "\\." contained
highlight default link fixString String
highlight default link fixEscape SpecialChar

syntax match fixClass "[A-Z][A-Za-z0-9]*"
highlight default link fixClass Type

syntax keyword fixType type struct union module namespace impl trait
highlight default link fixType Keyword

syntax keyword fixModifier box unbox
highlight default link fixModifier StorageClass

let b:current_syntax = "fix"
