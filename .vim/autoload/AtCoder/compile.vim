let s:Promise = vital#vital#new().import('Async.Promise')

let s:command = {
	\ 'cpp': ['make'],
	\ 'rust': ['cargo', 'build'],
	\ }

function AtCoder#compile#compile() abort
	update
	cexpr ""
	let cmd = get(s:command, &filetype, [])
	return s:Promise.new({resolve, reject -> job_start(cmd, {
		\ "err_cb": {ch, mes -> execute("caddexpr mes")},
		\ "exit_cb": {ch, state -> state ? reject() : resolve()},
		\ })})
endfunction

function! AtCoder#compile#compile_then(cmd) abort
	return AtCoder#compile#compile().then({-> execute(a:cmd)})
endfunction
