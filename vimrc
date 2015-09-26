" Better safe than sorry
set nocompatible

" ============================================================================
" VIM-PLUG
" ============================================================================

if filereadable(expand("$DOTFILES/vimrc.bundles"))
  source $DOTFILES/vimrc.bundles
endif

" ============================================================================
" THEME
" ============================================================================

" ----------------------------------------------------------------------------
" Solarized light
" ----------------------------------------------------------------------------
set background=light
colorscheme solarized
let g:airline_theme='solarized'

" Allow color schemes to do bright colors without forcing bold
set t_Co=16

" ============================================================================
" BASIC SETTINGS
" ============================================================================

let mapleader = ' '

" Copy indent from current line when starting a new line
set autoindent

" Backspace deletes like most programs in insert mode
set backspace=2

" Highlight current line
set cursorline

" Do incremental searching
set incsearch

" https://github.com/bling/vim-airline/wiki/FAQ#vim-airline-doesnt-appear-until-i-create-a-new-split
set laststatus=2

" Switch off automatic creation of backup files
set nobackup
set nowritebackup

" Get rid of default mode indicator - using airline's instead
set noshowmode

" http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set noswapfile

" Line numbers
set number
set numberwidth=5

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Draw a vertical line to encourage wrapping the text at 80 chars
set textwidth=80
set colorcolumn=+1

" Enable color syntax highlighting
syntax enable

" ============================================================================
" TEXT WRAPP AND SPELL CHECK
" ============================================================================

" ----------------------------------------------------------------------------
" Git commit
" ----------------------------------------------------------------------------
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

" ----------------------------------------------------------------------------
" Markdown
" ----------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd FileType markdown setlocal spell

" ============================================================================
" PLUGINS
" ============================================================================

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
" Note: The airline theme is defined on the top of this file under "THEME"
" section.

" Enable powerline font symbols.
let g:airline_powerline_fonts=1

" Prevent powerline font symbols from being partially messed up.
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" ----------------------------------------------------------------------------
" Gitgutter
" ----------------------------------------------------------------------------
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '✖'
let g:gitgutter_sign_removed_first_line = '➜'
let g:gitgutter_sign_modified_removed = '✗'

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

"let g:syntastic_enable_signs=1
"let g:syntastic_mode_map={ 'mode': 'active',
"                     \ 'active_filetypes': ['coffee'],
"                     \ 'passive_filetypes': ['html', 'java'] }
"let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
"let g:syntastic_enable_signs=1
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" ============================================================================
" MAPPINGS
" ============================================================================

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------

" Fix code identation.
map <F7> mzgg=G`z

" Highlight all instances of word under cursor. Use <S-*> to move to the next
" occurence.
map <F2> :set hlsearch!
