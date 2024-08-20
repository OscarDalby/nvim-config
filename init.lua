-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    require("os").exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.wo.number = true

-- Setup lazy.nvim
require("vim-options")
require("lazy").setup("plugins")

-- Format on save
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ async = false, id = args.data.client_id })
      end,
    })
  end,
})

vim.api.nvim_create_user_command("RunPy", "silent !python %", {})

vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "split buffer horizontally" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "split buffer vertically" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldlevel = 2
  end,
})
-- moving around quickly with CTRL-arrows
vim.keymap.set("n", "<C-Up>", "10k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "10j", { noremap = true, silent = true })

vim.keymap.set("n", "<C-Left>", "b", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "e", { noremap = true, silent = true })

-- replace all found with LDR-r-a
vim.keymap.set(
  "n",
  "<Leader>ra",
  [[:%s/\<<C-r>//\<<C-r>//g<Left><Left>]],
  { desc = "Replace all instances of a found thing" }
)

vim.api.nvim_set_hl(0, "Normal", { fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg, bg = "black" })
