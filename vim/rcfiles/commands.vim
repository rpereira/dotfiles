" Quick access to my .vimrc file.
command! SV source  $MYVIMRC
command! EV tabedit $MYVIMRC <bar> lcd %:p:h

" Count the number of matches of the specified pattern.
" Usage: :Count <pattern>
command! -nargs=1 Count execute printf('%%s/%s//gn', escape(<q-args>, '/'))
      \ | normal! ``
