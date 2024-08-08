command! CampOpen call camp#open()
command! CampRun call camp#run()
command! CampTest call camp#test()
command! -bang CampSubmit call camp#submit(<bang>0)
command! CampSummaries
\ call ddu#start(#{
\   sources: [#{
\     name: 'camp_summaries',
\     params: #{ bin_name_or_alias: '%:t:r'->expand(), },
\   }],
\ })
