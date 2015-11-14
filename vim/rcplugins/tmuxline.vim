" ----------------------------------------------------------------------------
" Custom Preset
" ----------------------------------------------------------------------------
" Based on powerline. The time format is the same as the system's.
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
