setlocal shiftwidth=4
setlocal softtabstop=4
compiler go
map <leader>r :!clear && go run %<CR>
