local keymap = vim.keymap.set
local saga = require("lspsaga")

vim.wo.number = true -- this is set number, but lspsaga wouldn't get it unless set through this

saga.setup({
    lightbulb = {
        enable = false,
    },
    diagnostic = {
        enable = false,
        -- show_layout = 'float',
        -- show_normal_height = 10,
        -- jump_num_shortcut = true,
        -- auto_preview = true,
        -- max_width = 0.8,
        -- max_height = 0.6,
        -- max_show_width = 0.9,
        -- max_show_height = 0.6,
        -- wrap_long_lines = true,
        -- extend_relatedInformation = false,
        -- diagnostic_only_current = true,
        -- keys = {
        --     exec_action = 'o',
        --     quit = 'q',
        --     toggle_or_jump = '<CR>',
        --     quit_in_show = { 'q', '<ESC>' },
        -- },
    },
	symbol_in_winbar = { enable = false },
})

-- Rename
keymap("n", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true })

keymap("n", "pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
