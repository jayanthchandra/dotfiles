vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Movement
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- File Operation
vim.keymap.set("n","<C-q>",":q!<CR>", { desc = "Quit" })
vim.keymap.set("n","<C-s>",":w<CR>", { silent = true, desc = "Save" })
vim.keymap.set("n","<C-a>","ggVG$", { silent = true, desc = "Select all" })
-- Buffer Movements
vim.keymap.set("n","<leader>bn",":bn<CR>", { desc = "Buffer Next" })
vim.keymap.set("n","<leader>bp",":bp<CR>", { desc = "Buffer Previous" })
vim.keymap.set("n","<leader>bd",":bd<CR>", { desc = "Buffer Delete" })
-- Move text in Visual Mode
vim.keymap.set("x","J",":move '>+1<CR>gv-gv", { desc = "Move block down"})
vim.keymap.set("x","K",":move '<-2<CR>gv-gv", { desc = "Move block up"})
-- Terminal Mode
vim.keymap.set("t","<esc>",[[<C-\><C-n>]], { desc = "Escape mode" })
