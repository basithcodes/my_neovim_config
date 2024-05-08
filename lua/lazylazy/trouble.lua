return {
   'folke/trouble.nvim',
   config = function()
      require("trouble").setup({
         icons = false,
      })

      vim.keymap.set("n", "<leader>tt", function()
         require("trouble").toggle()
      end);

      vim.keymap.set('n', 'gr', function()
         vim.api.nvim_command('Trouble lsp_references')
      end);

      vim.keymap.set("n", "<C-j>", function()
         require("trouble").next({
            skip_groups = true,
            jump = true,
         })
      end);

      vim.keymap.set("n", "<C-k>", function()
         require("trouble").previous({
            skip_groups = true,
            jump = true,
         })
      end);
   end
}
