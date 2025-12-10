" leader関連
let g:mapleader = ' '
let g:maplocalleader = '\'

nmap <leader> <Plug>(leader)

" コマンドラインでの動き
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <Esc> <Nop>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>b <S-Left>

nnoremap <C-S> <Cmd>update<CR>
nnoremap U <C-R>

command! Xed
\ execute '!xed -l' .. line('.') .. ' ' .. shellescape(expand('%'))
