-- TODOS:
-- - Get bufnr dynamicaly
-- - Make neovim do not care about the content of the buffer when quiting it
-- - Make dynamic and default command specefic for each language

local attach_to_buffer = function(output_bufnr, pattern, command)
  local num_bufnr = tonumber(output_bufnr)

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("mahdi-autosave", { clear = true }),
    pattern = pattern,
    callback = function()
      local append_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(num_bufnr, -1, -1, false, data)
        end
      end

      vim.api.nvim_buf_set_lines(num_bufnr, 0, -1, false, { "----- output: " })
      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data
      })
    end
  })
end


vim.api.nvim_create_user_command("AutoRun", function()
  local bufnr = vim.fn.input("Bufnr: ")
  local pattern = vim.fn.input("Pattern: ")
  local command = vim.split(vim.fn.input("Command: "), " ")

  attach_to_buffer(bufnr, pattern, command)
end, {})
