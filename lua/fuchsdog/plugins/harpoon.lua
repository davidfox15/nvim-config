return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>hm",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			desc = "Add harpoon mark",
		},
		{
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			desc = "Go to next harpoon mark",
		},
		{
			"<leader>hN",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			desc = "Go to previous harpoon mark",
		},
		{
			"<leader>hh",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			desc = "Toggle harpoon menu",
		},
	},
	config = function()
		require("harpoon").setup({
			menu = {
				width = math.ceil(vim.api.nvim_win_get_width(0) * 0.75),
			},
		})
	end,
}
