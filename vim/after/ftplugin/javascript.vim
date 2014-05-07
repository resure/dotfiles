setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

map <leader>r :!node %<CR>
map <leader>h :!jshint %<CR>

let g:syntastic_javascript_checkers = ['jshint']

