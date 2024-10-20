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
        config = function()
            require("oil").setup({
                float = {
                    preview_split = "right"
                },
            })
            -- Function to open oil.nvim in a vertical split
            local function open_oil_split()
                -- Calculate the width for the split (20% of the total width)
                local width = math.floor(vim.o.columns * 0.2)       -- 20% of total width
                -- Create a vertical split and set width
                vim.cmd("vsplit")                                   -- Create a vertical split
                vim.cmd(string.format("vertical resize %d", width)) -- Resize to 20%
                -- Open oil in the new split
                require("oil").open()                               -- Use open() to open oil.nvim
            end

            -- Key mapping to open oil in a vertical split
	    vim.api.nvim_set_keymap('n', '<leader>o', ':lua require("oil").open_float()<CR>', { noremap = true, silent = true })
	    vim.keymap.set('n', '<leader>O', open_oil_split, { noremap = true, silent = true })

        end
    },
    -- {
    --     'echasnovski/mini.files',
    --     version = false,
    --     opts = {
    --         mappings = {
    --             close       = 'q',
    --             go_in       = '',
    --             go_in_plus  = 'l',
    --             go_out      = '<CR>',
    --             go_out_plus = 'h',
    --             reset       = '<BS>',
    --             show_help   = 'g?',
    --             synchronize = 's',
    --         },
    --         options = {
    --             permanent_delete = false
    --         }
    --     },
    --     keys = {
    --         {
    --             "<leader>o",
    --             function()
    --                 require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
    --             end,
    --             desc = "Open mini.files (Directory of the current file)"
    --         },
    --         {
    --             "<leader>O",
    --             function()
    --                 require("mini.files").open(vim.uv.cwd(), true)
    --             end,
    --             desc = "Open mini.files (cwd)"
    --         }
    --     }
    -- },
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
