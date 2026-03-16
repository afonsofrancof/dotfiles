vim.g.mapleader = " "

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
vim.opt.signcolumn = "yes"
vim.o.laststatus = 1
vim.o.winborder = nil

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.iskeyword:append("_")
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.smoothscroll = true

vim.opt.undodir = os.getenv("XDG_STATE_HOME") .. "/nvim/undodir"
vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir = os.getenv("XDG_STATE_HOME") .. "/nvim/backupdir"
vim.opt.autoread = true
vim.opt.swapfile = false

vim.opt.formatoptions:remove("ro")

-- keymaps --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")

vim.keymap.set("n", "<A-h>", "<cmd>bp<CR>")
vim.keymap.set("n", "<A-l>", "<cmd>bn<CR>")

vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set('x', 'gp', '"+P', { desc = 'Paste from system clipboard' })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("v", "<A-J>", function()
    for _ = 1, vim.fn.getpos("'>")[2] - vim.fn.getpos("'<")[2] - 1 do
        vim.api.nvim_command("normal! J")
    end
end)

-- autocmds --
vim.api.nvim_create_autocmd("VimLeavePre", {
    pattern = "*",
    callback = function()
        if vim.g.savesession then
            vim.api.nvim_command("mks! .session.vim")
        end
    end
})

-- pack hooks --
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})

-- plugins --
vim.pack.add({
    'https://github.com/sainnhe/gruvbox-material',
    'https://github.com/sainnhe/everforest',
    'https://github.com/navarasu/onedark.nvim',
    { src = 'https://github.com/echasnovski/mini.icons',    version = vim.version.range('*') },
    'https://github.com/folke/snacks.nvim',
    'https://github.com/rachartier/tiny-glimmer.nvim',
    { src = 'https://github.com/echasnovski/mini.surround', version = vim.version.range('*') },
    { src = 'https://github.com/echasnovski/mini.pairs',    version = vim.version.range('*') },
    { src = 'https://github.com/echasnovski/mini.ai',       version = 'HEAD' },
    'https://github.com/tpope/vim-abolish',
    'https://github.com/mbbill/undotree',
    { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/mrjones2014/smart-splits.nvim',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/folke/lazydev.nvim',
    'https://github.com/smjonas/inc-rename.nvim',
    'https://github.com/williamboman/mason.nvim',
    { src = 'https://github.com/saghen/blink.cmp',     version = vim.version.range('*') },
    'https://github.com/rafamadriz/friendly-snippets',
    'https://github.com/stevearc/conform.nvim',
    'https://github.com/mfussenegger/nvim-lint',
    'https://github.com/barreiroleo/ltex-extra.nvim',
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/igorlfs/nvim-dap-view',
    'https://github.com/lervag/vimtex',
    { src = 'https://github.com/chomosuke/typst-preview.nvim', version = vim.version.range('1.*') },
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/FabijanZulj/blame.nvim',
    'https://github.com/folke/todo-comments.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
})

-- colorscheme --
require('onedark').setup({ style = 'dark' })
require('onedark').load()

-- mini --
require('mini.icons').setup()
require('mini.surround').setup()

require('mini.pairs').setup({
    mappings = {
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][%s%)%]%}]" },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][%s%)%]%}]" },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][%s%)%]%}]" },
        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
        ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%w][^%w]", register = { cr = false } },
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w][^%w]", register = { cr = false } },
        ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^%w][^%w]", register = { cr = false } },
    },
})
vim.keymap.set('n', 'S', 'saiw', { silent = true })

local gen_spec = require('mini.ai').gen_spec
require('mini.ai').setup({
    custom_textobjects = {
        F = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
    },
    n_lines = 1000
})

-- snacks --
require('snacks').setup({
    bigfile = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    input = { enabled = true },
    image = {
        doc = {
            inline = false,
            float = true,
            max_width = 10,
            max_height = 5,
        }
    },
    words = {
        debounce = 10
    }
})

-- tiny-glimmer --
require('tiny-glimmer').setup({
    overwrite = {
        search = { enabled = true },
        undo = { enabled = true },
        redo = { enabled = true },
    }
})

-- treesitter --
require('nvim-treesitter.config').setup({
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "latex" },
        use_languagetree = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = { enable = true },
})

-- fzf-lua --
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
        winopts = { width = 0.5, height = 0.5 },
    },
    grep = {
        winopts = {
            width = 0.7,
            preview = {
                layout = "horizontal",
                horizontal = "right:40%",
            },
        },
    },
})
vim.keymap.set('n', '<leader>ff', fzflua.files)
vim.keymap.set('n', '<leader>fe', fzflua.diagnostics_workspace)
vim.keymap.set('n', '<leader>fg', fzflua.live_grep)
vim.keymap.set('n', '<leader>fb', fzflua.buffers)
vim.keymap.set('n', '<leader>fh', fzflua.help_tags)
vim.keymap.set({ 'n', 'v' }, '<leader>fc', fzflua.commands)

