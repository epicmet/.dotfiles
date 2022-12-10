local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', '<leader>nt', ':tabedit<Return>', { silent = true })

-- Split tab window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window I am still ok without no remaping for this
--keymap.set('n', '<Space>', '<C-w>w')
--keymap.set('', 'sh', '<C-w>h')
--keymap.set('', 'sk', '<C-w>k')
--keymap.set('', 'sj', '<C-w>j')
--keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Move lines
keymap.set('v', 'J', ":m '>+1 <CR>gv=gv")
keymap.set('v', 'K', ":m '<-2 <CR>gv=gv")

-- Source the current file
keymap.set('n', '<leader><CR>', '<cmd>so%<CR>')

-- Put cursor on the center when navigating with Ctrl-u and Ctrl-d
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', '<C-d>', '<C-d>zz')
