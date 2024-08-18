return {
  "yorickpeterse/nvim-window",
  keys = {
    { "<leader>j", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
  },
  config = function()
    local nvim_window = require("nvim-window")

    -- local function select_window_by_number(number)
    -- 	local windows = vim.api.nvim_list_wins()
    -- 	if windows[number] then
    -- 		vim.api.nvim_set_current_win(windows[number])
    -- 	end
    -- end

    -- vim.keymap.set("n", "<leader>w1", function()
    -- 	select_window_by_number(1)
    -- end, { desc = "go to window 1" })
    --
    -- vim.keymap.set("n", "<leader>w2", function()
    -- 	select_window_by_number(2)
    -- end, { desc = "go to window 2" })
    --
    -- vim.keymap.set("n", "<leader>w3", function()
    -- 	select_window_by_number(3)
    -- end, { desc = "go to window 3" })
    --
    -- vim.keymap.set("n", "<leader>w4", function()
    -- 	select_window_by_number(4)
    -- end, { desc = "go to window 4" })
    --
    -- vim.keymap.set("n", "<leader>w5", function()
    -- 	select_window_by_number(5)
    -- end, { desc = "go to window 5" })

    nvim_window.setup({
      chars = {
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
      },
      normal_hl = "Normal",
      hint_hl = "Bold",
      border = "single",
      render = "float",
    })
  end,
}
