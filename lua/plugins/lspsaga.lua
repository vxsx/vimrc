local keymap = vim.keymap.set
local saga = require("lspsaga")

vim.wo.number = true -- this is set number, but lspsaga wouldn't get it unless set through this

saga.setup({
	code_action_lightbulb = { enable = false },
	symbol_in_winbar = { enable = false },
})

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true })

keymap("n", "pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
