local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'folke/tokyonight.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'hoob3rt/lualine.nvim'
  use 'norcalli/nvim-colorizer.lua'

  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind.nvim'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- use 'glepnir/lspsaga.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'windwp/nvim-ts-autotag'

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'akinsho/nvim-bufferline.lua'

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  use 'ThePrimeagen/harpoon'

  use 'lewis6991/gitsigns.nvim'

  use 'tpope/vim-commentary'

  use 'xiyaowong/nvim-transparent'

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use 'ThePrimeagen/vim-be-good'
end)
