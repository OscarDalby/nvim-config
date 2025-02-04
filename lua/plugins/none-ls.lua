return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

    local function on_attach(client, bufnr)
      if client.name == "tsserver" or client.name == "eslint" then
        client.server_capabilities.documentFormattingProvider = false
      end
      
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({
              async = false,
              filter = function(cli)
                return cli.name == "null-ls" 
              end,
            })
          end,
        })
      end
    end

    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,
        -- JavaScript/TypeScript
        -- null_ls.builtins.diagnostics.eslint_d, 
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        }),
        -- Python
        null_ls.builtins.formatting.black, -- Python formatting with black
        null_ls.builtins.formatting.isort, -- Python import sorting
        null_ls.builtins.diagnostics.mypy, -- Python linting with mypy
      },
      on_attach = on_attach, 
    })

    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format file" })
  end,
}
