local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- print(actions)

require("telescope").setup({
    pickers = {
        buffers = {
            mappings = {
                i = { ["<CR>"] = actions.select_tab_drop },
            },
            find_files = {
                mappings = {
                    i = { ["<CR>"] = actions.select_tab_drop },
                },
            },
            git_files = {
                mappings = {
                    i = { ["<CR>"] = actions.select_tab_drop },
                },
            },
            old_files = {
                mappings = {
                    i = { ["<CR>"] = actions.select_tab_drop },
                },
            },
        },
    },
})
