local status, indent = pcall(require, 'indent_blankline')
if not status then return end

vim.cmd([[highlight IndentBlanklineIndent guifg=#61AFEF gui=nocombine]])

indent.setup({
  char = '┊',
  show_trailing_blankline_indent = false,
  char_highlight_list = {
    'IndentBlanklineIndent',
  },
})
