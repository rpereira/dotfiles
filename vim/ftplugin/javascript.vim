" let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
" let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

fun! RunESlint(path)
  " Clear terminal
  execute '!clear'

  " Run ESLint
  execute '! ./node_modules/.bin/eslint ' . expand('%')
endfun

command! -nargs=* Lint call RunESlint('src')
