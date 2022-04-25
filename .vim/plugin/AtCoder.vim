command! -buffer -nargs=1 OjDownload
	\ call AtCoder#oj#download(<q-args>)

command! -buffer OjTest
	\ call AtCoder#oj#test()

command! -buffer -bang OjSubmit
	\ call AtCoder#oj#submit(<q-bang>)

command! -buffer -nargs=1 AccPrepare
	\ call AtCoder#acc#prepare(<q-args>)

command! -buffer -nargs=1 AccCd
	\ call AtCoder#acc#cd(<q-args>)

command! -buffer AccTest
	\ call AtCoder#acc#test()

command! -buffer -bang AccSubmit
	\ call AtCoder#acc#submit(<q-bang>)
