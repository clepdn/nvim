vim.cmd('source ~/.config/nvim/vimbindings.vim')

vim.g.markdown_fenced_languages = {
	"ts=typescript"
}

require'lspconfig'.denols.setup{}
require'lspconfig'.svelte.setup{}
