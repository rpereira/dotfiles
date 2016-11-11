let s:ft_emoji = map({
  \ 'c':              'baby_chick',
  \ 'clojure':        'lollipop',
  \ 'coffee':         'coffee',
  \ 'conf':           'wrench',
  \ 'cpp':            'chicken',
  \ 'css':            'art',
  \ 'eruby':          'ring',
  \ 'gitcommit':      'cat',
  \ 'haml':           'hammer',
  \ 'haskell':        'tophat',
  \ 'help':           'angel',
  \ 'html':           'herb',
  \ 'java':           'older_man',
  \ 'javascript':     'see_no_evil',
  \ 'javascript.jsx': 'see_no_evil',
  \ 'json':           'page_with_curl',
  \ 'make':           'seedling',
  \ 'markdown':       'book',
  \ 'perl':           'camel',
  \ 'python':         'snake',
  \ 'ruby':           'gem',
  \ 'scala':          'barber',
  \ 'scss':           'art',
  \ 'sh':             'shell',
  \ 'slim':           'dancer',
  \ 'text':           'books',
  \ 'vim':            'poop',
  \ 'vim-plug':       'electric_plug',
  \ 'yaml':           'yum',
  \ 'yaml.jinja':     'yum',
  \ 'zsh':            'shell',
\ }, 'emoji#for(v:val)')

let s:mode_emoji = map({
  \ "n":      'cherry_blossom',
  \ "i":      'four_leaf_clover',
  \ "R":      'sunflower',
  \ "v":      'tulip',
  \ "\<C-V>": 'tulip',
  \ "V":      'tulip',
\ }, 'emoji#for(v:val)')

function! Mode()
  " Get emoji for mode and fallback to 'question' emoji
  return get(s:mode_emoji, mode(), emoji#for('question'))
endfunc

" See: https://github.com/neomake/neomake/blob/master/doc/neomake.txt#L407
function! NeomakeStatus()
  let prefix = ' '.emoji#for('x').' '
  return neomake#statusline#LoclistStatus(prefix)
endfunction

function! Filetype()
  if empty(&filetype)
    return ''
  else
    return get(s:ft_emoji, &filetype)
  endif
endfunction

function! Modified()
  if &modified
    return emoji#for('construction').' '
  else
    return ''
  endif
endfunction

function! GitBranch()
  let l:head = fugitive#head()
    if empty(l:head)
      return ''
    else
      " return emoji#for('arrows_clockwise').l:head
      return l:head
    endif
endfunction

function! GitHunks()
  let hunks  = GitGutterGetHunkSummary()
  let string = ''

  if !empty(hunks)
    let hunk_symbols = ['+', '~', '-']

    for i in [0, 1, 2]
      if hunks[i] > 0
        let string .= printf('%s%s ', hunk_symbols[i], hunks[i])
      endif
    endfor
  endif
  return string
endfunction

hi def link User1 TablineFill
function! StatusLine()
  let mode        = " %{Mode()} "
  let buf         = "[%n]"
  let make_status = "%{NeomakeStatus()}"
  let fpath       = " %<%f "
  let ft          = "%{Filetype()} "
  let mod         = "%{Modified()}"
  let spell       = "%{&spell ? emoji#for('mag') . ' ' : ''}"
  let ro          = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
  " Use 4l as a little trick to avoid issues of emojis being rendered above
  " previous chars.
  let pos         = " %4l,%-3c %P "
  let sep         = " %= "
  let gb          = "%{GitBranch()} "
  let gh          = "%{GitHunks()}"

  return mode.buf.make_status.fpath.ft.ro.mod.spell.pos.sep.sep.gb.gh
endfunction

" Note that the "%!" expression is evaluated in the context of the
" current window and buffer, while %{} items are evaluated in the
" context of the window that the statusline belongs to.
set statusline=%!StatusLine()
