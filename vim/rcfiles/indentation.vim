" Copy indent from current line when starting a new line
set autoindent

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" A <Tab> in front of a line inserts blanks according to 'shiftwidth'
set smarttab

" Tabs are spaces: shortcut for inserting 2 spaces
set expandtab

" Round indent to multiple of 'shiftwidth'
set shiftround

" Number of columns to use for text indenting
set shiftwidth=2

" Number of spaces in tab when editing
set softtabstop=2

" Number of visual spaces per TAB
set tabstop=2

" Fix code indentation
nnoremap <F7> mzgg=G`z

" Display extra whitespace.
set list
set listchars=tab:»·,trail:·,nbsp:·

" Make every wrapped line visually indented.
set breakindent
let &showbreak = '››› '

" Ident like most editors do.
" Note: In insert mode, you can just use Ctrl-t and Ctrl-d to indent/dedent.
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
