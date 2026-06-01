return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local list = {
      'tsx',
      'typescript',
      'gitignore',
      'bash',
      'c',
      'rust',
      'go',
      'toml',
      'json',
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
    }

    require('nvim-treesitter').install(list):wait()

    vim.api.nvim_create_autocmd('FileType', {
      pattern = list,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
