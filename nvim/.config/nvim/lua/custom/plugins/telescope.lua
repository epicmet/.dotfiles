return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'moniquelive/rfc.nvim' },
    },
    config = function()
      local tl = require('telescope')
      local builtin = require('telescope.builtin')
      local actions = require('telescope.actions')
      local fb_actions = require('telescope').extensions.file_browser.actions

      tl.setup({
        defaults = {
          mappings = {
            n = {
              ['q'] = actions.close,
            },
          },
          vimgrep_arguments = {
            'rg',
            '--no-require-git',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--hidden',
            '--smart-case',
          },
          file_ignore_patterns = {
            '^.git/',
          },
        },
        pickers = {
          find_files = {
            theme = 'ivy',
          },
        },
        extensions = {
          fzf = {},
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
                ['l'] = actions.select_default,
                ['/'] = function()
                  vim.cmd('startinsert')
                end,
              },
            },
          },
        },
      })

      tl.load_extension('fzf')
      tl.load_extension('file_browser')
      tl.load_extension('rfc')

      -- File browser remaps
      vim.keymap.set('n', '<C-p>', function()
        tl.extensions.file_browser.file_browser({
          path = '%:p:h',
          cwd = vim.fn.expand('%:p:h'),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = 'normal',
          layout_config = { height = 40 },
        })
      end)

      -- Remove default behavior of s (who uses s?)
      vim.keymap.set({ 'n', 'v' }, 's', '<Nop>', { silent = true })

      vim.keymap.set('n', 'sf', function()
        builtin.find_files({
          no_ignore = false,
          hidden = true,
        })
      end, { desc = '[S]earch [F]iles' })

      vim.keymap.set('n', 'sw', function()
        builtin.grep_string({
          short_path = true,
          word_match = '-w',
          only_sort_text = true,
        })
      end, { desc = '[S]earch current [W]ord' })

      vim.keymap.set('n', 'sg', require('custom.telescope.multi-ripgrep'), { desc = '[S]earch by [G]rep' })

      vim.keymap.set('n', '<leader><Space>', function()
        builtin.buffers()
      end)

      vim.keymap.set('n', 'sh', function()
        builtin.help_tags()
      end, { desc = '[S]earch [H]elp' })

      vim.keymap.set('n', '\\\\', function()
        builtin.resume()
      end)
    end,
  },
}
