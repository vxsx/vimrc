vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.semanticTokensProvider then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end,
})

require("dark_notify").run()
require("mason").setup({ PATH = "prepend" })
require("mason-lspconfig").setup()

require("colorizer").setup({
    "css",
    "scss",
    "typescript",
    "typescript.tsx",
    "lua",
    "vim",
})

require("plugins.lspsaga")
require("plugins.nvim-cmp")
require("plugins.lspconfig")
require("plugins.indent_blankline")
require("plugins.spectre")
-- require("plugins.neoai")
-- require("plugins.trouble")
-- require("plugins.telescope")
require("plugins.conform")
require("plugins.auto-dark-mode")

-- require('avante').setup({
--     windows = {
--         sidebar_header = {
--             align = "left",
--             rounded = false
--         }
--     }
-- })


-- require("folke/snacks.nvim").setup({ input = {}, picker = {} })

require("tiny-inline-diagnostic").setup({
    preset = "powerline",
})
vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics


vim.o.autoread = true

-- Recommended/example keymaps for opencode.nvim
-- vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask about this" })
-- vim.keymap.set({ "n", "x" }, "<leader>os", function() require("opencode").select() end, { desc = "Select prompt" })
-- vim.keymap.set({ "n", "x" }, "<leader>o+", function() require("opencode").prompt("@this") end, { desc = "Add this" })
-- vim.keymap.set("n", "<leader>ot", function() require("opencode").toggle() end, { desc = "Toggle embedded" })
-- vim.keymap.set("n", "<leader>oc", function() require("opencode").command() end, { desc = "Select command" })
-- vim.keymap.set("n", "<leader>on", function() require("opencode").command("session_new") end, { desc = "New session" })
-- vim.keymap.set("n", "<leader>oi", function() require("opencode").command("session_interrupt") end, { desc = "Interrupt session" })
-- vim.keymap.set("n", "<leader>oA", function() require("opencode").command("agent_cycle") end, { desc = "Cycle selected agent" })
-- vim.keymap.set("n", "<S-C-u>",    function() require("opencode").command("messages_half_page_up") end, { desc = "Messages half page up" })
-- vim.keymap.set("n", "<S-C-d>",    function() require("opencode").command("messages_half_page_down") end, { desc = "Messages half page down" })
--
-- require('claudecode').setup({
--     terminal_cmd = "~/.claude/local/claude", -- Point to local installation
-- })
--
