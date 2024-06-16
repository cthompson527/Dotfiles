-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

wk.register({
  o = {
    name = "+open",
  },
}, { prefix = "<leader>" })

-- windows
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit, { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>ws", vim.cmd.split, { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Focus Left Window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Focus Down Window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Focus Up Window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Focus Right Window" })
vim.keymap.set("n", "<leader>wd", "<C-w>q", { desc = "Focus Up Window" })
vim.keymap.set("n", "<leader>wm", ":Maximize<CR>", { desc = "Maximize Window" })

-- Files
vim.keymap.set("n", "<leader>o-", vim.cmd.Oil, { desc = "File Explorer" })

-- Resize window using <Alt> arrow keys
vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffers
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next Buffer" })

-- files
vim.keymap.set("n", "<leader>fs", ":wa<CR>", { desc = "Save All Files" })

-- visual mode --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "jk", "<ESC>")
-- end visual mmode --

-- insert mode --
vim.keymap.set("i", "jk", "<Esc>")
-- end insert mode --
