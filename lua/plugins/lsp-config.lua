return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"tailwindcss",
					"dockerls",
					"gopls",
					"html",
					"tsserver",
					"spectral",
					"lua_ls",
					"marksman",
					"pico8_ls",
					"pyright",
					"grammarly",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			lspconfig.tsserver.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc="see information"})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {desc = "go to definition"})
			-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.X, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "perform code action" })
		end,
	},
}
