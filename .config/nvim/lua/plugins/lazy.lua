local lazy = require("lazy")

lazy.setup({

    "lewis6991/impatient.nvim",

    -------------------------------------------THEMES------------------------------------------
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    "sainnhe/gruvbox-material",

    -------------------------------------------------------MFP---------------------------------
    {
        "susliko/tla.nvim",
        opts = {},
    },
    -------------------------------------------------------QOL---------------------------------

    {
        "jbyuki/instant.nvim",
        config = function()
            vim.g.instant_username = "afonso"
        end,
    },

    "vimpostor/vim-tpipeline",

    {
        "TobinPalmer/pastify.nvim",
        cmd = { "Pastify" },
        opts = {},
    },

    --Python notebooks
    {
        "luk400/vim-jukit",
        config = function()
            require("plugins.jukit")
        end,
        ft = { "python", "json" },
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("plugins.copilot")
        end,
    },

    --Nvim to browser
    "subnut/nvim-ghost.nvim",

    {
        "declancm/cinnamon.nvim",
        opts = {
            scroll_limit = 10000,
            always_scroll = true,
        },
    },

    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    {
        "folke/zen-mode.nvim",
        event = "VeryLazy",
        opts = {
            vim.keymap.set("n", "<leader>z", "<Cmd> ZenMode <CR>", { noremap = true, silent = true }),
        },
    },

    --Change add and remove surroundings from words
    "tpope/vim-surround",

    {
        "NvChad/nvim-colorizer.lua",
        opts = {},
    },

    "mbbill/undotree",

    --Tmux navigation
    {
        "alexghergh/nvim-tmux-navigation",
        opts = {
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left = "<F5>",
                down = "<F6>",
                up = "<F7>",
                right = "<F8>",
            },
        },
    },

    -- Rename variable pop up
    "stevearc/dressing.nvim",

    {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.autopairs")
        end,
    },

    "nvim-tree/nvim-web-devicons",

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("plugins.lualine")
        end,
    },

    {
        "stevearc/oil.nvim",
        opts = {},
    },

    -------------------------------------------------------LSP----------------------------------------------
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",                -- lsp
            "hrsh7th/cmp-nvim-lua",                -- Nvim API completions
            "hrsh7th/cmp-nvim-lsp-signature-help", -- Show function signatures
            "hrsh7th/cmp-buffer",                  --buffer completions
            "hrsh7th/cmp-path",                    --path completions
            "hrsh7th/cmp-cmdline",                 --cmdline completions
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim", --lspkind icons
        },
        config = function()
            require("plugins.cmp")
        end,
    },

    --LSP Status
    "j-hui/fidget.nvim",

    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("plugins.dap")
        end,
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("plugins.mason")
        end,
    },

    "williamboman/mason-lspconfig.nvim",

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lspconfig")
        end,
    },

    {
        "stevearc/conform.nvim",
        config = function()
            require("plugins.conform")
        end,
    },

    {
        "lervag/vimtex",
        config = function()
            require("plugins.vimtex")
        end,
    },

    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        ft = { "rust" },
    },

    "barreiroleo/ltex-extra.nvim",

    -------------------------------------------------------------------------------------------
    -- Syntax Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.treesitter")
        end,
    },

    "kaarmu/typst.vim",

    --Sticky headers
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("plugins.treesitter-context")
        end,
    },

    "runoshun/vim-alloy",

    --does so much
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        -- or                            , branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.telescope")
        end,
    },

    --Discord Rich Presence
    "andweeb/presence.nvim",
    
    --Vim be good
    'ThePrimeagen/vim-be-good',

    --JQ
    'jrop/jq.nvim'
})
