local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    p = {
        name = "+project",
        R = { ":OverseerRun<CR>", "Project Run" },
    },
  },
})

