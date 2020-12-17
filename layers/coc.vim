
function! LYRD#layers#coc#plugins() abort
    call LYRD#setup#plugins({
                \    'neoclide/coc.nvim': {'branch': 'release'},
                \    })

endfunction

function! LYRD#layers#coc#settings() abort
    let g:coc_config_home = "~/.config/nvim/nvim-settings/"
    let g:coc_global_extensions = []

    call extend(g:coc_global_extensions, [
                \ "coc-explorer",
                \ "coc-yank"])

    " Removes CoC Explorer if it is the last buffer
    autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

endfunction

function! LYRD#layers#coc#keybindings() abort
    nnoremap <silent> <F2> :CocCommand explorer --position floating<CR>

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


endfunction

function! LYRD#layers#coc#complete() abort

endfunction

function! LYRD#layers#coc#support()

endfunction
