return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Add border to float windows
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.diagnostic.config({
			float = {
				border = "rounded",
			},
			-- LSP signs takes precedence over gitsigns
			signs = {
				priority = 101,
			},
			-- LSP signs order
			severity_sort = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- lsp find
				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
				opts.desc = "Code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				opts.desc = "Code diagnostic"
				vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
				opts.desc = "Symbol information"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settigns = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostic = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
