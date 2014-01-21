setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
map <leader>r :!clear && node %<CR>
map <leader>h :!clear && jshint %<CR>

let g:syntastic_javascript_checkers = ['jshint']

