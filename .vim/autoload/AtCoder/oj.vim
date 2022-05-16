let s:Promise = vital#vital#new().import('Async.Promise')

function AtCoder#oj#download(url) abort
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
		\ -> term_start("oj t -N -c ./program -t 4", {
			\ "term_name": "oj-test",
			\ "term_rows": 20,
			\ "exit_cb": {ch, state -> state ? reject() : resolve()},
			\ })})})
endfunction

function AtCoder#oj#submit(bang) abort
	let promise = a:bang ==# ''
		\ ? AtCoder#oj#test()
		\.then({-> input("Submit? [y/N]: ") == "y"
			\ ? s:Promise.resolve()
			\ : s:Promise.reject()})
		\ : s:Promise.resolve()
	return promise
		\.then({-> AtCoder#bundle()})
		\.then({-> job_start("oj s --wait=0 -y bundle.cpp", {
			\ "exit_cb": {ch, state -> state ? s:Promise.reject() : s:Promise.resolve()},
			\ })})
endfunction
