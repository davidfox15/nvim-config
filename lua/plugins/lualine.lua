return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    return {
      options = {
        theme = "dracula",
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            -- Displays diagnostics for the defined severity types
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " },
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false, -- Show diagnostics even if there are none.
          },
        },

        lualine_y = { "diff" },
        lualine_z = { "location" },
      },
    }
  end,
}
