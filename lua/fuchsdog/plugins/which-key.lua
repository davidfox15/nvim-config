return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local wk = require("which-key")
		wk.register({
			d = {
				name = "Debug",
			},
			t = {
				name = "Toggles",
			},
			g = {
				name = "Git",
			},
			f = {
				name = "Telescope",
			},
			c = {
				name = "Code actions",
				i = {
					name = "Imports actions",
				},
			},
			b = {
				name = "Buffer actions",
			},
			h = {
				name = "Harpoon / Hunk",
			},
		}, { prefix = "<leader>" })
	end,
}
