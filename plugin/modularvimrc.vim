"early exit if loaded
if exists("modularvimrc#loaded")
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

call modularvimrc#load()

"set script as loaded
let modularvimrc#loaded = 1

let &cpo = s:save_cpo
unlet s:save_cpo

