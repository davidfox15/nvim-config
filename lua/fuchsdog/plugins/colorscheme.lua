return {
	{
		"rose-pine/neovim",
		enabled = true,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				palette = {
					-- Override the builtin palette per variant
					-- moon = {
					--     base = '#18191a',
					--     overlay = '#363738',
					-- },
				},

				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- VertSplit = { fg = "muted", bg = "muted" },
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.pine then
					--     highlight.fg = palette.foam
					-- end
				end,
			})

			vim.cmd("colorscheme rose-pine")
			-- vim.cmd("colorscheme rose-pine-main")
			-- vim.cmd("colorscheme rose-pine-moon")
			-- vim.cmd("colorscheme rose-pine-dawn")

			vim.cmd.colorscheme("rose-pine")

			vim.api.nvim_set_hl(0, "IlluminatedWordText", { fg = "#50ab59", underline = true })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = "#50ab59", underline = true })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { fg = "#50ab59", underline = true })
		end,
	},
	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		config = function()
			-- local colors = require("catppuccin.palettes").get_palette()
			-- colors.none = "NONE"
			require("catppuccin").setup({
				show_end_of_buffer = true,
				-- flavour = "frappe",
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
				-- },
			})
			vim.cmd.colorscheme("catppuccin-mocha")
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
