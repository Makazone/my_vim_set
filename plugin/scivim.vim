" file:     scivim.vim
" purpose:  support file for vimsh, when sourced starts a vimsh buffer
"
" author:   Maximilian Nickel   max@inmachina.com,
"                           http://github.com/mnick/scivim
" created:  02/01/09
" last_mod: 02/01/09
" version:  0.1
"
" usage:    :SciOct | :SciR | :SciVim <path>

if !exists("g:scivim_octave_path")
	let g:scivim_octave_path='octave'
endif

if !exists("g:scivim_r_path")
	let g:scivim_r_path='R'
endif

" Only load vimsh.py once (don't reset variables)
if !exists("g:vimsh_loaded_python_file")
    pyfile <sfile>:p:h:h/scivim/vimsh.py
    let g:vimsh_loaded_python_file=1
endif

" Only load scivim.py once
if !exists("g:scivim_loaded_python_file")
	pyfile <sfile>:p:h:h/scivim/scivim.py
	let g:scivim_loaded_python_file=1
endif

function! VimShRedraw()
	redraw
endfunction

function! SciVimStart(sci_env)
    let g:scivim_mode = a:sci_env
    python startSciVim( vim.eval( "a:sci_env" ) )
endfunction

function! SciVimSource()
    if g:scivim_mode == g:scivim_octave_path
        python sourceOctaveAndR()
    elseif g:scivim_mode == g:scivim_r_path
        python sourceOctaveAndR()
    endif
endfunction

function! SciVimUpdate()
    if g:scivim_mode == g:scivim_octave_path
        python updateOctaveAndR()
    elseif g:scivim_mode == g:scivim_r_path
        python updateOctaveAndR()
    endif
endfunction

if has("gui_running")
    try
        unmenu SciVim
    catch /^Vim\%((\a\+)\)\=:E329/
    endtry
    menu SciVim.Start\ Octave           :SciOct<CR>
    if !executable(g:scivim_octave_path)
        menu disable SciVim.Start\ Octave
    endif

    menu SciVim.Start\ R                :SciR<CR>
    if !executable(g:scivim_r_path)
        menu disable SciVim.Start\ R
    endif

    menu SciVim.-Sep-                   :
    menu SciVim.Run\ Current\ Buffer    :SciSource<CR>
    menu SciVim.Run\ Current\ Selection :SciUpdate<CR>
endif

command! -nargs=1 SciVim call SciVimStart( "<args>" )

" Command shortcut to start Octave
command! -nargs=0 SciOct call SciVimStart( g:scivim_octave_path )

" Command shortcut to start R
command! -nargs=0 SciR call SciVimStart( g:scivim_r_path )

command! SciClose bd SciVim
command! SciSource call SciVimSource()
command! SciUpdate call SciVimUpdate()
