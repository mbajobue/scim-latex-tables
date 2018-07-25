" Vim pluggin that cans generate latex tables using sc-im, a spreadsheet program for the terminal emulator. 
" Last Change:  25/07/2018
" Maintainer:   Manuel Bajo Buenestado <lolobajo@gmail.com>
" License:      MIT LICENSE

if exists("g:loaded_typecorr")
  finish
endif
let g:loaded_typecorr = 1

let s:save_cpo = &cpo
set cpo&vim


iabbrev \begin{table} \begin{table}[htbp]<CR>
        \<tab>\begin{center}<CR>
        \<tab><tab>\begin{tabular}{}<CR>
        \<CR><CR><tab><tab>\end{tabular}<CR>
        \<tab><tab>\caption{}<CR>
        \<tab><tab>\label{}<CR>
        \<tab>\end{center}<CR>
	\\end{table}<esc>
        \:! touch .table.csv <CR>
        \6k:! sc-im .table.csv<CR>
        \:! sed -i -- 's/,/ \&      /g' .table.csv<CR>
        \:! sed -i "s<Bar>$<Bar>    \\\<Bar>" .table.csv<CR>
        \:! sed -i "s<Bar>$<Bar>\\\<Bar>" .table.csv<CR>
        \:! sed -i 's/^/<tab><tab><tab>/' .table.csv<CR>
        \:r .table.csv<CR>
        \:! rm .table.csv <CR>
        \?tabular}{}<CR>2f}i

let &cpo = s:save_cpo
