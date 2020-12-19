
function! LYRD#layers#motions#plugins() abort
  call LYRD#setup#plugins({
        \ 'easymotion/vim-easymotion': '',
        \})

endfunction

function! LYRD#layers#motions#settings() abort

endfunction

function! LYRD#layers#motions#keybindings() abort

  map <Leader><Leader> <Plug>(easymotion-prefix)

  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-sn)

  "Hides the whichkey menu for <Leader><Leader>
  call LYRD#layers#mappings#leaderignorekey([','])
  " ➡ Jump forward
  map <Plug>(easymotion-prefix)l <Plug>(easymotion-lineforward)
  " ⬇ Jump below (Start of line)
  map <Plug>(easymotion-prefix)j <Plug>(easymotion-sol-j)
  " ⬇ Jump below
  map <Plug>(easymotion-prefix)J <Plug>(easymotion-j)
  " ⬆ Jump above (Start of line)
  map <Plug>(easymotion-prefix)k <Plug>(easymotion-sol-k)
  " ⬆ Jump above
  map <Plug>(easymotion-prefix)K <Plug>(easymotion-k)
  " ⬅ Jump backward
  map <Plug>(easymotion-prefix)h <Plug>(easymotion-linebackward)
  " Jump anywhere
  map <Plug>(easymotion-prefix)a <Plug>(easymotion-jumptoanywhere)



  " Find character (In line)
  map <Plug>(easymotion-prefix)s <Plug>(easymotion-s)
  " Search expression (In line)
  map <Plug>(easymotion-prefix)S <Plug>(easymotion-sln)

endfunction

function! LYRD#layers#motions#complete() abort

endfunction

function! LYRD#layers#motions#support()

endfunction
