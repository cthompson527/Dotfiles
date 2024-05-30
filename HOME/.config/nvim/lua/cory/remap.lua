local wk = require("which-key")

-- normal mode --
wk.register({
    ["<leader>"] = {
        w = {
            name = "+window",
            v = { vim.cmd.vsplit, "Vertical Split"     },
            s = { vim.cmd.split,  "Horizontal Split"   },
            h = { "<C-w>h",       "Focus Left Window"  },
            j = { "<C-w>j",       "Focus Down Window"  },
            k = { "<C-w>k",       "Focus Up Window"    },
            l = { "<C-w>l",       "Focus Right Window" },
            d = { "<C-w>q",       "Close Window"       },
        },
        p = {
            name = "+project",
            v = { vim.cmd.Ex,   "File Explorer" },
            s = { vim.cmd.wall, "Save All"      },
        },
        o = {
            name = "+open",
            ["-"] = { vim.cmd.Ex,   "File Explorer" },
        },
        b = {
            name = "+buffers",
            d = { vim.cmd.bdelete,   "Delete Buffer"   },
            n = { vim.cmd.bnext,     "Next Buffer"     },
            p = { vim.cmd.bprevious, "Previous Buffer" },
        },
    },
})
-- end normal mode --

-- visual mode --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- end visual mmode --

-- insert mode --
vim.keymap.set("i", "jk", "<Esc>")
-- end insert mode --

