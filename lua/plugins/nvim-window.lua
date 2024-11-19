return {
  "yorickpeterse/nvim-window",
  keys = {
    { "<leader>j", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
  },
  config = function()
    local nvim_window = require("nvim-window")
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
