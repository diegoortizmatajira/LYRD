
function! LYRD#layers#git#plugins() abort
    call LYRD#setup#plugins({
                \ 'tpope/vim-fugitive': '',
                \ 'tpope/vim-rhubarb': '',
                \ 'shumphrey/fugitive-gitlab.vim': '',
                \ 'airblade/vim-gitgutter': '',
                \ 'tpope/vim-dispatch': '',
                \})

endfunction

function! LYRD#layers#git#settings() abort
    let g:gitgutter_map_keys = 0

endfunction

function! LYRD#layers#git#keybindings() abort

    call LYRD#layers#mappings#spacemenu([
                \ [ ['g','f'], 'Gitflow' ],
                \])

    call LYRD#layers#mappings#space([
                \ ["noremap", ['g', 's'], ':Git<CR>', 'Status' ],
                \ ["noremap", ['g', 'S'], ':Git add %<CR>', 'Stage current file' ],
                \ ["noremap", ['g', 'U'], ':Git reset -q %<CR>', 'Unstage current file' ],
                \ ["noremap", ['g', 'c'], ':Git commit<CR>', 'Commit changes' ],
                \ ["noremap", ['g', 'a'], ':Gwrite<CR>', 'Write' ],
                \ ["noremap", ['g', 'p'], ':Git push<CR>', 'Push' ],
                \ ["noremap", ['g', 'P'], ':Git pull<CR>', 'Pull' ],
                \ ["noremap", ['g', 'd'], ':Gvdiffsplit<CR>', 'View diff' ],
                \ ["noremap", ['g', 'A'], ':Git add .<CR>', 'Stage all' ],
                \ ["noremap", ['g', 'b'], ':Git_blame<CR>', 'View blame' ],
                \ ["noremap", ['g', 'r'], ':GRemove<CR>', 'Remove' ],
                \ ["noremap", ['g', 'V'], ':Gclog -- %<CR>', 'Current file log' ],
                \ ["noremap", ['g', 'v'], ':Gclog --<CR>', 'File log' ],
                \ ["noremap", ['g', 'o'], ':.Gbrowse<CR>', 'Browse line on web' ],
                \ ["nmap", ['g', 'f', 'i'], ':Git flow init<CR>', 'Init' ],
                \ ["nmap", ['g', 'f', 'f'], ':Git flow feature start ', 'Feature start' ],
                \ ["nmap", ['g', 'f', 'F'], ':Git flow feature finish <C-R>=LYRD#layers#git#flowbranch()<CR>', 'Feature finish' ],
                \ ["nmap", ['g', 'f', 'r'], ':Git flow release start ', 'Release start' ],
                \ ["nmap", ['g', 'f', 'R'], ':Git flow release finish <C-R>=LYRD#layers#git#flowbranch()<CR>', 'Release finish' ],
                \ ["nmap", ['g', 'f', 'h'], ':Git flow hotfix start ', 'Hotfix start' ],
                \ ["nmap", ['g', 'f', 'H'], ':Git flow hotfix finish <C-R>=LYRD#layers#git#flowbranch()<CR>', 'Hotfix finish' ],
                \ ["nmap", ['g', 'f', 'D'], ':Git checkout develop', 'Checkout Develop branch' ],
                \ ["nmap", ['g', 'f', 'M'], ':Git checkout master', 'Checkout Master branch' ],
                \])

endfunction

function! LYRD#layers#git#complete() abort

endfunction

function! LYRD#layers#git#flowbranch()
    let parts = split(FugitiveHead(),'/')
    return parts[len(parts)-1]
endfunction

function! LYRD#layers#git#support()

endfunction
