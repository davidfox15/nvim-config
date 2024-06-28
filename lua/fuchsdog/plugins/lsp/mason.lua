return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = { "tsserver", "html", "cssls", "tailwindcss", "rust_analyzer", "lua_ls" },
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd", -- prettier formatter
				"eslint_d", -- js linter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"rustfmt",
				"stylelint",
			},
		})
	end,
}
