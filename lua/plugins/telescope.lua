return {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
	-- or                              , branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons'
	},		

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require "telescope._extensions.file_browser.actions"

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				-- layout_config = { prompt_position = "top" },
				-- sorting_strategy = "ascending",
				winblend = 0,
			  mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
				file_ignore_patterns = {
					"node_modules"
				}
			},
			extensions = {
				file_browser = {
					finders = {
						finder = {
							depth = false
						}
					},
					initial_mode = "normal",
					mappings = {
						["n"] = {
							["h"] = fb_actions.goto_parent_dir,
						}
					}
				}
			}
		})
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
		vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
		-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set("n", "<Leader>fo", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
		require("telescope").load_extension "file_browser"
	end
}

