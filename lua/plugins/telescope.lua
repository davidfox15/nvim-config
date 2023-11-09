return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	-- or                              , branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope._extensions.file_browser.actions")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				-- layout_config = { prompt_position = "top" },
				-- sorting_strategy = "ascending",
				-- winblend = 0,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				file_ignore_patterns = {
					"node_modules",
				},
			},
			extensions = {
				file_browser = {
					finders = {
						finder = {
							depth = false,
						},
					},
					initial_mode = "normal",
					mappings = {
						["n"] = {
							["h"] = fb_actions.goto_parent_dir,
						},
					},
				},
				git_status = {
					initial_mode = "normal",
				},
				grep_string = {
					initial_mode = "normal",
				},
			},
		})
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Telescope find grep_string word" })
		-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope find helps_tag" })
		vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", {})

		-- git
		vim.keymap.set("n", "<leader>gfc", builtin.git_commits, { desc = "Telescope find git commits" })
		vim.keymap.set("n", "<leader>gfs", builtin.git_status, { desc = "Telescope find git status" })
		vim.keymap.set("n", "<leader>gfb", builtin.git_branches, { desc = "Telescope find git branches" })

		require("telescope").load_extension("file_browser")
	end,
}
