setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

map <leader>r :!clear && node %<CR>
map <leader>h :!clear && jshint %<CR>

let g:syntastic_javascript_checkers = ['jshint']

