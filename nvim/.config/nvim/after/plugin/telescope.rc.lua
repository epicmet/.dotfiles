local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local sorters = require('telescope.sorters')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--smart-case"
    },
  },
  extensions = {
    file_browser = {
      initial_mode = "normal",
      theme = "dropdown",
      grouped = true,
      hidden = true,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal Vd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

vim.keymap.set('n', '<leader>gw',
  function()
    builtin.grep_string({
      short_path = true,
      word_match = "-w",
      only_sort_text = true,
      layout_strategy = "vertical",
      sorter = sorters.get_fzy_sorter()
    })
  end)
vim.keymap.set('n', '<leader>tf',
  function()
    builtin.git_files({
      layout_strategy = "vertical",
    })
  end)
vim.keymap.set('n', '<leader>ta',
  function()
    builtin.find_files({
      no_ignore = false,
      layout_strategy = "vertical",
      hidden = true
    })
  end)
vim.keymap.set('n', '<leader>tr',
  function()
    builtin.live_grep()
  end)
vim.keymap.set('n', '<leader>tb',
  function()
    builtin.buffers()
  end)
vim.keymap.set('n', '<leader>th',
  function()
    builtin.help_tags()
  end)
vim.keymap.set('n', '\\\\',
  function()
    builtin.resume()
  end)
vim.keymap.set('n', '<leader>te',
  function()
    builtin.diagnostics()
  end)
vim.keymap.set('n', '<leader>to',
  function()
    builtin.oldfiles()
  end)


vim.keymap.set('n', '<leader>gs',
  function()
    builtin.git_status({
      layout_strategy = "vertical",
    })
  end)
vim.keymap.set('n', '<leader>gc',
  function()
    builtin.git_commits({
      layout_strategy = "vertical",
    })
  end)
vim.keymap.set('n', '<leader>gb',
  function()
    builtin.git_bcommits({
      layout_strategy = "vertical",
    })
  end)

vim.keymap.set("n", "sf",
  function()
    telescope.extensions.file_browser.file_browser({
      path = "%:p:h",
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = "normal",
      layout_config = { height = 40 }
    })
  end)
