-- Navigate between quickfix items
vim.keymap.set("n", "<ESC>j", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
vim.keymap.set("n", "<ESC>k", "<cmd>cprev<CR>zz", { desc = "Previous qfixlist" })
vim.keymap.set("n", "<leader>zen", "<cmd>ZenMode<CR>", { desc = "Zen Mode" })
vim.keymap.set("n", "<leader>n", "<cmd>Neotree toggle<CR>", { desc = "Neotree Toggle" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "LSP Symbols (Toggle)" })
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
   { desc = "LSP Definitions/References/...(Toggle)" })
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Toggle)" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.bug=0<CR>",
   { desc = "Buffer Diagnostics (Toggle)" })
vim.keymap.set("n", "<leader>qq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix List (Toggle)" })
vim.keymap.set("n", "<leader>ll", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List (Toggle)" })
vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references<CR>", { desc = "Location List (Toggle)" })
vim.api.nvim_create_autocmd('LspAttach', {
   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
   callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.diagnostic.config({
         virtual_text = true,
         update_in_insert = true,
         float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = true,
         }
      })

      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<space>f', function()
         vim.lsp.buf.format { async = true }
      end, opts)
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
   end,
})
