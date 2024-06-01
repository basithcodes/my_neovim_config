return {
   'neovim/nvim-lspconfig',
   dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
      { 'folke/neodev.nvim', opts = {} },
      { 'hrsh7th/nvim-cmp',  opts = {} },
      { 'L3MON4D3/LuaSnip',  opts = {} },
      'saadparwaiz1/cmp_luasnip',
      { 'hrsh7th/cmp-nvim-lsp', opts = {} },
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      --'rafamadriz/friendly-snippets',
   },
   config = function()
      require("trouble").setup()
      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
         ensure_installed = {
            "lua_ls",
            "rust_analyzer",
            "clangd",
            "vimls",
         },
      })
      local handlers = {
         function(server_name)
            -- print("setting up", server_name)
            require("lspconfig")[server_name].setup {}
         end,

         ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
               settings = {
                  Lua = {
                     diagnostics = {
                        globals = { "vim", "P" },
                     },
                  },
               },
            }
         end,
      }

      require("mason-lspconfig").setup_handlers(handlers)

      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup({
         window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
         },
         mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['C-Space'] = cmp.mapping.complete(),
         }),
         sources = cmp.config.sources(
            {
               { name = 'nvim_lsp' },
            },
            {
               { name = 'luasnip' },
            },
            {
               { name = 'neorg' },
            },
            {
               { name = 'buffer' },
            },
            {
               { name = 'path' },
            },
            {
               { name = 'cmdline' },
            }
         ),
         view = {
            ghost_text = true,
         },
         snippet = {
            expand = function(args)
               require('luasnip').lsp_expand(args.body)
            end,
         },
      })
   end
}
