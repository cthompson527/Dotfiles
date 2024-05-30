local wk = require("which-key")

wk.register({
    ["<leader>"] = {
        g = {
            name = "+git",
            g = { ":LazyGit<CR>", "Git status" },
        }
    }
})

