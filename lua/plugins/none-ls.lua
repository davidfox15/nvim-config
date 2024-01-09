return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.completion.spell,
            },
        })

        vim.keymap.set("n", "<space>cf", function()
            vim.lsp.buf.format({ async = true })
        end, { desc = "Fromat document" })
    end,
}
