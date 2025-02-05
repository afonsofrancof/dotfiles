return {
    {
        "mbbill/undotree",
        event = "VeryLazy",
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        opts = {}
    },
    {
        'echasnovski/mini.pairs',
        version = '*',
        config = function()
            vim.api.nvim_set_keymap('n', 'S', 'saiw', { silent = true })
            require("mini.pairs").setup({
                mappings = {
                    -- Prevents the action if the cursor is just before any character or next to a "\".
                    ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][%s%)%]%}]" },
                    ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][%s%)%]%}]" },
                    ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][%s%)%]%}]" },
                    -- This is default (prevents the action if the cursor is just next to a "\").
                    [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
                    ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
                    ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
                    -- Prevents the action if the cursor is just before or next to any character.
                    ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%w][^%w]", register = { cr = false } },
                    ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w][^%w]", register = { cr = false } },
                    ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^%w][^%w]", register = { cr = false } },
                },
            })
        end
    },

    --  Adds S in regex replace and change camelCase to snake_case, etc
    "tpope/vim-abolish"
}
