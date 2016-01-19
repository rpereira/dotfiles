call plug#begin('~/.vim/bundle')

" Theme
Plug 'altercation/vim-colors-solarized'
Plug 'edkolev/tmuxline.vim'

" Tools
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf',            { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/syntastic'

" Edit
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-commentary',    { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Local bundles
if filereadable(expand("~/.vimrc_bundles.local"))
  source ~/.vimrc_bundles.local
endif

call plug#end()
