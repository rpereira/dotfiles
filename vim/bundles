call plug#begin('~/.vim/bundle')

" Theme
Plug 'altercation/vim-colors-solarized'
Plug 'edkolev/tmuxline.vim'

" Tools
Plug 'bling/vim-airline'
Plug 'junegunn/fzf',            { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'scrooloose/syntastic'

" Edit
Plug 'tpope/vim-commentary',    { 'on': '<Plug>Commentary' }
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Local bundles
if filereadable(expand("~/.vimrc_bundles.local"))
  source ~/.vimrc_bundles.local
endif

call plug#end()
