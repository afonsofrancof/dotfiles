return {
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon.setup()
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
        end
    },
    {
        "stevearc/oil.nvim",
        opts = {},
    },
    {
        'mrjones2014/smart-splits.nvim',
        config = function()
            require('smart-splits').setup({})
            --Resize
            vim.keymap.set('n', '<S-F5>', require('smart-splits').resize_left)
            vim.keymap.set('n', '<S-F6>', require('smart-splits').resize_down)
            vim.keymap.set('n', '<S-F7>', require('smart-splits').resize_up)
            vim.keymap.set('n', '<S-F8>', require('smart-splits').resize_right)
            --Move
            vim.keymap.set('n', '<F5>', require('smart-splits').move_cursor_left)
            vim.keymap.set('n', '<F6>', require('smart-splits').move_cursor_down)
            vim.keymap.set('n', '<F7>', require('smart-splits').move_cursor_up)
            vim.keymap.set('n', '<F8>', require('smart-splits').move_cursor_right)
        end
    },
}
