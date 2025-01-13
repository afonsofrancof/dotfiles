return {
    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        version = "*",
        opts = {
            keymap = {
                preset = 'default',
                ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
                },
            },
            signature = {
                enabled = true,
                window = {
                    max_width = 160,
                    max_height = 30,
                    scrollbar = true,
                    show_documentation = false,
                }
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true
                    }
                },
                menu = {
                    border = "single",
                    winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
                    winblend = 0,
                    draw = {
                        treesitter = { 'lsp' },
                        columns = { { 'kind_icon' }, { 'label' } },
                    }
                },
                documentation = {
                    auto_show = true,
                    window = {
                        border = 'single',
                        max_width = 160,
                        max_height = 30,
                        winblend = 0,
                        winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
                    }
                },
            },
        },
    },
}
