return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      map_cr = false
    })
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
