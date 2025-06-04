return {

    -- {
    --     "vimpostor/vim-tpipeline",
    --     config = function()
    --         vim.g.tpipeline_restore = 0
    --         vim.g.tpipeline_autoembed = 0
    --         vim.o.laststatus = 0
    --         vim.g.tpipeline_statusline = '%=%l:%c'
    --     end
    -- },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline",
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
                signature = {
                    enabled = false
                }
            },
            presets = {
                inc_rename = true,
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },
    {
        'kevinhwang91/nvim-ufo',
        event = "VeryLazy",
        dependencies = 'kevinhwang91/promise-async',
        config = function()
            vim.o.foldcolumn = '0'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
            require('ufo').setup()
        end
    },
    {
        "OXY2DEV/markview.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
    },
    {
        "echasnovski/mini.diff",
        opts = {}
    }

}
