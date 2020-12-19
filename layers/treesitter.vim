
function! LYRD#layers#treesitter#plugins() abort
  call LYRD#setup#plugins({
        \ 'nvim-treesitter/nvim-treesitter': {'do': ':TSUpdate'} ,
        \ 'nvim-treesitter/playground': '',
        \    })

endfunction

function! LYRD#layers#treesitter#settings() abort
  " Settings
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },
}
EOF

endfunction

function! LYRD#layers#treesitter#keybindings() abort
  call LYRD#layers#mappings#space([
        \ [ "nmap", ['v', 't'], ':TSPlaygroundToggle<CR>', 'Treesitter Playground'],
        \])

endfunction

function! LYRD#layers#treesitter#complete() abort

endfunction

function! LYRD#layers#treesitter#support()

endfunction
