-- indent guides setup
require("ibl").setup()
--
-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Color scheme
vim.cmd[[colorscheme rose-pine]]
