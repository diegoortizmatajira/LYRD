
function! LYRD#layers#filetree#plugins() abort
    call LYRD#setup#plugins({
                \ 'kyazdani42/nvim-web-devicons': '',
                \ 'kyazdani42/nvim-tree.lua': '',
                \    })

endfunction

function! LYRD#layers#filetree#settings() abort

    call LYRD#layers#commands#register_implementations("*", {
                \ "LYRDViewFileTree": ":LuaTreeToggle",
                \ "LYRDViewFileExplorer": ":LuaTreeToggle",
                \ })

    let g:lua_tree_side = 'right'
    let g:lua_tree_width = 60
    let g:lua_tree_auto_close = 1
    let g:lua_tree_quit_on_open = 1
    let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache', 'bin', 'obj' ]
    let g:lua_tree_icons = {
                \ 'default': '',
                \ 'symlink': '',
                \ 'git': {
                \   'unstaged': "✗",
                \   'staged': "✓",
                \   'unmerged': "",
                \   'renamed': "➜",
                \   'untracked': "★"
                \   },
                \ 'folder': {
                \   'default': "",
                \   'open': "",
                \   'symlink': "",
                \   }
                \ }
endfunction

function! LYRD#layers#filetree#keybindings() abort

endfunction

function! LYRD#layers#filetree#complete() abort

endfunction

function! LYRD#layers#filetree#support()

endfunction
