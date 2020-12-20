let g:LYRD_Settings = {}

" -----------------------------------------------------------------
" VIMPLUG
" -----------------------------------------------------------------

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    let g:not_finish_vimplug = "yes"

    autocmd VimEnter * PlugInstall
endif

function! LYRD#setup#load(root, layers)
    let g:LYRD_Settings.root = a:root
    let g:LYRD_Settings.plugins = {}
    let g:LYRD_Settings.layers = a:layers
    call s:load_layers()
    call s:load_plugins()
    call s:load_settings()
    call s:load_complete()
endfunction

function! LYRD#setup#plugins(plugins)
    for plugin in items(a:plugins)
        let plugin_name = tolower(plugin[0])
        let g:LYRD_Settings.plugins[plugin_name] = plugin[1]
    endfor
endfunction

function! s:load_layers()
    for layer in g:LYRD_Settings.layers
        let layer_path = join(split(layer, '#'), '/')
        execute 'so '.g:LYRD_Settings.root.'layers/'.layer_path.'.vim'
    endfor
endfunction

function! s:load_plugins()
    for layer in g:LYRD_Settings.layers
        execute 'call LYRD#layers#'.layer.'#plugins()'
    endfor

    call plug#begin(expand('~/.config/nvim/plugged'))

    for plugin in items(g:LYRD_Settings.plugins)
        if type(plugin[1]) == 4
            Plug plugin[0], plugin[1]
        else
            Plug plugin[0]
        endif
    endfor

    call plug#end()

endfunction

function! s:load_settings()
    for layer in g:LYRD_Settings.layers
        execute 'call LYRD#layers#'.layer.'#settings()'
        execute 'call LYRD#layers#'.layer.'#keybindings()'
    endfor
endfunction

function! s:load_complete()
    for layer in g:LYRD_Settings.layers
        execute 'call LYRD#layers#'.layer.'#complete()'
    endfor
endfunction

