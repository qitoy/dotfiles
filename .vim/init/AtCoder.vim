nnoremap <buffer> <LocalLeader>cc :make run<CR>
nnoremap <buffer> <LocalLeader>cl /end template<CR>jdGo<Esc>0C<CR><CR><CR>int main(){}<Left><CR><Esc><S-o><CR><Esc>O
nnoremap <buffer> <LocalLeader>ay ggVG"*y<C-o><C-o>

command! -buffer -nargs=1 OjInit
			\ : ter ++hidden ++open ++shell
			\ rm -rf test/ && oj d <args>

command! -buffer OjTest
			\ : w | ter ++hidden ++open ++shell
			\ make && oj t -N -c ./program

command! -buffer -bang OjSubmit
			\ call OjSubmit(<q-bang>)
function! OjSubmit(bang) abort
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
