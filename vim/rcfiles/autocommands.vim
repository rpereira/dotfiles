" Set filetype for file names without format.
augroup file_type_check
  autocmd!
  autocmd BufNewFile,BufRead *named.conf* set ft=named
  autocmd BufNewFile,BufRead *.txt,INSTALL,LICENSE,NEWS,README,TODO
        \ if &ft == ""  |
        \   set ft=text |
        \ endif
augroup END

" Write all changed buffers when Vim loses input focus.
augroup write_buffer_on_focus_lost
  autocmd!
  autocmd FocusLost * silent! wall
augroup END

" Restore cursor position when opening file except for gitcommit filetype.
augroup restore_cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if &ft !=# 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END
