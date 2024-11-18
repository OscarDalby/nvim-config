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
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })
      lspconfig.pico8_ls.setup({ capabilities = capabilities })
      lspconfig.marksman.setup({ capabilities = capabilities })
      lspconfig.dockerls.setup({ capabilities = capabilities })
      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.tsserver.setup({ capabilities = capabilities })
      lspconfig.grammarly.setup({ capabilities = capabilities })
      lspconfig.spectral.setup({ capabilities = capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "see information" })
      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "go to definition" })
      vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, { desc = "rename all instances of symbol" })
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "find all references to" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "perform code action" })
    end,
  },
}
