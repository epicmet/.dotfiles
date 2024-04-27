-- Use `:make` to run `tsc --noEmit` on the whole TS/JS project and put the errors in a quickfix list

local augroup = vim.api.nvim_create_augroup('tsc-error', { clear = true })

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  group = augroup,
  command = 'compiler tsc | setlocal makeprg=./node_modules/.bin/tsc\\ --noEmit',
})
