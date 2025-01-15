return {
	{
		"tpope/vim-sleuth",
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre" },
		cmd = { "ConformInfo" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					-- Use a sub-list to run only the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					svelte = { "prettierd", "prettier", stop_after_first = true },
					css = { "prettierd", "prettier", stop_after_first = true },
					scss = { "prettierd", "prettier", stop_after_first = true },
					html = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd", "prettier", stop_after_first = true },
					yaml = { "prettierd", "prettier", stop_after_first = true },
					markdown = { "prettierd", "prettier", stop_after_first = true },
					graphql = { "prettierd", "prettier", stop_after_first = true },
					lua = { "stylua" },
					python = { "isort", "black", stop_after_first = true },
					rust = { "rustfmt" },
				},
				format_on_save = function(bufnr)
					-- Disable "format_on_save lsp_fallback" for languages that don't
					-- have a well standardized coding style. You can add additional
					-- languages here or re-enable it for the disabled ones.
					local disable_filetypes = { c = true, cpp = true }
					local lsp_format_opt
					if disable_filetypes[vim.bo[bufnr].filetype] then
						lsp_format_opt = "never"
					else
						lsp_format_opt = "fallback"
					end
					if vim.g.auto_format then
						return { timeout_ms = 500, lsp_format = lsp_format_opt }
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
				require("conform").format({
					async = true,
					callback = "fallback",
				})
			end, { desc = "format" })

			vim.api.nvim_create_user_command("FormatAll", function()
				vim.cmd("args **/*.{js,jsx,ts,tsx,json,css,html}")
				vim.cmd('argdo lua require("conform").format()')
			end, {
				desc = "Toggle autoformat-on-save",
			})
		end,
	},
}
