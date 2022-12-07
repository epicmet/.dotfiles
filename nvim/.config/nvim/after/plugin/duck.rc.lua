local status, duck = pcall(require, 'duck')
if not status then return end

vim.keymap.set('n', '<leader>dd', function() duck.hatch() end, {})
vim.keymap.set('n', '<leader>dk', function() duck.cook() end, {})
