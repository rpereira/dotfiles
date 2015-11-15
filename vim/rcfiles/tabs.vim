" ----------------------------------------------------------------------------
" Tab Navigation
" ----------------------------------------------------------------------------
" Navigate Vim style
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprevious<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnext<CR>

" Open tabpage after the last one
nnoremap tn :$tabnew<CR>

" Close current tab
nnoremap td :tabclose<CR>

" Go to the nth tabpage
nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt
nnoremap t6 6gt
nnoremap t7 7gt
nnoremap t8 8gt
nnoremap t9 9gt
nnoremap t0 10gt

" ----------------------------------------------------------------------------
" Tab Actions
" ----------------------------------------------------------------------------
autocmd VimEnter * tab all
"autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'