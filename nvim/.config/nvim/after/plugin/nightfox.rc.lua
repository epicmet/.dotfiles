local status, nightfox = pcall(require, 'nightfox')
if not status then return end

local function has(x)
  return vim.fn.has(x) == 1
end

local is_mac = has('macunix')

nightfox.setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/nightfox',
    compile_file_suffix = '_compiled', -- Compiled file suffix
    transparent = not is_mac, -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false, -- Non focused panes set to alternative background
    module_default = true, -- Default enable value for modules
    styles = { -- Style to be applied to different syntax groups
      comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
      constants = 'bold',
      functions = 'italic',
      keywords = 'bold',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
      types = 'italic,bold',
      variables = 'NONE',
    },
    inverse = { -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = { -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- setup must be called before loading
vim.cmd('colorscheme nightfox')
