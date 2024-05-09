return {
   "rebelot/kanagawa.nvim",
   config = function()
      require('kanagawa').setup({})
   require("kanagawa").load("wave")
   vim.cmd("hi CursorLineNr guifg=#ffa500")
   vim.cmd("set cursorline")
   end
}
