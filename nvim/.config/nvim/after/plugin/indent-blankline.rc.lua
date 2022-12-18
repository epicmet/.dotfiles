local status, indent = pcall(require, 'indent_blankline')
if not status then return end

indent.setup({
  char = '┊',
  show_trailing_blankline_indent = false,
})
