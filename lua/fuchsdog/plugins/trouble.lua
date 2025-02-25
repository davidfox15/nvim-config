return {
	"folke/trouble.nvim",
	opts = {
		action_keys = {
			close = { "q", "<esc>" },
			cancel = "<c-e>",
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xf",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble close<cr>",
			desc = "Close (Trouble)",
		},
	},
	config = function()
		require("trouble").setup({
			auto_close = true, -- auto close when there are no items
			focus = true, -- Focus the window when opened
		})

		vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "none" })
	end,
}
