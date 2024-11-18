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

-- Moving around quickly with CTRL-arrows
vim.keymap.set("n", "<C-Up>", "10k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "10j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "b", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "e", { noremap = true, silent = true })

-- Open the minimap for specific file types
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.c", "*.lua", "*.py", "*.go", "*.css", "*.html", "*.cs" },
--   callback = function()
--     require("mini.map").open()
--   end,
-- })

-- Set the background/foreground to pure black regardless of theme
vim.api.nvim_set_hl(0, "Normal", { fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg, bg = "black" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = "#000000", bg = "#000000" })
-- Oil keymap
vim.keymap.set("n", "<Leader>o", ":Oil<CR>", { noremap = true, silent = true })
-- Open Oil automatically on new splits
-- vim.api.nvim_create_augroup("VerticalSplitCommand", { clear = true })
-- vim.api.nvim_create_autocmd("WinNew", {
--   group = "VerticalSplitCommand",
--   callback = function()
--     if vim.fn.winwidth(0) < vim.fn.winheight(0) then
--       vim.cmd("echo 'width less than height'")
--       -- vim.cmd(":Oil<CR>")
--     else
--       vim.cmd("echo 'width greater than height'")
--       vim.cmd(" j2")
--       vim.cmd(":Oil<CR>")
--     end
--   end,
-- })
-- Windowfrom helpers import *vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = 'nvim %{expand("%:p")}'
-- Search case behaviour
vim.o.ignorecase = true
vim.o.smartcase = true

-- LANGUAGE-SPECIFIC SETUPS
-- Python
local function run_current_python_file()
  local file_path = vim.api.nvim_buf_get_name(0)
  local file_dir, file_name = file_path:match("(.+)/(.+).py$")
  local module_path = file_dir:gsub("/", ".") .. "." .. file_name
  local py_cmd = vim.api.nvim_replace_termcodes("python -m " .. module_path .. "<cr>", true, false, true)
  local percent_of_win = 0.4
  local curr_win_height = vim.api.nvim_win_get_height(0)
  local term_height = math.floor(curr_win_height * percent_of_win)
  vim.cmd(":below " .. term_height .. "split | term")
  vim.api.nvim_feedkeys(py_cmd, "t", false)
end

vim.api.nvim_create_user_command("RunPy", "silent !python %", {})
-- Folds
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.foldmethod = "manual"
    -- vim.opt_local.foldlevel = 2
  end,
})

vim.keymap.set({ "n" }, "<C-r>", "", {
  desc = "Run .py file via Neovim built-in terminal",
  callback = run_current_python_file,
})
-- increase the tab width in *.py files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
  end,
})

-- Go
require("lspconfig").gopls.setup({})
