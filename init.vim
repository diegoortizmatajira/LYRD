let s:root = '$HOME/.config/nvim/LYRD/'

execute 'so '.s:root.'general.vim'
execute 'so '.s:root.'setup.vim'

call LYRD#setup#load(s:root, [
            \ 'mappings', 
            \ 'commands', 
            \ 'core', 
            \ 'motions',
            \ 'git',
            \ 'coc',
            \ 'fzf',
            \ 'dev',
            \ 'debug',
            \ 'wiki',
            \ 'ui',
            \])
