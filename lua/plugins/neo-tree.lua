return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				},
			},
		})
		vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>", { desc = "toggle Neotree" })
		vim.keymap.set("n", "<leader>wn", "<Cmd>Neotree reveal<CR>", { desc = "reveal Neotree" })
	end,
}
