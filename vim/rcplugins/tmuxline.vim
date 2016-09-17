" Custom preset based on powerline. The time format is the same as the system's.
" Plugin documentation is kinda short on custom presets, so I'll add some
" instructions for future reference. The ideia is to edit this file and then run
" `:TmuxlineSnapshot! tmux/tmuxline.conf` inside Vim.
let g:tmuxline_preset = {
  \ 'a'    : '#S',
  \ 'win'  : ['#I', '#W'],
  \ 'cwin' : ['#I', '#W'],
  \ 'y'    : ['%a %b %e', '%l:%M %p'],
  \ 'z'    : '#h',
  \ 'options': {
  \ 'status-justify': 'left'
  \ }
  \ }
