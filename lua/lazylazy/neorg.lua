return {
   "nvim-neorg/neorg",
   lazy = false,
   version = "*",
   dependencies = {"luarocks.nvim"},
   config = function()
      require("neorg").setup ({
         load = {
            ["core.defaults"] = {
            },
            ["core.autocommands"] = {},
            ["core.integrations.treesitter"] = {
               config = {
                  configure_parsers = true,
                  install_parsers = true,

               },
            },
            ["core.export"] = {},
            ["core.concealer"] = { -- Adds pretty icons to your document
               config = {
                  folds = false,
               },
            },
            ["core.summary"] = {},
            ["core.dirman"] = { -- Manages Neorg workspaces
               config = {
                  workspaces = {
                     notes = "~/Documents/notes",
                  },
                  index = "~/Documents/notes/home.norg",
               }
            }
         },
      })
   end,
}

