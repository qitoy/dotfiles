let s:Promise = vital#vital#new().import('Async.Promise')

function AtCoder#make(...) abort
	update
	cexpr ""
	let cmd = ["make"] + a:000
	return s:Promise.new({resolve, reject -> job_start(cmd, {
		\ "err_cb": {ch, mes -> execute("caddexpr mes")},
		\ "exit_cb": {ch, state -> state ? reject() : resolve()},
		\ })})
endfunction

function AtCoder#make_then(cmd) abort
	return AtCoder#make().then({-> execute(a:cmd)})
endfunction

function AtCoder#bundle() abort
	return s:Promise.new({resolve, reject -> term_start(["/bin/sh", "-c", "oj-bundle -I ~/AtCoder/C++/library/ main.cpp | sed -e '/#line/d' > bundle.cpp"], {
		\ "hidden": v:true,
		\ "term_finish": "close",
		\ "exit_cb": {ch, state -> state ? reject() : resolve()},
		\ })})
endfunction
