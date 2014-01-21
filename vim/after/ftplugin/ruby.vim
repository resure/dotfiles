setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
compiler ruby
setlocal makeprg=ruby\ -wc\ %
map <leader>r :!clear && ruby %<CR>
map <leader>h :!clear<CR>:make<CR>
