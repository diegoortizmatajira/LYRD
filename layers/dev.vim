
function! LYRD#layers#dev#plugins() abort
    call LYRD#setup#plugins({
                \ 'honza/vim-snippets': '',
                \ 'Raimondi/delimitMate': '',
                \ 'tpope/vim-commentary': '',
                \ 'sheerun/vim-polyglot': '',
                \ 'Chiel92/vim-autoformat': '',
                \ 'kkoomen/vim-doge': '',
                \})

endfunction

function! LYRD#layers#dev#settings() abort

    call LYRD#layers#commands#register_commands({
                \ "LYRDTest": '',
                \ "LYRDTestSuite": '',
                \ "LYRDTestFile": '',
                \ "LYRDTestFunc": '',
                \ "LYRDTestLast": '',
                \ "LYRDBuild": '',
                \ "LYRDRun": '',
                \ "LYRDTestCoverage": '',
                \ "LYRDDebugStart": '',
                \ "LYRDDebugBreakpoint": '',
                \ "LYRDAlternateFile": '',
                \ "LYRDFindUsages": '',
                \ "LYRDFindImplementations": '',
                \ "LYRDRefactorSymbol": '',
                \ "LYRDPreviewDefinitions": '',
                \ "LYRDPreviewImplementations": '',
                \ "LYRDTypeLookup": '',
                \ "LYRDViewDocumentation": '',
                \ "LYRDFindSymbol": '',
                \ "LYRDFixImports": '',
                \ "LYRDGlobalCodecheck": '',
                \ "LYRDViewCodeActions": '',
                \ "LYRDCodeFormat": ':Autoformat',
                \ "LYRDRenameSymbol": '',
                \ "LYRDGoToDefinition": '',
                \ "LYRDGoToTypeDefinition": '',
                \ "LYRDQuickFix": ':cope',
                \ "LYRDImplementInterface": '',
                \ "LYRDFillStructure": '',
                \})

endfunction

function! LYRD#layers#dev#keybindings() abort

    call LYRD#layers#mappings#spacemenu([
                \ [['t'], 'Tests'],
                \ [['d'], 'Development'],
                \ [['d', 'p'], 'Preview'],
                \ [['d', 'l'], 'Language'],
                \ [['G'], 'Go to'],
                \ ])

    call LYRD#layers#mappings#space([
                \ ["nmap", ['b', 'f'], ':LYRDCodeFormat<CR>', 'Format Buffer'],
                \ ["nmap", ['d', 'h'], ':LYRDViewDocumentation<CR>', 'Hint Documentation'],
                \ ['nmap', ['d', 'b'], ':LYRDBuild<CR>', 'Build'],
                \ ['nmap', ['d', 'x'], ':LYRDRun<CR>', 'Run'],
                \ ['nmap', ['d', 'a'], ':LYRDAlternateFile<CR>', 'Toggle to alterate file'],
                \ ['nmap', ['d', 'u'], ':LYRDFindUsages<CR>', 'Find usages'],
                \ ['nmap', ['d', 'i'], ':LYRDFindImplementations<CR>', 'Find implementations'],
                \ ['nmap', ['d', 'I'], ':LYRDImplementInterface<CR>', 'Implement interface'],
                \ ['nmap', ['d', 'l'], ':LYRDTypeLookup<CR>', 'Type lookup'],
                \ ['nmap', ['d', 's'], ':LYRDFindSymbol<CR>', 'Find symbols'],
                \ ['nmap', ['d', 'c'], ':LYRDGlobalCodecheck<CR>', 'Global code check'],
                \ ['nmap', ['d', 'r'], ':LYRDRenameSymbol<CR>', 'Rename'],
                \ ['nmap', ['d', 'R'], ':LYRDRefactorSymbol<CR>', 'Refactor'],
                \ ["nmap", ['d', 'd'], ':LYRDGoToDefinition<CR>', 'Go to definition'],
                \ ["nmap", ['d', 'D'], ':vsp<CR>:LYRDGoToDefinition<CR>', 'Go to definition (v-split],'],
                \ ['nmap', ['d', 'p', 'd'], ':LYRDPreviewDefinitions<CR>', 'Preview definitions'],
                \ ['nmap', ['d', 'p', 'i'], ':LYRDPreviewImplementations<CR>', 'Preview implementations'],
                \ ['nmap', ['d', 'l', 'i'], ':LYRDImplementInterface<CR>', 'Implement interface' ],
                \ ['nmap', ['d', 'l', 's'], ':LYRDFillStructure<CR>', 'Fill structure' ],
                \ ['nmap', ['d', 'X'], ':LYRDDebugStart<CR>', 'Debug start'],
                \ ['nmap', ['d', '.'], ':LYRDDebugBreakpoint<CR>', 'Toggle breakpoint'],
                \ ['nmap', ['t', '.'], ':LYRDTest<CR>', 'Run project tests'],
                \ ['nmap', ['t', 's'], ':LYRDTestSuite<CR>', 'Run suite tests'],
                \ ['nmap', ['t', 'f'], ':LYRDTestFile<CR>', 'Run file tests'],
                \ ['nmap', ['t', 'n'], ':LYRDTestFunc<CR>', 'Run nearest function test'],
                \ ['nmap', ['t', 'l'], ':LYRDTestLast<CR>', 'Run last tests'],
                \ ['nmap', ['t', 'c'], ':LYRDTestCoverage<CR>', 'Toggle test coverage'],
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
    map gt :LYRDGoToTypeDefinition<CR>
    nmap <F5> :LYRDDebugStart<CR>
    nmap <F9> :LYRDDebugBreakpoint<CR>

endfunction

function! LYRD#layers#dev#complete() abort

endfunction


