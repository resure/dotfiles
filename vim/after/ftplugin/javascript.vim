setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
au FileType javascript map <leader>rr :!node %<CR>
au FileType coffee map <leader>rr :!coffee %<CR>

let g:syntastic_javascript_checkers = ['jshint']

