return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				graphql = { "prettierd" },
				lua = { "stylua" },
				-- python = { "isort", "black" },
			},
			format_on_save = function()
				-- Disable with a global variable
				if vim.g.disable_autoformat then
					return
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				}
			end,
		})

		vim.api.nvim_create_user_command("FormatDisable", function()
			vim.g.disable_autoformat = true
			-- vim.notify = require("notify")
			-- vim.notify("autoformat-on-save disabled globally", "info", { title = "conform.nvim" })
		end, {
			desc = "Disable autoformat-on-save",
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.g.disable_autoformat = false
			-- vim.notify = require("notify")
			-- vim.notify("autoformat-on-save disabled globally", "info", { title = "conform.nvim" })
		end, {
			desc = "Re-enable autoformat-on-save",
		})

		vim.keymap.set("n", "<leader>nf", function()
			if vim.g.disable_autoformat then
				vim.cmd("FormatEnable")
			else
				vim.cmd("FormatDisable")
			end
		end, {
			desc = "Format on save toggle",
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
