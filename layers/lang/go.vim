
function! LYRD#layers#lang#go#plugins() abort
    call LYRD#setup#plugins({
                \ 'fatih/vim-go': {'do': ':GoUpdateBinaries'} ,
                \})

endfunction

function! LYRD#layers#lang#go#settings() abort
    call LYRD#layers#coc#add_extensions([
                \ "coc-go",
                \])

    let g:go_list_type = "quickfix"
    let g:go_fmt_command = "goimports"
    let g:go_fmt_fail_silently = 1
    let g:go_def_mapping_enabled = 0
    let g:go_doc_popup_window = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_space_tab_error = 0
    let g:go_highlight_array_whitespace_error = 0
    let g:go_highlight_trailing_whitespace_error = 0
    let g:go_highlight_extra_types = 1
    let g:go_debug_breakpoint_sign_text = '>'

endfunction

function! LYRD#layers#lang#go#keybindings() abort

endfunction

function! LYRD#layers#lang#go#complete() abort

endfunction

function! LYRD#layers#lang#go#support()

endfunction
