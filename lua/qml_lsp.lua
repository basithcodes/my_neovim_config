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

--function Find_File_In_Dir(file_name)
--   local chr = os.tmpname():sub(1, 1)
--   if chr == "/" then
--      chr = "/[^/]*$"
--   else
--      chr = "\\[^\\]*$"
--   end
--   return arg[0]:sub(1, arg[0]:find(chr)) .. (file_name or '')
--end

local function is_it_a_workspace()
   if vim.lsp.buf.list_workspace_folders() ~= nil then
      print("hello")
   end
end


return {
   -- Find qmlls file in a dir and extract buildDir value
   -- vim.api.nvim_create_autocmd({ "BufEnter" }, {
   --    pattern = { ".qmlls.ini" },
   --    callback = function(ev)
   --       print(string.format('Event fired: %s', vim.inspect(ev)))
   --    end,
   -- })
   --
   -- local file_name = ".qmlls.ini"
   -- local searchString = "buildDir="
   -- local file_present = Find_File_In_Dir(file_name)
   -- local full_content_of_a_file
   --
   -- if file_present ~= nil then
   --    local f = assert(io.open(file_name, "r"))
   --    full_content_of_a_file = f:read("*all")
   --    f:close()
   -- end
   --
   -- local found_line = {}
   -- for line in string.gmatch(full_content_of_a_file, "[^\r\n]+") do
   --    if string.find(line, searchString) then
   --       table.insert(found_line, line)
   --    end
   -- end
   --
   -- local qmlls_build_path = found_line[1]
   -- print(qmlls_build_path)
}
