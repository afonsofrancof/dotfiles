return {
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" }),

            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            notifier = { enabled = true },
            notify = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            dashboard = { enabled = true },
            input = { enabled = true },
            image = { enabled = true },
            lazygit = {
                vim.keymap.set('n', '<leader>lg', function()
                    Snacks.lazygit.open()
                end)
            },
            words = {
                debounce = 10,
                vim.keymap.set('n', '<leader>gn', function()
                    Snacks.words.jump(1, true)
                end)
            },
        },
    },
    {
        "FabijanZulj/blame.nvim",
        event = "VeryLazy",
        config = function()
            require("blame").setup()
        end
    },
    "tpope/vim-fugitive",
    {
        'codethread/qmk.nvim',
        config = function()
            ---@type qmk.UserConfig
            local conf = {
                name = 'LAYOUT_lily58_pro',
                variant = 'zmk',
                layout = {
                    'x x x x x x _ _ _ _ x x x x x x',
                    'x x x x x x _ _ _ _ x x x x x x',
                    'x x x x x x _ _ _ _ x x x x x x',
                    'x x x x x x x _ _ x x x x x x x',
                    '_ _ _ x x x x _ _ x x x x _ _ _',
                }
            }
            require('qmk').setup(conf)
        end
    },
    {
        "afonsofrancof/worktrees.nvim",
        dev = false,
        event = "VeryLazy",
        opts = {
            mappings = {
                create = "<leader>wtc",
                delete = "<leader>wtd",
                switch = "<leader>wts",
            }
        }
    },
    {
        "afonsofrancof/osc11.nvim",
        dev = false,
        dependencies = {
            "navarasu/onedark.nvim",
        },
        opts = {
            on_dark = function()
                vim.g.gruvbox_material_better_performance = 1
                vim.g.gruvbox_material_background = "hard"
                vim.g.gruvbox_material_foreground = "original"
                vim.g.gruvbox_material_transparent_background = 2
                vim.opt.background = "dark"
                vim.cmd('colorscheme gruvbox-material')
            end,
            on_light = function()
                require('onedark').setup {
                    style = 'light'
                }
                -- Enable theme
                require('onedark').load()
            end,
        }
    }
}
