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
        "j-hui/fidget.nvim",
        opts = {
            progress = {
                display = {
                    render_limit = 3,
                }
            }
        },
    },
    --Better quick fix
    {
        'kevinhwang91/nvim-bqf',
        event = "VeryLazy",
        ft = 'qf'
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
