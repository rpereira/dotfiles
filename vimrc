set nocompatible

" Allow color schemes to do bright colors without forcing bold.
set t_Co=16

" Runtime path manipulation.
call pathogen#infect()

" Enable color syntax highlighting.
syntax enable

" Solarized Light
set background=light
colorscheme solarized

" Vim plugins. In order to install them launch vim and run :PluginInstall.
if filereadable(expand("vimrc.bundles"))
  source vimrc.bundles
endif

" Enable language-dependent indenting.
filetype plugin indent on

" Copy indent from current line when starting a new line.
set autoindent

" Make backspace work like most other apps
set backspace=2

" http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set noswapfile

" Switch off automatic creation of backup files.
set nobackup
set nowritebackup

" Display incomplete commands
set showcmd

" Delete comment character when joining commented lines.
set formatoptions+=j

" Automatically wrap at 72 characters and spell check git commit messages.
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

" Automatically wrap at 80 characters for Markdown.
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd FileType markdown setlocal spell

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Draw a vertical line to encourage wrapping the text at 80 chars.
set textwidth=80
set colorcolumn=+1

" Highlight current line.
set cursorline

" Match and highligh on red color trailing whitespaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Auto-strip trailing whitespaces from files on saving.
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" Line numbers.
set number
set numberwidth=5

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
