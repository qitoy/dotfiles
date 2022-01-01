augroup AtCoder
	autocmd!
	autocmd BufEnter */AtCoder/*.cpp nnoremap <buffer> <LocalLeader>cc :make run<CR>
	autocmd BufEnter */AtCoder/*.cpp nnoremap <buffer> <LocalLeader>cl /end template<CR>jdGo<Esc>0C<CR><CR><CR>int main(){}<Left><CR><Esc><S-o><CR><Esc>O
	autocmd BufEnter */AtCoder/*.cpp nnoremap <buffer> <LocalLeader>ay ggVG"*y<C-o><C-o>
	autocmd BufEnter */AtCoder/*.cpp nnoremap <buffer> <LocalLeader>db :make debug<CR>
augroup END

