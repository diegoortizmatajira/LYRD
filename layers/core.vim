
function! LYRD#layers#core#plugins() abort
    call LYRD#setup#plugins({
                \    'Shougo/vimproc.vim': {'do': 'make'},
                \    'Raimondi/delimitMate': '',
                \    'tpope/vim-commentary': '',
                \    'tpope/vim-surround': '',
                \    'vimwiki/vimwiki': '',
                \    })

endfunction

function! LYRD#layers#core#settings() abort
    call LYRD#layers#commands#register_commands({
                \ "CMDUno": ":echo 'hola'",
                \})
endfunction

function! LYRD#layers#core#keybindings() abort
    "" Standard Commands
    nmap <C-s> :w<CR>
    imap <C-s> <Esc>:w<CR>
    imap <Leader>s <Esc>:w<CR>
    "" Switching windows
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l
    noremap <C-h> <C-w>h
    "*****************************************************************************
    "" Abbreviations
    "*****************************************************************************
    "" no one is really happy until you have this shortcuts
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qall qall

    call LYRD#layers#mappings#space([
                \ [ 'nmap', ['x'], ':CMDUno<CR>', 'Prueba'],
                \ [ 'nmap', ['y'], ':CMDUno<CR>', 'Prueba 2'],
                \ ])

endfunction

function! LYRD#layers#core#complete() abort

endfunction

