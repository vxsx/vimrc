-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.handlers["textDocument/semanticTokens/full"] = function() end

local function ts_on_init(client)
	if client.server_capabilities then
		client.server_capabilities.semanticTokensProvider = nil
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
		client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
	end
end

local function ts_on_attach(client)
	client.server_capabilities.semanticTokensProvider = nil
end

-- TypeScript 7 ships no tsserver.js, so ts_ls silently falls back to its own old bundled TS.
-- Projects on TS 7 get TS 7's built-in language server instead.
local function ts_native(root)
	local ts = vim.fs.joinpath(root, "node_modules/typescript")
	return vim.uv.fs_stat(ts) ~= nil and vim.uv.fs_stat(vim.fs.joinpath(ts, "lib/tsserver.js")) == nil
end

local ts_root_dir = vim.lsp.config.ts_ls.root_dir

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	root_dir = function(bufnr, on_dir)
		ts_root_dir(bufnr, function(root)
			if not ts_native(root) then
				on_dir(root)
			end
		end)
	end,
	on_init = ts_on_init,
	on_attach = ts_on_attach,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
	callback = function(args)
		ts_root_dir(args.buf, function(root)
			if not ts_native(root) then
				return
			end
			vim.lsp.start({
				name = "tsgo",
				cmd = { vim.fs.joinpath(root, "node_modules/.bin/tsc"), "--lsp", "--stdio" },
				root_dir = root,
				capabilities = capabilities,
				get_language_id = function(_, ft)
					return ft == "typescript.tsx" and "typescriptreact" or ft
				end,
				on_init = ts_on_init,
				on_attach = ts_on_attach,
			}, { bufnr = args.buf })
		end)
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
