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

function! AtCoder#make_then(cmd) abort
	return AtCoder#make().then({-> execute(a:cmd)})
endfunction
