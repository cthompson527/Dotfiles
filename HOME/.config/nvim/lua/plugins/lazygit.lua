return {
  "kdheepak/lazygit.nvim",
  requires = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("telescope").load_extension("lazygit")

    local wk = require("which-key")

    wk.register({
      ["<leader>"] = {
        g = {
          name = "+git",
          g = { ":LazyGit<CR>", "Git status" },
        }
      }
    })
  end,
}

