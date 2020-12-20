
function! LYRD#layers#core#plugins() abort
    call LYRD#setup#plugins({
                \    'Shougo/vimproc.vim': {'do': 'make'},
                \    'tpope/vim-surround': '',
                \    'vimwiki/vimwiki': '',
                \    })

endfunction

function! LYRD#layers#core#settings() abort
    call LYRD#layers#commands#register_commands({
                \ "LYRDViewFileTree": ":e .",
                \ "LYRDViewFileExplorer": ":e .",
                \ "LYRDViewErrorList": ":cope",
                \ "LYRDViewRegisters": ":registers",
                \ "LYRDViewYankList": "",
                \})
endfunction

function! LYRD#layers#core#keybindings() abort
    "" Standard Commands
    nmap <C-s> :w<CR>
    imap <C-s> <Esc>:w<CR>
    imap <Leader>s <Esc>:w<CR>
    nnoremap <silent> <F2> :LYRDViewFileExplorer<CR>
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


    call LYRD#layers#mappings#spacemenu([
                \ [['g'], 'Git Repository'],
                \ [['a'], 'Actions'],
                \ [['A'], 'Application'],
                \ [['b'], 'Buffers'],
                \ [['T'], 'Tabs'],
                \ [['f'], 'Files'],
                \ [['p'], 'Plugins'],
                \ [['q'], 'Quit'],
                \ [['s'], 'Search'],
                \ [['u'], 'User interface'],
                \ [['v'], 'View'],
                \ ])

    call LYRD#layers#mappings#space([
                \ ["nmap", ['v', 'l'], ':LYRDViewErrorList<CR>', 'List all errors'],
                \ ["nmap", ['v', 'r'], ':LYRDViewRegisters<CR>', 'Registers'],
                \ ["nmap", ['v', 'y'], ':LYRDViewYankList<CR>', 'Yank list'],
                \ ["nmap", ['<Tab>'], ':b#<CR>', 'Last buffer'],
                \ ["nmap", ['b', '>'], ':bn<CR>', 'Next buffer'],
                \ ["nmap", ['b', '<'], ':bp<CR>', 'Previous buffer'],
                \ ["nmap", ['b', 'd'], ':bd<CR>', 'Close buffer'],
                \ ["nmap", ['b', 'D'], ':bd!<CR>', 'Force close buffer'],
                \ ["nmap", ['b', 'x'], ':bufdo bd<CR>', 'Close all buffers'],
                \ ["nmap", ['b', 'X'], ':bufdo bd!<CR>', 'Force close all buffers'],
                \ ["nmap", ['b', 'h'], ':<C-u>split<CR>', 'Horizonal split'],
                \ ["nmap", ['b', 'v'], ':<C-u>vsplit<CR>', 'Vertical split'],
                \ ["nmap", ['b', 'w'], ':setl readonly!<CR>', 'Toggle read only mode'],
                \ ["nmap", ['b', 'Y'], ':normal! ggVG"+y``<CR>', 'Copy whole buffer to clipboard'],
                \ ["nmap", ['b', 'P'], ':normal! ggdG"+P<CR>', 'Paste clipboard to whole buffer'],
                \ ["nmap", ['b', 'n'], ':enew<CR>', 'New empty buffer'],
                \ ["nmap", ['T', 'n'], ':tabnew<CR>', 'New empty tab'],
                \ ["nmap", ['T', '>'], ':tabnext<CR>', 'Next tab'],
                \ ["nmap", ['T', '<'], ':tabprevious<CR>', 'Previous tab'],
                \ ["nmap", ['T', 'd'], ':tabclose<CR>', 'Close tab'],
                \ ["nmap", ['T', 'D'], ':tabclose!<CR>', 'Force close tab'],
                \ ["nmap", ['f', 's'], ':w<CR>', 'Save current file'],
                \ ["nmap", ['f', 'S'], ':wall<CR>', 'Save all files'],
                \ ["nmap", ['f', 't'], ':LYRDViewFileTree<CR>', 'Toggle file tree'],
                \ ["nmap", ['f', 'e'], ':LYRDViewFileExplorer<CR>', 'Explore files'],
                \ ["nmap", ['A', 'i'], ':PlugInstall<CR>', 'Install plugins'],
                \ ["nmap", ['A', 'u'], ':PlugUpdate<CR>', 'Update plugins'],
                \ ["nmap", ['A', 'c'], ':PlugClean<CR>', 'Clean plugins'],
                \ ["nmap", ['A', 'w'], ':VimwikiIndex<CR>', 'Wiki'],
                \ ["nmap", ['A', 't'], ':terminal<CR>', 'Terminal'],
                \ ["nmap", ['q', '.'], ':q<CR>', 'Close window'],
                \ ["nmap", ['q', 'q'], ':qa<CR>', 'Quit'],
                \ ["nmap", ['q', 'Q'], ':qa!<CR>', 'Force Quit'],
                \ ["nmap", ['a', 'u'], 'u', 'Undo'],
                \ ["nmap", ['a', 'r'], '<C-r>', 'Redo'],
                \ ["nmap", ['u', 'w'], ':setlocal wrap!<CR>', 'Toggle line wrap'],
                \ ])

    call LYRD#layers#mappings#leader([
                \ ["nnoremap", ['<Space>'], ':noh<CR>', 'Clear search highlights'],
                \ ["noremap", ['s'], ':w<CR>', 'Save buffer content'],
                \ ["noremap", ['z'], ':bp<CR>', 'Previous buffer'],
                \ ["noremap", ['x'], ':bn<CR>', 'Next buffer'],
                \ ["noremap", ['c'], ':bd<CR>', 'Close buffer'],
                \ ["noremap", ['q'], ':q<CR>', 'Close window'],
                \ ["noremap", ['h'], ':<C-u>split<CR>', 'Horizonal split'],
                \ ["noremap", ['v'], ':<C-u>vsplit<CR>', 'Vertical split'],
                \ ])

endfunction

function! LYRD#layers#core#complete() abort

endfunction

