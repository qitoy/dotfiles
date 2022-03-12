nnoremap <buffer> <silent> <LocalLeader>cm
			\ <Cmd>call denops_make_bg#make("")<CR>
nnoremap <buffer> <silent> <LocalLeader>cc
			\ <Cmd>call denops_make_bg#make_then("ter ++rows=10 ./program")<CR>
nnoremap <buffer> <silent> <LocalLeader>cl
			\ /end template<CR>jdGo<Esc>0C<CR><CR><CR>int main(){}<Left><CR><Esc><S-o><CR><Esc>O
nnoremap <buffer> <LocalLeader>ay ggVG"*y<C-o><C-o>

command! -buffer -nargs=1 OjInit
			\ :ter ++rows=10 ++shell
			\ rm -rf test/ && oj d <args>

command! -buffer OjTest
			\ call denops_make_bg#make_then("ter ++rows=10 oj t -N -c ./program")

command! -buffer -bang OjSubmit
			\ call s:ojSubmit(<q-bang>)
function! s:ojSubmit(bang) abort
	if a:bang ==# ''
		call denops_make_bg#make_then("ter ++close ++shell ++rows=10 oj t -N -c ./program && oj s main.cpp")
	else
		ter ++close ++rows=10 oj s main.cpp
	end
endfunction

command! -buffer OjGenIn
			\ ter ++hidden ++close oj g/i ./generate.py

command! -buffer OjGenOut
			\ call denops_make_bg#make_then("ter ++hidden ++close oj g/o -c ./naive")
