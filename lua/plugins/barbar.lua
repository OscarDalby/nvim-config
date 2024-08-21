return {
	"romgrk/barbar.nvim",
	config = function()
		require("lazy").setup({
			{
				"romgrk/barbar.nvim",
				dependencies = {
					"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
					"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
				},
				init = function()
					vim.g.barbar_auto_setup = false
				end,
				opts = {
					-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
					-- animation = true,
					-- insert_at_start = true,
					-- …etc.
				},
				version = "^1.0.0", -- optional: only update when a new 1.x version is released
			},
		})

		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		map("n", "bb", "<Cmd>BufferPrevious<CR>", opts)
		map("n", "bn", "<Cmd>BufferNext<CR>", opts)
		map("n", "b1", "<Cmd>BufferGoto 1<CR>", opts)
		map("n", "b2", "<Cmd>BufferGoto 2<CR>", opts)
		map("n", "b3", "<Cmd>BufferGoto 3<CR>", opts)
		map("n", "b4", "<Cmd>BufferGoto 4<CR>", opts)
		map("n", "b5", "<Cmd>BufferGoto 5<CR>", opts)
		map("n", "b6", "<Cmd>BufferGoto 6<CR>", opts)
		map("n", "b7", "<Cmd>BufferGoto 7<CR>", opts)
		map("n", "b8", "<Cmd>BufferGoto 8<CR>", opts)
		map("n", "b9", "<Cmd>BufferGoto 9<CR>", opts)
		map("n", "bp", "<Cmd>BufferPin<CR>", opts)
		map("n", "bc", "<Cmd>BufferClose<CR>", opts)
		map("n", "ba", "<Cmd>BufferOrderByName<CR>", opts)
		map("n", "bo", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
	end,
}
