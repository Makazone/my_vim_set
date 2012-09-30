call pathogen#infect()
call pathogen#helptags()

"set line highliting
set cursorline

colorscheme solarized
set background=dark

" SciVim plugin
let g:scivim_octave_path='/Applications/Octave.app/Contents/Resources/bin/octave'

" Always show status line
set laststatus=2

" switch on syntax highliting
syntax on

" omnicppcomplete
set nocp
let OmniCpp_MayCompleteScope = 1
let OmniCpp_ShowPrototypeInAbbr = 1

" Make command line two  lines high
set ch=2

" Set visiual bell
set vb

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

set cpoptions=ces$

" Allows cursor to go in to "invalid" places
set virtualedit=all

" When the page starts to scroll, keep the cursor 8 lines from the top and bottom
set scrolloff=8

" Make the command-line completion better
set wildmenu

" Set the textwidth to be 80 chars
set textwidth=80

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Set gui interface
set guioptions=acge

" Allow unsaved buffer to go hidden without showing erros
set hidden

" Status line
set stl=%f\ %m\ Buf:#%n\ 
 
" Don't show the current command
set showmode

set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set nocursorline
set nocursorcolumn

set guifont=Menlo:h16
                        
set noncompatible
filetype on
filetype plugin on

" enable line numbering
set number

filetype plugin indent on
