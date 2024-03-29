#!/usr/bin/env perl
$lualatex         = 'lualatex --synctex=1 --halt-on-error';
$lualatex_silent  = 'lualatex --synctex=1 --halt-on-error --interaction=batchmode';
$bibtex           = 'pbibtex';
$biber            = 'biber --bblencoding=utf8 -u -U --output_safechars';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 4;
$pvc_view_file_via_temporary = 0;
if($^O eq 'darwin') {
    $pdf_previewer    = "open -ga /Applications/Skim.app";
} else {
    $pdf_previewer    = "xdg-open";
}
