nnoremap <buffer> <silent> <LocalLeader>cm
	\ <Cmd>call atcoder#make()<CR>
nnoremap <buffer> <silent> <LocalLeader>cc
	\ <Cmd>call atcoder#make_then("ter ++rows=10 ./program")<CR>
nnoremap <buffer> <silent> <LocalLeader>cl
	\ <Cmd>%d<CR><Cmd>0r ~/.vim/template/cpp.cpp<CR>
