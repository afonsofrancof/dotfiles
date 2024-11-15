return {
    {
        "tpope/vim-surround",
        event = "VeryLazy",
    },
    {
        "mbbill/undotree",
        event = "VeryLazy",
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            local npairs = require('nvim-autopairs')

            npairs.setup({
                map_cr = true,
                map_bs = true,
                check_ts = true,
                enable_check_bracket_line = true,
                ignored_next_char = "[%w]"
            })
        end,
    },

    {
        "epwalsh/obsidian.nvim",
        version = "v3.9.0",
        lazy = true,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "tese",
                    path = "~/vaults/uni/tese/",
                },
                {
                    name = "chronolens",
                    path = "~/vaults/uni/chronolens/",
                },
            },
            completion = {
                nvim_cmp = true,
                min_chars = 2,
            },
            picker = {
                name = "fzf-lua",
            },

        },
    },
    -- {
    --     "m4xshen/hardtime.nvim",
    --     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --     opts = {}
    -- },
}
