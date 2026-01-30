return {
    "folke/which-key.nvim",
    "rose-pine/neovim",
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically - makes tabs work normally
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "gopls", "ts_ls", "html", "cssls", "svelte" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    }
}
