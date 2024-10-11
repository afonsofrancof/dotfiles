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
                indent = {
                    enable = true,
                },
            }

            treesitter.setup(options)
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        config = function()
            require 'treesitter-context'.setup()
        end,
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
                    -- Function definition (needs treesitter queries with these captures)
                    F = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
                },
                n_lines = 1000
            })
        end
    },
}
