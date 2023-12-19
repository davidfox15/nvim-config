return {
	"folke/tokyonight.nvim",
	opts = {
		style = "moon",
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
		on_colors = function(colors)
			-- colors.hint = colors.orange
			-- colors.error = "#ff0000"
			colors.border = colors.orange
		end,
	},
}
