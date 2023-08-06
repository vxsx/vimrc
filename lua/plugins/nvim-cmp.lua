-- Set up nvim-cmp.
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		-- native_menu = false,
		-- ghost_text = true,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		--    ["<Tab>"] = cmp.mapping(function(fallback)
		--   if cmp.visible() then
		--     cmp.select_next_item()
		--   elseif vim.fn["vsnip#available"](1) == 1 then
		--     feedkey("<Plug>(vsnip-expand-or-jump)", "")
		--   elseif has_words_before() then
		--     cmp.complete()
		--   else
		--     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
		--   end
		-- end, { "i", "s" }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function()
		--   if cmp.visible() then
		--     cmp.select_prev_item()
		--   elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		--     feedkey("<Plug>(vsnip-jump-prev)", "")
		--   end
		-- end, { "i", "s" }),
		-- ['<Tab>'] = function(fallback)
		-- if not cmp.select_next_item() then
		--   if vim.bo.buftype ~= 'prompt' and has_words_before() then
		--     cmp.complete()
		--   else
		--     fallback()
		--   end
		-- end
		["<Tab>"] = function(fallback)
			if luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			elseif not cmp.select_next_item() then
				if vim.bo.buftype ~= "prompt" and has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end
		end,
		--   ['<S-Tab>'] = function(fallback)
		--   if vim.fn.pumvisible() == 1 then
		--     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
		--   elseif luasnip.jumpable(-1) then
		--     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
		--   else
		--     fallback()
		--   end
		-- end,

		["<S-Tab>"] = function(fallback)
			if not cmp.select_prev_item() then
				if vim.bo.buftype ~= "prompt" and has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end
		end,
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- cmp.setup.cmdline(':Ack', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
-- })
