" ----------------------------------------------------------------------------
" Syntastic
" ----------------------------------------------------------------------------
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

let g:syntastic_coffee_checkers     = ['coffeelint', 'coffee']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers       = ['reek', 'rubocop']
