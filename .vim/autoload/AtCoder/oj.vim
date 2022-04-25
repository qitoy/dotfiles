let s:Promise = vital#vital#new().import('Async.Promise')

function AtCoder#oj#init(url) abort
	lchdir %:h
	let s:job = job_start(["/bin/sh", "-c", "rm -rf test/ && oj d " . a:url], {
		\ "exit_cb": {ch, state ->
		\ execute(state ? "echoerr 'Error!'" : "echomsg 'Done!'" , "")
		\ }})
endfunction

function AtCoder#oj#test() abort
	return AtCoder#make()
		\.then({
		\ -> s:Promise.new({resolve, reject
		\ -> term_start("oj t -N -c ./program", {
			\ "term_rows": 20,
			\ "exit_cb": {ch, state -> state ? reject() : resolve()},
			\ })})})
endfunction

function AtCoder#oj#submit(bang) abort
	return {-> a:bang ==# '' ? AtCoder#oj#test() : s:Promise.resolve()}()
		\.then({-> AtCoder#bundle()})
		\.then({-> term_start("oj s bundle.cpp", {"term_finish": "close"})})
endfunction
