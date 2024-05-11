--return {
--   vim.api.nvim_create_autocmd( "BufEnter", {
--      callback = function ()
--         local capabilities = vim.lsp.protocol.make_client_capabilities()
--         capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
--         vim.lsp.start({
--            name = "QMLLangServer",
--            cmd = {"qmlls"},
--            --root_dir = vim.fs.dir(vim.fs.find({''}))
--            root_dir = vim.fs.dirname(vim.fs.find({'.qmlls.ini'}, { upward = true })),
--            handlers = {
--               ["textDocument/publishDiagnostics"] = vim.lsp.with(
--               vim.lsp.diagnostic.on_publish_diagnostics, {
--                  -- Disable virtual_text
--                  virtual_text = true,
--               }),
--            },
--         })
--      end,
--   })
--}

local function is_it_a_workspace()
   if vim.lsp.buf.list_workspace_folders() ~= nil then
      print("hello")
   end
end


return {
}
