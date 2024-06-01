return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function maximize_status()
      return vim.t.maximized and '   ' or ''
    end

    require('lualine').setup(
    {
      sections = {
        lualine_c = { maximize_status }
      }
    }
    )
  end,
}

