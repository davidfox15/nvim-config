return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {
					"lua",
					"vimdoc",
					"javascript",
					"typescript",
					"tsx",
					-- "html",
					-- "scss",
					-- "css",
					-- "json",
					-- "rust",
					-- "c",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				highlight = {
					enable = true,
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
					disable = function(_, bufnr)
						local buf_name = vim.api.nvim_buf_get_name(bufnr)
						local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
						return file_size > 256 * 1024
					end,
				},

				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			local config = require("treesitter-context")
			config.setup({
				max_lines = 5,
			})
			vim.keymap.set("n", "gc", function()
				require("treesitter-context").go_to_context(vim.v.count1)
			end, { silent = true })
		end,
	},
}