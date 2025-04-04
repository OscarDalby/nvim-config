return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config_treesitter = require("nvim-treesitter.configs").setup {
      ensure_installed = { "c", "cpp", "lua", "python", "javascript", "typescript" },
      autoinstall = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
