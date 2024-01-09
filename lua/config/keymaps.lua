vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Netrw" })

vim.keymap.set("n", "<leader>bq", ":q<cr>", { desc = "exit" })
vim.keymap.set("n", "<leader>bw", ":wq<cr>", { desc = "save and exit" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Split window
vim.keymap.set("n", "ss", ":split<Return>", { desc = "split horizontal" })
vim.keymap.set("n", "sv", ":vsplit<Return>", { desc = "split vertical" })
-- Move window
vim.keymap.set("n", "sh", "<C-w>h", { desc = "go to left spliut window" })
vim.keymap.set("n", "sk", "<C-w>k", { desc = "go to up split window" })
vim.keymap.set("n", "sj", "<C-w>j", { desc = "go to down split window" })
vim.keymap.set("n", "sl", "<C-w>l", { desc = "go to right split window" })
vim.keymap.set("n", "se", "<C-w>=", { desc = "split equal size" })

-- Resize window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

-- Comments
-- vim.keymap.set("n", "<leader>cc", "gcc", { desc = "Comment line" })

-- move select up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move next line to cursor line
vim.keymap.set("n", "J", "mzJ`z")

-- stay cursor in center, when move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- no copy when paste
vim.keymap.set("x", "<leader>p", '"_dP')

-- file history
-- vim.keymap.set("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", { desc = "undotree" })

-- marks
vim.keymap.set("n", "<leader>nm", ":delmarks ", { desc = "Delete mark" })
