" Set filetype for file names without format.
augroup file_type_check
  autocmd!
  autocmd BufNewFile,BufRead .babelrc,.eslintrc,.lintstagedrc set ft=json
  autocmd BufNewFile,BufRead *named.conf* set ft=named
  autocmd BufNewFile,BufRead *.txt,INSTALL,LICENSE,NEWS,README,TODO
        \ if &ft == ""  |
        \   set ft=text |
        \ endif
augroup END

" Restore cursor position when opening file except for gitcommit filetype.
augroup restore_cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if &ft !=# 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

augroup auto_save_and_read
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END

" Only highlight the current line in the current window.
augroup cursor_line
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
