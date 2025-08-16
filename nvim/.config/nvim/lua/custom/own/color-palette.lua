-- colorscheme based on Maple Dark (Maple Theme)
vim.o.termguicolors = true
local colors = {
  bg       = "#1e1e1f",
  fg       = "#cbd5e1",
  red      = "#edabab",
  green    = "#a4dfae",
  yellow   = "#eecfa0",
  blue     = "#8fc7ff",
  purple   = "#d2ccff",
  cyan     = "#a1e8e5",
  bright_red    = "#ffc4c4",
  bright_green  = "#bdf8c7",
  bright_blue   = "#a8e0ff",
  bright_cyan   = "#bafffe",
  bright_purple = "#ebe5ff",
  bright_white  = "#ffffff",
  bright_yellow = "#ffe8b9",
  bright_black  = "#bfbfbf",
  bright_grey   = "#403e3e",
}

-- core UI highlights
vim.api.nvim_set_hl(0, "Normal",       { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "CursorLine",   { bg = colors.bright_grey })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = colors.bright_black })
vim.api.nvim_set_hl(0, "SignColumn",   { bg = colors.bg })
vim.api.nvim_set_hl(0, "LineNr",       { fg = colors.bright_black, bg = colors.bg })
vim.api.nvim_set_hl(0, "Comment",      { fg = colors.bright_black, italic = true })
vim.api.nvim_set_hl(0, "Constant",     { fg = colors.yellow })
vim.api.nvim_set_hl(0, "String",       { fg = colors.green })
vim.api.nvim_set_hl(0, "Identifier",   { fg = colors.blue, italic = true })
vim.api.nvim_set_hl(0, "Function",     { fg = colors.bright_blue, underline = false })
vim.api.nvim_set_hl(0, "Statement",    { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, "Type",         { fg = colors.cyan })
vim.api.nvim_set_hl(0, "Keyword",      { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, "Boolean",      { fg = colors.red })
vim.api.nvim_set_hl(0, "Number",       { fg = colors.bright_purple })
vim.api.nvim_set_hl(0, "Error",        { fg = colors.bright_red, bold = true })

