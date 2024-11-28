return {
    {
        "yioneko/nvim-cmp",
        branch = "perf",
        event = "VeryLazy",
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
            local cmp = require("cmp")

            local luasnip = require("luasnip")
            require("luasnip/loaders/from_vscode").lazy_load()

            vim.opt.pumheight = 15

            local lspkind = require("lspkind")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                performance = {
                    debounce = 0,
                    throttle = 0,
                },
                mapping = {
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-y>"] = cmp.mapping(
                        cmp.mapping.confirm({
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true,
                        }),
                        { "i", "c" }
                    ),
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end),
                },
                formatting = {
                    fields = { "kind", "abbr" },
                    format = function(entry, vim_item)
                        local formatted_entry = lspkind.cmp_format({
                            mode = "symbol",
                            maxwidth = {
                                menu = 0
                            },
                            show_labelDetails = false
                        })(entry, vim_item)
                        formatted_entry.kind = (formatted_entry.kind or "") .. " "
                        -- local item = entry:get_completion_item()
                        -- if item.detail then
                        --     local detail = item.detail
                        --     if string.find(detail, "->") ~= nil then
                        --         local return_arrow = vim.split(detail, "->", { trimempty = true })
                        --         detail = vim.trim(return_arrow[2] or "")
                        --     end
                        --     if string.len(detail) <= 10 then
                        --         print("<=10 " .. detail)
                        --         formatted_entry.menu = detail
                        --     else
                        --         print(">10 " .. detail)
                        --         formatted_entry.menu = nil
                        --     end
                        -- end
                        return formatted_entry
                    end
                },
                preselect = cmp.PreselectMode.None,
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,

                        --Make entries that start with underline appear after
                        function(entry1, entry2)
                            local _, entry1_under = entry1.completion_item.label:find("^_+")
                            local _, entry2_under = entry2.completion_item.label:find("^_+")
                            entry1_under = entry1_under or 0
                            entry2_under = entry2_under or 0
                            if entry1_under > entry2_under then
                                return false
                            elseif entry1_under < entry2_under then
                                return true
                            end
                        end,

                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                sources = cmp.config.sources({
                    { name = "nvim_lua" },
                    { name = "nvim_lsp" },
                    --{ name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer", keyword_length = 5 },
                }),
                window = {
                    completion = {
                        border = "rounded",
                        winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
                    },
                    documentation = {
                        border = "rounded",
                        winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
                    },
                },
                experimental = {
                    native_menu = false,
                    ghost_text = false,
                },
            })

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    }
}
