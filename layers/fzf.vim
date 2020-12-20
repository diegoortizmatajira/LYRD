
function! LYRD#layers#fzf#plugins() abort
    call LYRD#setup#plugins({
                \ 'junegunn/fzf': { 'dir': '~/.fzf', 'do': './install --bin' },
                \ 'junegunn/fzf.vim': '',
                \})

endfunction

function! LYRD#layers#fzf#settings() abort
    let g:fzf_layout = { 'down': '~40%' }

    set wildmode=list:longest,list:full
    set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
    let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

    "******* The Silver Searcher *********

    if executable('ag')
        let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
        set grepprg=ag\ --nogroup\ --nocolor
    endif

    "****** ripgrep ********

    if executable('rg')
        let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
        set grepprg=rg\ --vimgrep
        command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
    endif

endfunction

function! LYRD#layers#fzf#keybindings() abort

    " fzf file fuzzy search that respects .gitignore
    " If in git directory, show only files that are committed, staged, or unstaged
    " else use regular :Files
    nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

    call LYRD#layers#mappings#space([
                \ ["nmap", ['b', '/'], ':Buffers<CR>', 'Buffer list' ],
                \ ["noremap", ['f', '.'], ':Files<CR>', 'Find files' ],
                \ ["noremap", ['s', '.'], ':Files<CR>', 'Files' ],
                \ ["noremap", ['s', 'b'], ':Buffers<CR>', 'Buffers' ],
                \ ["noremap", ['s', 'g'], ':GFiles<CR>', 'Git Files' ],
                \ ["noremap", ['s', 'h'], ':History<CR>', 'Recent files' ],
                \ ["noremap", ['s', 'c'], ':History:<CR>', 'Recent comands' ],
                \ ["noremap", ['s', 'm'], ':Maps<CR>', 'Key Maps' ],
                \ ["noremap", ['s', 'l'], ':BLines<CR>', 'Lines' ],
                \ ["noremap", ['s', 't'], ':BTags<CR>', 'Tags' ],
                \ ["noremap", ['s', 'a'], ':Ag<CR>', 'The Silver Searcher' ],
                \ ["noremap", ['s', 'r'], ':Rg<CR>', 'Ripgrep' ],
                \ ["noremap", ['s', 'f'], ':Filetypes<CR>', 'Filetypes' ],
                \ ["noremap", ['s', 'o'], ':Colors<CR>', 'Color Schemes' ],
                \ ["noremap", ['s', 'w'], ':Windows<CR>', 'Windows' ],
                \ ["noremap", ['s', 's'], ':Snippets<CR>', 'Snippets' ],
                \ ["noremap", ['s', ','], ':Commands<CR>', 'Commands' ],
                \ ["noremap", ['G', 'm'], ':GFiles?<CR>', 'View modified files' ],
                \])

    call LYRD#layers#mappings#leader([
                \ ["noremap", ['b'], ':Buffers<CR>', 'Buffer list' ],
                \])

endfunction

function! LYRD#layers#fzf#complete() abort

endfunction

function! LYRD#layers#fzf#support()

endfunction
