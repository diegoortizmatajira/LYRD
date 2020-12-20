
function! LYRD#layers#dev#plugins() abort
    call LYRD#setup#plugins({
                \ 'honza/vim-snippets': '',
                \ 'Raimondi/delimitMate': '',
                \ 'tpope/vim-commentary': '',
                \ 'sheerun/vim-polyglot': '',
                \ 'dense-analysis/ale': '',
                \ 'Chiel92/vim-autoformat': '',
                \ 'kkoomen/vim-doge': '',
                \})

endfunction

function! LYRD#layers#dev#settings() abort

    call s:AleSettings()

    call LYRD#layers#commands#register_commands({
                \ "LYRDTest": '',
                \ "LYRDTestSuite": '',
                \ "LYRDTestFile": '',
                \ "LYRDTestFunc": '',
                \ "LYRDTestLast": '',
                \ "LYRDBuild": '',
                \ "LYRDTestCoverage": '',
                \ "LYRDDebugStart": '',
                \ "LYRDDebugBreakpoint": '',
                \ "LYRDAlternateFile": '',
                \ "LYRDFindUsages": ':ALEFindReferences',
                \ "LYRDFindImplementations": '',
                \ "LYRDRefactorSymbol": '',
                \ "LYRDPreviewDefinitions": '',
                \ "LYRDPreviewImplementations": '',
                \ "LYRDTypeLookup": '',
                \ "LYRDViewDocumentation": ':ALEHover',
                \ "LYRDFindSymbol": ':ALESymbolSearch',
                \ "LYRDFixImports": '',
                \ "LYRDGlobalCodecheck": '',
                \ "LYRDViewCodeActions": ':ALECodeAction',
                \ "LYRDCodeFormat": ':Autoformat',
                \ "LYRDRenameSymbol": ':ALERename',
                \ "LYRDGoToDefinition": ':ALEGoToDefinition',
                \ "LYRDGoToTypeDefinition": ':ALEGoToTypeDefinition',
                \ "LYRDQuickFix": ':cope',
                \})

endfunction

function! LYRD#layers#dev#keybindings() abort

    call LYRD#layers#mappings#spacemenu([
                \ [['T'], 'Tests'],
                \ [['d'], 'Development'],
                \ [['d', 'p'], 'Preview'],
                \ ])

    call LYRD#layers#mappings#space([
                \ ["nmap", ['b', 'f'], ':LYRDCodeFormat<CR>', 'Format Buffer'],
                \ ["nmap", ['d', 'h'], ':LYRDViewDocumentation<CR>', 'Hint Documentation'],
                \ ['nmap', ['d', 'b'], ':LYRDBuild<CR>', 'Build'],
                \ ['nmap', ['d', 'a'], ':LYRDAlternateFile<CR>', 'Toggle to alterate file'],
                \ ['nmap', ['d', 'u'], ':LYRDFindUsages<CR>', 'Find usages'],
                \ ['nmap', ['d', 'i'], ':LYRDFindImplementations<CR>', 'Find implementations'],
                \ ['nmap', ['d', 'l'], ':LYRDTypeLookup<CR>', 'Type lookup'],
                \ ['nmap', ['d', 's'], ':LYRDFindSymbol<CR>', 'Find symbols'],
                \ ['nmap', ['d', 'c'], ':LYRDGlobalCodecheck<CR>', 'Global code check'],
                \ ['nmap', ['d', 'r'], ':LYRDRenameSymbol<CR>', 'Rename'],
                \ ['nmap', ['d', 'R'], ':LYRDRefactorSymbol<CR>', 'Refactor'],
                \ ["nmap", ['d', 'd'], ':LYRDGoToDefinition<CR>', 'Go to definition'],
                \ ["nmap", ['d', 'D'], ':vsp<CR>:LYRDGoToDefinition<CR>', 'Go to definition (v-split],'],
                \ ['nmap', ['d', 'p', 'd'], ':LYRDPreviewDefinitions<CR>', 'Preview definitions'],
                \ ['nmap', ['d', 'p', 'i'], ':LYRDPreviewImplementations<CR>', 'Preview implementations'],
                \ ['nmap', ['D', 's'], ':LYRDDebugStart<CR>', 'Debug start'],
                \ ['nmap', ['D', 'b'], ':LYRDDebugBreakpoint<CR>', 'Toggle breakpoint'],
                \ ['nmap', ['T', '.'], ':LYRDTest<CR>', 'Run project tests'],
                \ ['nmap', ['T', 's'], ':LYRDTestSuite<CR>', 'Run suite tests'],
                \ ['nmap', ['T', 'f'], ':LYRDTestFile<CR>', 'Run file tests'],
                \ ['nmap', ['T', 'n'], ':LYRDTestFunc<CR>', 'Run nearest function test'],
                \ ['nmap', ['T', 'l'], ':LYRDTestLast<CR>', 'Run last tests'],
                \ ['nmap', ['T', 'c'], ':LYRDTestCoverage<CR>', 'Toggle test coverage'],
                \ ["nmap", ['a', 'q'], ':LYRDQuickFix<CR>', 'Quick fix'],
                \ ['nmap', ['a', 'f'], ':LYRDCodeFormat<CR>', 'Code format'],
                \ ['nmap', ['a', 'i'], ':LYRDFixImports<CR>', 'Fix imports/using'],
                \ ['nmap', ['a', 'a'], ':LYRDViewCodeActions<CR>', 'View code actions'],
                \ ["nmap", ['G', 'd'], ':LYRDGoToDefinition<CR>', 'Go to definition'],
                \ ["nmap", ['G', 'D'], ':vsp<CR>:LYRDGoToDefinition<CR>', 'Go to definition (v-split],'],
                \ ["nmap", ['G', 't'], ':LYRDGoToTypeDefinition<CR>', 'Go to type definition'],
                \ ["nmap", ['G', 'i'], ':LYRDFindImplementations<CR>', 'Go to implementation'],
                \ ["nmap", ['G', 'r'], ':LYRDFindUsages<CR>', 'Go to references'],
                \])

    call LYRD#layers#mappings#leader([
                \ ["nmap", ['t'], ':LYRDTest<CR>', 'Run tests'],
                \ ['nmap', ['r','n'], ':LYRDRenameSymbol<CR>', 'Rename'],
                \ ['nmap', ['r','b'], ':LYRDBuild<CR>', 'Run Build command'],
                \])

    nnoremap <silent> K :LYRDViewDocumentation<CR>
    map gd :LYRDGoToDefinition<CR>
    nmap <F5> :LYRDDebugStart<CR>
    nmap <F9> :LYRDDebugBreakpoint<CR>


endfunction

function! LYRD#layers#dev#complete() abort

endfunction

function! LYRD#layers#dev#add_linters(lang, linters)
    :call extend(g:ale_linters, { lang: linters, })

endfunction

function! s:AleSettings()
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

