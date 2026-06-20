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

-- Diagnostic config
vim.diagnostic.config({ virtual_text = true })

vim.keymap.set('n', '<leader>d', vim.cmd.Ex, { desc = 'Open [D]irectory (netrw)' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
--
-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- LSP
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#gopls
vim.lsp.config['gopls'] = {
  cmd = { 'gopls' },
  filetypes = { "go", "gomod", "gowork" },
  root_markers = { 'go.mod', '.go' },
  settings = {
      gopls = {
          semanticTokens = true
      }
  }
}
vim.lsp.enable('gopls')

