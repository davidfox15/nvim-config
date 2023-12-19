return {
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
		},
	},
	-- animations
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}
		end,
	},
	-- buffer line
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = function()
			return {
				options = {
					mode = "tabs",
					-- separator_style = "slant",
					always_show_bufferline = false,
					show_buffer_close_icons = false,
					show_close_icon = false,
					color_icons = true,
				},
			}
		end,
		keys = function()
			return {
				-- new empty tab
				{
					"<leader><Tab>n",
					":tabedit<CR>",
					desc = "New tab",
				},
				-- new duplicate current tab
				{
					"<leader><Tab>c",
					":tabedit %:p<CR>",
					desc = "Duplicate tab",
				},
				{
					"<leader><Tab>q",
					":tabclose<CR>",
					desc = "Close tab",
				},
				{
					"<leader><Tab>k",
					"<cmd>BufferLineCycleNext<cr>",
					desc = "Next tab",
				},
				{
					"<leader><Tab>j",
					"<cmd>BufferLineCyclePrev<cr>",
					desc = "Prev tab",
				},
			}
		end,
	},
}
