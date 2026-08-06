-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
local neogit = require("neogit")

wk.add({
  mode = { "n", "v" },
  { "<leader>o", group = "open" },
  { "<leader>h", group = "harpoon" },
  { "<leader>p", group = "project" },
  { "<leader>g", group = "git" },
})

-- windows
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit, { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>ws", vim.cmd.split, { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Focus Left Window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Focus Down Window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Focus Up Window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Focus Right Window" })
vim.keymap.set("n", "<leader>wd", "<C-w>q", { desc = "Focus Up Window" })
vim.keymap.set("n", "<leader>wm", "<cmd>Maximize<cr>", { desc = "Maximize Window" })

-- Files
vim.keymap.set("n", "<leader>o-", vim.cmd.Oil, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>oe", "<cmd>Neotree current<cr>", { desc = "NeoTree" })
vim.keymap.set("n", "<leader>ob", "<cmd>Neotree current buffers<cr>", { desc = "NeoTree Buffers" })

-- Resize window using <Alt> arrow keys
vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Git
vim.keymap.set("n", "<leader>gg", function()
  neogit.open({ cwd = "%:p:h" })
end, { desc = "Open Neogit" })
vim.keymap.set("n", "<leader>gG", neogit.open, { desc = "Open Neogit (CWD)" })

-- buffers
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- files
vim.keymap.set("n", "<leader>fs", "<cmd>wa<cr>", { desc = "Save All Files" })

-- vimux
vim.keymap.set("n", "<leader>pp", "<cmd>VimuxPromptCommand<cr>", { desc = "Vimux Prompt" })
vim.keymap.set("n", "<leader>pr", "<cmd>VimuxRunLastCommand<cr>", { desc = "Vimux Re-Run" })
vim.keymap.set("n", "<leader>pi", "<cmd>VimuxInspectRunner<cr>", { desc = "Vimux Inspect" })

-- visual mode --
vim.keymap.set("v", "K", "<cmd>m '<-2<cr>gv=gv")
vim.keymap.set("v", "J", "<cmd>m '>+1<cr>gv=gv")
vim.keymap.set("v", "jk", "<ESC>")
-- end visual mmode --

-- insert mode --
vim.keymap.set("i", "jk", "<Esc>")
-- end insert mode --

-- neogit --
local neogit = require("neogit")
vim.keymap.set("n", "<leader>gg", neogit.open, { desc = "Open Git" })

vim.keymap.set("n", "<leader>pp", "<cmd>VimuxPromptCommand<cr>", { desc = "Vimux Prompt Command" })
vim.keymap.set("n", "<leader>pr", "<cmd>VimuxRunLastCommand<cr>", { desc = "Vimux Run Last Command" })
vim.keymap.set("n", "<leader>pi", "<cmd>VimuxInspectRunner<cr>", { desc = "Vimux Inspect Runner" })

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Harpoon Mark" })
vim.keymap.set("n", "<leader>H", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon List" })
vim.keymap.set("n", "<leader>hh", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon List" })

vim.keymap.set("n", "<leader>h1", function()
  harpoon:list():select(1)
end, { desc = "Harpoon Select 1" })
vim.keymap.set("n", "<leader>h2", function()
  harpoon:list():select(2)
end, { desc = "Harpoon Select 2" })
vim.keymap.set("n", "<leader>h3", function()
  harpoon:list():select(3)
end, { desc = "Harpoon Select 3" })
vim.keymap.set("n", "<leader>h4", function()
  harpoon:list():select(4)
end, { desc = "Harpoon Select 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function()
  harpoon:list():prev()
end, { desc = "Harpoon Previous Buffer" })
vim.keymap.set("n", "<leader>hn", function()
  harpoon:list():next()
end, { desc = "Harpoon Next Buffer" })
vim.keymap.set("n", "<leader>hc", function()
  harpoon:list():clear()
end, { desc = "Harpoon Clear" })

-- Make copy/paste work in Neovide
if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
