return { "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config_treesitter = require("nvim-treesitter.configs")
config_treesitter.setup({
  ensure_installed = {"lua", "javascript", "typescript", "go", "python"},
  highlight = { enable = true },
  indent = { enable = true },
}
)

vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>")
  end
}
