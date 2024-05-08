M = {}

local find_mapping = function(maps, keymapping)
   for _, value in ipairs(maps) do
      if (keymapping == value.lhs) then
         return value
      end
   end
end

M._stack = {}

M.push = function(name, mode, keymapping)
   local maps = vim.api.nvim_get_keymap(mode) -- get all keymappings
   local existing_maps = {}
   -- if user required keymap(keymapping) is present in maps then
   -- save it to the table
   for lhs, rhs in pairs(keymapping) do
      local existing = find_mapping(maps, lhs)
      if existing then
         table.insert(existing_maps, existing)
      end
   end
   M._stack[name] = existing_maps
   --P(M._stack)
end

M.pop = function(name)
   print(name)
end

return M
