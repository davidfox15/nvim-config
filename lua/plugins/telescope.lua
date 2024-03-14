return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		version = false, -- telescope did only one release, so use HEAD for now
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				file_ignore_patterns = {
					"node_modules",
				},
			},
			pickers = {
				oldfiles = {
					find_files = {
						-- not work (show ./ dir in oldfiles)
						find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
					},
				},
				lsp_references = {
					-- initial_mode = "normal",
					show_line = false,
				},
				lsp_definitions = {
					-- initial_mode = "normal",
					show_line = false,
				},
			},
			extensions = {
				git_status = {
					-- initial_mode = "normal",
				},

				grep_string = {
					initial_mode = "normal",
				},
			},
		},
		keys = function()
			function vim.getVisualSelection()
				vim.cmd('noau normal! "vy"')
				local text = vim.fn.getreg("v")
				vim.fn.setreg("v", {})

				text = string.gsub(text, "\n", "")
				if #text > 0 then
					return text
				else
					return ""
				end
			end

			return {
				-- lsp find
				{ "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Find definitions" },
				{ "gr", "<cmd>Telescope lsp_references<CR>", desc = "Find references" },
				-- find string
				{ "<leader>fw", "<cmd>Telescope grep_string word_match=-w<CR>", desc = "Word (root dir)" },
				{ "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Grep (root dir)" },
				{
					"<leader>fs",
					function()
						local tb = require("telescope.builtin")
						local text = vim.getVisualSelection()
						tb.live_grep({ default_text = text })
					end,
					mode = { "v" },
					desc = "Selection (root dir)",
				},
				--find files
				-- { "<leader><space>", "<cmd>Telescope find_files<CR>",                desc = "Find Files (root dir)" },
				{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files (root dir)" },
				-- find command history
				{ "<leader>:", "<cmd>Telescope command_history<CR>", desc = "Command History" },
				-- find config files
				{ "<leader>fc", "<cmd>Telescope config_files<CR>", desc = "Find Config File" },
				--find in recent files
				{ "<leader>fo", "<cmd>Telescope oldfiles cwd_only=true<cr>", desc = "Old files" },
				-- git
				{ "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "Find Git Files" },
				{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
				{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
				-- others
				{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help tags" },
				{ "<leader>fl", "<cmd>Telescope resume<CR>", desc = "Last search" },
				{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics search" },
				{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "TodoTelescope" },
			}
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
							["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
