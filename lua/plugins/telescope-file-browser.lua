return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<CR>", {})

		-- open file_browser with the path of the current buffer
		vim.api.nvim_set_keymap("n", "<space>fB", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {})
	end,
}
