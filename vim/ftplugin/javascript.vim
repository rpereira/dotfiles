"
" flowtype/vim-flow
"
let g:flow#autoclose = 1

" Custom flow executable.
let g:flow#flowpath = getcwd() . '/node_modules/.bin/flow'

"
" heavenshell/vim-jsdoc
"
let g:jsdoc_param_description_separator = ' - '
let g:jsdoc_enable_es6 = 1

"
" pangloss/vim-javascript
"
" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

" Enables syntax highlighting for Flow.
let g:javascript_plugin_flow = 1

"
" Snippets
"
autocmd FileType javascript.jsx UltiSnipsAddFiletypes javascript-react
