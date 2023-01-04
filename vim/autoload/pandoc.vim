function pandoc#makepdf() abort
	let s:job = job_start([
		\ "pandoc",
		\ expand("%"),
		\ "-o",
		\ expand("%:r") . ".pdf",
		\ "--pdf-engine=lualatex",
		\ "-Vdocumentclass=ltjsarticle",
		\ "-Vluatexjapresetoptions=hiragino-pron"
		\ ], {
			\ "exit_cb": {ch, state -> execute("echomsg 'done'", "")}
			\ })
endfunction
