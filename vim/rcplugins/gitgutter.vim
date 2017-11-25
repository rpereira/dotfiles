set updatetime=250

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '✖'
let g:gitgutter_sign_removed_first_line = '➜'
let g:gitgutter_sign_modified_removed = '✗'

" Use 'ag' as the default grep command
if executable('ag')
  let g:gitgutter_grep_command = 'ag'
endif
