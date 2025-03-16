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
        "afonsofrancof/worktrees.nvim",
        dev = true,
        opts = {
            mappings = {
                create = "<leader>wtc",
                delete = "<leader>wtd",
                switch = "<leader>wts",
            }
        }
    }
}
