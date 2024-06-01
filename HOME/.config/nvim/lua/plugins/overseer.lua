return {
  'stevearc/overseer.nvim',
  event = "VeryLazy",
  config = function() 
    require('overseer').setup() 

    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        p = {
          name = "+project",
          R = { ":OverseerRun<CR>", "Project Run" },
          t = { ":OverseerToggle<CR>", "Overseer Toggle" },
        },
      },
    })
  end,
}

