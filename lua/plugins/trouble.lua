return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>",                       desc = "Trouble" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble workspace diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Trouble document diagnostics" },
  },
  opts = {
    action_keys = {
      close = { "q", "<esc>" },
      cancel = "<c-e>",
    },
  },
}
