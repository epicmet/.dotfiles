local status, telescope = pcall(require, 'telescope')
if not status then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require('telescope').extensions.file_browser.actions

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--hidden',
      '--smart-case',
    },
  },
  extensions = {
    file_browser = {
      initial_mode = 'normal',
      theme = 'dropdown',
      grouped = true,
      hidden = true,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['n'] = {
          -- your custom normal mode mappings
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end,
        },
      },
    },
  },
})

telescope.load_extension('file_browser')

-- File browser remaps
vim.keymap.set('n', '<C-p>', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = 'normal',
    layout_config = { height = 40 },
  })
end)

-- Telescope remaps
vim.keymap.set('n', 'sf', function()
  builtin.find_files({
    no_ignore = false,
    layout_strategy = 'vertical',
    hidden = true,
  })
end, { desc = '[S]earch [F]iles' })

-- vim.keymap.set('n', 'sgf', function()
-- 	builtin.git_files({
-- 		layout_strategy = 'vertical',
-- 	})
-- end)

vim.keymap.set('n', 'sw', function()
  builtin.grep_string({
    short_path = true,
    word_match = '-w',
    only_sort_text = true,
    layout_strategy = 'vertical',
    sorter = sorters.get_fzy_sorter(),
  })
end, { desc = '[S]earch current [W]ord' })

vim.keymap.set('n', 'sg', function()
  builtin.live_grep()
end, { desc = '[S]earch by [G]rep' })

-- Until I find a usage for this, this stays commented
-- vim.keymap.set('n', '<leader><Space>', function()
-- 	builtin.buffers()
-- end)

vim.keymap.set('n', 'sh', function()
  builtin.help_tags()
end, { desc = '[S]earch [H]elp' })

vim.keymap.set('n', '\\\\', function()
  builtin.resume()
end)

vim.keymap.set('n', 'sd', function()
  builtin.diagnostics()
end, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = '[/] Fuzzily search in current buffer]' })

-- Until I find a usage for this, this stays commented
-- vim.keymap.set('n', '<leader>?', function()
-- 	builtin.oldfiles()
-- end, { desc = '[?] Find recently opened files' })

vim.keymap.set('n', '<leader>gs', function()
  builtin.git_status({
    layout_strategy = 'vertical',
  })
end)

vim.keymap.set('n', '<leader>gc', function()
  builtin.git_commits({
    layout_strategy = 'vertical',
  })
end)

vim.keymap.set('n', '<leader>gb', function()
  builtin.git_bcommits({
    layout_strategy = 'vertical',
  })
end)
