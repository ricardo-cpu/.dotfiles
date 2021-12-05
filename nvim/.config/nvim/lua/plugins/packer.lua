local packer = require('packer')

packer.init({
    compile_on_sync = true,
})
packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Preview Plugins
    use {'turbio/bracey.vim', ft = {'html', 'css'}, run = 'npm install --prefix server'}
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    use {'iamcco/mathjax-support-for-mkdp', run = ':call mkdp#util#install()', after = {'markdown-preview.nvim'}}

    -- General Plugins
    use 'jiangmiao/auto-pairs'
    use 'andymass/vim-matchup'
    use 'mg979/vim-visual-multi'
    use 'skywind3000/asynctasks.vim'
    use 'skywind3000/asyncrun.vim'
    use 'junegunn/goyo.vim'
    use 'kana/vim-submode'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'junegunn/vim-easy-align'
    use 'FooSoft/vim-argwrap'
    use 'tpope/vim-endwise'

    -- Lua Plugins Section
    use "AckslD/nvim-neoclip.lua"
    use 'akinsho/bufferline.nvim'
    use 'famiu/feline.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-lua/popup.nvim'
    use 'phaazon/hop.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'numtostr/FTerm.nvim'
    use 'chentau/marks.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'numToStr/Comment.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'ThePrimeagen/harpoon'
    use 'windwp/nvim-ts-autotag'
    use 'lewis6991/impatient.nvim'
    use 'ThePrimeagen/refactoring.nvim'

    -- treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'
    use 'romgrk/nvim-treesitter-context'
    use {'nvim-treesitter/nvim-treesitter',     run = ':TSUpdate'}

    -- Snippets Plugins
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-vsnip'
    use "rafamadriz/friendly-snippets"

    -- Debug Section
    use 'mfussenegger/nvim-dap'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'theHamsta/nvim-dap-virtual-text'

    -- Lsp/auto Complete Section
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'

end)