-- lsp --
require('lazydev').setup({
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})

require('inc_rename').setup({ save_in_cmdline_history = false })
require('mason').setup()

local capabilities = require('blink.cmp').get_lsp_capabilities(nil, true)

vim.lsp.config["gopls"] = {
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
            },
        },
    },
}
vim.lsp.enable('gopls')

vim.lsp.config["lua_ls"] = {
    capabilities = capabilities,
    settings = {
        Lua = { hint = { enable = true } },
    },
}
vim.lsp.enable('lua_ls')

vim.lsp.config["ltex"] = {
    capabilities = capabilities,
    on_attach = function() require("ltex_extra").setup() end,
    settings = {
        ltex = {
            language = "en-GB",
            additionalRules = {
                enablePickyRules = true,
                languageModel = '~/Downloads/ngrams/',
            },
        },
    },
}
vim.lsp.enable('ltex')

vim.lsp.config["hls"] = {
    capabilities = capabilities,
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
}
vim.lsp.enable('hls')

vim.lsp.config["texlab"] = { capabilities = capabilities }
vim.lsp.enable('texlab')

vim.lsp.config["bashls"] = { capabilities = capabilities }
vim.lsp.enable('bashls')

vim.lsp.config["zls"] = { capabilities = capabilities }
vim.lsp.enable('zls')

vim.lsp.config["pyright"] = { capabilities = capabilities }
vim.lsp.enable('pyright')

vim.lsp.config['clangd'] = { capabilities = capabilities }
vim.lsp.enable('clangd')

vim.lsp.config['nil_ls'] = { capabilities = capabilities }
vim.lsp.enable('nil_ls')

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local conform = require("conform")

        local function jumpWithVirtLineDiags(jumpCount)
            pcall(vim.api.nvim_del_augroup_by_name, "jumpWithVirtLineDiags")
            vim.diagnostic.jump({ count = jumpCount })
            local initialVirtTextConf = vim.diagnostic.config().virtual_text
            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = { current_line = true },
            })
            vim.defer_fn(function()
                vim.api.nvim_create_autocmd("CursorMoved", {
                    once = true,
                    group = vim.api.nvim_create_augroup("jumpWithVirtLineDiags", {}),
                    callback = function()
                        vim.diagnostic.config({ virtual_lines = false, virtual_text = initialVirtTextConf })
                    end,
                })
            end, 1)
        end

        local bufopts = { noremap = true, silent = true, buffer = ev.buf }
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, bufopts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gr", fzflua.lsp_references, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", fzflua.lsp_implementations, bufopts)
        vim.keymap.set("n", "<space>k", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { expr = true })
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<space>ge", function() jumpWithVirtLineDiags(1) end, bufopts)
        vim.keymap.set("n", "<space>gE", function() jumpWithVirtLineDiags(-1) end, bufopts)
        vim.keymap.set("n", "<space>fo", function() conform.format({ lsp_fallback = true }) end, bufopts)
    end,
})

-- blink.cmp --
require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<Up>'] = {},
        ['<Down>'] = {},
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
    },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                fallbacks = { "lsp" },
            },
        },
    },
    signature = {
        enabled = true,
        window = { show_documentation = false },
    },
    cmdline = {
        completion = { menu = { auto_show = true } },
    },
    completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = {
            border = "single",
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
            winblend = 0,
            draw = {
                treesitter = { 'lsp' },
                columns = { { 'kind_icon' }, { 'label' } },
                components = {
                    kind_icon = {
                        ellipsis = false,
                        text = function(ctx)
                            local kind_icon = require('mini.icons').get('lsp', ctx.kind)
                            return kind_icon
                        end,
                        highlight = function(ctx)
                            local _, hl = require('mini.icons').get('lsp', ctx.kind)
                            return hl
                        end,
                    },
                },
            },
        },
        documentation = {
            auto_show = true,
            window = {
                border = 'single',
                max_width = 160,
                max_height = 30,
                winblend = 0,
                winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
            },
        },
    },
})

-- conform --
require('conform').setup({
    formatters_by_ft = {
        python = { "black" },
        haskell = { "fourmolu" },
        javascript = { "prettierd" },
        markdown = { "mdformat" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        json = { "jq" },
        bash = { "shfmt", "beautysh" },
        zsh = { "beautysh" },
    },
})

-- lint --
local lint = require('lint')
lint.linters_by_ft = { go = { "golangcilint" } }

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("lint", { clear = true }),
    callback = function() lint.try_lint() end,
})
vim.keymap.set("n", "<leader>li", function() lint.try_lint() end, { desc = "Trigger linting" })

-- dap --
local dap = require('dap')
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.expand("~/.local/share/nvim/mason/bin/codelldb"),
        args = { "--port", "${port}" },
    },
}
dap.configurations.c = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}
dap.configurations.cpp = dap.configurations.c

