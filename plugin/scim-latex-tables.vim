" scim-latex-tables is a Vim pluggin that generates latex tables using sc-im, a spreadsheet program for the terminal emulator. 
" Last Change:  29/07/2018
" Maintainer:   Manuel Bajo Buenestado <lolobajo@gmail.com>
" License:      MIT LICENSE

if exists("g:loaded_slt")
  finish
endif

let g:loaded_slt = 1

let s:save_cpo = &cpo
set cpo&vim


iabbrev newTable \begin{table}[htbp]<CR>
        \<tab>\begin{center}<CR>
        \<tab><tab>\begin{tabular}{}<CR>
        \<CR><CR><tab><tab>\end{tabular}<CR>
        \<tab><tab>\caption{}<CR>
        \<tab><tab>\label{}<CR>
        \<tab>\end{center}<CR>
	\\end{table}<esc>6k
	\:! touch .table.csv<CR>
        \:call Csv_to_tex()<CR>
        \?tabular}{}<CR>2f}i


iabbrev importTable \begin{table}[htbp]<CR>
        \<tab>\begin{center}<CR>
        \<tab><tab>\begin{tabular}{}<CR>
        \<CR><CR><tab><tab>\end{tabular}<CR>
        \<tab><tab>\caption{}<CR>
        \<tab><tab>\label{}<CR>
        \<tab>\end{center}<CR>
        \\end{table}<esc>6k
        \:call Import_table()<CR>
        \:call Csv_to_tex()<CR>
        \?tabular}{}<CR>2f}i



function! Csv_to_tex()
        exe '!sc-im .table.csv'
        exe '!sed -i  "s/,$//g" .table.csv'
        exe '!sed -i  "/^,$/d" .table.csv'
        exe '!sed -i  "/,,$/d" .table.csv'
        exe '!sed -i -- "s/,/ \&      /g" .table.csv'
        exe '!sed -i "s|$|    \\\|" .table.csv'
        exe '!sed -i "s|$|\\\|" .table.csv'
        exe '!sed -i "s/^/			/" .table.csv'
        exe 'r .table.csv'
        exe '!rm .table.csv'
endfunction


function! Import_table()
	exe '! touch .table.csv'
	exe '!read -p "CSV file path: " path && cp $path .table.csv'
endfunction

let &cpo = s:save_cpo
