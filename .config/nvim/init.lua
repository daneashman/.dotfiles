vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"

vim.g.mapleader = " "
vim.g.have_nerd_font = true

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>d", ":Oil<CR>", { desc = "Open [D]irectory (netrw)" })
vim.keymap.set("n", "<leader>p", vim.lsp.buf.format)
vim.keymap.set({ "n", "v", "x" }, "<leader>s", ":e #<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>S", ":sf #<CR>")

vim.diagnostic.config({ virtual_text = true })

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }
	-- To look at:
	-- mini.pick
})
require("mini.icons").setup()
require "oil".setup({
	columns = {
		"icon",
	},
})
require("mason").setup()
require("nvim-treesitter").setup()

vim.cmd("colorscheme rose-pine")
vim.cmd(":hi statusline guibg=NONE")

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		-- Enable treesitter highlighting and disable regex syntax
		pcall(vim.treesitter.start)
	end,
})

require("nvim-treesitter").install({
	"lua", "go", "svelte", "javascript", "html"
})

vim.lsp.enable({ "lua_ls", "gopls", "svelte" })

vim.lsp.config("lua_ls", { -- Stop lsp diagnostic warnings on vim.*
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
})
