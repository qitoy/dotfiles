set runtimepath^=~/.cache/dein/repos/github.com/vim-denops/denops.vim
set runtimepath^=~/.cache/dein/repos/github.com/Shougo/ddc.vim
set runtimepath^=~/.cache/dein/repos/github.com/Shougo/pum.vim
set runtimepath^=~/.cache/dein/repos/github.com/Shougo/ddc-cmdline
set runtimepath^=~/.cache/dein/repos/github.com/tani/ddc-fuzzy
set runtimepath^=~/.cache/dein/repos/github.com/matsui54/ddc-converter_truncate

nnoremap : <Cmd>call CommandlinePre()<CR>:
function! CommandlinePre() abort
	" Note: It disables default command line completion!
	set wildchar=<C-t>

	cnoremap <expr> <Tab>
	\ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
	\ ddc#manual_complete()
	cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
	cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
	cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

	" Overwrite sources
	if !exists('s:cmdline_prev_buffer_config')
		let s:cmdline_prev_buffer_config = ddc#custom#get_buffer()
	endif

	autocmd User DDCCmdlineLeave ++once call CommandlinePost()
	autocmd InsertEnter <buffer> ++once call CommandlinePost()

	" Enable command line completion
	call ddc#enable_cmdline_completion()
endfunction
function! CommandlinePost() abort
	silent! cunmap <Tab>
	silent! cunmap <S-Tab>
	silent! cunmap <C-y>
	silent! cunmap <C-e>

	" Restore sources
	if exists('s:cmdline_prev_buffer_config')
	  call ddc#custom#set_buffer(s:cmdline_prev_buffer_config)
	  unlet s:cmdline_prev_buffer_config
	else
	  call ddc#custom#set_buffer({})
	endif

	set wildchar=<Tab>
endfunction

call ddc#custom#patch_global('cmdlineSources', ['cmdline'])
call ddc#custom#patch_global('sourceOptions', {
	\ 'cmdline': {
		\ 'mark': 'cmd',
	\ },
	\ '_': {
		\ 'matchers': ['matcher_fuzzy'],
		\ 'sorters': ['sorter_fuzzy'],
		\ 'converters': ['converter_fuzzy', 'converter_truncate'],
	\ },
	\ })
call ddc#custom#patch_global('filterParams', {
	\ 'converter_fuzzy': {
		\ 'hlGroup': 'CursorLine'
		\ },
	\ 'converter_truncate': {
		\ 'maxAbbrWidth': 50,
		\ },
	\ })
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('autoCompleteEvents', [
	\ 'InsertEnter', 'TextChangedI', 'TextChangedP',
	\ 'CmdlineEnter', 'CmdlineChanged',
	\ ])
call ddc#enable()
