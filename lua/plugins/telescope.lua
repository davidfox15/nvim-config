return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false, -- telescope did only one release, so use HEAD for now
	opts = {
		defaults = {
			layout_strategy = "horizontal",
			mappings = {
				i = {
					["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
					["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
				},
			},
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
		return {
			-- find string
			{ "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Grep (root dir)" },
			{ "<leader>fs", "<cmd>Telescope grep_string<CR>", mode = { "v" }, desc = "Selection (root dir)" },
			--find files
			{ "<leader><space>", "<cmd>Telescope find_files<CR>", desc = "Find Files (root dir)" },
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files (root dir)" },
			-- find command history
			{ "<leader>:", "<cmd>Telescope command_history<CR>", desc = "Command History" },
			-- find config files
			{ "<leader>fc", "<cmd>Telescope config_files<CR>", desc = "Find Config File" },
			--find in recent files
			{ "<leader>fr", "<cmd>Telescope oldfiles cwd_only=true<cr>", desc = "Recent" },
			-- git
			{ "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "Find Git Files" },
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
			-- search
			{ "<leader>fw", "<cmd>Telescope grep_string word_match=-w<CR>", desc = "Word (root dir)" },
			{ "<leader>fw", "<cmd>Telescope grep_string word_match=-w<CR>", mode = { "v" }, desc = "Word (root dir)" },
			-- others
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help tags" },
			{ "<leader>fl", "<cmd>Telescope resume<CR>", desc = "Last search" },
			-- { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
			--{
			--  "<leader>ss",
			--  function()
			--    require("telescope.builtin").lsp_document_symbols({
			--      symbols = require("lazyvim.config").get_kind_filter(),
			--    })
			--  end,
			--  desc = "Goto Symbol",
			--},
			--{
			--  "<leader>sS",
			--  function()
			--    require("telescope.builtin").lsp_dynamic_workspace_symbols({
			--      symbols = require("lazyvim.config").get_kind_filter(),
			--    })
			--  end,
			--  desc = "Goto Symbol (Workspace)",
			--},
		}
	end,
}
