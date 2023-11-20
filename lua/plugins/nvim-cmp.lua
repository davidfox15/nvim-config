return {
	"hrsh7th/nvim-cmp",
	dependencies = { "hrsh7th/nvim-cmp" },
	opts = {
		mapping = require("cmp").mapping.preset.insert({
			["<S-Tab>"] = require("cmp").mapping.select_prev_item(), -- previous suggestion
			["<Tab>"] = require("cmp").mapping.select_next_item(), -- next suggestion
			["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
			["<C-f>"] = require("cmp").mapping.scroll_docs(4),
			["<C-Tab>"] = require("cmp").mapping.complete(), -- show completion suggestions
			["<C-e>"] = require("cmp").mapping.abort(), -- close completion window
			["<CR>"] = require("cmp").mapping.confirm({ select = false }),
		}),
	},
}
