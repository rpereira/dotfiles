call plug#begin('~/.vim/bundle')

" Theme
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'edkolev/tmuxline.vim'

" Tools
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf',            { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/syntastic'
Plug 'sirver/ultisnips'

" Edit
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-commentary',    { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

" Languages
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'pangloss/vim-javascript',  { 'for': 'javascript' }
Plug 'mxw/vim-jsx',              { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown',  { 'for': 'markdown' }
Plug 'tpope/vim-haml',           { 'for': 'haml' }
Plug 'tpope/vim-rails',          { 'for': ['ruby', 'haml'] }
Plug 'vim-ruby/vim-ruby',        { 'for': 'ruby' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Local bundles
if filereadable(expand("~/.vimrc_bundles.local"))
  source ~/.vimrc_bundles.local
endif

call plug#end()
