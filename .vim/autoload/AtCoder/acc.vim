let s:Promise = vital#vital#new().import('Async.Promise')

function AtCoder#acc#prepare(id) abort
	let s:acc_path = getcwd() . "/" . a:id
	let s:job = job_start("acc n --no-tests " . a:id, {
		\ "exit_cb": {
			\ ch, state ->
			\ execute(state ? "echoerr 'Error!'" : "echomsg 'Done!'", "")
			\ }
			\ })
endfunction

function AtCoder#acc#cd(dir) abort
	let dir = "/" . a:dir . "/"
	if isdirectory(s:acc_path . dir) == v:false
		echoerr "The directory is not exists!!"
		return
	endif
	execute("edit " . s:acc_path . dir . "main.cpp")
	execute("lcd " . s:acc_path . dir)
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
		\.then({-> term_start(["/bin/sh", "-c", "oj-bundle -I ~/AtCoder/C++/library/ main.cpp | sed -e '/#line/d' > bundle.cpp && acc s"], {"term_finish": "close"})})
endfunction
