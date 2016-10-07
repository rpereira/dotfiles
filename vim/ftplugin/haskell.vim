function! RunAllSpecs()
  execute "!clear && stack test"
endfunction

map <Leader>a :call RunAllSpecs()<CR>
