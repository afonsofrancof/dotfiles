return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } }
            }
        }
    },
    {
        "smjonas/inc-rename.nvim",
        opts = {
            save_in_cmdline_history = false,
        }
    },
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        opts = {}
    },
    -- {
    --     "ray-x/go.nvim",
    --     dependencies = {
    --         "ray-x/guihua.lua",
    --         "neovim/nvim-lspconfig",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --     config = function(lp, opts)
    --         require("go").setup(opts)
    --         local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             pattern = "*.go",
    --             callback = function()
    --                 require('go.format').goimports()
    --             end,
    --             group = format_sync_grp,
    --         })
    --     end,
    --     event = { "CmdlineEnter" },
    --     ft = { "go", 'gomod' },
    --     build = ':lua require("go.install").update_all_sync()'
    -- },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            "ibhagwan/fzf-lua",
            "stevearc/conform.nvim",
        },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local lspconfig = require("lspconfig")
            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local fzflua = require("fzf-lua")
                    local conform = require("conform")

                    local function jumpWithVirtLineDiags(jumpCount)
                        pcall(vim.api.nvim_del_augroup_by_name, "jumpWithVirtLineDiags")

                        vim.diagnostic.jump { count = jumpCount }

                        local initialVirtTextConf = vim.diagnostic.config().virtual_text
                        vim.diagnostic.config {
                            virtual_text = false,
                            virtual_lines = { current_line = true },
                        }

                        vim.defer_fn(function()
                            vim.api.nvim_create_autocmd("CursorMoved", {
                                desc = "User(once): Reset diagnostics virtual lines",
                                once = true,
                                group = vim.api.nvim_create_augroup("jumpWithVirtLineDiags", {}),
                                callback = function()
                                    vim.diagnostic.config { virtual_lines = false, virtual_text = initialVirtTextConf }
                                end,
                            })
                        end, 1)
                    end

                    local rename_func = function()
                        return ":IncRename " .. vim.fn.expand("<cword>")
                    end

                    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
                    local bufopts_expr = { expr = true }
                    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
                    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, bufopts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                    vim.keymap.set("n", "gr", fzflua.lsp_references, bufopts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
                    vim.keymap.set("n", "gi", fzflua.lsp_implementations, bufopts)
                    vim.keymap.set("n", "<space>k", vim.lsp.buf.signature_help, bufopts)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
                    vim.keymap.set("n", "<space>rn", rename_func, bufopts_expr)
                    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, bufopts)
                    vim.keymap.set("n", "<space>ge", function() jumpWithVirtLineDiags(1) end, bufopts)
                    vim.keymap.set("n", "<space>gE", function() jumpWithVirtLineDiags(-1) end, bufopts)
                    vim.keymap.set("n", "<space>fo", function() conform.format({ lsp_fallback = true }) end, bufopts)
                end,
            })
            local capabilities = require('blink.cmp').get_lsp_capabilities(nil, true)
            lspconfig["gopls"].setup({
                capabilities = capabilities,
                settings = {
                    gopls = {
                        ["ui.completion.usePlaceholders"] = true,
                        ["ui.diagnostic.staticcheck"] = true,
                        ["ui.inlayhint.hints"] = {
                            assignVariablesTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            completeUnimported = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                            analyses = {
                                unusedparams = true,
                            }
                        },
                    }
                }
            })
            lspconfig["lua_ls"].setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        hint = { enable = true },
                    },
                },
            })
            lspconfig["ltex"].setup({
                capabilities = capabilities,
                on_attach = function(_, _)
                    require("ltex_extra").setup()
                end,
                settings = {
                    ltex = {
                        language = "en-GB",
                        additionalRules = {
                            enablePickyRules = true,
                            languageModel = '~/Downloads/ngrams/',
                        },
                    },
                },
            })
            lspconfig["hls"].setup({
                capabilities = capabilities,
                filetypes = { 'haskell', 'lhaskell', 'cabal' },
            })
            -- lspconfig["clangd"].setup({
            --     capabilities = capabilities,
            -- })
            lspconfig["texlab"].setup({
                capabilities = capabilities,
            })
            lspconfig["bashls"].setup({
                capabilities = capabilities,
            })
            lspconfig["zls"].setup({
                capabilities = capabilities,
            })
            lspconfig["pyright"].setup({
                capabilities = capabilities,
            })
            lspconfig["sourcekit"].setup({
                capabilities = capabilities,
            })
        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = false
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        opts = {}
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
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
        end
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "black" },
                    haskell = { "fourmolu" },
                    javascript = { "prettierd" },
                    markdown = { "mdformat" },
                    rust = { "rustfmt" },
                    go = { "gofmt" },
                    json = { "jq" },
                    bash = { "shfmt", "beautysh" },
                    zsh = { "beautysh" }
                }
            })
        end,
    },
    {
        'mfussenegger/nvim-lint',
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                go = { "golangcilint" },
            }

            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })

            vim.keymap.set("n", "<leader>li", function()
                lint.try_lint()
            end, { desc = "Trigger linting for current file" })
        end,
    },

    {
        "lervag/vimtex",
        filetypes = { "tex" },
        config = function()
            if vim.loop.os_uname().sysname == "Darwin" then
                vim.g.vimtex_view_method = 'sioyek'
            else
                vim.g.vimtex_view_method = 'zathura'
            end
            vim.g.vimtex_quickfix_ignore_filters = {
                "warning",
                "Warning"
            }
            vim.g.vimtex_quickfix_open_on_warning = 0
            vim.g.vimtex_quickfix_ignore_filters = {
                'Overfull',
                'Underfull',
            }
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_compiler_latexmk = {
                out_dir = 'build',
                options = {
                    "-verbose",
                    "-shell-escape",
                    "-file-line-error",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                }
            }
            vim.g.vimtex_view_automatic = 1
        end,
    },
    {
        "barreiroleo/ltex-extra.nvim",
        event = "VeryLazy",
    },
}
