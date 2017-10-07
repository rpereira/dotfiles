" Vim only remembers the last 20 commands and search patterns entered. Let's
" boost this up.
set history=1000

" Highlight matches
set hlsearch

" Search as characters are entered
set incsearch

" When using a ':substitute' command, all matches in a line are substituted
" instead of one.
set gdefault

" Ignore the case of normal letters. 'smartcase' is set to ignore case when the
" pattern contains lowercase letters only.
set ignorecase
set smartcase

" Use the Silver Searcher
if executable('ag')
  " Use ag over grep.
  " Output the line and column number of each match, so that we can navigate
  " results by jumping to the precise position of each match.
  set grepprg=ag\ --nogroup\ --nocolor\ --column\ $*
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" See grepper#run in vim/autoload/grepper.vim
command! -nargs=* -complete=file Ag call grepper#run(<q-args>)

" Bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<Space>

" Bind K to grep word under cursor
nnoremap <silent> K :grep! "\b<C-R><C-W>\b"<CR>:copen<CR>

nnoremap ,I :Ilist<Space>
