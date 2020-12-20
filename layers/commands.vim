
function! LYRD#layers#commands#plugins() abort

endfunction

function! LYRD#layers#commands#settings() abort
    let g:LYRD_Settings.commands = {}

endfunction

function! LYRD#layers#commands#keybindings() abort

endfunction

function! LYRD#layers#commands#complete() abort

endfunction

function! LYRD#layers#commands#register_commands(commands)
    for cmd in items(a:commands)
        execute 'command! '.cmd[0].' call LYRD#layers#commands#execute_command("'.cmd[0].'")'
        call LYRD#layers#commands#register_implementation("*", cmd[0], cmd[1])
    endfor
endfunction

function! LYRD#layers#commands#execute_command(command)
    if has_key(g:LYRD_Settings.commands[a:command], &filetype)
        exe g:LYRD_Settings.commands[a:command][&filetype]
    else
        if has_key(g:LYRD_Settings.commands[a:command], '*')
            exe g:LYRD_Settings.commands[a:command]['*']
        else
            echo "Command '". a:command . "' not implemented for the filetype '".&filetype."'"
        endif
    endif
endfunction

function! LYRD#layers#commands#register_implementation(filetype, command, implementation)
    let fts = a:filetype
    if type(a:filetype) != type([])
        let fts = [ a:filetype ]
    endif
    if !has_key(g:LYRD_Settings.commands, a:command)
        call extend(g:LYRD_Settings.commands, { a:command : {} })
    endif
    if a:implementation != ''
        for ft in fts
            call extend(g:LYRD_Settings.commands[a:command], { ft : a:implementation })
        endfor
    endif
endfunction

function! LYRD#layers#commands#register_implementations(filetype, commands)
    for cmd in items(a:commands)
        call LYRD#layers#commands#register_implementation(a:filetype, cmd[0], cmd[1])
    endfor
endfunction
