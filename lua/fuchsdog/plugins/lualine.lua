return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function show_codeium_status()
			return "{…}" .. vim.fn["codeium#GetStatusString"]()
		end

		-- Добавляем кастомный компонент для Fugitive
		local function fugitive_status()
			return vim.fn.FugitiveStatusline() or "" -- Получаем статус Git от fugitive
		end

		local colors = {
			bg = "#202328",
			fg = "#bbc2cf",
			yellow = "#ECBE7B",
			cyan = "#008080",
			darkblue = "#081633",
			green = "#98be65",
			orange = "#FF8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#51afef",
			red = "#ec5f67",
		}
		require("lualine").setup({
			options = {
				-- theme = "dracula",
				theme = "auto",
				component_separators = { left = "|", right = "|" },
			},
			sections = {
				lualine_a = {
					-- {
					-- 	"mode",
					-- 	fmt = function(str)
					-- 		return str:sub(1, 1)
					-- 	end,
					-- },
				},
				lualine_b = {
					-- fugitive_status,
					"branch",
				},
				-- lualine_b = { "branch" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						-- Displays diagnostics for the defined severity types
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = " ", warn = " ", info = " " },
						diagnostics_color = {
							error = { fg = colors.red },
							warn = { fg = colors.yellow },
							info = { fg = colors.cyan },
						},
						update_in_insert = false, -- Update diagnostics in insert mode.
						always_visible = false, -- Show diagnostics even if there are none.
					},
					"progress",
				},
				lualine_y = {
					-- show_codeium_status,
					-- "diff",
				},
				lualine_z = {},
				-- lualine_z = { "location" },
			},
		})
	end,
}
