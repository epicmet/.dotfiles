local keymap = vim.keymap

-- Remove default behavior of space
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Do not yank things deleted with x
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

-- Cursor stays on its position on J
keymap.set('n', 'J', 'mzJ`z')

-- When paste on visual mode, do not replace the deleted thing with the yank register
keymap.set('x', '<leader>p', '"_dP')

-- Delete to void register
keymap.set('n', '<leader>d', '"_d')
keymap.set('v', '<leader>d', '"_d')

-- Replace current word (This suggested by Codeium !!)
keymap.set('n', '<leader>rp', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Beginning and end of the line
keymap.set({ 'n', 'v' }, 'H', '^')
keymap.set({ 'n', 'v' }, 'L', '$')

-- Quickfix list
keymap.set('n', ']q', '<cmd>cnext<CR>zz')
keymap.set('n', '[q', '<cmd>cprev<CR>zz')
keymap.set('n', '<leader>qo', '<cmd>copen<CR>')
keymap.set('n', '<leader>qq', '<cmd>cclose<CR>')

-- terminal mode
keymap.set('t', '<C-[>', '<C-\\><C-n>')

local function toggle_manual_format_keymap()
  local temp = vim.g.auto_prettier_format_onsave
  vim.g.auto_prettier_format_onsave = not temp
  print('Auto format on save ' .. (tostring(vim.g.auto_prettier_format_onsave)))
end

keymap.set('n', '<leader>tf', toggle_manual_format_keymap)
