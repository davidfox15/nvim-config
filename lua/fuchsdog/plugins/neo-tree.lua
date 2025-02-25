return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		vim.keymap.set("n", "<leader>E", ":Neotree<CR>", { desc = "Neotree" }),
		vim.keymap.set("n", "<leader>e", ":Neotree reveal=true<cr>", { desc = "Neotree path" }),
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
			close_if_last_window = true,
			window = {
				position = "float",
				width = 60,
				mappings = {
					-- ["<esc>"] = "close_window",
					["<space>"] = "",
					["h"] = "close_node",
					["l"] = "open",
				},
			},
		})
	end,
}
