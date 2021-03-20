
function! LYRD#layers#lang#csharp#plugins() abort
    call LYRD#setup#plugins({
                \ 'OmniSharp/omnisharp-vim': '',
                \ 'nickspoons/vim-sharpenup': '',
                \ 'adamclerk/vim-razor': '',
                \ })

endfunction

function! LYRD#layers#lang#csharp#settings() abort
    call LYRD#layers#commands#register_implementations('cs',{
                \ 'LYRDTestFile': ':OmniSharpRunTestsInFile',
                \ 'LYRDTestFunc': ':OmniSharpRunTest',
                \ 'LYRDViewDocumentation': ':OmniSharpDocumentation',
                \ 'LYRDFixImports': ':OmniSharpFixUsings',
                \ 'LYRDGlobalCodecheck': ':OmniSharpGlobalCodeCheck',
                \ 'LYRDPreviewDefinitions': ':OmniSharpPreviewDefinition',
                \ 'LYRDPreviewImplementations': ':OmniSharpPreviewImplementation',
                \ 'LYRDTypeLookup': ':OmniSharpTypeLookup',
                \ 'LYRDViewCodeActions': ':OmniSharpGetCodeActions',
                \ 'LYRDCodeFormat': ':OmniSharpCodeFormat',
                \})

    call LYRD#layers#linters#add('cs', ['OmniSharp'])
    call LYRD#layers#coc#add_extensions(['coc-omnisharp'])

endfunction

function! LYRD#layers#lang#csharp#keybindings() abort
    call LYRD#layers#mappings#spacemenu([
                \ [['p', '#'], 'C#'],
                \])
    call LYRD#layers#mappings#space([
                \ ['nmap', ['p', '#', 'l'], ':OmniSharpOpenLog<CR>', 'Open Log'],
                \ ['nmap', ['p', '#', 'R'], ':OmniSharpRestartServer<CR>', 'Restart OmniSharp server'],
                \ ['nmap', ['p', '#', 's'], ':OmniSharpStatus<CR>', 'OmniSharp status'],
                \ ['nmap', ['p', '#', 'S'], ':OmniSharpStartServer<CR>', 'Start OmniSharp server'],
                \ ['nmap', ['p', '#', 'X'], ':OmniSharpStopServer<CR>', 'Stop OmniSharp server'],
                \ ['nmap', ['p', '#', 'i'], ':OmniSharpInstall<CR>', 'Install OmniSharp'],
                \])


endfunction

function! LYRD#layers#lang#csharp#complete() abort

endfunction

function! LYRD#layers#lang#csharp#support()

endfunction
