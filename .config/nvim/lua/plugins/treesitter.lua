return {

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            require('nvim-treesitter.install').update({ with_sync = true })


            local options = {
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = { "latex" },
                    use_languagetree = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
                indent = {
                    enable = true,
                },
            }

            treesitter.setup(options)
        end
    },
    {
        'echasnovski/mini.ai',
        event = "VeryLazy",
        version = false,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        config = function()
            local gen_spec = require('mini.ai').gen_spec
            require('mini.ai').setup({
                custom_textobjects = {
                    F = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
                },
                n_lines = 1000
            })
        end
    },
    "kyoh86/vim-jsonl"
}
