return {

    {
        "vimpostor/vim-tpipeline",
        config = function()
            vim.g.tpipeline_restore = 0
            vim.g.tpipeline_autoembed = 0
            vim.o.laststatus = 0
            vim.g.tpipeline_statusline = '%=%l:%c'
        end
    },
    {
        'kevinhwang91/nvim-bqf',
        event = "VeryLazy",
        ft = 'qf'
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            views = {
                cmdline_popup = {
                    position = {
                        row = "100%",
                        col = "0%",
                    },
                    size = {
                        min_width = 60,
                        width = "97%",
                        height = "auto",
                    },
                },
                cmdline_popupmenu = {
                    relative = "editor",
                    position = {
                        row = "85%",
                        col = "0%",
                    },
                },
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                command_palette = true,
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = true,            -- enables an input dialog for inc-rename.nvim
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },

    -- {
    --     "OXY2DEV/markview.nvim",
    --     ft = "markdown",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     opts = {
    --         modes = { "n", "no", "c" },
    --         callbacks = {
    --             on_enable = function(_, win)
    --                 vim.wo[win].conceallevel = 2;
    --                 vim.wo[win].concealcursor = "c";
    --             end
    --         }
    --     }
    -- },
    {
        "karb94/neoscroll.nvim",
        config = function()
            local neoscroll = require('neoscroll')
            neoscroll.setup({
                hide_cursor = false,
            })
            local keymap = {
                ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 150 }) end,
                ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 150 }) end,
            }
            local modes = { 'n', 'v', 'x' }
            for key, func in pairs(keymap) do
                vim.keymap.set(modes, key, func)
            end
        end
    },
    {
        "folke/zen-mode.nvim",
        event = "VeryLazy",
        opts = {
            vim.keymap.set("n", "<leader>z", "<Cmd> ZenMode <CR>", { noremap = true, silent = true }),
        },
    },
    {
        "NStefan002/screenkey.nvim",
        lazy = false,
        version = "*", -- or branch = "dev", to use the latest commit
    },
}
