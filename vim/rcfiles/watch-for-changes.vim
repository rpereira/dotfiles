" Reload when entering the buffer or gaining focus
au FocusGained,BufEnter * :silent! !

" Save when exiting the buffer or losing focus
au FocusLost,WinLeave * :silent! w
