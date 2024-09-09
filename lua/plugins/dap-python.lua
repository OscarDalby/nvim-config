return {
  "mfussenegger/nvim-dap-python",
  config = function()
    require("dap-python").setup(".venv/bin/python")

    vim.api.nvim_set_keymap("n", "<leader>dn", ":lua require('dap-python').test_method()<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader>df", ":lua require('dap-python').test_class()<CR>", { silent = true })
    vim.api.nvim_set_keymap(
      "v",
      "<leader>ds",
      "<ESC>:lua require('dap-python').debug_selection()<CR>",
      { silent = true }
    )

    vim.api.nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { silent = true })

    function RunSelectedPythonCode()
      local start_line, end_line = vim.fn.getpos("'<")[2], vim.fn.getpos("'>")[2]
      local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
      local tmpname = vim.fn.tempname() .. ".py"
      vim.fn.writefile(lines, tmpname)
      require("dap").run({
        type = "python",
        request = "launch",
        program = tmpname,
        pythonPath = function()
          local venv_path = os.getenv("VIRTUAL_ENV") or "/.venv"
          return venv_path .. "/bin/python"
        end,
      })
    end

    vim.api.nvim_set_keymap(
      "v",
      "<leader>dr",
      "<Esc>:lua RunSelectedPythonCode()<CR>",
      { noremap = true, silent = true }
    )
  end,
}
