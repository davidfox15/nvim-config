return {
	"hrsh7th/nvim-cmp",
	dependencies = { "hrsh7th/nvim-cmp" },
	opts = {
		preselect = "none",
		completion = {
			completeopt = "menu,menuone,noinsert,noselect",
		},
		mapping = require("cmp").mapping.preset.insert({
			["<S-Tab>"] = require("cmp").mapping.select_prev_item(), -- previous suggestion
			["<Tab>"] = require("cmp").mapping.select_next_item(), -- next suggestion
			["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
			["<C-f>"] = require("cmp").mapping.scroll_docs(4),
			["<C-Tab>"] = require("cmp").mapping.complete(), -- show completion suggestions
			["<C-e>"] = require("cmp").mapping.abort(), -- close completion window
			["<S-CR>"] = require("cmp").mapping.confirm({ select = true }),
			["<CR>"] = require("cmp").mapping.confirm({ select = false }),
			["<C-L>"] = require("cmp").mapping.complete(),
		}),
	},

	config = function(_, opts)
		for _, source in ipairs(opts.sources) do
			source.group_index = source.group_index or 1
		end
		local cmp = require("cmp")
		cmp.setup(opts)

		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
