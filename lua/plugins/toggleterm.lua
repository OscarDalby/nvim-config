return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = { --[[ things you want to change go here]]
  },
  config = function()
    require("toggleterm").setup({
      -- size can be a number or function which is passed the current terminal
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,    -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = true,
      direction = "horizontal", -- or 'vertical' or 'float' or 'tab'
      close_on_exit = true,  -- close the terminal window when the process exits
      shell = vim.o.shell,   -- change the default shell
    })

    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    local term1 = Terminal:new({ count = 1 })
    local term2 = Terminal:new({ count = 2 })
    local term3 = Terminal:new({ count = 3 })
    local term4 = Terminal:new({ count = 4 })
    local term5 = Terminal:new({ count = 5 })
    local term6 = Terminal:new({ count = 6 })

    function _TERM1_TOGGLE()
      term1:toggle()
    end

    function _TERM2_TOGGLE()
      term2:toggle()
    end

    function _TERM3_TOGGLE()
      term3:toggle()
    end

    function _TERM4_TOGGLE()
      term4:toggle()
    end

    function _TERM5_TOGGLE()
      term5:toggle()
    end

    function _TERM6_TOGGLE()
      term6:toggle()
    end

    vim.api.nvim_set_keymap("n", "t1", "<cmd>lua _TERM1_TOGGLE()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "t2", "<cmd>lua _TERM2_TOGGLE()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "t3", "<cmd>lua _TERM3_TOGGLE()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "t4", "<cmd>lua _TERM4_TOGGLE()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "t5", "<cmd>lua _TERM5_TOGGLE()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "t6", "<cmd>lua _TERM6_TOGGLE()<CR>", { noremap = true, silent = true })
  end,
}
