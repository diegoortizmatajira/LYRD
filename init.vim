let s:root = '$HOME/.config/nvim/LYRD/'

execute 'so '.s:root.'general.vim'
execute 'so '.s:root.'setup.vim'

call LYRD#setup#load(s:root, [
            \ 'mappings',
            \ 'commands',
            \ 'core',
            \ 'motions',
            \ 'fzf',
            \ 'git',
            \ 'dev',
            \ 'linters',
            \ 'debug',
            \ 'coc',
            \ 'filetree',
            \ 'wiki',
            \ 'ui',
            \ 'lang#go',
            \ 'lang#csharp',
            \ 'lang#vim',
            \])
