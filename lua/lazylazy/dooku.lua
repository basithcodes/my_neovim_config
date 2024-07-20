return {
   "Zeioth/dooku.nvim",
   event = "VeryLazy",
   opts = {
      -- your config options here
      project_root = { '.git', '.hg', '.svn', '.bzr', '_darcs', '_FOSSIL_', '.fslckout' },
      browser_cmd = "xdg-open",

      -- automations
      on_bufwrite_generate = false, -- auto run :DookuGenerate when a buffer is written.
      on_generate_open = true,      -- auto open when running :DookuGenerate. This options is not triggered by on_bufwrite_generate.
      auto_setup = true,            -- auto download a config for the generator if it doesn't exist in the project.

      -- notifications
      on_generate_notification = true,
      on_open_notification = true
   },
}
