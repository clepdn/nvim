vim.g.mapleader = '\\'

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set('n', '<leader>d', function() 
					vim.diagnostic.open_float()
				end)

require('config.lazy')

vim.cmd('source ~/.config/nvim/vimbindings.vim') -- escape hatch

vim.g.markdown_fenced_languages = {
	"ts=typescript"
}

require'lspconfig'.eslint.setup{}
require'lspconfig'.ts_ls.setup{}

--[=====[
--]=====]


