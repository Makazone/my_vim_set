import sys, os, time, threading
sys.path.append(os.environ['HOME'] + '/.vim/scivim')

from vimsh import *

_DEBUG_ = 1
_VIMSH_NAME_ = '_SciVim_'

def dbg(txt):
	if _DEBUG_:
		print(txt)

def lookup_vimsh():
	return lookup_buf(_VIMSH_NAME_)

def vsh_redraw(time_out=1):
	vsh = lookup_vimsh()
	while 1:
		if vim.current.buffer.name.endswith(_VIMSH_NAME_) and vim.eval('mode()') == 'n':
			try:
				lookup_vimsh().page_output()
				vim.command('stopinsert!')
			except:
				pass
		time.sleep(time_out)

def vsh_exec(cmd, time_out=0.5):
	vsh = lookup_vimsh()
	if vsh:
	    cwnr = lookup_window_number(vim.current.window)
	    vsh.focus()
        vsh.execute_cmd(cmd, _passive=1)
        #vim.command(str(cwnr) + 'wincmd p')
        #vsh_redraw(time_out)
        vim.command('stopinsert!')

def startSciVim(path):
    spawn_buf( _VIMSH_NAME_ )
    vsh_exec([path])
    threading._start_new_thread(vsh_redraw, ())

def updateOctaveAndR():
    cb = vim.current.buffer
    r = vim.current.range
    cr = cb.range(r.start + 1, r.end + 1)
    for i in range(len(cr)):
        vsh_exec([cr[i]]);

def sourceOctaveAndR():
    cb = vim.current.buffer
    vsh_exec(['source("' + cb.name + '");s'], 1)
