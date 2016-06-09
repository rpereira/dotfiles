call plug#begin('~/.vim/bundle')

set rtp+=/usr/local/opt/fzf

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
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mxw/vim-jsx',              { 'for': 'javascript' }
Plug 'pangloss/vim-javascript',  { 'for': 'javascript', 'branch': 'develop' }
Plug 'plasticboy/vim-markdown',  { 'for': 'markdown' }
Plug 'rust-lang/rust.vim',       { 'for': 'rust' }
Plug 'tpope/vim-haml',           { 'for': 'haml' }
Plug 'tpope/vim-rails',          { 'for': ['ruby', 'haml'] }
Plug 'vim-ruby/vim-ruby',        { 'for': 'ruby' }

"------------------------------------------------
" Motion
"------------------------------------------------
Plug 'wellle/targets.vim'

"------------------------------------------------
" Theme
"------------------------------------------------
Plug 'edkolev/tmuxline.vim',     { 'on': [] }

"------------------------------------------------
" Tools
"------------------------------------------------
Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/syntastic'

Plug 'sirver/ultisnips', { 'on': [] }
augroup ulti_snips_lazy_load_on_file_type
  autocmd!
  autocmd FileType javascript,java call plug#load('ultisnips')
        \| call UltiSnips#FileTypeChanged()
        \| autocmd! ulti_snips_lazy_load_on_file_type
augroup END

" Local bundles
if filereadable(expand("~/.vimrc_bundles.local"))
  source ~/.vimrc_bundles.local
endif

call plug#end()
