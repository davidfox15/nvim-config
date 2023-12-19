return {
	{
		"neovim/nvim-lspconfig",
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			-- change a keymap
			keys[#keys + 1] = {
				"gd",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "Goto Definition",
				has = "definition",
			}
		end,
	},
}
