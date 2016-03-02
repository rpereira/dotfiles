" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------
" Open ~/.vimrc file in a vertical split.
" Think of this command as 'Edit my Vimrc file'.
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" Source the ~/.vimrc file so that changes take effect.
" Think of this command as 'Source my Vimrc file'.
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Toggle auto-indenting for code paste.
set pastetoggle=<F5>

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

" Surround the word under the cursor in double quotes.
:nnoremap <Leader>" viw<Esc>a"<Esc>hbi"<Esc>lel
