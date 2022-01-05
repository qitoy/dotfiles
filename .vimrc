" {{{1 dein Scripts-----------------------------

let s:toml = '~/.vim/dein.toml'
let s:toml_lazy = '~/.vim/dein_lazy.toml'

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein')

call dein#load_toml(s:toml, {'lazy': 0})
call dein#load_toml(s:toml_lazy, {'lazy': 1})

" Let dein manage dein
" Required:
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:

" {{{2 ddc -------------------------------------------------
call dein#add('Shougo/ddc.vim')
call dein#add('vim-denops/denops.vim')

" Install your sources
call dein#add('Shougo/ddc-around')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('mattn/vim-lsp-settings')
call dein#add('shun/ddc-vim-lsp')
call dein#add('vim-skk/skkeleton')

" Install your filters
call dein#add('Shougo/ddc-matcher_head')
call dein#add('Shougo/ddc-sorter_rank')

call ddc#custom#patch_global('sources', [
			\ 'neosnippet',
			\ 'around',
			\ 'vim-lsp', 
			\ 'skkeleton'
			\ ])

call ddc#custom#patch_global('sourceOptions', {
			\ 'vim-lsp': {
				\ 'mark': 'LSP',
				\ 'matchers': ['matcher_head'],
				\ 'forceCompletionPattern': '\.|:|->|"\w+/*'
			\ },
			\ 'neosnippet': {'mark': 'snippet'},
			\ 'around': {'mark': 'A'},
			\ '_': {
				\   'matchers': ['matcher_head'],
				\   'sorters': ['sorter_rank']
			\ },
			\ 'skkeleton': {
				\ 'mark': 'SKK',
				\ 'matchers': ['skkeleton'],
				\ 'sorters': []
			\ },
			\ })

let g:lsp_diagnostics_enabled = 0

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
			\ ddc#map#pum_visible() ? '<C-n>' :
			\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
			\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()
" }}}2 ddc -------------------------------------------------

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

" }}}1 End dein Scripts-------------------------

" neosnippet
let g:neosnippet#snippets_directory = '~/.vim/my_snippets'
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-l>     <Plug>(neosnippet_expand_or_jump)
smap <C-l>     <Plug>(neosnippet_expand_or_jump)
xmap <C-l>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
			\ pumvisible() ? "\<C-n>" :
			\ neosnippet#expandable_or_jumpable() ?
			\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" LaTeX
let g:tex_flavor = "latex"
let g:tex_conceal=''
aug LaTeX
	au!
	au FileType tex inoremap <buffer> <Bslash>[ <Bslash>[<Bslash>]<Left><Left><CR><CR><Up><C-F>
	au BufNewFile *.tex 0r $HOME/.vim/template/LaTeX.tex
	au BufNewFile *.tex %s/Title_Here/\=expand("%:r")/
	au BufNewFile *.tex %s/Document_Here
	au InsertLeave *.tex w
aug END

" skkeleton
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

call skkeleton#config({
			\'eggLikeNewline':v:true,
			\'globalJisyo': '~/Library/Application Support/AquaSKK/SKK-JISYO.L',
			\'userJisyo': '~/Library/Application Support/AquaSKK/skk-jisyo.utf8',
			\})

call skkeleton#register_kanatable('rom', {
			\ ',': ['，', ''],
			\ '.': ['．', ''],
			\ })

" 行番号を表示
set number

" tabの幅
set tabstop=4
set shiftwidth=4

" コマンド表示
set showcmd

" 括弧補完
inoremap {<CR> {}<Left><CR><CR><Up><C-f>

" レジスタ関連
nnoremap x "_x
vnoremap x "_x
set clipboard+=unnamed

" 移動関連
nnoremap j gj
nnoremap k gk
set scrolloff=10

" 折りたたみ
set foldmethod=marker
aug folding
	au!
	au BufWinLeave ?* mkview
	au BufWinEnter ?* silent loadview
aug END
set viewoptions-=options

" map関連
let maplocalleader=' '

set autowrite
set laststatus=2
