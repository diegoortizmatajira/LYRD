
function! LYRD#layers#coc#plugins() abort
    call LYRD#setup#plugins({
                \ 'neoclide/coc.nvim': {'branch': 'release'},
                \})

endfunction

function! LYRD#layers#coc#settings() abort
    let g:coc_config_home = "~/.config/nvim/LYRD/"
    let g:coc_global_extensions = []

    call LYRD#layers#coc#add_extensions([
                \ "coc-snippets",
                \ "coc-actions",
                \ "coc-vetur",
                \ "coc-yank",
                \])

    call LYRD#layers#commands#register_implementations("*", {
                \ "LYRDViewYankList": ":CocList -A --normal yank",
                \ "LYRDFindUsages": ':call CocActionAsync("jumpReferences")',
                \ "LYRDFindImplementations": ':call CocActionAsync("jumpImplementation")',
                \ "LYRDRefactorSymbol": ':call CocActionAsync("refactor")',
                \ "LYRDViewDocumentation": ':call LYRD#layers#coc#show_documentation()',
                \ "LYRDFindSymbol": ':CocList -I symbols',
                \ "LYRDFixImports": ':call CocActionAsync("organizeImport")',
                \ "LYRDGlobalCodecheck": ':call CocActionAsync("quickfixes")',
                \ "LYRDRenameSymbol": ':call CocActionAsync("rename")',
                \ "LYRDGoToDefinition": ':call CocActionAsync("jumpDefinition")',
                \ "LYRDGoToTypeDefinition": ':call CocActionAsync("jumpTypeDefinition")',
                \ "LYRDQuickFix": ':call CocActionAsync("doQuickfix")',
                \ })

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

endfunction

function! LYRD#layers#coc#keybindings() abort

    call LYRD#layers#mappings#spacemenu([
                \ [['p', 'c'], 'Coc'],
                \ ])

    call LYRD#layers#mappings#space([
                \ ["nmap", ['p', 'c', 'c'], ':CocConfig<CR>', 'Coc Config file'],
                \ ["nmap", ['p', 'c', 'u'], ':CocUpdate<CR>', 'Update coc extensions'],
                \ ["nmap", ['p', 'c', 'l'], ':CocOpenLog<CR>', 'View coc Log'],
                \ ["nmap", ['p', 'c', 'i'], ':CocInfo<CR>', 'Coc info'],
                \ ["nmap", ['p', 'c', 'e'], ':<C-u>CocList extensions<CR>', 'Coc Extensions'],
                \ ["nmap", ['v', 'j'], ':<C-u>CocNext<CR>', 'Next item'],
                \ ["nmap", ['v', 'k'], ':<C-u>CocPrev<CR>', 'Previous item'],
                \ ["nmap", ['v', 'p'], ':<C-u>CocListResume<CR>', 'Resume list'],
                \ ["nmap", ['v', 'd'], ':<C-u>CocList diagnostics<CR>', 'Diagnostics'],
                \ ["nmap", ['v', 'o'], ':<C-u>CocList outline<CR>', 'Outline'],
                \ ["nmap", ['v', 's'], ':<C-u>CocList -I symbols<CR>', 'Symbols'],
                \ ["nmap", ['a', '.'], ':CocAction<CR>', 'Action list'],
                \ ["nmap", ['a', 's'], '<Plug>(coc-codeaction-selected', 'Code action on selection'],
                \ ["nmap", ['a', 'b'], '<Plug>(coc-codeaction', 'Code action on line'],
                \])

    call LYRD#layers#mappings#leader([
                \ ['vmap', ['a'], '<Plug>(coc-codeaction-selected)', 'Code Action for selection'],
                \ ['nmap', ['a'], '<Plug>(coc-codeaction-selected)', 'Code Action for selection'],
                \])

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Coc Snippets

    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<tab>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<S-tab>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)

    " Use <leader>x for convert visual selected code to snippet
    xmap <leader>x  <Plug>(coc-convert-snippet)

endfunction

function! LYRD#layers#coc#complete() abort

endfunction

function! LYRD#layers#coc#show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocActionAsync('doHover')
    endif
endfunction


function! LYRD#layers#coc#add_extensions(extensions)
    call extend(g:coc_global_extensions, a:extensions)

endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

