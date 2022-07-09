let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

nmap <leader>pp <Plug>(Prettier)
nnoremap <leader>pd :let g:prettier#autoformat = 0<CR>
nnoremap <leader>pe :let g:prettier#autoformat = 1<CR>
