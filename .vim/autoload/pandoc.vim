function pandoc#makepdf() abort
	let name = expand("%:r")
	let s:job = job_start([
		\ "pandoc",
		\ name . ".md",
		\ "-o",
		\ name . ".pdf",
		\ "--pdf-engine=lualatex",
		\ "-Vdocumentclass=ltjsarticle",
		\ "-Vluatexjapresetoptions=hiragino-pron"
		\ ], {
			\ "exit_cb": {ch, state -> execute("echomsg 'done'", "")}
			\ })
endfunction
