vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Netrw" })

vim.keymap.set("n", "<leader>bq", ":q<cr>", { desc = ":q" })
vim.keymap.set("n", "<leader>bw", ":wq<cr>", { desc = ":wq" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Split window
vim.keymap.set("n", ",h", ":split<Return>", { desc = "split horizontal" })
vim.keymap.set("n", ",v", ":vsplit<Return>", { desc = "split vertical" })
-- Move window
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "go to left spliut window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "go to up split window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "go to down split window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "go to right split window" })
vim.keymap.set("n", ",e", "<C-w>=", { desc = "split equal size" })

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

-- paste without copy
vim.keymap.set("x", "<leader>p", '"_dP')

-- delete without copy
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- file history
-- vim.keymap.set("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", { desc = "undotree" })

-- marks
vim.keymap.set("n", "<leader>nm", ":delmarks ", { desc = "Delete mark" })

-- vim.keymap.set("n", "<leader>tr", ':exec &nu==&rnu? "se nornu!" : "se rnu!"<cr>', { desc = "Toggle relative number" })

-- work with buffers
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Buffer next" })
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Buffer prev" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Buffer delete" })

-- open tmux-sessionizer
vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux-sessionizer" })

-- substitute word
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Substitute word" })
