return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "<leader>gn", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "next hunk" })

				map("n", "<leader>gN", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "prev hunk" })

				-- Actions
				-- reset hunk
				map("n", "<leader>gr", gs.reset_hunk, { desc = "reset hunk" })
				-- add buffer to stage
				map("n", "<leader>gS", gs.stage_buffer, { desc = "stage buffer" })
				-- reset buffer
				map("n", "<leader>gR", gs.reset_buffer, { desc = "rest buffer" })
				-- look last change from git in line
				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end)
				map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "toggle current line blame" })

				-- map("n", "<leader>gs", gs.stage_hunk, { desc = "stage hunk " })
				--[[ map("v", "<leader>gs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end) ]]
				--[[ map("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end) ]]
				-- map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
				-- map("n", "<leader>gp", gs.preview_hunk, { desc = "preview hunk" })
				-- map("n", "<leader>gd", gs.diffthis, { desc = "diff this" })
				--[[ map("n", "<leader>gD", function()
					gs.diffthis("~")
				end, { desc = "diff this" }) ]]
				-- map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle deleted" })

				-- Text object
				-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select hunk" })
			end,
		})
		return true
	end,
}
