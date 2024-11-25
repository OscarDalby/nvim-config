return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	enabled = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup({})

		vim.keymap.set("n", "ha", function()
			harpoon.mark.add()
		end)
		vim.keymap.set("n", "hh", function()
			harpoon.ui.toggle_quick_menu()
		end)

		vim.keymap.set("n", "h1", function()
			harpoon.ui.nav_file(1)
		end)
		vim.keymap.set("n", "h2", function()
			harpoon.ui.nav_file(2)
		end)
		vim.keymap.set("n", "h3", function()
			harpoon.ui.nav_file(3)
		end)
		vim.keymap.set("n", "h4", function()
			harpoon.ui.nav_file(4)
		end)

		vim.keymap.set("n", "hb", function()
			harpoon.ui.nav_prev()
		end)
		vim.keymap.set("n", "hn", function()
			harpoon.ui.nav_next()
		end)
	end,
}
