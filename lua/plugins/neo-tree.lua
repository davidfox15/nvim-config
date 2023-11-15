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
		{ "<leader>pp", "<cmd>:Neotree dir=./<cr>", desc = "Neo-tree" },
		{ "<leader>pf", "<cmd>:Neotree reveal=true<cr>", desc = "Neo-tree current path" },
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
