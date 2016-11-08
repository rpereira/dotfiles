packadd! matchit

set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/bundle')

"------------------------------------------------
" Edit
"------------------------------------------------
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-commentary',    { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

"------------------------------------------------
" Git
"------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"------------------------------------------------
" Languages
"------------------------------------------------
" CoffeeScript
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" Elixir
Plug 'elixir-lang/vim-elixir',   { 'for': 'elixir' }

" JavaScript
Plug 'flowtype/vim-flow'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript',  { 'branch': 'develop' }
Plug 'heavenshell/vim-jsdoc'

" Markdown
Plug 'plasticboy/vim-markdown',  { 'for': 'markdown' }

" Ruby
Plug 'tpope/vim-haml',           { 'for': 'haml' }
Plug 'tpope/vim-rails',          { 'for': ['ruby', 'haml'] }
Plug 'vim-ruby/vim-ruby',        { 'for': 'ruby' }

" Rust
Plug 'rust-lang/rust.vim',       { 'for': 'rust' }

"------------------------------------------------
" Motion
"------------------------------------------------
Plug 'wellle/targets.vim'

"------------------------------------------------
" Searching
"------------------------------------------------
Plug 'romainl/vim-qlist'

"------------------------------------------------
" Theme
"------------------------------------------------
Plug 'romainl/flattened',        { 'dir': '~/.vim/colors' }

"------------------------------------------------
" Tools
"------------------------------------------------
Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pbrisbin/vim-mkdir'
Plug 'neomake/neomake'
" Lazy load. See vim/rcplugins/ultisnips.vim
Plug 'sirver/ultisnips', { 'on': [] }

" Local bundles
if filereadable(expand("~/.vimrc_bundles.local"))
  source ~/.vimrc_bundles.local
endif

call plug#end()
