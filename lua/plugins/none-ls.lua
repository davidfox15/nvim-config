return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.completion.spell,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							if vim.g.auto_format then
								vim.lsp.buf.format({ async = false })
								vim.notify("Format and save", "info", { title = "none-ls" })
							end
						end,
					})
				end
			end,
		})

		vim.api.nvim_create_user_command("AutoFormatDisable", function()
			vim.g.auto_format = false
			vim.notify("Format on save off", "info", { title = "none-ls" })
		end, {
			desc = "Disable format on save",
		})

		vim.api.nvim_create_user_command("AutoFormatEnable", function()
			vim.g.auto_format = true
			vim.notify("Format on save on", "info", { title = "none-ls" })
		end, {
			desc = "Re-enable format on save",
		})

		vim.keymap.set("n", "<space>cf", function()
			vim.lsp.buf.format({ async = true })
			vim.notify("Document format", "info", { title = "none-ls" })
		end, { desc = "Format document" })

		vim.keymap.set("n", "<space>tf", function()
			if vim.g.auto_format then
				vim.cmd("AutoFormatDisable")
			else
				vim.cmd("AutoFormatEnable")
			end
		end, { desc = "Toggle formatting on save" })
	end,
}
