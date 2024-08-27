-- NOTE: Notification
return {
  "rcarriga/nvim-notify",
  -- lazy = false,
  event = "VeryLazy",
  opts = {
    level = 2,
    minimum_width = 30,
    render = "wrapped-compact",
    stages = "static",
    timeout = 2000,
    top_down = false,
  },
  config = function() end,
}
