require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("i", "jj", "<Esc>", opts)
keymap("n", "<leader>hk", ":vsplit ~/.vim/hotkeys<CR>", opts)
keymap("n", "<leader><leader>u", ":UndotreeToggle<CR>", opts)
keymap("n", "gt", ":tabnext<CR>", opts)
keymap("n", "gT", ":tabprev<CR>", opts)
keymap("n", "t", ":tabnew<CR>", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("n", ";", ":", { noremap = true })
keymap("v", ";", ":", { noremap = true })
keymap("n", "Y", "y$", opts)

keymap("n", "bn", ":bn<CR>", opts)
keymap("n", "bp", ":bp<CR>", opts)
keymap("n", "b^", ":b#<CR>", opts)
keymap("n", "bk", ":bd<CR>", opts)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- split nav
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover info" })
