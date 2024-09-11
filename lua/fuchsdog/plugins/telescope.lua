return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	cmd = "Telescope",
	version = false, -- telescope did only one release, so use HEAD for now
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
					["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
				},
			},
			layout_strategy = "horizontal",
			file_ignore_patterns = {
				"public",
				"node_modules",
				".git/",
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
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
			buffers = {
				mappings = {
					i = {
						["<C-x>"] = require("telescope.actions").delete_buffer,
					},
					n = {
						["<C-x>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
		},
		extensions = {
			git_status = {
				-- initial_mode = "normal",
			},
			grep_string = {
				initial_mode = "normal",
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
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
			-- { "<leader>fc", "<cmd>Telescope config_files<CR>", desc = "Find Config File" },
			--find in recent files
			{ "<leader>fo", "<cmd>Telescope oldfiles cwd_only=true<cr>", desc = "Old files" },
			-- git
			-- { "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "Find Git Files" },
			{ "<leader>fc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
			{ "<leader>fg", "<cmd>Telescope git_status<CR>", desc = "status" },
			-- others
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help tags" },
			{ "<leader>fl", "<cmd>Telescope resume<CR>", desc = "Last search" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics search" },
			{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "TodoTelescope" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
			{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "[S]earch [K]eymaps" },
		}
	end,
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("ui-select") -- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>f/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", "<leader>f?", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })
		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
