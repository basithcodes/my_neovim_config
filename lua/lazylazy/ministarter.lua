return {
  -- 'echasnovski/mini.nvim',
  -- config = function ()
  --    local header_art =
  --    [[
  --    ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
  --    │││├┤ │ │╰┐┌╯││││
  --    ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
  --    ]]

  --    require('mini.starter').setup({
  --       -- Whether to read latest session if Neovim opened without file arguments
  --       autoread = false,
  --       -- Whether to write current session before quitting Neovim
  --       autowrite = false,
  --       -- Directory where global sessions are stored (use `''` to disable)
  --       directory =  '~/.project/nvim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
  --       -- File for local session (use `''` to disable)
  --       file = 'Session.vim' -- 'Session.vim',
  --    })

  --    local starter = require('mini.starter')
  --    local session = require('mini.sessions')

  --    starter.setup({
  --       -- evaluate_single = true,
  --       items = {
  --          starter.sections.sessions(77, true),
  --          starter.sections.builtin_actions(),
  --       },
  --       content_hooks = {
  --          function(content)
  --             local blank_content_line = { { type = 'empty', string = '' } }
  --             local section_coords = starter.content_coords(content, 'section')
  --             -- Insert backwards to not affect coordinates
  --             for i = #section_coords, 1, -1 do
  --                table.insert(content, section_coords[i].line + 1, blank_content_line)
  --             end
  --             return content
  --          end,
  --          starter.gen_hook.adding_bullet("» "),
  --          starter.gen_hook.aligning('center', 'center'),
  --       },
  --       header = header_art,
  --       footer = '',
  --    })

  --    session.setup({

  --    })
  -- end,
  -- version = false,
}

