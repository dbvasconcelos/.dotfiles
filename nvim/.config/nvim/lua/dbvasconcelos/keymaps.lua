-- Move lines down
vim.cmd "nnoremap J :m .+1<CR>=="
vim.cmd "xnoremap J :m '>+1<CR>gv=gv"

-- Move lines up
vim.cmd 'nnoremap K :m .-2<CR>=='
vim.cmd "xnoremap K :m '<-2<CR>gv=gv"

-- Save file as sudo on files that require root permission
vim.cmd "cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"

-- Esc leaves terminal mode
vim.cmd "tnoremap <ESC> <C-\\><C-N>"

-- Terminal Navigation with Ctrl + vimkeys
vim.cmd 'tnoremap <C-h> <C-\\><C-N><C-w>h'
vim.cmd 'tnoremap <C-j> <C-\\><C-N><C-w>j'
vim.cmd 'tnoremap <C-k> <C-\\><C-N><C-w>k'
vim.cmd 'tnoremap <C-l> <C-\\><C-N><C-w>l'

-- Split Navigation with Ctrl + vimkeys
vim.cmd 'nnoremap <C-h> <C-w>h'
vim.cmd 'nnoremap <C-j> <C-w>j'
vim.cmd 'nnoremap <C-k> <C-w>k'
vim.cmd 'nnoremap <C-l> <C-w>l'

-- Yank to end of the line
vim.cmd 'nnoremap Y y$'

-- Prevent triggering ex mode
vim.cmd 'nnoremap <silent> Q <nop>'

-- <Enter> Clears hlsearch after doing a search
vim.cmd 'nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl<CR>" : "<CR>"}()'

-- Resize with ctrl + arrows
vim.cmd 'nnoremap <C-Up> :resize -2<CR>'
vim.cmd 'nnoremap <C-Down> :resize +2<CR>'
vim.cmd 'nnoremap <C-Left> :vertical resize -2<CR>'
vim.cmd 'nnoremap <C-Right> :vertical resize +2<CR>'
