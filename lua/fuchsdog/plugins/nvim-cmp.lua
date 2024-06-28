return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local luasnip = require("luasnip")
		local cmp = require("cmp")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			},
			-- formatting = cmp_format,
			mapping = cmp.mapping.preset.insert({
				["<C-q>"] = cmp.mapping.complete(),
				["<C-y>"] = cmp.mapping.confirm(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				-- Navigate between snippet placeholder
				-- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
				-- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
			}),
		})
	end,
}
