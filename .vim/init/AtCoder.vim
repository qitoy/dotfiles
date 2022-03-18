let s:Promise = vital#vital#new().import('Async.Promise')

nnoremap <buffer> <silent> <LocalLeader>cm
			\ <Cmd>call <SID>make()<CR>
nnoremap <buffer> <silent> <LocalLeader>cc
			\ <Cmd>call <SID>make_then("ter ++rows=10 ./program")<CR>
nnoremap <buffer> <silent> <LocalLeader>cl
			\ /end template<CR>jdGo<Esc>0C<CR><CR><CR>int main(){}<Left><CR><Esc><S-o><CR><Esc>O
nnoremap <buffer> <LocalLeader>ay ggVG"*y<C-o><C-o>
nnoremap <buffer> <silent> <LocalLeader>ot
			\ <Cmd>call <SID>ojTest()<CR>
nnoremap <buffer> <silent> <LocalLeader>os
			\ <Cmd>call <SID>ojSubmit("")<CR>

function! s:make(...) abort
	if &modified && &autowrite
		write
	endif
	cexpr ""
	let cmd = ["make"] + a:000
	return s:Promise.new({resolve, reject -> job_start(cmd, {
				\ "err_cb": {ch, mes -> execute("caddexpr mes")},
				\ "exit_cb": {ch, state -> state ? reject() : resolve()},
				\ })})
endfunction

function! s:make_then(cmd) abort
	return s:make().then({-> execute(a:cmd)})
endfunction

command! -buffer -nargs=1 OjInit
			\ :ter ++rows=10 ++shell
			\ rm -rf test/ && oj d <args>

command! -buffer OjTest
			\ call s:ojTest()
function! s:ojTest() abort
	return s:make_then("ter ++rows=10 oj t -N -c ./program")
endfunction

command! -buffer -bang OjSubmit
			\ call s:ojSubmit(<q-bang>)
function! s:ojSubmit(bang) abort
	if a:bang ==# ''
		call s:make_then("ter ++close ++shell ++rows=10 oj t -N -c ./program && oj s main.cpp")
	else
		ter ++close ++rows=10 oj s main.cpp
	endif
endfunction

command! -buffer OjGenIn
			\ ter ++hidden ++close oj g/i ./generate.py

command! -buffer OjGenOut
			\ call s:make_then("ter ++hidden ++close oj g/o -c ./naive")
