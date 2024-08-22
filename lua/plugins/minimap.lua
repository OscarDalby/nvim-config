return {
	"echasnovski/mini.map",
	version = false,
	config = function()
		require("mini.map").setup({
			symbols = {
				scroll_line = "█",
				scroll_view = "┃",
			},

			-- Window options
			window = {
				focusable = false,
				side = "right",
				show_integration_count = true,
				width = 6,
				winblend = 25,
				zindex = 10,
			},
		})

		vim.api.nvim_set_keymap("n", "mo", "<cmd>lua MiniMap.open()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "mc", "<cmd>lua MiniMap.close()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "mt", "<cmd>lua MiniMap.toggle()<CR>", { noremap = true, silent = true })
	end,
}
