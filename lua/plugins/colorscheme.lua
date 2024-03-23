return {
	{
		"catppuccin/nvim",
		enabled = true,
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- local colors = require("catppuccin.palettes").get_palette()
			-- colors.none = "NONE"
			-- require("catppuccin").setup({
			-- 	flavour = "frappe",
			-- 	transparent_background = true,
			-- 	custom_highlights = {
			-- 		Comment = { fg = colors.overlay1 },
			-- 		LineNr = { fg = colors.overlay1 },
			-- 		CursorLine = { bg = colors.none },
			-- 		CursorLineNr = { fg = colors.lavender },
			-- 		DiagnosticVirtualTextError = { bg = colors.none },
			-- 		DiagnosticVirtualTextWarn = { bg = colors.none },
			-- 		DiagnosticVirtualTextInfo = { bg = colors.none },
			-- 		DiagnosticVirtualTextHint = { bg = colors.none },
			-- 	},
			-- })
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
		config = function(_, opts)
			require("solarized-osaka").setup(opts)
			vim.cmd.colorscheme("solarized-osaka")
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
