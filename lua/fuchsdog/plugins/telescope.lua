return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
			layout_config = {
				horizontal = { width = 0.9 },
			},
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
			fzf = {},
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
			{ "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Grep (root dir)" },
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "[F]ind [F]iles" },
			{ "<leader>fo", "<cmd>Telescope oldfiles cwd_only=true<cr>", desc = "[F]ind [O]ld files" },
			-- git
			{ "<leader>fgf", "<cmd>Telescope git_files<CR>", desc = "[F]ind [G]it [F]iles" },
			{ "<leader>fgc", "<cmd>Telescope git_commits<CR>", desc = "[F]ind [G]it [C]commits" },
			{ "<leader>fgs", "<cmd>Telescope git_status<CR>", desc = "[F]ind [G]it [S]status" },
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
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>fw", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end, { desc = "Find word (root dir)" })

		vim.keymap.set("n", "<leader>fW", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Find WORD (root dir)" })

		vim.keymap.set("v", "<leader>fs", function()
			local text = vim.getVisualSelection()
			builtin.live_grep({ default_text = text })
		end, {
			desc = "[F]ind [S]election",
		})

		vim.keymap.set("n", "<leader>f/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
