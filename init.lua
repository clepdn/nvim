vim.g.mapleader = '\\'

vim.opt.clipboard:append("unnamedplus")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set('n', '<leader>d', function() 
					vim.diagnostic.open_float()
				end)

vim.keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<cr>', { desc = 'list all found diagnostics in current buffer' })

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

vim.lsp.inlay_hint.enable(true)

-- require'lspconfig'.eslint.setup{}
require'lspconfig'.ts_ls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.pylsp.setup{}

-- the docs do this in a new way for some reason?
vim.lsp.config('rust_analyzer', {
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true;
			},
			inlayHints = {
				enable = true,
				chainingHints = {
					enable = true,
				},
				typeHints = {
					enable = true,
					hideClosureInitialization = false,
					hideNamedConstructor = false,
				},
				parameterHints = {
					enable = true,
				},
			}
		}
	}
})

vim.lsp.enable('rust_analyzer')


vim.cmd 'colorscheme habamax'
