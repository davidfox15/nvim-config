return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>"] = {
				g = {
					name = "Git",
					f = {
						name = "Telescope git",
					},
				},
				f = {
					name = "Telescope",
				},
				h = {
					name = "Harpoon",
				},
				t = {
					name = "Tabs",
				},
				n = {
					"no",
				},
				p = {
					name = "Explorer",
				},
				c = {
					name = "Code",
				},
				s = {
					name = "size",
				},
			},
		})
	end,
}
