return {
   "nvim-treesitter/nvim-treesitter",
   dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
   },
   config = function()
      require("nvim-treesitter.configs").setup({
         ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "rust", "go", "jsdoc" },
         auto_install = true,
         highlight = {
            enable = true,
         },
      })
   end,
   build = ':TSUpdate',
}

