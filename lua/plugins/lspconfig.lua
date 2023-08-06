-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig")["tsserver"].setup({
	capabilities = capabilities,
	on_init = function(client)
		if client.server_capabilities then
			client.server_capabilities.semanticTokensProvider = nil
			client.server_capabilities.document_formatting = false
			client.server_capabilities.document_range_formatting = false
			client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
		end
	end,
	on_attach = function(client) end,
})

require("lspconfig")["stylelint_lsp"].setup({
	capabilities = capabilities,
	filetypes = { "scss", "css" },
})

require("lspconfig")["eslint"].setup({
	capabilities = capabilities,
})

require("lspconfig")["tailwindcss"].setup({
	capabilities = capabilities,
	filetypes = { "svelte" },
})

require("lspconfig")["svelte"].setup({
	capabilities = capabilities,
	filetypes = { "svelte" },
})

require("lspconfig")["grammarly"].setup({
	capabilities = capabilities,
	filetypes = { "rst", "markdown" },
})

require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
	filetypes = { "lua" },
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "buffer" },
			},
		},
	},
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     buffer = buffer,
--     callback = function()
--         vim.lsp.buf.format { async = false }
--     end
-- })
