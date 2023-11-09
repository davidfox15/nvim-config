return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "tabs",
			-- separator_style = "slant",
			always_show_bufferline = false,
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
		},
	},
	keys = {
		-- new empty tab
		{
			"tn",
			":tabedit<CR>",
			desc = "New tab",
		},
		-- new duplicate current tab
		{
			"td",
			":tabedit %:p<CR>",
			desc = "Duplicate tab",
		},
		{
			"tc",
			":tabclose<CR>",
			desc = "Close tab",
		},
		{
			"tn",
			"<cmd>BufferLineCycleNext<cr>",
			desc = "Next tab",
		},
		{
			"tN",
			"<cmd>BufferLineCyclePrev<cr>",
			desc = "Prev tab",
		},
	},
}
