let s:Promise = vital#vital#new().import('Async.Promise')

function AtCoder#acc#prepare(id) abort
	let s:acc_path = getcwd() . "/" . a:id
	call term_start("acc n --no-tests " . a:id, {
		\ "term_finish": "close",
		\ "exit_cb": {
			\ ch, state -> state
			\ ? execute("echoerr 'Error!'", "")
			\ : execute("echomsg 'Done!'", "")
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
		call term_start(["/bin/sh", "-c", "oj d `acc task -u`"], {
			\ "term_finish": "close"
			\ })
	endif
endfunction

function AtCoder#acc#test() abort
	return AtCoder#oj#test()
endfunction

function AtCoder#acc#submit(bang) abort
	return {-> a:bang ==# '' ? AtCoder#oj#test() : s:Promise.resolve()}()
		\.then({-> term_start("acc s", {"term_finish": "close"})})
endfunction
