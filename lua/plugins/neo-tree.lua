return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		position = "current",
	},
	keys = {
		{ "<leader>fe", "<cmd>:Neotree dir=./<cr>", desc = "Explorer neo-tree (cwd)" },
		{ "<leader>fE", "<cmd>:Neotree reveal=true<cr>", desc = "Explorer neo-tree current path" },
		{ "<leader>e", false },
		{ "<leader>E", false },
		{ "<leader>ge", false },
		{ "<leader>be", false },
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "float",
				mappings = {
					["h"] = "close_node",
					["l"] = "open",
				},
			},
		})
	end,
}
