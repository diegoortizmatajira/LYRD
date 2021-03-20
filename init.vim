let s:root = '$HOME/.config/nvim/LYRD/'

execute 'so '.s:root.'general.vim'
execute 'so '.s:root.'setup.vim'

let layers = [
                        \ 'mappings',
                        \ 'commands',
                        \ 'core',
                        \ 'motions',
                        \ 'fzf',
                        \ 'git',
                        \ 'dev',
                        \ 'filetree',
                        \ 'wiki',
                        \ 'ui',
                        \]

if $VIMASIDE == 'true'
        let layers = [ 
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
                                \]
        echo "Using Neovim as an IDE"
endif
call LYRD#setup#load(s:root, layers)

