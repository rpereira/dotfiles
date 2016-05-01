" Inserting Dates and Times
iab Ydate <C-R>=strftime("%d-%b-%Y")<CR>
" Example: 16-Apr-2016

iab Ytoday <C-R>=strftime("%a %b %e")<CR>
" Example: Fri Apr 29

iab Ytime <C-R>=strftime("%H:%M")<CR>
" Example: 22:21

iab YDATE <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
" Example: Sat Apr 16 22:20:24 WEST 2016

" The lower letter alphabet.
iab Yalpha abcdefghijklmnopqrstuvwxyz

" The upper letter alphabet.
iab YALPHA ABCDEFGHIJKLMNOPQRSTUVWXYZ

" The ten digits.
iab Ydigit 1234567890

" The sixteen digits of a hexadecimal system.
iab Yhex 1234567890ABCDEF
