vim.diagnostic.config({
	virtual_text = false,
	float = {
		border = "rounded",
		focusable = true,
	},
	-- LSP signs takes precedence over gitsigns
	signs = {
		priority = 101,
	},
	-- LSP signs order
	severity_sort = true,
})
