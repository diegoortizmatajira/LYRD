
function! LYRD#layers#lang#vim#plugins() abort
    call LYRD#setup#plugins({
                \    })

endfunction

function! LYRD#layers#lang#vim#settings() abort
    call LYRD#layers#linters#add('vim', ['vint'])
    call LYRD#layers#coc#add_extensions(['coc-vimlsp'])

endfunction

function! LYRD#layers#lang#vim#keybindings() abort

endfunction

function! LYRD#layers#lang#vim#complete() abort

endfunction

function! LYRD#layers#lang#vim#support()

endfunction
