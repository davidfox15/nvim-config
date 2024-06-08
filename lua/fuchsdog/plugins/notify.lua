return {
  "rcarriga/nvim-notify",
	enabled = false,
  -- Уточнить работает ли это
  opts = {
    timeout = 500,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
  config = function()
    require("notify").setup({
      background_colour = "#000000",
    })
    vim.notify = require("notify")
    vim.keymap.set("n", "<leader>fn", ":Telescope notify<CR>", { desc = "Telescope notify" })
  end,
}
