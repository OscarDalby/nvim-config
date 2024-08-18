return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      -- Keymap for finding files in project scope
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "open telescope in project scope" })
      -- Keymap for grepping in project scope
      vim.keymap.set("n", "<leader>fp", builtin.live_grep, { desc = "file grep in project scope" })
      -- Keymap for grepping the current file
      vim.keymap.set("n", "<leader>ff", function()
        builtin.grep_string({ search = vim.fn.input("Grep For > ") })
      end, { desc = "grep current file" })
      -- Keymap for system-wide grep
      vim.keymap.set("n", "<leader>fs", function()
        builtin.live_grep({ search_dirs = { "/" } })
      end, { desc = "grep system-wide" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules" },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
