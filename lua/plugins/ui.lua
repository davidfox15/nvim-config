return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = function()
      return {
        options = {
          mode = "tabs",
          -- separator_style = "slant",
          always_show_bufferline = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          color_icons = true,
        },
      }
    end,
    keys = function()
      return {
        -- new empty tab
        {
          "<leader><Tab>n",
          ":tabedit<CR>",
          desc = "New tab",
        },
        -- new duplicate current tab
        {
          "<leader><Tab>c",
          ":tabedit %:p<CR>",
          desc = "Duplicate tab",
        },
        {
          "<leader><Tab>q",
          ":tabclose<CR>",
          desc = "Close tab",
        },
        {
          "<leader><Tab>k",
          "<cmd>BufferLineCycleNext<cr>",
          desc = "Next tab",
        },
        {
          "<leader><Tab>j",
          "<cmd>BufferLineCyclePrev<cr>",
          desc = "Prev tab",
        },
      }
    end,
  },
  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
}
