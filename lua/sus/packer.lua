-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'                                                    

    -- Improvements!
    use 'ThePrimeagen/vim-be-good'                                                    

    -- Notes

    -- Colerscheme stuff
    use {'dracula/vim', as = 'dracula'}

    -- Share thy wisdom
    use 'andweeb/presence.nvim'
    use 'wakatime/vim-wakatime'

    -- Autocompletion
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'tpope/vim-surround'

    -- Better Indentation
    use 'vim-scripts/indentpython.vim'


    -- Harpoon
    use {
        'ThePrimeagen/harpoon',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- Better syntax stuff
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    if is_bootstrap then
        require('packer').sync()
    end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

-- Automatically run packer compile whenever plugins.lua is updated
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