require('dap-view').setup({
    winbar = { controls = { enabled = true } },
    auto_toggle = true,
})

-- vimtex --
if vim.loop.os_uname().sysname == "Darwin" then
    vim.g.vimtex_view_method = 'sioyek'
else
    vim.g.vimtex_view_method = 'zathura'
end
vim.g.vimtex_quickfix_ignore_filters = { 'Overfull', 'Underfull' }
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
    out_dir = 'build',
    options = {
        "-verbose",
        "-shell-escape",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
    },
}
vim.g.vimtex_view_automatic = 1

-- typst-preview --
require('typst-preview').setup({
    extra_args = { "--font-path=fonts" },
    invert_colors = '{"rest": "auto","image": "never"}',
})

-- harpoon --
local harpoon = require('harpoon')
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

-- oil --
require('oil').setup({
    float = { preview_split = "right" },
})

local function open_oil_split()
    local width = math.floor(vim.o.columns * 0.2)
    vim.cmd("vsplit")
    vim.cmd(string.format("vertical resize %d", width))
    require("oil").open()
end

vim.keymap.set('n', '<leader>o', function() require("oil").open_float() end)
vim.keymap.set('n', '<leader>O', open_oil_split)

-- smart-splits --
local splits = require('smart-splits')
splits.setup()
vim.keymap.set('n', '<S-F5>', splits.resize_left)
vim.keymap.set('n', '<S-F6>', splits.resize_down)
vim.keymap.set('n', '<S-F7>', splits.resize_up)
vim.keymap.set('n', '<S-F8>', splits.resize_right)
vim.keymap.set('n', '<F5>', splits.move_cursor_left)
vim.keymap.set('n', '<F6>', splits.move_cursor_down)
vim.keymap.set('n', '<F7>', splits.move_cursor_up)
vim.keymap.set('n', '<F8>', splits.move_cursor_right)

-- git --
require('blame').setup()
require('todo-comments').setup()
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

-- dev plugins --
vim.cmd.packadd("osc11.nvim")
require('osc11').setup({
    on_dark = function()
        require('onedark').setup({ style = 'dark' })
        require('onedark').load()
    end,
    on_light = function()
        require('onedark').setup({ style = 'light' })
        require('onedark').load()
    end,
})

vim.cmd.packadd("worktrees.nvim")
require('worktrees').setup({
    mappings = {
        create = "<leader>wtc",
        delete = "<leader>wtd",
        switch = "<leader>wts",
    },
})

-- winbar --

function RenderWinbar()
    local path = vim.fs.normalize(vim.fn.expand '%:p' --[[@as string]])

    if vim.startswith(path, 'diffview') then
        return string.format('%%#Winbar#%s', path)
    end

    local separator = ' %#WinbarSeparator# '

    local prefix, prefix_path = '', ''
    local folder_icon = ''

    if vim.api.nvim_win_get_width(0) < math.floor(vim.o.columns / 3) then
        path = vim.fn.pathshorten(path)
    else
        local special_dirs = {
            DOTFILES = vim.env.XDG_CONFIG_HOME,
            GITS = vim.env.HOME .. '/gits',
            HOME = vim.env.HOME,
            PROJECTS = vim.env.HOME .. '/projects',
        }
        for dir_name, dir_path in pairs(special_dirs) do
            if vim.startswith(path, vim.fs.normalize(dir_path)) and #dir_path > #prefix_path then
                prefix, prefix_path, folder_icon = dir_name, dir_path, MiniIcons.get('file', path)
            end
        end
        if prefix ~= '' then
            path = path:gsub('^' .. prefix_path, '')
            prefix = string.format('%%#WinBarFile#%s %s%s', folder_icon, prefix, separator)
        end
    end

    path = path:gsub('^/', '')

    vim.api.nvim_set_hl(0, "Winbar", { link = "Normal" })
    vim.api.nvim_set_hl(0, "WinbarSeparator", { link = "Normal" })
    vim.api.nvim_set_hl(0, "WinBarFile", { link = "Normal" })

    return table.concat {
        ' ',
        prefix,
        table.concat(
            vim.iter(vim.split(path, '/'))
            :map(function(segment)
                return string.format('%%#Winbar#%s', segment)
            end)
            :totable(),
            separator
        ),
    }
end

vim.api.nvim_create_autocmd('BufWinEnter', {
    group = vim.api.nvim_create_augroup('afonso/winbar', { clear = true }),
    desc = 'Attach winbar',
    callback = function(args)
        if
            not vim.api.nvim_win_get_config(0).zindex
            and vim.bo[args.buf].buftype == ''
            and vim.api.nvim_buf_get_name(args.buf) ~= ''
            and not vim.wo[0].diff
        then
            vim.wo.winbar = "%{%v:lua.RenderWinbar()%}"
        end
    end,
})
