vim.g.mapleader = '\\'

vim.opt.clipboard:append("unnamedplus")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set('n', '<leader>d', function() 
					vim.diagnostic.open_float()
				end)

vim.keymap.set("n", "<leader>f", function()
	require("telescope").extensions.file_browser.file_browser()
end, { noremap = true })

-- ai slop bind - verify if ture
vim.keymap.set('n', 'gy', ':tabp<CR>', { noremap = true, silent = true })

require('config.lazy')

-- vim.cmd('source ~/.config/nvim/vimbindings.vim') -- escape hatch

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.splitright = true

vim.g.markdown_fenced_languages = {
	"ts=typescript",
	"tsx=typescript"
}

-- require'lspconfig'.eslint.setup{}
require'lspconfig'.ts_ls.setup{}
require'lspconfig'.clangd.setup{}

vim.cmd 'colorscheme habamax'
