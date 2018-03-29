" Header {{{
" plugin:
"   Modular .vimrc
"
" desc.:
"   A plugin for loading directory specific .vimrc files
"
" }}}
" Save CPO {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}
" Default config options {{{
" taken from https://github.com/Shougo/neomru.vim/blob/master/autoload/neomru.vim
function! modularvimrc#set_default(var, val, ...)  
    if !exists(a:var)
        let alternate_var = get(a:000, 0, '')
        let {a:var} = exists(alternate_var) ? {alternate_var} : a:val
    endif
endfunction 

let s:defaults = {
            \ 'filename': '.vimrc',
            \ }

call modularvimrc#set_default('g:modularvimrc#filename', s:defaults.filename)
"}}}
" Loader function {{{
function! modularvimrc#load() 
    " Start looking for .vimrc files from the root dir
    let local_path = "/"
    let current_path = getcwd()
    " If the current path is a child of $HOME directory, start looking from $HOME instead
    if current_path =~ $HOME
        let local_path = $HOME . local_path
        let current_path = substitute(current_path, $HOME, '', '')
    endif
    " Split the path into directories
    let path_parts = split(current_path, "/")
    " Go through each directory and source the .vimrc file if it exists
    for path_part in path_parts
        let local_path = local_path . path_part . "/"
        if filereadable(local_path . g:modularvimrc#filename)
            exe ":so " . local_path . vimrc_filename
        endif
    endfor
endfunction 
"}}}
" Restore CPO {{{
let &cpo = s:save_cpo
unlet s:save_cpo
" }}}
