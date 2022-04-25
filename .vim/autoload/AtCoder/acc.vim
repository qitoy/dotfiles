let s:Promise = vital#vital#new().import('Async.Promise')

function AtCoder#acc#prepare(id) abort
	let s:acc_path = getcwd() . "/" . a:id
	call system("acc n --no-tests " . a:id)
	execute v:shell_error ? "echoerr 'Error!'" : "echomsg 'Done!'"
endfunction

function AtCoder#acc#cd(dir) abort
	let dir = s:acc_path . "/" . a:dir . "/"
	if isdirectory(dir) == v:false
		echoerr "The directory is not exists!!"
		return
	endif
	execute("edit " . dir . "main.cpp")
	execute("lcd " . dir)
	if isdirectory("test") == v:false
		let s:job = job_start(["/bin/sh", "-c", "oj d `acc task -u`"], {
			\ "exit_cb": {
				\ ch, state ->
				\ execute(state ? "echoerr 'Error!'" : "echomsg 'Done!'" , "")
				\ }
				\ })
	endif
endfunction

function AtCoder#acc#test() abort
	return AtCoder#oj#test()
endfunction

function AtCoder#acc#submit(bang) abort
	return {-> a:bang ==# '' ? AtCoder#acc#test() : s:Promise.resolve()}()
		\.then({-> AtCoder#bundle()})
		\.then({-> term_start("acc s", {"term_finish": "close"})})
endfunction
