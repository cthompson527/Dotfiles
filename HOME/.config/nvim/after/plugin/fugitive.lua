local wk = require("which-key")

wk.register({
    ["<leader>"] = {
        g = {
            name = "+git",
            b = { ":Git blame<CR>", "Git blame"  },
        }
    }
})

vim.opt.diffopt:append("vertical")

