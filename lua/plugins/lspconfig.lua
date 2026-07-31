-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.handlers["textDocument/semanticTokens/full"] = function() end

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	on_init = function(client)
		if client.server_capabilities then
			client.server_capabilities.semanticTokensProvider = nil
			client.server_capabilities.document_formatting = false
			client.server_capabilities.document_range_formatting = false
			client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
		end
	end,
	on_attach = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

vim.lsp.config("stylelint_lsp", {
	capabilities = capabilities,
	filetypes = { "scss", "css" },
})

vim.lsp.config("eslint", {
	capabilities = capabilities,
})

vim.lsp.config("pyright", {
	capabilities = capabilities,
})

vim.lsp.config("prismals", {
	capabilities = capabilities,
	filetypes = { "prisma" },
})

vim.lsp.config("tailwindcss", {
	capabilities = capabilities,
	filetypes = { "svelte", "typescript", "typescriptreact", "typescript.tsx" },
	on_attach = function(_, bufnr)
		require("tailwindcss-colors").buf_attach(bufnr)
	end,
})

vim.lsp.config("svelte", {
	capabilities = capabilities,
	filetypes = { "svelte" },
})

-- vim.lsp.config("grammarly", {
-- 	capabilities = capabilities,
-- 	filetypes = { "rst", "markdown" },
-- })

vim.lsp.config("lua_ls", {
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

vim.lsp.config("biome", {
	capabilities = capabilities,
	get_language_id = function(_, ftype)
		if ftype == "typescript.tsx" then
			return "typescriptreact"
		end
		return ftype
	end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     buffer = buffer,
--     callback = function()
--         vim.lsp.buf.format { async = false }
--     end
-- })
