
function! LYRD#layers#telescope#plugins() abort
    call LYRD#setup#plugins({
                \ 'nvim-lua/popup.nvim': '',
                \ 'nvim-lua/plenary.nvim': '',
                \ 'nvim-telescope/telescope.nvim': '',
                \})

endfunction

function! LYRD#layers#telescope#settings() abort

endfunction

function! LYRD#layers#telescope#keybindings() abort

    nnoremap <C-p> :Telescope find_files<CR>

    call LYRD#layers#mappings#space([
                \ ["nmap", ['b', '/'], ':Telescope buffers<CR>', 'Buffer list' ],
                \ ["noremap", ['f', '.'], ':Telescope find_files<CR>', 'Find files' ],
                \ ["noremap", ['s', '.'], ':Telescope find_files<CR>', 'Files' ],
                \ ["noremap", ['s', 'b'], ':Telescope buffers<CR>', 'Buffers' ],
                \ ["noremap", ['s', 'g'], ':Telescope git_files<CR>', 'Git Files' ],
                \ ["noremap", ['s', 'h'], ':Telescope old_files<CR>', 'Recent files' ],
                \ ["noremap", ['s', 'l'], ':Telescope current_buffer_fuzzy_lines<CR>', 'Lines' ],
                \ ["noremap", ['s', 'c'], ':Telescope command_history<CR>', 'Recent comands' ],
                \ ["noremap", ['s', 'm'], ':Telescope keymaps<CR>', 'Key Maps' ],
                \ ["noremap", ['s', 't'], ':Telescope current_buffer_tags<CR>', 'Tags' ],
                \ ["noremap", ['s', 'a'], ':Telescope live_grep<CR>', 'Live grep' ],
                \ ["noremap", ['s', 'f'], ':Telescope filetypes<CR>', 'Filetypes' ],
                \ ["noremap", ['s', 'o'], ':Telescope colorscheme<CR>', 'Color Schemes' ],
                \ ["noremap", ['s', 'q'], ':Telescope quickfix<CR>', 'Quick Fixes' ],
                \ ["noremap", ['s', 'r'], ':Telescope registers<CR>', 'Quick Fixes' ],
                \ ["noremap", ['s', 'H'], ':Telescope highlights<CR>', 'Highlights' ],
                \ ["noremap", ['s', ','], ':Telescope commands<CR>', 'Commands' ],
                \ ["noremap", ['G', 'm'], ':Telescope git_status<CR>', 'View modified files' ],
                \ ["noremap", ['g', 'B'], ':Telescope git_branches<CR>', 'Branches' ],
                \])

    call LYRD#layers#mappings#leader([
                \ ["noremap", ['b'], ':Telescope buffers<CR>', 'Buffer list' ],
                \])

endfunction

function! LYRD#layers#telescope#complete() abort

endfunction

function! LYRD#layers#telescope#support()

endfunction
