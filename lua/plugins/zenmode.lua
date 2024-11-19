return {
  "folke/zen-mode.nvim",
  opts = {},
  config = function()
    vim.api.nvim_set_keymap("n", "<Leader>z", ":ZenMode<CR>", { noremap = true, silent = true })
  end,
}
