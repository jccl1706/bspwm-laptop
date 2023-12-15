-- set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local keymap = vim.keymap -- for conciseness

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true

-- use spaces for tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- pane Navegation
keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Navigate Left" }) -- Navigate Left
keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Navigate Down" }) -- Navigate Down
keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Navigate Up" }) -- Navigate Up
keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Navigate Right" }) -- Navigate Right

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
