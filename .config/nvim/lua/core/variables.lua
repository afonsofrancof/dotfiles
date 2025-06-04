-- Set the leader key
vim.g.mapleader = " "

-- Appearance
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.wrap = false        -- Disable line wrapping
vim.opt.conceallevel = 2    -- Hide Org mode links (assuming you use Org mode)
vim.opt.concealcursor = 'nc' -- Conceal text in normal mode only
vim.opt.signcolumn = "yes"  -- Always show the sign column
vim.o.laststatus = 1        -- Always show the status line (Note: original had '1', consider '2' for always visible)
vim.o.winborder = nil       -- Use default border for floating windows

-- Indentation
vim.opt.tabstop = 4      -- Number of spaces a tab represents
vim.opt.softtabstop = 4  -- Number of spaces a <Tab> in Insert mode equals
vim.opt.shiftwidth = 4   -- Number of spaces to use for autoindent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting

-- Searching
vim.opt.hlsearch = false    -- Disable highlighting of search matches
vim.opt.incsearch = true    -- Show partial matches while typing

-- Behavior and Navigation
vim.opt.iskeyword:append("_") -- Add '_' to the list of keyword characters
vim.opt.scrolloff = 10        -- Keep 10 lines above/below cursor when scrolling
vim.opt.sidescrolloff = 10
vim.opt.smoothscroll = true

-- File Management
vim.opt.undodir = os.getenv("XDG_STATE_HOME") .. "/nvim/undodir" -- Directory for undo files
vim.opt.undofile = true                                         -- Save undo history
vim.opt.backup = true                                           -- Create backup files
vim.opt.backupdir = os.getenv("XDG_STATE_HOME") .. "/nvim/backupdir" -- Directory for backup files
vim.opt.autoread = true                                         -- Automatically reload changed files
vim.opt.swapfile = false                                        -- Disable swap files

-- Formatting
vim.opt.formatoptions:remove("ro") -- Remove 'ro' from formatoptions (assuming you don't want auto-wrapping comments)
