return {
	"folke/zen-mode.nvim",
	opts = {},
	config = function()
		vim.api.nvim_set_keymap("n", "zz", ":ZenMode<CR>", { noremap = true, silent = true })
	end,
}
