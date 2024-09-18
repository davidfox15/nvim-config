return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- main module to put in config, require(main).setup(opts)
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"scss",
				"css",
				"json",
				"regex",
				"bash",
				"sql",
				"dockerfile",
				"gitignore",
				"yaml",
				"graphql",
				"go",
				"markdown",
				"markdown_inline",
				"rust",
				"c",
			},
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },

				-- TODO: How to open big files ???
				--
				-- XOde for off treesitter in big files
				-- disable = function(_, bufnr)
				-- 	local buf_name = vim.api.nvim_buf_get_name(bufnr)
				-- 	local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
				-- 	return file_size > 256 * 1024
				-- end,
			},
			indent = { enable = true, disable = { "ruby" } },

			-- TODO: Setup treesitter incremental_selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "tn", -- Начать визуальное выделение по контексту
					node_incremental = "tn", -- Расширить выделение
					scope_incremental = "ts", -- Расширить выделение до области
					node_decremental = "tm", -- Уменьшить выделение
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			max_lines = 5,
		},
		config = function(_, opts)
			require("treesitter-context").setup(opts)

			vim.keymap.set("n", "gc", function()
				require("treesitter-context").go_to_context(vim.v.count1)
			end, { silent = true, desc = "Go to context" })
		end,
	},
}
