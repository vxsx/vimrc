require("auto-dark-mode").setup({
	fallback = "light",

	set_dark_mode = function()
		vim.api.nvim_set_option_value("background", "dark", {})
	end,

	set_light_mode = function()
		vim.api.nvim_set_option_value("background", "light", {})
	end,

	update_interval = 5000,
})
