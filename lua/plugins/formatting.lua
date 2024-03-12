return {
	"stevearc/conform.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	opts = {},
	config = function()
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

		require("conform").setup({
			formatters_by_ft = {
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				graphql = { { "prettierd", "prettier" } },
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
			},
			format_on_save = function(bufnr)
				if vim.g.auto_format then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
		})

		vim.keymap.set("n", "<space>tf", function()
			if vim.g.auto_format then
				vim.g.auto_format = false
				vim.notify("Document format off", "info", { title = "conform.nvim" })
			else
				vim.g.auto_format = true
				vim.notify("Document format on", "info", { title = "conform.nvim" })
			end
		end, { desc = "Toggle formatting on save" })

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				vim.notify("Document format", "info", { title = "conform.nvim" })
				require("conform").format({ bufnr = args.buf })
			end,
		})

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "format" })
	end,
}
