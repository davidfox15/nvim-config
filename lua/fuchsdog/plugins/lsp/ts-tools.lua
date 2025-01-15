return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
			-- settings = {
			-- locale of all tsserver messages, supported locales you can find here:
			-- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
			-- tsserver_locale = "en",
			-- },
		})

		vim.keymap.set(
			{ "n" },
			"<leader>cir",
			":TSToolsRemoveUnusedImports<CR>",
			{ desc = "TSTools: [R]emove Unused Imports" }
		)

		vim.keymap.set({ "n" }, "<leader>cis", ":TSToolsSortImports<CR>", { desc = "TSTools: [S]ort Imports" })

		vim.keymap.set(
			{ "n" },
			"<leader>cia",
			":TSToolsAddMissingImports<CR>",
			{ desc = "TSTools: [A]dd Missing Imports" }
		)
	end,
}
