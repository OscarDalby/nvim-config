return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config_treesitter = require("nvim-treesitter.configs")
		config_treesitter.setup({
			autoinstall = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
