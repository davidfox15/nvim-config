return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "tabs",
				-- separator_style = 'slant',
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				-- color_icons = true,
			},
		})
		vim.keymap.set("n", "<leader>tn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })
		vim.keymap.set("n", "<leader>tN", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev tab" })
	end,
}
