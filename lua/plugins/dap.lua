return {
  "mfussenegger/nvim-dap",
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>dv", ":DapToggleRepl<CR>", { noremap = true, silent = true })
  end,
}
