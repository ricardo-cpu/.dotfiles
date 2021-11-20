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
    use 'akinsho/bufferline.nvim'
    use 'famiu/feline.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-lua/popup.nvim'
    use {'nvim-treesitter/nvim-treesitter',     run = ':TSUpdate'}
    use {'kyazdani42/nvim-tree.lua',            config = require('nvim-tree').setup{open_on_setup = true, view = {side = 'right'}}}
    use {'numtostr/FTerm.nvim',                 config = require('FTerm').setup({cmd = {'tmux'}}) }
    use {'chentau/marks.nvim',                  config = require'marks'.setup{}}
    use {'norcalli/nvim-colorizer.lua',         config = require("colorizer").setup()}
    use {'numToStr/Comment.nvim',               config = require("Comment").setup()}
    use {'kyazdani42/nvim-web-devicons',        config = require("nvim-web-devicons").setup()}
    use {'lukas-reineke/indent-blankline.nvim', config = require("indent_blankline").setup {buftype_exclude = {"terminal"}}}
    use {'lewis6991/gitsigns.nvim',             config = require('gitsigns').setup{current_line_blame = true}}
    use {'ThePrimeagen/harpoon',                config = require('harpoon').setup()}
    use {'windwp/nvim-ts-autotag',              config = require('nvim-treesitter.configs').setup { autotag = {enable = true} }}
    use {'lewis6991/impatient.nvim',            config = require('impatient')}
    use {'ThePrimeagen/refactoring.nvim',       config = require('refactoring').setup()}

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
    use 'hrsh7th/cmp-path'

end)
