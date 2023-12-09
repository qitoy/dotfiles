" leader関連
let g:mapleader = ' '
let g:maplocalleader = '\'

nmap <leader> <Plug>(leader)

" 後でなんかするかも
nnoremap Q <Nop>
inoremap <F1> <Nop>

" コマンドラインでの動き
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <Esc> <Nop>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>b <S-Left>

" レジスタ関連
nnoremap x "_x
vnoremap x "_x
nnoremap Y y$

nnoremap <silent> j gj
nnoremap <silent> k gk

nnoremap <C-S> <Cmd>update<CR>

" insert empty line
nnoremap <CR> <Cmd>call append(line('.'), '')<CR>
nnoremap <S-CR> <Cmd>call append(line('.') - 1, '')<CR>

" for camp.vim
command! CampOpen call camp#open()
command! CampTest call camp#test()
command! -bang CampSubmit call camp#submit(<bang>0)
