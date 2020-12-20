
function! LYRD#layers#linters#plugins() abort
    call LYRD#setup#plugins({
                \ 'dense-analysis/ale': '',
                \    })

endfunction

function! LYRD#layers#linters#settings() abort
    call LYRD#layers#commands#register_implementations('*',{
                \ "LYRDFindUsages": ':ALEFindReferences',
                \ "LYRDViewDocumentation": ':ALEHover',
                \ "LYRDFindSymbol": ':ALESymbolSearch',
                \ "LYRDViewCodeActions": ':ALECodeAction',
                \ "LYRDRenameSymbol": ':ALERename',
                \ "LYRDGoToDefinition": ':ALEGoToDefinition',
                \ "LYRDGoToTypeDefinition": ':ALEGoToTypeDefinition',
                \})

    let g:ale_linters = {}
    let g:ale_disable_lsp = 1
    let g:ale_fixers = {
                \   '*': ['remove_trailing_lines', 'trim_whitespace'],
                \}
    let g:ale_sign_error = '⛔'
    let g:ale_sign_warning = ''
    let g:ale_set_loclist = 1
    let g:ale_set_quickfix = 1

endfunction

function! LYRD#layers#linters#keybindings() abort

endfunction

function! LYRD#layers#linters#complete() abort

endfunction

function! LYRD#layers#linters#add(lang, linters)
    :call extend(g:ale_linters, { a:lang: a:linters, })
endfunction
