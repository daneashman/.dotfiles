-- Leader key
vim.g.mapleader = " "
-- Keep undos after close
vim.opt.undofile = true
-- Window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- Nerd Font
vim.g.have_nerd_font = true
-- Dont show mode because it's in the lualine
vim.opt.showmode = false
