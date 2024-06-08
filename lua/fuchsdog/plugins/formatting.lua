return {
	"stevearc/conform.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mfussenegger/nvim-lint",
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
			format_on_save = function()
				if vim.g.auto_format then
					return { timeout_ms = 500, lsp_fallback = true }
				end
			end,
		})

		vim.api.nvim_create_user_command("FormatingToggle", function()
			if vim.g.auto_format then
				vim.g.auto_format = false
			else
				vim.g.auto_format = true
			end
			vim.notify("autoformat-on-save " .. tostring(vim.g.auto_format), "info", { title = "conform.nvim" })
		end, {
			desc = "Toggle autoformat-on-save",
		})

		vim.keymap.set("n", "<space>tf", function()
			vim.cmd("FormatingToggle")
		end, { desc = "Toggle formatting on save" })

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({ async = true, lsp_fallback = true }, function()
				require("lint").try_lint()
			end)
		end, { desc = "format" })
	end,
}
