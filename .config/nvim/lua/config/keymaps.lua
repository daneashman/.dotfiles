vim.keymap.set('n', '<leader>d', vim.cmd.Ex, { desc = 'Open [D]irectory (netrw)' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Telescope config
require('telescope').setup {
  defaults = {
    mappings = {
      n = { -- Normal mode mappings
        ['<C-d>'] = require('telescope.actions').delete_buffer, -- Use CTRL-d to delete a buffer
      },
    },
  },
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })

-- Short Terminal Shortcut
vim.keymap.set('n', '<leader>ts',
  function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd('J')
    vim.api.nvim_win_set_height(0, 15)
    vim.cmd('startinsert')
  end,
  { desc = "Open Short Terminal" }
)
-- Tall Terminal Shortcut
vim.keymap.set('n', '<leader>tt',
  function()
    vim.cmd.new()
    vim.cmd.term()
    vim.cmd.wincmd('L')
    vim.api.nvim_win_set_width(0, 100)
    vim.cmd('startinsert')
  end,
  { desc = "Open Tall Terminal" }
)

-- Shortcut to go back to normal mode and !(delete the buffer) while in terminal
vim.keymap.set('t', '<esc><esc>', '<C-\\><C-n>', { desc = "Exit terminal and close window" })
-- Shortcut to quit the current terminal
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>:bd!<CR>', { desc = "Exit terminal and close window" })
-- Shortcut to hide the current terminal
-- vim.keymap.set('t', '<C-h>', '<C-\\><C-n>:close<CR>', { desc = "Exit terminal and close window" })

-- Actual pop-up
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = true })
