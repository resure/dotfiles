setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

map <leader>r :!node %<CR>
map <leader>h :!jshint %<CR>

let g:syntastic_javascript_checkers = ['jshint']

