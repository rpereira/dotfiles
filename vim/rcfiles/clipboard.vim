" Yank selected text or a line into the system clipboard, respectively.
noremap <leader>y "*y
noremap <leader>yy "*Y"

" Preserve indentation while pasting text from the system clipboard.
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
