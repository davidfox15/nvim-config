return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble workspace diagnostics" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble document diagnostics" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble quickfix" },
		{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Trouble Todo" },
	},
	opts = {
		action_keys = {
			close = { "q", "<esc>" },
			cancel = "<c-e>",
		},
	},
}
