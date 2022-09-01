-- Highly Inspired by: https://github.com/ThePrimeagen/.dotfiles/tree/master/nvim/.config/nvim
-- Yeeted from: https://github.com/nvim-lua/kickstart.nvim
-- The package manager: https://github.com/wbthomason/packer.nvim

require("sus.sets")
require("sus.keymap")  -- Must be before plugins otherwise wrong leader might be set
require("sus.packer")
require("sus.vimwiki")
require("sus.telescope")
require("sus.treesitter")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
