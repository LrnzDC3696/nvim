" REMAPS
" nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

" - Buffers
nnoremap <silent> <C-l> :bp<CR>
nnoremap <silent> <C-h> :bn<CR>
nnoremap <silent> <C-q> :bp\|bd #<CR>

" noremap <leader>z :bp <CR>
" noremap <leader>q :bp <CR>
" noremap <leader>x :bn <CR>
" noremap <leader>w :bn <CR>
" noremap <leader>c :bd <CR>

" - Windows
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

" - Shorcut split switching (conflict with above, solution: use harpoon)
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" - Shortcut slit opening
nnoremap <leader><C-h> :split<Space>
nnoremap <leader><C-v> :vsplit<Space>

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap J mzJ`z

" " - Moves visuals
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vmap < <gv
vmap > >gv

" " - Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi

" " - Alias replace all to S
nnoremap <leader>S :%s//gI<Left><Left><Left>

" " - Alias write and quit to Q
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" " greatest remap ever
" xnoremap <leader>p "_dP

" " next greatest remap ever : asbjornHaland
" nnoremap <leader>y "+y
" vnoremap <leader>y "+y
" nmap <leader>Y "+Y

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" nnoremap <leader>d "_d
" vnoremap <leader>d "_d

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall! qall!
cnoreabbrev Qall qall
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev Wa wa
