return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    local ss = require('smart-splits')
    ss.setup({})

    vim.keymap.set('n', '<C-h>', ss.resize_left)
    vim.keymap.set('n', '<C-j>', ss.resize_down)
    vim.keymap.set('n', '<C-k>', ss.resize_up)
    vim.keymap.set('n', '<C-l>', ss.resize_right)
  end,
}
