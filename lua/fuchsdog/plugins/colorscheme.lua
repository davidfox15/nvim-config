return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		enable = true,
		config = function()
			local palette = require("rose-pine.palette")
			require("rose-pine").setup({
				highlight_groups = {
					Visual = { fg = palette.love },
				},
			})

			vim.cmd("colorscheme rose-pine")

			vim.api.nvim_set_hl(0, "IlluminatedWordText", { fg = "#50ab59", underline = true })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = "#50ab59", underline = true })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { fg = "#50ab59", underline = true })
		end,
	},
	{
		"catppuccin/nvim",
		enabled = false,
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- local colors = require("catppuccin.palettes").get_palette()
			-- colors.none = "NONE"
			require("catppuccin").setup({
				-- 	flavour = "frappe",
				-- transparent_background = true,
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
			})
			-- vim.cmd.colorscheme("catppuccin-macchiato")
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
			-- vim.cmd.colorscheme("solarized-osaka")
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- storm dark
			-- day light
			-- vim.cmd.colorscheme("tokyonight-storm")
		end,
	},
}
