return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- Use a sub-list to run only the first available formatter
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				svelte = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				yaml = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				graphql = { "prettierd", "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
			},
			format_on_save = function()
				if vim.g.auto_format then
					return { timeout_ms = 1000, lsp_fallback = true, async = false }
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
			require("conform").format({ async = true })
		end, { desc = "format" })

		vim.api.nvim_create_user_command("FormatAll", function()
			vim.cmd("args **/*.{js,jsx,ts,tsx,json,css,html}")
			vim.cmd('argdo lua require("conform").format()')
		end, {
			desc = "Toggle autoformat-on-save",
		})
	end,
}
