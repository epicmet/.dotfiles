local status, ui = pcall(require, 'harpoon.ui')
if (not status) then return end

local status2, mark = pcall(require, 'harpoon.mark')
if (not status2) then return end

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>v', ui.toggle_quick_menu)

-- TOOD: Make these calls dynamic to a remap, something like this:
-- 2<leader>nf -> nav_file(2)

vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>5', function() ui.nav_file(5) end)
vim.keymap.set('n', '<leader>6', function() ui.nav_file(6) end)
vim.keymap.set('n', '<leader>7', function() ui.nav_file(7) end)
vim.keymap.set('n', '<leader>8', function() ui.nav_file(8) end)
vim.keymap.set('n', '<leader>9', function() ui.nav_file(9) end)
