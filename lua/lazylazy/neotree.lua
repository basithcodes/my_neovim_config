return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
       "nvim-lua/plenary.nvim",
       "nvim-tree/nvim-web-devicons",
       "MunifTanjim/nui.nvim",
       "3rd/image.nvim"
    },
    config = function ()
      require("neo-tree").setup({
       close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    })
    end

 }
