" scim-latex-tables is a Vim pluggin that generates latex tables using sc-im, a spreadsheet program for the terminal emulator. 
" Last Change:  09/11/2018
" Maintainer:   Manuel Bajo Buenestado <lolobajo@gmail.com>
" License:      MIT LICENSE




if exists("g:loaded_slt")
  finish
endif

let g:loaded_slt = 1

let s:save_cpo = &cpo
set cpo&vim



function! Csv_to_tex()
        exe '!sc-im .table.csv'
        exe '!sed -i  "s/,$//g" .table.csv'
        exe '!sed -i  "/^,$/d" .table.csv'
        exe '!sed -i  "/,,$/d" .table.csv'
        exe '!sed -i -- "s/,/\t\&\t/g" .table.csv'
        exe '!sed -i "s|$|    \\\|" .table.csv'
        exe '!sed -i "s|$|\\\|" .table.csv'
	exe '!sed -i "1ihline" .table.csv'
	exe '!sed -i "3ihline hline" .table.csv'
	exe '!sed -i "\$ahline" .table.csv'
	exe '!sed -i -e "s/hline/\\\hline/g" .table.csv'
	let col = system('head asd | awk -F"," "{print NF-1}"')
        exe '!sed -i "s/^/\t\t\t/" .table.csv'
        exe 'r .table.csv'
        exe '!rm .table.csv'
endfunction



function! Import_table()
	exe '! touch .table.csv'
	exe '!read -p "CSV file path: " path && cp $path .table.csv'
endfunction



iabbrev newTable \begin{table}[htbp]<CR>
        \<tab>\begin{center}<CR>
        \<tab><tab>\begin{tabular}{}<CR>
        \<CR><CR>\end{tabular}<CR>
        \%\caption{}<CR>
        \%\label{}<CR>
        \\end{center}<CR>
	\\end{table}<esc>6k
	\:! touch .table.csv<CR>
        \:call Csv_to_tex()<CR>
        \?tabular}{}<CR>2f}i



iabbrev importTable \begin{table}[htbp]<CR>
        \<tab>\begin{center}<CR>
        \<tab><tab>\begin{tabular}{}<CR>
        \<CR><CR>\end{tabular}<CR>
        \%\caption{}<CR>
        \%\label{}<CR>
        \\end{center}<CR>
        \\end{table}<esc>6k
        \:call Import_table()<CR>
        \:call Csv_to_tex()<CR>
        \?tabular}{}<CR>2f}i



let &cpo = s:save_cpo
