
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


    call LYRD#layers#mappings#spacemenu([
                \ [['g'], 'Git Repository'],
                \ [['T'], 'Tests'],
                \ [['a'], 'Actions'],
                \ [['A'], 'Application'],
                \ [['b'], 'Buffers'],
                \ [['t'], 'Tabs'],
                \ [['d'], 'Development'],
                \ [['D'], 'Debug'],
                \ [['e'], 'Edit'],
                \ [['f'], 'Files'],
                \ [['f', 'c'], 'Config'],
                \ [['G'], 'Go to'],
                \ [['l'], 'Language specified'],
                \ [['q'], 'Quit'],
                \ [['s'], 'Search'],
                \ [['u'], 'User interface'],
                \ [['v'], 'View'],
                \ ])

    call LYRD#layers#mappings#space([
                \ ["nmap", ['f', 'c', 'c'], ':CocConfig', 'Open CoC Config'],
                \ ["nmap", ['v', 'l'], ':cope<CR>', 'List all errors'],
                \ ["nmap", ['v', 'r'], ':registers<CR>', 'Registers'],
                \ ["nmap", ['v', 'y'], ':<C-u>CocList -A --normal yank<CR>', 'Yank list'],
                \ ["nmap", ['v', 'j'], ':<C-u>CocNext<CR>', 'Next item'],
                \ ["nmap", ['v', 'k'], ':<C-u>CocPrev<CR>', 'Previous item'],
                \ ["nmap", ['v', 'p'], ':<C-u>CocListResume<CR>', 'Resume list'],
                \ ["nmap", ['v', 'e'], ':<C-u>CocList extensions<CR>', 'Extensions'],
                \ ["nmap", ['s', 'v'], ':<C-u>CocList vimcommands<CR>', 'Vim Commands'],
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
                \ ["nmap", ['t', 'n'], ':tabnew<CR>', 'New empty tab'],
                \ ["nmap", ['t', '>'], ':tabnext<CR>', 'Next tab'],
                \ ["nmap", ['t', '<'], ':tabprevious<CR>', 'Previous tab'],
                \ ["nmap", ['t', 'd'], ':tabclose<CR>', 'Close tab'],
                \ ["nmap", ['t', 'D'], ':tabclose!<CR>', 'Force close tab'],
                \ ["nmap", ['f', 's'], ':w<CR>', 'Save current file'],
                \ ["nmap", ['f', 'S'], ':wall<CR>', 'Save all files'],
                \ ["nmap", ['f', 't'], ':CocCommand explorer<CR>', 'Toggle file tree'],
                \ ["nmap", ['f', 'e'], ':CocCommand explorer --position floating<CR>', 'Explore files'],
                \ ["nmap", ['A', 'i'], ':PlugInstall<CR>', 'Install plugins'],
                \ ["nmap", ['A', 'u'], ':PlugUpdate<CR>', 'Update plugins'],
                \ ["nmap", ['A', 'c'], ':PlugClean<CR>', 'Clean plugins'],
                \ ["nmap", ['A', 'w'], ':VimwikiIndex<CR>', 'Wiki'],
                \ ["nmap", ['A', 't'], ':terminal<CR>', 'Terminal'],
                \ ["nmap", ['A', 't'], ':terminal<CR>', 'Terminal'],
                \ ["nmap", ['q', '.'], ':q<CR>', 'Close window'],
                \ ["nmap", ['q', 'q'], ':qa<CR>', 'Quit'],
                \ ["nmap", ['q', 'Q'], ':qa!<CR>', 'Force Quit'],
                \ ["nmap", ['e', 'u'], 'u', 'Undo'],
                \ ["nmap", ['e', 'r'], '<C-r>', 'Redo'],
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

