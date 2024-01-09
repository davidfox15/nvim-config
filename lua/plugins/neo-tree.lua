return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		vim.keymap.set("n", "<leader>e", ":Neotree<CR>", { desc = "Neotree" }),
		vim.keymap.set("n", "<leader>E", ":Neotree reveal=true<cr>", { desc = "Neotree path" }),
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "float",
				mappings = {
					["<space>"] = "",
					["h"] = "close_node",
					["l"] = "open",
				},
			},
		})
	end,
}
