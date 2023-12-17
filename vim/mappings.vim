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
nnoremap x "xx
nnoremap Y y$

" とりあえずここに
" https://blog.atusy.net/2023/12/17/vim-easy-to-remember-regnames/
function! s:regname() abort
  if v:event.regname ==# ''
    call setreg(v:event.operator, getreg())
  endif
endfunction
autocmd vimrc TextYankPost * call s:regname()

nnoremap <silent> j gj
nnoremap <silent> k gk

nnoremap <C-S> <Cmd>update<CR>
