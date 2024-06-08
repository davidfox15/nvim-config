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
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>xf",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{
			"gt",
			"<cmd>Trouble lsp_type_definitions togg<cr>",
			desc = "Type defenition (Trouble)",
		},
		{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Trouble Todo" },
		{
			"<leader>xq",
			"<cmd>Trouble close<cr>",
			desc = "Close (Trouble)",
		},
		-- { "gr", "<cmd>TroubleToggle lsp_references<cr>", desc = "Trouble lsp_references" },
		-- 		{ "<lead>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble workspace diagnostics" },
		-- 		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble document diagnostics" },
		-- 		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble quickfix" },
	},
	config = function()
		require("trouble").setup({
			-- auto_close = true, -- auto close when there are no items
			focus = true, -- Focus the window when opened
		})
	end,
}
