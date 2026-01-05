return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.config').setup({
      ensure_installed = {
        'tsx',
        'typescript',
        'gitignore',
        'bash',
        'c',
        'rust',
        'go',
        'toml',
        'json',
        'jsonc',
        'yaml',
        'css',
        'scss',
        'html',
        'prisma',
        'svelte',
        'php',
        'python',
        'gomod',
        'gowork',
        'gosum',
        'lua',
        'vim',
        'vimdoc',
        'query',
        'markdown',
        'markdown_inline',
        'regex',
      },

      -- Automatically install missing parsers when entering buffer
      auto_install = false,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then return true end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
