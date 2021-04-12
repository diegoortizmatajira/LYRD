let s:root = '$HOME/.config/nvim/LYRD/'

execute 'so '.s:root.'general.vim'
execute 'so '.s:root.'setup.vim'

let layers = [
                        \ 'mappings',
                        \ 'commands',
                        \ 'core',
                        \ 'motions',
                        \ 'telescope',
                        \ 'git',
                        \ 'dev',
                        \ 'filetree',
                        \ 'wiki',
                        \ 'ui',
                        \ 'jetbrains_keys',
                        \]

if $VIMASIDE == 'true'
        let layers = [
                                \ 'mappings',
                                \ 'commands',
                                \ 'core',
                                \ 'motions',
                                \ 'telescope',
                                \ 'git',
                                \ 'dev',
                                \ 'treesitter',
                                \ 'linters',
                                \ 'debug',
                                \ 'coc',
                                \ 'filetree',
                                \ 'wiki',
                                \ 'ui',
                                \ 'jetbrains_keys',
                                \ 'lang#go',
                                \ 'lang#csharp',
                                \ 'lang#vim',
                                \]
        echo "Using Neovim as an IDE"
endif
call LYRD#setup#load(s:root, layers)

