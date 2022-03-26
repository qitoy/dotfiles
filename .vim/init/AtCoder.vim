nnoremap <buffer> <silent> <LocalLeader>cm
	\ <Cmd>call AtCoder#make#make()<CR>
nnoremap <buffer> <silent> <LocalLeader>cc
	\ <Cmd>call AtCoder#make#make_then("ter ++rows=10 ./program")<CR>
nnoremap <buffer> <silent> <LocalLeader>cl
	\ /end template<CR>jdGo<Esc>0C<CR>int main(){}<Left><CR><Esc><S-o><CR><Esc>O
nnoremap <buffer> <LocalLeader>ay ggVG"*y<C-o><C-o>
nnoremap <buffer> <silent> <LocalLeader>ot
	\ <Cmd>call AtCoder#oj#test()<CR>
nnoremap <buffer> <silent> <LocalLeader>os
	\ <Cmd>call AtCoder#oj#submit("")<CR>
nnoremap <buffer> <silent> <LocalLeader>at
	\ <Cmd>call AtCoder#acc#test()<CR>
nnoremap <buffer> <silent> <LocalLeader>as
	\ <Cmd>call AtCoder#acc#submit("")<CR>

command! -buffer -nargs=1 OjInit
	\ :ter ++rows=10 ++shell
	\ rm -rf test/ && oj d <args>

command! -buffer OjTest
	\ call AtCoder#oj#test()

command! -buffer -bang OjSubmit
	\ call AtCoder#oj#submit(<q-bang>)

command! -buffer OjNewTest
	\ call AtCoder#oj#new_test()

command! -buffer OjGenIn
	\ ter ++hidden ++close oj g/i ./generate.py

command! -buffer OjGenOut
	\ call AtCoder#make#make_then("ter ++hidden ++close oj g/o -c ./naive")

command! -buffer -nargs=1 AccPrepare
	\ call AtCoder#acc#prepare(<q-args>)

command! -buffer -nargs=1 AccCd
	\ call AtCoder#acc#cd(<q-args>)

command! -buffer AccTest
	\ call AtCoder#acc#test()

command! -buffer -bang AccSubmit
	\ call AtCoder#acc#submit(<q-bang>)
