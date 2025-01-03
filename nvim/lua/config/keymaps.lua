vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Movement
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- delete single character without copying into register
keymap.set("n", "x", '"_x')
keymap.set("n", "d", '"_d')
-- Toggle Numbers
keymap.set("n", "<leader>ln", "<cmd>set nu!<CR>", { desc = "Toggle Line number" })
keymap.set("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle Relative number" })
-- File Operation
keymap.set("n", "<C-q>", ":q!<CR>", { desc = "Quit" })
keymap.set("n", "<C-s>", ":w<CR>", { silent = true, desc = "Save" })
keymap.set("n", "<C-a>", "ggVG$", { silent = true, desc = "Select all" })
-- Increment/Decrement
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment Number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement Number" })
-- Move text in Visual Mode
keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move block down" })
keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move block up" })
-- Buffer Movements
keymap.set("n", "<Tab>", ":bn<CR>", { desc = "Buffer Next " })
keymap.set("n", "<S-Tab>", ":bp<CR>", { desc = "Buffer Previous" })
-- Terminal Mode
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Terminal Escape mode" })
-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close current split window" })
