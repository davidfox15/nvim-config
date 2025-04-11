vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- global vars
vim.g.auto_format = true
vim.g.illumination = false

-- line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- vim.opt.cursorline = true -- highlight the current cursor line

vim.opt.title = true
-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
-- Clipboard
vim.opt.clipboard = "unnamedplus"
-- Work with files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- Lines
vim.opt.wrap = false
-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
vim.opt.termguicolors = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

vim.opt.scrolloff = 6

-- vim.opt.updatetime = 50 -- auto save timer

vim.opt.list = false

-- colored 80 col
-- vim.opt.colorcolumn = "80"

vim.opt.synmaxcol = 240
vim.opt.inccommand = "split"
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.backspace = "indent,eol,start"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
-- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = false

vim.opt.iskeyword:remove("_") -- Add snake case support

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
