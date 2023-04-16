-- Highly Inspired by: https://github.com/ThePrimeagen/.dotfiles/tree/master/nvim/.config/nvim
-- Yeeted from: https://github.com/nvim-lua/kickstart.nvim
-- The package manager: https://github.com/wbthomason/packer.nvim

require("sus.keymap")  -- Must be before plugins otherwise wrong leader might be set

-- [[ vanilla ]]
require("sus.options")
require("sus.remaps")
require("sus.autocommands")
-- pairs
-- commentary
-- indentline


-- [[ plugins ]]

require("sus.packer")
require("sus.presence")
require("sus.telescope")
require("sus.treesitter")
require("sus.harpoon")
require("sus.coc")
require("sus.arduino")
