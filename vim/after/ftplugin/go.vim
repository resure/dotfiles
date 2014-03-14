setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
compiler go
map <leader>r :!clear && go run %<CR>
