return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
    -- vim.keymap.set("x", "(", "S)", { remap = true })
    -- vim.keymap.set("x", ")", "S)", { remap = true })
    -- vim.keymap.set("x", "[", "S]", { remap = true })
    -- vim.keymap.set("x", "]", "S]", { remap = true })
    -- vim.keymap.set("x", "{", "S}", { remap = true })
    -- vim.keymap.set("x", "}", "S}", { remap = true })
  end,
}
