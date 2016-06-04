" Open ~/.vimrc file in a vertical split.
" Think of this command as 'Edit my Vimrc file'.
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" Source the ~/.vimrc file so that changes take effect.
" Think of this command as 'Source my Vimrc file'.
nnoremap <Leader>sv :source $MYVIMRC<CR>

" ----------------------------------------------------------------------------
" Basic Mappings
" ----------------------------------------------------------------------------

" Save
nnoremap ,, :w<CR>
inoremap ,, <C-O>:w<CR>

" Save & Quit
nnoremap <leader>x :x<CR>

" Quit
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>

" Open the file explorer in a new tab
map <leader>T :Texplore<CR>

" ----------------------------------------------------------------------------
" Editing
" ----------------------------------------------------------------------------

" Smart-insert semicolon
inoremap <leader>; <C-o>A;<Esc>:w<CR>
nnoremap <leader>; A;<Esc>:w<CR>

" Surround the word under the cursor in double quotes.
noremap <Leader>" viw<Esc>a"<Esc>hbi"<Esc>lel

" Make Y consistent with other capitals (e.g. C and D)
nnoremap Y y$

" Moving lines
xnoremap < <gv
xnoremap > >gv

" ----------------------------------------------------------------------------
" Movement
" ----------------------------------------------------------------------------

" Supper toggling powers.
" Example: When I hit `0` for the first time, I want it be be like `^`. If I hit
" it again, I want it to finish its travels and go to the first column.
function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

" ----------------------------------------------------------------------------
" Learn Vim the hard way
" ----------------------------------------------------------------------------
" Quote from http://learnvimscriptthehardway.stevelosh.com/
" `The right way to use Vim is to get out of insert mode as soon as you can and
" use normal mode to move around.`
nnoremap <Up> :echoe "Use k"<CR>
inoremap <Up> <NOP>
vnoremap <Up> <NOP>

nnoremap <Down> :echoe "Use j"<CR>
inoremap <Down> <NOP>
vnoremap <Down> <NOP>

nnoremap <Left> :echoe "Use h"<CR>
inoremap <Left> <NOP>
vnoremap <Left> <NOP>

nnoremap <Right> :echoe "Use l"<CR>
inoremap <Right> <NOP>
vnoremap <Right> <NOP>

" Save my left hand. Using <jk> to return to normal mode is greate because these
" keys are under two of my strongest fingers and I don't have to perform a
" chord.
"inoremap jk <Esc>

" Disable <Esc> key in insert mode. Use <jk> mapping to exit insert mode.
"inoremap <Esc> <NOP>
