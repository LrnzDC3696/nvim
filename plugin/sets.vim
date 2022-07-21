" SETS

set exrc

" Dunno man seems kinda sussy baka
set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

" Ignore files
set wildignore+=*.pyc,**/.git/*,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/

set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set colorcolumn=88
set guicursor=
set nohlsearch
set nowrap
set scrolloff=10
set sidescrolloff=10

set smartcase
set ignorecase

set signcolumn=yes:2
set splitbelow

set hidden
set incsearch
" set noerrorbells

set number
set relativenumber

" set cursorline
" set cursorcolumn

" =====

set directory=~/.vim/dirs/tmp
set backup
set backupdir=~/.vim/dirs/backups
set undofile
set undodir=~/.vim/dirs/undos

if !isdirectory(&backupdir)
	call mkdir(&backupdir, "p")
endif

if !isdirectory(&directory)
	call mkdir(&directory, "p")
endif

if !isdirectory(&undodir)
	call mkdir(&undodir, "p")
endif

" - Copy paste stuff
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

