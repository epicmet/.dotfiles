local status, yanky = pcall(require, 'yanky')
if not status then return end

local mapping = require('yanky.telescope.mapping')
local utils = require('yanky.utils')

local actions = require('telescope.actions')

yanky.setup({
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 100,
  },
  picker = {
    telescope = {
      mappings = {
        default = mapping.put('p'),
        i = {
          ['<c-n>'] = actions.move_selection_next,
          ['<c-p>'] = actions.move_selection_previous,
          ['<c-x>'] = mapping.delete(),
          ['<c-r>'] = mapping.set_register(utils.get_default_register()),
        },
        n = {
          p = mapping.put('p'),
          P = mapping.put('P'),
          d = mapping.delete(),
          r = mapping.set_register(utils.get_default_register()),
        },
      },
    },
  },
})

vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')

-- I dont know what are these yet
-- vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
-- vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')

vim.keymap.set('n', '<c-n>', '<Plug>(YankyCycleForward)')
vim.keymap.set('n', '<c-p>', '<Plug>(YankyCycleBackward)')
