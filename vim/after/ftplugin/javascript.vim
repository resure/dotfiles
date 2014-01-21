setlocal expandtab
setlocal shiftwidth=6
setlocal softtabstop=6
map <leader>r :!clear && node %<CR>
map <leader>h :!clear && jshint %<CR>

let g:syntastic_javascript_checkers = ['jshint']

