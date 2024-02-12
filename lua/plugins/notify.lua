return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#000000",
		})
		vim.notify = require("notify")
		vim.keymap.set("n", "<leader>fn", ":Telescope notify<CR>", { desc = "Telescope notify" })
	end,
}
