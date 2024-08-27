-- NOTE: Sidebar
return {
  "sidebar-nvim/sidebar.nvim",
  enabled = false,
  cmd = {
    "SidebarNvimToggle",
    "SidebarNvimOpen",
    "SidebarNvimFocus",
    "SidebarNvimUpdate",
  },
  opts = {
    disable_default_keybindings = 0,
    bindings = nil,
    open = true,
    side = "left",
    initial_width = 28,
    hide_statusline = false,
    update_interval = 100,
    sections = { "files", "todos", "git" },
    section_separator = { "", "-----", "" },
    section_title_separator = { "" },
    containers = {
      attach_shell = "/bin/sh",
      show_all = true,
      interval = 5000,
    },
    -- datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
    ["git"] = {
      icon = "",
    },
  },
  config = function()
    -- SidebarNvimToggle
    vim.keymap.set("n", "<C-n>", ":SidebarNvimToggle<CR>")
  end,
}
