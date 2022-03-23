let s:Promise = vital#vital#new().import('Async.Promise')

nnoremap <buffer> <silent> <LocalLeader>cm
			\ <Cmd>call AtCoder#make#make()<CR>
nnoremap <buffer> <silent> <LocalLeader>cc
			\ <Cmd>call AtCoder#make#make_then("ter ++rows=10 ./program")<CR>
nnoremap <buffer> <silent> <LocalLeader>cl
			\ /end template<CR>jdGo<Esc>0C<CR><CR><CR>int main(){}<Left><CR><Esc><S-o><CR><Esc>O
nnoremap <buffer> <LocalLeader>ay ggVG"*y<C-o><C-o>
nnoremap <buffer> <silent> <LocalLeader>ot
			\ <Cmd>call AtCoder#oj#test()<CR>
nnoremap <buffer> <silent> <LocalLeader>os
			\ <Cmd>call AtCoder#oj#submit("")<CR>

command! -buffer -nargs=1 OjInit
			\ :ter ++rows=10 ++shell
			\ rm -rf test/ && oj d <args>

command! -buffer OjTest
			\ call AtCoder#oj#test()

command! -buffer -bang OjSubmit
			\ call AtCoder#oj#submit(<q-bang>)

command! -buffer OjNewTest
			\ call s:ojNewTest()
function! s:ojNewTest() abort
	let num = localtime()
	execute("belowright 10 split test/" . num . ".in")
	execute("belowright vsplit test/" . num . ".out")
	execute "normal \<C-W>\<C-P>"
endfunction

command! -buffer OjGenIn
			\ ter ++hidden ++close oj g/i ./generate.py

command! -buffer OjGenOut
			\ call AtCoder#make#make_then("ter ++hidden ++close oj g/o -c ./naive")

command! -buffer -nargs=1 ACCPrepare
			\ call s:acc_prepare(<q-args>)
function! s:acc_prepare(id) abort
	let s:acc_path = getcwd() . a:id
	call job_start("acc n --no-tests " . a:id,
				\ { "exit_cb": {
					\ ch, state -> state
					\ ? execute("echomsg 'Done!'", "")
					\ : execute("echoerr 'Error!'", "")
					\ }})
endfunction

command! -buffer -nargs=1 ACCCd
			\ call s:acc_cd(<q-args>)
function! s:acc_cd(dir) abort
	let dir = "/" . a:dir . "/"
	execute("edit " . s:acc_path . dir . "main.cpp")
	execute("lcd " . s:acc_path . dir)
	call job_start("oj d `acc task -u`")
endfunction
