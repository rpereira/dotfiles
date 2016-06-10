" ----------------------------------------------------------------------------
" Searching
" ----------------------------------------------------------------------------
" Vim only remembers the last 20 commands and search patterns entered. Let's
" boost this up.
set history=1000

" Highlight matches
set hlsearch

" Search as characters are entered
set incsearch

" Turn off search highlight
nnoremap <silent> <Leader>qs <Esc> :nohlsearch<CR>

" Look for files under current directory
map <C-p> :FZF<CR>

" Use the Silver Searcher
if executable('ag')
  " Use ag over grep.
  " Output the line and column number of each match, so that we can navigate
  " results by jumping to the precise position of each match.
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  " Set Ag to search for the provided text and open a 'quickfix' window
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  " Bind \ (backward slash) to grep shortcut
  nnoremap \ :Ag<Space>
endif

" Bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
