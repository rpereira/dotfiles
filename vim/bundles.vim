set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/bundle')

"------------------------------------------------
" Edit
"------------------------------------------------
Plug 'christoomey/vim-sort-motion'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align',    { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-commentary',       { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

"------------------------------------------------
" Git
"------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'

"------------------------------------------------
" Languages
"------------------------------------------------
" Elixir
Plug 'elixir-lang/vim-elixir',     { 'for': 'elixir' }

" Haskell
Plug 'neovimhaskell/haskell-vim',  { 'for': 'haskell' }
Plug 'hspec/hspec.vim',            { 'for': 'haskell.hspec' }

" JavaScript
Plug 'flowtype/vim-flow' ,         { 'for': ['javascript.jsx', 'javascript'] }
Plug 'mxw/vim-jsx' ,               { 'for': ['javascript.jsx', 'javascript'] }
Plug 'pangloss/vim-javascript' ,   { 'for': ['javascript.jsx', 'javascript'] }
Plug 'heavenshell/vim-jsdoc' ,     { 'for': ['javascript.jsx', 'javascript'] }

" Markdown
Plug 'plasticboy/vim-markdown',    { 'for': 'markdown' }

" Ruby
Plug 'tpope/vim-haml',             { 'for': 'haml' }
Plug 'tpope/vim-rails',            { 'for': ['ruby', 'haml'] }
Plug 'vim-ruby/vim-ruby',          { 'for': 'ruby' }

" Rust
Plug 'rust-lang/rust.vim',         { 'for': 'rust' }

"------------------------------------------------
" Motion
"------------------------------------------------
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'

"------------------------------------------------
" Searching
"------------------------------------------------
Plug 'romainl/vim-cool'

"------------------------------------------------
" Theme
"------------------------------------------------
Plug 'junegunn/seoul256.vim',       { 'dir': '~/.vim/colors' }

"------------------------------------------------
" Tools
"------------------------------------------------
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-dirvish'
Plug 'neomake/neomake'
Plug 'pbrisbin/vim-mkdir'
Plug 'msanders/snipmate.vim'

call plug#end()
