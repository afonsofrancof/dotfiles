return {
    {
        "ibhagwan/fzf-lua",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local fzflua = require('fzf-lua')
            fzflua.register_ui_select()
            fzflua.setup({
                defaults = {
                    winopts = {
                        border = "rounded",
                        width = 0.6,
                        height = 0.5,
                    },
                },
                files = {
                    previewer = false,
                    winopts = {
                        width = 0.5,
                        height = 0.5,
                    }
                },
                grep = {
                    winopts = {
                        width = 0.7,
                        preview = {
                            layout = "horizontal",
                            horizontal = "right:40%"
                        }
                    },
                }
            })
            vim.keymap.set('n', '<leader>ff', fzflua.files, {})
            vim.keymap.set('n', '<leader>fe', fzflua.diagnostics_workspace, {})
            vim.keymap.set('n', '<leader>fg', fzflua.live_grep, {})
            vim.keymap.set('n', '<leader>fb', fzflua.buffers, {})
            vim.keymap.set('n', '<leader>fh', fzflua.help_tags, {})
            vim.keymap.set({'n','v'}, '<leader>fc', fzflua.commands, {})
        end
    }
}
