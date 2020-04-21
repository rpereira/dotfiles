setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal expandtab

" Clear list
setlocal list&

" Run goimports + gofmt on each save
let g:go_fmt_command = "goimports"

" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1
