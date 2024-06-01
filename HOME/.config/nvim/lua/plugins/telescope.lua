return {
  'nvim-telescope/telescope.nvim', 
  version = '0.1.6',
  dependencies = {'nvim-lua/plenary.nvim'},
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    local builtin = require('telescope.builtin')

    wk.register({
      ["<leader>"] = {
        s = {
          name = "+search",
          f = { builtin.find_files, "Search Files"     },
          p = { builtin.live_grep,  "Search Project"   },
          b = { builtin.buffers,    "Search Buffers"   },
          h = { builtin.help_tags,  "Search Help Tags" },
          k = { builtin.keymaps,    "Search Keymaps"   },
        },
      },
    })
  end
}

