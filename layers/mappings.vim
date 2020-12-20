
function! LYRD#layers#mappings#plugins() abort
    call LYRD#setup#plugins({
                \ 'liuchengxu/vim-which-key': '',
                \ })

endfunction

function! LYRD#layers#mappings#settings() abort
    let g:LYRD_Settings.mappings = {}
    let g:LYRD_Settings.mappings.Leader = {}
    let g:LYRD_Settings.mappings.Space = {}
    call which_key#register(',', g:LYRD_Settings.mappings.Leader)
    call which_key#register('<Space>', g:LYRD_Settings.mappings.Space)
    let g:which_key_timeout = 100
endfunction

function! LYRD#layers#mappings#keybindings() abort
    nnoremap <silent> <Leader> :WhichKey '<Leader>'<CR>
    nnoremap <silent> <Space> :WhichKey '<Space>'<CR>
endfunction

function! LYRD#layers#mappings#complete() abort

endfunction

function! LYRD#layers#mappings#support()

endfunction

function! LYRD#layers#mappings#leader(mappings) abort
    for mapping in a:mappings
        call s:mapkey('Leader', mapping[0], mapping[1], mapping[2], mapping[3])
    endfor
endfunction

function! LYRD#layers#mappings#space(mappings) abort
    for mapping in a:mappings
        call s:mapkey('Space', mapping[0], mapping[1], mapping[2], mapping[3])
    endfor
endfunction

function! LYRD#layers#mappings#spacemenu(menus)
    for item in a:menus
        call s:mapmenu('Space', item[0], item[1])
    endfor
endfunction

function! LYRD#layers#mappings#leaderignorekey(keys)
    call s:recursive_doc(g:LYRD_Settings.mappings.Leader, a:keys, 'which_key_ignore', 0)
endfunction

function! LYRD#layers#mappings#leaderignoremenu(keys)
    call s:recursive_doc(g:LYRD_Settings.mappings.Leader, a:keys, { 'name': 'which_key_ignore'}, 0)
endfunction

function! s:mapmenu(lead, keys, desc)
    call s:recursive_doc(g:LYRD_Settings.mappings[a:lead], a:keys, { 'name': '[ '. a:desc .' ]'}, 0)
endfunction

function! s:mapkey(lead, m, keys, cmd, desc) abort
    exe a:m . ' <silent> <'.a:lead.'>' . join(a:keys, '') . ' ' . a:cmd
    call s:recursive_doc(g:LYRD_Settings.mappings[a:lead], a:keys, a:desc, 0)
endfunction

function! s:recursive_doc(list, keys, desc, i) abort
    if a:i == len(a:keys)-1
        let a:list[a:keys[a:i]] = a:desc
    else
        if !has_key(a:list, a:keys[a:i])
            let a:list[a:keys[a:i]]={}
        endif
        if type(a:list[a:keys[a:i]]) != type({})
            " The next iteration would produce and error as the next node is not a
            " dictionary
            let pendingkeys = a:keys[a:i:-1]
            let collapsedkeys = a:keys[0:a:i]
            let collapsedkeys[a:i] = join(pendingkeys,'')
            call s:recursive_doc(a:list,collapsedkeys,a:desc, a:i)
            return
        else
            call s:recursive_doc(a:list[a:keys[a:i]], a:keys, a:desc, a:i+1)
        endif
    endif
endfunction
