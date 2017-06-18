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

" Useful for 'getting around'.
nnoremap <leader>e :edit **/*
nnoremap <leader>f :find *
nnoremap <leader>s :split **/*
nnoremap <leader>v :vsplit **/*

nnoremap <C-p> :FZF<CR>

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

" Don't use Ex mode, use Q for formatting.
map Q gq

" Completion menu with various formats for current date.
inoremap <silent> <C-g><C-t> <C-r>=repeat(complete(col('.'), map(["%Y-%m-%d %H:%M:%S","%a, %d %b %Y %H:%M:%S %z","%Y %b %d","%d-%b-%y","%a %b %d %T %Z %Y"],'strftime(v:val)')+[localtime()]),0)<CR>

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
" Insert blank lines above and bellow current line, respectively.
nnoremap [<Space> :<c-u>put! =repeat(nr2char(10), v:count1)<CR>
nnoremap ]<Space> :<c-u>put =repeat(nr2char(10), v:count1)<CR>

" Move current line up and down, respectively.
nnoremap <silent> [e :move-2<CR>
nnoremap <silent> ]e :move+<CR>
xnoremap <silent> [e :move-2<CR>gv
xnoremap <silent> ]e :move'>+<CR>gv

" Change indentation
nnoremap < <<
nnoremap > >>
xnoremap < <gv
xnoremap > >gv

" ----------------------------------------------------------------------------
" Readline-style key bindings in command-line
" ----------------------------------------------------------------------------
cnoremap        <C-A> <Home>
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"

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
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

" Disable <Esc> key in insert mode. Use <jk> mapping to exit insert mode.
inoremap <Esc> <NOP>
