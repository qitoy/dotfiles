command! -nargs=1 OjDownload
	\ call AtCoder#oj#download(<q-args>)

command! OjTest
	\ call AtCoder#oj#test()

command! -bang OjSubmit
	\ call AtCoder#oj#submit(<q-bang>)

command! -nargs=1 AccPrepare
	\ call AtCoder#acc#prepare(<q-args>)

command! -nargs=1 AccCd
	\ call AtCoder#acc#cd(<q-args>)

command! AccTest
	\ call AtCoder#acc#test()

command! -bang AccSubmit
	\ call AtCoder#acc#submit(<q-bang>)
