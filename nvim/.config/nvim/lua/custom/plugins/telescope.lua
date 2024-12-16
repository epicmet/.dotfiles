return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      },
    },
    config = function()
      local tl = require("telescope")
      local builtin = require("telescope.builtin")

      tl.setup({
        file_ignore_patterns = {
          '^.git/',
        },
        pickers = {
          find_files = {
            theme = "ivy"
          },
        },
        extensions = {
          fzf = {}
        }
      })

      tl.load_extension("fzf")

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

      vim.keymap.set('n', 'sg', function()
        builtin.live_grep()
      end, { desc = '[S]earch by [G]rep' })

      vim.keymap.set('n', '<leader><Space>', function()
        builtin.buffers()
      end)

      vim.keymap.set('n', 'sh', function()
        builtin.help_tags()
      end, { desc = '[S]earch [H]elp' })

      vim.keymap.set('n', '\\\\', function()
        builtin.resume()
      end)
    end
  }
}
