require("spectre").setup({
	find_engine = {
		["ag"] = {
			cmd = "ag",
			args = {
				"--vimgrep",
				"-s",
			},
			options = {
				["ignore-case"] = {
					value = "-i",
					icon = "[I]",
					desc = "ignore case",
				},
				["hidden"] = {
					value = "--hidden",
					desc = "hidden file",
					icon = "[H]",
				},
			},
		},
	},
	default = {
		find = {
			--pick one of item in find_engine
			cmd = "ag",
			options = { "ignore-case" },
		},
	},
})

vim.keymap.set(
	"n",
	"<leader>S",
	'<cmd>lua require("spectre").open()<CR>',
	{ remap = false, desc = "Search and replace" }
)
