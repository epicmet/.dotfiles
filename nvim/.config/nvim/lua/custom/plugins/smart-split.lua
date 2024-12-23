return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    local ss = require('smart-splits')
    ss.setup({})

    vim.keymap.set('n', '<C-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').resize_right)
  end,
}
