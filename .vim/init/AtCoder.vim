nnoremap <buffer> <silent> <LocalLeader>cm
			\ <Cmd>call <SID>make_bg()<CR>
nnoremap <buffer> <silent> <LocalLeader>cc
			\ <Cmd>ter ++rows=10 make run<CR>
nnoremap <buffer> <silent> <LocalLeader>cl
			\ /end template<CR>jdGo<Esc>0C<CR><CR><CR>int main(){}<Left><CR><Esc><S-o><CR><Esc>O
nnoremap <buffer> <LocalLeader>ay ggVG"*y<C-o><C-o>

function! <SID>make_bg() abort
	if &modified && &autowrite
		write
	end
	let s:tmp_file = tempname()
	let s:job = job_start('make', {
					\ 'err_io': 'file',
					\ 'err_name': s:tmp_file,
					\ 'exit_cb': function('s:exit_handler'),
					\ })
endfunction

function! s:exit_handler(buf, exit_status) abort
	execute 'cf' s:tmp_file
	unlet s:tmp_file s:job
endfunction

command! -buffer -nargs=1 OjInit
			\ :ter ++hidden ++open ++shell
			\ rm -rf test/ && oj d <args>

command! -buffer OjTest
			\ :w | ter ++hidden ++open ++shell
			\ make && oj t -N -c ./program

command! -buffer -bang OjSubmit
			\ call s:ojSubmit(<q-bang>)
function! s:ojSubmit(bang) abort
	if a:bang ==# ''
		: w | ter ++shell make && oj t -N -c ./program && oj s main.cpp
	else
		: ter ++close oj s main.cpp
	end
endfunction

command! -buffer OjGenIn
			\ ter ++hidden ++close oj g/i ./generate.py

command! -buffer OjGenOut
			\ ter ++hidden ++close oj g/o -c ./naive
