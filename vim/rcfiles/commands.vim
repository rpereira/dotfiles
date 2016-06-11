" Quick access to my .vimrc file.
command! SV source  $MYVIMRC
command! EV tabedit $MYVIMRC <bar> lcd %:p:h
