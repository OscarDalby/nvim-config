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
vim.keymap.set("x", "<C-Up>", "10k", { noremap = true, silent = true })
vim.keymap.set("x", "<C-Down>", "10j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "b", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "e", { noremap = true, silent = true })

-- Resize splits with shift + arrows
vim.api.nvim_set_keymap("n", "<S-Left>", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Right>", ":vertical resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Up>", ":resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Down>", ":resize -5<CR>", { noremap = true, silent = true })

-- Set the background/foreground to pure black regardless of theme
vim.api.nvim_set_hl(0, "Normal", { fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg, bg = "black" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = "#000000", bg = "#000000" })
-- Oil keymap
vim.keymap.set("n", "<Leader>o", ":Oil<CR>", { noremap = true, silent = true })

-- Git keymaps
vim.api.nvim_set_keymap("n", "<leader>ga", ":!git add .<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>gc",
  ':!git commit -m "neovim auto commit"<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<leader>gp", ":!git push origin main<CR>", { noremap = true, silent = true })

-- Window title
vim.opt.titlelen = 0
vim.opt.titlestring = [[%{fnamemodify(getcwd(), ':t')} - %t]]
-- Search case behaviour
vim.o.ignorecase = true
vim.o.smartcase = true

-- Split separators
vim.opt.fillchars = { vert = "│", horiz = "-" }
vim.opt.laststatus = 3
vim.cmd([[hi VertSplit guibg=NONE guifg=#001BFF]])

-- Python
vim.api.nvim_set_keymap("n", "<leader>pr", ":w<CR>:vsplit | term python %<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>pm",
  ":w<CR>:vsplit | term python -m " .. vim.fn.expand("%:t:r") .. "<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>pi", ":!pip install -r requirements.txt<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.cmd("silent! %!black --quiet -")
  end
})

vim.cmd("let $PYTHONPATH = expand('%:p:h')")


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
