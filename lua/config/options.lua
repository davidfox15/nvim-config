-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- shows absolute line number on cursor line (when relative number is on)

vim.opt.cursorline = true -- highlight the current cursor line

vim.opt.title = true
vim.opt.autoindent = true
-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.incsearch = true
-- Tab
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- vim.opt.smartindent = true
vim.opt.autoindent = true
-- Clipboard
vim.opt.clipboard = "unnamedplus"
-- Lines
vim.opt.wrap = false
-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
vim.opt.swapfile = false

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
vim.opt.termguicolors = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

vim.opt.scrolloff = 4

vim.opt.updatetime = 50

vim.opt.termguicolors = true
-- recommended settings from nvim-tree documentation
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.netrw_liststyle = 3

vim.opt.list = false
