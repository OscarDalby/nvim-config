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

some_unused_func = function()
  printh("hello!")
end

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

-- Open the minimap for specific file types
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.js", "*.jsx", "*.lua", "*.py", "*.go", "*.css", "*.html", "*.cs" },
  callback = function()
    require("mini.map").open()
  end,
})

vim.api.nvim_set_hl(0, "Normal", { fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg, bg = "black" })

vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = "#000000", bg = "#000000" })

-- NvimTree
-- NvimTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
-- NvimTreeRootFolder = { fg = c.blue, style = "bold" },
-- NvimTreeGitDirty = { fg = c.git.change },
-- NvimTreeGitNew = { fg = c.git.add },
-- NvimTreeGitDeleted = { fg = c.git.delete },
-- NvimTreeSpecialFile = { fg = c.purple, style = "underline" },
-- LspDiagnosticsError = { fg = c.error },
-- LspDiagnosticsWarning = { fg = c.warning },
-- LspDiagnosticsInformation = { fg = c.info },
-- LspDiagnosticsHint = { fg = c.hint },
-- NvimTreeIndentMarker = { fg = c.fg_gutter },
-- NvimTreeImageFile = { fg = c.fg_sidebar },
-- NvimTreeSymlink = { fg = c.blue },

vim.opt.guifont = "3270 Nerd Font Regular"
