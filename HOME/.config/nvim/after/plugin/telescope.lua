local wk = require("which-key")
local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>sp', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<leader>hk', builtin.keymaps, {})

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

