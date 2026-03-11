vim.g.mapleader = '\\'

vim.opt.clipboard:append("unnamedplus")

-- According to claude this is unreliable if you don't use a term with the kitty keyboard protocol
vim.keymap.set("t", "<C-Esc><C-Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set('n', '<leader>i', function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })

vim.keymap.set('n', '<leader>d', function() 
					vim.diagnostic.open_float()
				end)

vim.keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<cr>', { desc = 'list all found diagnostics in current buffer' })

vim.keymap.set("n", "<leader>f", function()
	require("telescope").extensions.file_browser.file_browser()
end, { noremap = true })

vim.keymap.set('n', '<leader>i', function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

-- ai slop bind - verify if ture
vim.keymap.set('n', 'gy', ':tabp<CR>', { noremap = true, silent = true })

-- LSP hover on current token
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { desc = 'LSP Hover' })

-- Detailed LSP inspect on current token
vim.keymap.set('n', '<leader>H', function()
  local params = vim.lsp.util.make_position_params()
  local result = vim.lsp.buf_request_sync(0, 'textDocument/hover', params, 1000)
  print(vim.inspect(result))
end, { desc = 'LSP Inspect token' })

-- Visual studio "refactor"
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)


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
-- require'lspconfig'.ts_ls.setup{}
-- require'lspconfig'.clangd.setup{}
-- require'lspconfig'.pylsp.setup{}

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

vim.lsp.config('ts_ls', {
  cmd = { "typescript-language-server", "--stdio" },
  init_options = {
    tsserver = {
      path = "/usr/lib/node_modules/typescript/lib/tsserver.js"
    }
  }
})

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('nixd')
vim.lsp.enable('ts_ls')
vim.lsp.enable('pylsp')
vim.lsp.enable('clangd')


vim.cmd 'colorscheme habamax'
