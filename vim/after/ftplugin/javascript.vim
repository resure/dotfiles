setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

map <leader>h :!clear && ~/node_modules/.bin/jshint %<CR>

let g:syntastic_javascript_checkers = ['jshint', 'jscs']

map <leader>C :!clear && jscs % -c ~/.jscsrc<CR>
map <leader>L :SyntasticCheck jscs<CR>

