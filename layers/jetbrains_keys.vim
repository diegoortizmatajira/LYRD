
function! LYRD#layers#jetbrains_keys#plugins() abort
    call LYRD#setup#plugins({
                \    })

endfunction

function! LYRD#layers#jetbrains_keys#settings() abort

endfunction

function! LYRD#layers#jetbrains_keys#keybindings() abort

    noremap <A-Left> :bp<CR>
    noremap <A-Right> :bn<CR>
    noremap <C-F4> :bd<CR>

endfunction

function! LYRD#layers#jetbrains_keys#complete() abort

endfunction

function! LYRD#layers#jetbrains_keys#support()

endfunction
