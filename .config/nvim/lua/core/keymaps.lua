--Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--quickfix keybinds
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
--buffer keybinds
vim.keymap.set("n", "<A-h>", "<cmd>bp<CR>")
vim.keymap.set("n", "<A-l>", "<cmd>bn<CR>")
--jk as escape
vim.keymap.set("i", "jk","<esc>")
-- Copy to system clipboard
vim.keymap.set({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
-- Paste from system clipboard in normal mode
vim.keymap.set('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })
-- Paste from system clipboard in visual mode without overwriting the clipboard
vim.keymap.set('x', 'gp', '"+P', { desc = 'Paste from system clipboard' })
--Center screen after some motions
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Center cursor after moving down half-page"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Center cursor after moving down half-page"})
vim.keymap.set("n", "G", "Gzz", {desc = "Center cursor after moving down half-page"})
--Run lua stuff (ty teej)
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
