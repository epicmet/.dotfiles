local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local _, packer = pcall(require, 'packer')

packer.startup(function(use)
	use('wbthomason/packer.nvim')

	use('nvim-lua/plenary.nvim')

	use('folke/tokyonight.nvim')
	use('kyazdani42/nvim-web-devicons')
	use('hoob3rt/lualine.nvim')
	use('norcalli/nvim-colorizer.lua')

	use('L3MON4D3/LuaSnip')
	use('onsails/lspkind.nvim')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/nvim-cmp')
	use('neovim/nvim-lspconfig')
	use('williamboman/mason.nvim')
	use('williamboman/mason-lspconfig.nvim')
	-- use 'glepnir/lspsaga.nvim'
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	})

	use('nvim-treesitter/nvim-treesitter-context')

	use('windwp/nvim-ts-autotag')

	use('nvim-telescope/telescope.nvim')
	use('nvim-telescope/telescope-file-browser.nvim')
	use('akinsho/nvim-bufferline.lua')

	use('jose-elias-alvarez/null-ls.nvim')
	use('jay-babu/mason-null-ls.nvim')
	use('MunifTanjim/prettier.nvim')

	use('ThePrimeagen/harpoon')

	use('lewis6991/gitsigns.nvim')

	use('tpope/vim-commentary')
	use('JoosepAlviste/nvim-ts-context-commentstring')

	use('xiyaowong/nvim-transparent')

	use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })

	use('ThePrimeagen/vim-be-good')

	use('simrat39/rust-tools.nvim')

	use('rcarriga/nvim-notify')

	use('mbbill/undotree')

	if packer_bootstrap then require('packer').sync() end
end)
