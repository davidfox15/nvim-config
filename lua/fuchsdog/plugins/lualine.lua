return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function show_codeium_status()
			return "{…}" .. vim.fn["codeium#GetStatusString"]()
		end
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						-- Displays diagnostics for the defined severity types
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " },
						update_in_insert = false, -- Update diagnostics in insert mode.
						always_visible = false, -- Show diagnostics even if there are none.
					},
				},
				lualine_y = {
					show_codeium_status,
					"diff",
				},
				lualine_z = { "location" },
			},
		})
	end,
}
