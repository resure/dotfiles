set shiftwidth=4
set softtabstop=0
set noexpandtab

map <leader>h :!clear && ~/node_modules/.bin/jshint %<CR>

let g:syntastic_javascript_checkers = ['jshint', 'jscs']

map <leader>C :!clear && jscs % -c ~/.jscsrc<CR>

map <leader>l :SyntasticCheck<CR>
map <leader>ll :SyntasticReset<CR>
