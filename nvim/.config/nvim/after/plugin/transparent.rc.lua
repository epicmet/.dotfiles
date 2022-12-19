local status, transparent = pcall(require, 'transparent')
if not status then return end

transparent.setup({
  enable = true,
})

-- Disable nvim_transparent on macOS
if vim.fn.has('macunix') == 1 then vim.api.nvim_command('TransparentDisable') end
