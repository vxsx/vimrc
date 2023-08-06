require("mason").setup({ PATH = 'prepend' })
require("mason-lspconfig").setup()

require("colorizer").setup({
    'scss',
    'typescript',
    'lua',
})

require('plugins.lspsaga')
require('plugins.nvim-cmp')
require('plugins.lspconfig')
require('plugins.null-ls')
require('plugins.prettier')
require('plugins.indent_blankline')
require('plugins.spectre')
