" https://github.com/fisadev/fisa-vim-config/blob/master/config.vim#L1-L49
let using_neovim = has('nvim')
let using_vim = !using_neovim

" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0

if using_neovim
    " let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
    let vim_plug_path = expand('~/.vim/autoload/plug.vim')
else
    let vim_plug_path = expand('~/.vim/autoload/plug.vim')
endif

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    if using_neovim
        " silent !mkdir -p ~/.config/nvim/autoload
        " silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the config down below
" as you wish :)
" IMPORTANT: some things in the config are vim or neovim specific. It's easy
" to spot, they are inside `if using_vim` or `if using_neovim` blocks.

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
if using_neovim
    " call plug#begin("~/.config/nvim/plugged")
    call plug#begin("~/.vim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif

" Welcome Humans

"" - Autocompletion
" NOTE: Coc requires nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
" Plug 'alvan/vim-closetag'

"" - File Management
" NOTE: Telescope requires ripgrep for live_grep and grep_string
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'

"" - Note and Todo
Plug 'vimwiki/vimwiki'

"" - Code Commenter
Plug 'tpope/vim-commentary'

"" - Git Stuff
Plug 'tpope/vim-fugitive'

"" - Python Stuff
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-dotenv'

"" - Theme Stuff
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

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
    "
    if !isdirectory(&backupdir)
        call mkdir(&backupdir, "p")
    endif

    if !isdirectory(&directory)
        call mkdir(&directory, "p")
    endif

    if !isdirectory(&undodir)
        call mkdir(&undodir, "p")
    endif

end

"" DUNNO
syntax on

filetype indent on
filetype plugin on

"" COLORSHEME STUFF
set termguicolors

let g:dracula_italic=0
colorscheme dracula

"" REMAPS
let mapleader = " "

"" - Buffers
nnoremap <silent> <C-l> :bp<CR>
nnoremap <silent> <C-h> :bn<CR>

"" - Copying mode
" nnoremap <silent> <leader>C :call Copymode()<CR>


"" AUTOCOMMANDS
if has("autocmd")

  " Automatically removing all trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  " Disable paste mode when leaving Insert Mode
  autocmd InsertLeave * set nopaste

  " I dunno but it's Coc Stuff
  augroup CocStuff
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
  augroup END

endif

" WSL yank support
" let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
" if executable(s:clip)
"   augroup WSLYank
"     autocmd!
"     autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"   augroup END
" endif


" Custom configurations ----------------

" Include user's custom nvim configurations
if using_neovim
    " let custom_configs_path = "~/.config/nvim/custom.vim"
    let custom_configs_path = "~/.vim/custom.vim"
else
    let custom_configs_path = "~/.vim/custom.vim"
endif

if filereadable(expand(custom_configs_path))
  execute "source " . custom_configs_path
endif
