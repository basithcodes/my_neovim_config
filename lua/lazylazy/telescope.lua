return {
   'nvim-telescope/telescope.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'sharkdp/fd',
      {
         'nvim-telescope/telescope-fzf-native.nvim',
         build = 'make',
         cond = function()
            return vim.fn.executable 'make' == 1
         end,
      },
      {
         "ThePrimeagen/git-worktree.nvim",
         config = function()
            require("git-worktree").setup {}
         end,
      },
   },

   config = function()
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<space><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
         -- You can pass additional configuration to telescope to change theme, layout, etc.
         require('telescope.builtin').current_buffer_fuzzy_find(
            require('telescope.themes').get_dropdown {
               winblend = 50,
               previewer = true,
            }
         )
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Create a shortcut which lists workspace_folders
      --local telescope_project_list = function ()

      --end

      local telescope_live_grep_open_files = function()
         require('telescope.builtin').live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
         }
      end

      local search_project_files = function()
         local workspace_folders = vim.lsp.buf.list_workspace_folders()
         if not workspace_folders or #workspace_folders == nil then
            print("No workspace folder found.")
            return
         else
            local workspace = workspace_folders[1]
            return require("telescope.builtin").find_files({
               cwd = workspace
            })
         end
      end

      local nvim_configs = function()
         local nvim_config_dir = "~/.config/nvim"
         vim.api.nvim_command('tabnew')
         vim.api.nvim_command('lcd ~/.config/nvim')
         require("telescope.builtin").find_files({
            cwd = nvim_config_dir,
         })
      end

      local find_my_notes = function()
         local notes_dir = "~/Documents/notes"
         vim.api.nvim_command('tabnew')
         vim.api.nvim_command('lcd ~/Documents/notes')
         require("telescope.builtin").find_files({
            cwd = notes_dir,
         })
      end

      local grep_my_notes = function()
         local notes_dir = "~/Documents/notes"
         vim.api.nvim_command('tabnew')
         vim.api.nvim_command('lcd ~/Documents/notes')
         require("telescope.builtin").live_grep({
            cwd = notes_dir,
         })
      end

      local basic_find_files = function()
         require("telescope").setup({
            defaults = {
               layout_strategy = "vertical",
               layout_config = {
                  height = 0.9,
                  width = 0.9,
                  preview_cutoff = 10,
                  prompt_position = "bottom"
               },
               cycle_layout_list = {
                  "horizontal",
                  "vertical",
                  "center",
               },
               path_display = {
                  "filename_first",
                  --shorten = {
                  --   len = 3,
                  --   exclude = { 1, -1 }
                  --},
               },
            },
         })
         require("telescope.builtin").find_files()
      end

      vim.keymap.set('n', '<leader>sp', search_project_files, { desc = '[S]earch [P]roject Files' })
      vim.keymap.set('n', '<leader>nvim', nvim_configs, { desc = 'Nvim Configs' })
      vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
      vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
      --vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sf', basic_find_files, { desc = '[S]erch [F]iles' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sn', find_my_notes, { desc = 'Search Notes' })
      vim.keymap.set('n', '<leader>sng', grep_my_notes, { desc = 'Grep Notes' })
   end
}
