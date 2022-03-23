let s:Promise = vital#vital#new().import('Async.Promise')
" function AtCoder#oj#test() abort
" 	return AtCoder#make#make_then(
" 		\ "ter ++rows=10 oj t -N -c ./program"
" 		\ )
" endfunction

function AtCoder#oj#test() abort
	return AtCoder#make#make()
		\.then({
		\ -> s:Promise.new({resolve, reject
		\ -> term_start("oj t -N -c ./program", {
			\ "term_rows": 20,
			\ "exit_cb": {ch, state -> state ? reject() : resolve()},
			\ })})})
endfunction

function AtCoder#oj#submit(bang) abort
	return {-> a:bang ==# '' ? AtCoder#oj#test() : s:Promise.resolve()}()
		\.then({-> execute("ter ++close ++shell ++rows=10 oj s main.cpp")})
endfunction
