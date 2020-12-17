let s:root = '$HOME/.config/nvim/LYRD/'

execute 'so '.s:root.'setup.vim'

call LYRD#setup#load(s:root, ['general', 'core', 'mappings', 'commands', 'motions'])
