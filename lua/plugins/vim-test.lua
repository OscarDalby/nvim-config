return {
  "vim-test/vim-test",
  cmd = { "TestFile", "TestNearest", "TestSuite", "TestLast" },
  keys = {
  { "<Leader>tf", "<cmd>TestFile<cr>", desc = "Run all tests in the file" },
  { "<Leader>tn", "<cmd>TestNearest<cr>", desc = "Run the nearest test" },
  { "<Leader>ts", "<cmd>TestSuite<cr>", desc = "Run the test suite" },
  { "<Leader>tl", "<cmd>TestLast<cr>", desc = "Run the last test" },
},
,
  config = function()
    vim.g['test#python#runner'] = 'pytest'
  end,
}
