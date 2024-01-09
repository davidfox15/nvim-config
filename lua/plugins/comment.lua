return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	keys = {
		{ "<leader>/", "<Plug>ContextCommentaryline", desc = "Comment line", noremap = true },
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			-- for commenting tsx and jsx files
			pre_hook = ts_context_commentstring.create_pre_hook(),

			mappings = {
				basic = true,
				extra = false,
			},

			toggler = {
				line = "<leader>/",
				block = "<leader>?",
			},

			opleader = {
				line = "<leader>/",
				block = "<leader>?",
			},
		})
	end,
}
