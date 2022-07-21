let using_neovim = has('nvim')
let using_vim = !using_neovim

call plug#begin()

" ========== VIM-PLUGGED AUTO INSTALL ==========

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
  echo "Installing Vim-plug..."
  echo ""
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

" =================================================

" ========== PLUGINS ==========

call plug#begin("~/.vim/plugged")

" if using_neovim
"     call plug#begin("~/.config/nvim/plugged")
" else
"     call plug#begin("~/.vim/plugged")
" endif

" ++++++++++++++++++++++++++++++
" List is sorted by importance to me

"" - Theme Stuff
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " LEARN MORE

"" - File Management
" NOTE: Telescope requires ripgrep for live_grep and grep_string
" Run this first for telescope: `pacman -S ripgrep`
Plug 'nvim-lua/plenary.nvim'  " required by telescope and harpoon
Plug 'nvim-telescope/telescope.nvim'  " CONFIG BETTER?
" Plug 'ThePrimeagen/harpoon' (CHECKOUT LATER)

"" - Autocompletion
" NOTE: Coc requires nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " CONFIG BETTER?
Plug 'tpope/vim-surround'  " GIT GOOD
" Plug 'alvan/vim-closetag'  " (why is this even in here)

"" - Github Copilot
" Plug 'github/copilot.vim' (CHECKOUT LATER)

"" - Git Stuff
Plug 'tpope/vim-fugitive'  " GIT GOOD, CONFIG BETTER?

"" - Note and Todo
Plug 'vimwiki/vimwiki'  " (needs that markdown not showing shit)

"" - Code Commenter
Plug 'tpope/vim-commentary' " GIT GOOD

"" - Python Stuff
Plug 'vim-scripts/indentpython.vim'
" Plug 'tpope/vim-dotenv' (dunno how)

"" - Indentation stuff
Plug 'Yggdroot/indentLine'

"" - Discord Rich Presence
Plug 'andweeb/presence.nvim'

" ++++++++++++++++++++++++++++++

call plug#end()

" =================================================

" ========== SETTING NEOVIM DEFAULTS ==========

if using_vim
  " A bunch of things that are set by default in neovim, but not in vim

  " no vi-compatible
  set nocompatible

  " allow plugins by file type (required for plugins!)
  filetype plugin on
  filetype indent on

  " always show status bar
  set ls=2

  " incremental search
  set incsearch

  " highlighted search results
  set hlsearch

  " syntax highlight on
  syntax on

  " better backup, swap and undos storage for vim (nvim has nice ones by
  " default)
  set directory=~/.vim/dirs/tmp     " directory to place swap files in
  set backup                        " make backup files
  set backupdir=~/.vim/dirs/backups " where to put backup files
  set undofile                      " persistent undos - undo after you re-open the file
  set undodir=~/.vim/dirs/undos
  set viminfo+=n~/.vim/dirs/viminfo

  " create needed directories if they don't exist
  if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
  endif

  if !isdirectory(&directory)
    call mkdir(&directory, "p")
  endif

  if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
  endif
endif

" =================================================

" ========== NGL DON'T KNOW ==========

let mapleader = " "
syntax on

" ===== DUNNO BUT MUST BE HERE?

filetype indent on
filetype plugin on

" ===== COLORSCHEME STUFF

set termguicolors

let g:dracula_italic=0
colorscheme dracula

" ===== AUTOCOMMANDS

if has("autocmd")

  " Automatically removing all trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  " Disable paste mode when leaving Insert Mode
  autocmd InsertLeave * set nopaste

endif

" =================================================

" -------------------- ARCHIVED --------------------
" " I dunno but it's Coc Stuff
"
" if has("autocmd")
"   augroup CocStuff
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"
"   " Highlight the symbol and its references when holding the cursor.
"   autocmd CursorHold * silent call CocActionAsync('highlight')
"   augroup END
" endif
"
" -------------------------------------------------

" -------------------- ARCHIVED --------------------
" Copy mode for termux for easier copying because
" unnamed+ and other stuff doesn't work
"
" let g:is_copy_mode = v:false
"
" function! Copymode() abort
"   if g:is_copy_mode
"     set number relativenumber signcolumn=yes:2
"     let g:is_copy_mode = v:false
"   else
"     set nonumber norelativenumber signcolumn=no
"     let g:is_copy_mode = v:true
"   endif
" endfunction
"
"
" " - Copying mode
" nnoremap <silent> <leader>C :call Copymode()<CR>
"
" -------------------------------------------------

" -------------------- ARCHIVED --------------------
"
" WSL yank support
" let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
" if executable(s:clip)
"   augroup WSLYank
"     autocmd!
"     autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"   augroup END
" endif
"
" -------------------------------------------------

