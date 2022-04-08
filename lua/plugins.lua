vim.cmd [[packadd packer.nvim]]

local use = require('packer').use
return require('packer').startup(function()

    use 'wbthomason/packer.nvim'
    use 'preservim/nerdtree'
	use {
		'nvim-telescope/telescope.nvim',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'neovim/nvim-lspconfig'
    use 'mfussenegger/nvim-dap'
    use 'nvim-treesitter/nvim-treesitter'
    use 'itchyny/lightline.vim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'jalvesaq/Nvim-R'
end)
