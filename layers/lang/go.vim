
function! LYRD#layers#lang#go#plugins() abort
    call LYRD#setup#plugins({
                \ 'fatih/vim-go': {'do': ':GoUpdateBinaries'} ,
                \})

endfunction

function! LYRD#layers#lang#go#settings() abort
    call LYRD#layers#commands#register_implementations('go',{
                \ 'LYRDTest': ":GoTest ./...",
                \ 'LYRDTestSuite': ':GoTest ./...',
                \ 'LYRDTestFile': ':GoTest',
                \ 'LYRDTestFunc': ":GoTestFunc",
                \ 'LYRDTestLast': ':GoTest ./...',
                \ 'LYRDBuild': ":call LYRD#layers#lang#go#build_go_files()",
                \ "LYRDRun": ':GoRun',
                \ 'LYRDTestCoverage': ":GoCoverageToggle",
                \ 'LYRDDebugStart': ":GoDebugStart",
                \ 'LYRDDebugBreakpoint': ":GoDebugBreakpoint",
                \ 'LYRDAlternateFile': ":GoAlternate",
                \ 'LYRDCodeFormat': ":GoFmt",
                \ 'LYRDFixImports': ":GoImports",
                \ 'LYRDGlobalCodecheck': ":GoMetaLinter!",
                \ "LYRDImplementInterface": "GoImpl",
                \ "LYRDFillStructure": ':GoFillStruct',
                \})

    call LYRD#layers#linters#add("go", ['golint', 'go vet'])
    call LYRD#layers#coc#add_extensions(["coc-go"])

    let g:go_list_type = "quickfix"
    let g:go_fmt_command = "goimports"
    let g:go_fmt_fail_silently = 1
    let g:go_def_mapping_enabled = 0
    let g:go_doc_popup_window = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_space_tab_error = 0
    let g:go_highlight_array_whitespace_error = 0
    let g:go_highlight_trailing_whitespace_error = 0
    let g:go_highlight_extra_types = 1
    let g:go_debug_breakpoint_sign_text = '>'

    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
endfunction

function! LYRD#layers#lang#go#keybindings() abort
    call LYRD#layers#mappings#spacemenu([
                \ [['p', 'g'], 'Go'],
                \])
    call LYRD#layers#mappings#space([
                \ ['nmap', ['p', 'g', 'd'], ':GoDocBrowser<CR>', 'Open doc in browser'],
                \ ['nmap', ['p', 'g', 'p'], ':GoPlay<CR>', 'Open in ply.golang.org'],
                \ ['nmap', ['p', 'g', 'g'], ':GoGenerate<CR>', 'Run code generation'],
                \ ['nmap', ['p', 'g', 'i'], ':GoInfo<CR>', 'Information on Symbol'],
                \ ['nmap', ['p', 'g', 'I'], ':GoInstallBinaries<CR>', 'Install go tooling'],
                \ ['nmap', ['p', 'g', 'U'], ':GoUpdateBinaries<CR>', 'Update go tooling'],
                \ ['nmap', ['p', 'g', 'k'], ':GoKeyify<CR>', 'Keyify struct literal'],
                \ ['nmap', ['p', 'g', 's'], ':GoFillStruct<CR>', 'Fill a struct literal'],
                \ ['nmap', ['p', 'g', 'f'], ':GoDecls<CR>', 'Declarations in file'],
                \ ['nmap', ['p', 'g', 'F'], ':GoDeclsDir<CR>', 'Declarations in dir'],
                \])

endfunction

function! LYRD#layers#lang#go#complete() abort

endfunction

" run :GoBuild or :GoTestCompile based on the go file
function! LYRD#layers#lang#go#build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction


