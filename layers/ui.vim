
function! LYRD#layers#ui#plugins() abort

    call LYRD#setup#plugins({
                \ 'vim-airline/vim-airline': '',
                \ 'vim-airline/vim-airline-themes': '',
                \ 'tomasr/molokai': '',
                \ 'gruvbox-community/gruvbox': '',
                \ 'jacoborus/tender.vim': '',
                \ 'mhinz/vim-startify': '',
                \ 'junegunn/vim-peekaboo': '',
                \ 'takac/vim-hardtime': '',
                \ 'ryanoasis/vim-devicons': '',
                \})
endfunction

function! LYRD#layers#ui#settings() abort
    call s:airlineSetup()
    call s:deviconsSetup()
    call s:startifySetup()

    let g:hardtime_default_on = 0

    " Highlight the yanked text
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
    augroup END

    " Set the default theme
    colorscheme gruvbox

    set background=dark

endfunction

function! LYRD#layers#ui#keybindings() abort
    call LYRD#layers#mappings#space([
                \ ["noremap", ['b', '.'], ':Startify<CR>', 'Homepage' ],
                \ ["noremap", ['A', '.'], ':Startify<CR>', 'Homepage' ],
                \ ["nmap", ['u', 'h'], ':HardTimeToggle<CR>', 'Toggle HardTime key mode' ],
                \])
endfunction

function! LYRD#layers#ui#complete() abort

endfunction

function! LYRD#layers#ui#support()

endfunction


"########################################################################
" Airline Setup
"########################################################################
function! s:airlineSetup()
    " vim-airline
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#ale#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tagbar#enabled = 1
    let g:airline_skip_empty_sections = 1

    " vim-airline
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    if !exists('g:airline_powerline_fonts')
        let g:airline#extensions#tabline#left_sep = ''
        let g:airline#extensions#tabline#left_alt_sep = '|'
        let g:airline_left_sep          = ''
        let g:airline_left_alt_sep      = '»'
        let g:airline_right_sep         = ''
        let g:airline_right_alt_sep     = '«'
        let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
        let g:airline#extensions#readonly#symbol   = '⊘'
        let g:airline#extensions#linecolumn#prefix = '¶'
        let g:airline#extensions#paste#symbol      = 'ρ'
        let g:airline_symbols.linenr    = '␊'
        let g:airline_symbols.branch    = '⎇'
        let g:airline_symbols.paste     = 'ρ'
        let g:airline_symbols.paste     = 'Þ'
        let g:airline_symbols.paste     = '∥'
        let g:airline_symbols.whitespace = 'Ξ'
    else
        let g:airline#extensions#tabline#left_sep = ''
        let g:airline#extensions#tabline#left_alt_sep = ''

        " powerline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ''
    endif

endfunction

"########################################################################
" DevIcons Setup
"########################################################################
function! s:deviconsSetup()
    let g:webdevicons_enable = 1
    let g:webdevicons_enable_nerdtree = 1
    let g:webdevicons_enable_unite = 1
    let g:webdevicons_enable_vimfiler = 1
    let g:webdevicons_enable_airline_tabline = 1
    let g:webdevicons_enable_airline_statusline = 1
    let g:webdevicons_enable_ctrlp = 1
    let g:webdevicons_enable_flagship_statusline = 1
    let g:WebDevIconsUnicodeDecorateFileNodes = 1
    let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
    let g:webdevicons_conceal_nerdtree_brackets = 1
    let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
    let g:webdevicons_enable_denite = 1
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:DevIconsEnableFoldersOpenClose = 1
    let g:DevIconsEnableFolderPatternMatching = 1
    let g:DevIconsEnableFolderExtensionPatternMatching = 1
    let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
endfunction

"########################################################################
" Startify Setup
"########################################################################
function! s:startifySetup()
    " Startify settings
    let g:startify_session_dir = '~/.config/nvim/session'
    let g:startify_lists = [
                \ { 'type': 'sessions',  'header': ['   Sessions']       },
                \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
                \ { 'type': 'files',     'header': ['   Files']            },
                \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                \ ]
    let g:startify_session_autoload = 1
    let g:startify_session_delete_buffers = 1
    let g:startify_custom_header = [
                \ '   ___       __    ______                            ',
                \ '   __ |     / /_______  /__________________ ________ ',
                \ '   __ | /| / /_  _ \_  /_  ___/  __ \_  __ `__ \  _ \',
                \ '   __ |/ |/ / /  __/  / / /__ / /_/ /  / / / / /  __/',
                \ '   ____/|__/  \___//_/  \___/ \____//_/ /_/ /_/\___/ ',
                \]
    let g:startify_change_to_dir = 0
    let g:startify_change_to_vcs_root = 0
endfunction


