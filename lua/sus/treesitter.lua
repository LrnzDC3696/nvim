require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'lua', 'python', 'javascript', 'html', 'css' },

    indent = { enable = true },
    incremental_selection = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
