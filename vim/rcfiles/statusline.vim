" See: https://github.com/neomake/neomake/blob/master/doc/neomake.txt#L407
function! NeomakeStatus()
  let prefix = ' '.emoji#for('x').' '
  return neomake#statusline#LoclistStatus(prefix)
endfunction

function! GitBranch()
  let l:head = fugitive#head()
    if empty(l:head)
      return ''
    else
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
  let buf         = " [%n]"
  let make_status = "%{NeomakeStatus()}"
  let fpath       = " %<%f "
  let mod         = "%m"
  let ro          = "%r"
  " Use 4l as a little trick to avoid issues of emojis being rendered above
  " previous chars.
  let pos         = "%4l,%-3c %P"
  let sep         = " %= "
  let spell       = "%{&spell ? &spelllang : ''}"
  let gb          = "%{GitBranch()} "
  let gh          = "%{GitHunks()}"

  return buf.make_status.fpath.ro.mod.pos.sep.spell.sep.gb.gh
endfunction

" Note that the "%!" expression is evaluated in the context of the
" current window and buffer, while %{} items are evaluated in the
" context of the window that the statusline belongs to.
set statusline=%!StatusLine()
