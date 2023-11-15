return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local Rule = require("nvim-autopairs.rule")
		local npairs = require("nvim-autopairs")

		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "vim" },
		})

		local cond = require("nvim-autopairs.conds")

		npairs.add_rules({
			Rule("<", "", "-vim"):with_pair(cond.not_before_regex("/")),
		})
	end,
}
