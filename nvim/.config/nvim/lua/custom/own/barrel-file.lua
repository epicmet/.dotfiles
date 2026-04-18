local function error(msg)
  vim.notify(msg, 'error', {
    title = 'error while creating barrel file',
    timeout = 2000,
  })
end

local function get_filename_from(name)
  -- TODO: generate filename according to module system (ESM or CJS)
  return vim.split(name, '.', { plain = true })[1]
end

local function get_export_statement(name, ext)
  local type_to_es = {
    ts = function()
      return 'export * from "./' .. get_filename_from(name) .. '";'
    end,
  }

  return type_to_es[ext]()
end

local function gen_barrel()
  local current_buf = vim.api.nvim_get_current_buf()
  local full_path = vim.api.nvim_buf_get_name(current_buf)

  local file_ext = full_path:match('%.([^%.]+)$')
  if file_ext == nil then return error('could not detect file extention') end

  if file_ext ~= 'ts' then return error('creating barrel file for extention "' .. file_ext .. '" is not supported.') end

  local dirname = vim.fs.dirname(full_path)

  local index_file_name = 'index.' .. file_ext
  local index_file_path = vim.fs.joinpath(dirname, index_file_name)

  local content = {}

  for name, t in vim.fs.dir(dirname) do
    if t == 'file' and vim.endswith(name, file_ext) and name ~= index_file_name then
      local export_statement = get_export_statement(name, file_ext)

      table.insert(content, export_statement)
    end
  end

  vim.fn.writefile(content, index_file_path, 'a')

  vim.notify('created/append into ' .. index_file_path)
end

vim.api.nvim_create_user_command('Barrel', function(_)
  gen_barrel()
end, {})
