local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  max_jobs = 6,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  -- use "tjdevries/astronauta.nvim" -- An implementation of the Popup API from vim in Neovim
  -- use {
  --   "aserowy/tmux.nvim",
  --   config = function()
  --     require("tmux").setup {
  --       -- overwrite default configuration
  --       -- here, e.g. to enable default bindings
  --       copy_sync = {
  --         -- enables copy sync and overwrites all register actions to
  --         -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
  --         enable = true,
  --       },
  --       navigation = {
  --         -- enables default keybindings (C-hjkl) for normal mode
  --         enable_default_keybindings = false,
  --       },
  --       resize = {
  --         -- enables default keybindings (A-hjkl) for normal mode
  --         enable_default_keybindings = false,
  --       },
  --     }
  --   end,
  -- }
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"

  use "kyazdani42/nvim-web-devicons"
  -- use "kyazdani42/nvim-tree.lua"
  use "matze/vim-move"
  use "lambdalisue/fern.vim"
  use "lambdalisue/nerdfont.vim"
  use "lambdalisue/fern-git-status.vim"
  use "lambdalisue/fern-renderer-nerdfont.vim"
  use "yuki-yano/fern-preview.vim"
  use "lambdalisue/glyph-palette.vim"
  use "antoinemadec/FixCursorHold.nvim"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "petertriho/nvim-scrollbar"
  use { "kevinhwang91/nvim-hlslens" }
  use "folke/which-key.nvim"
  use "unblevable/quick-scope"
  use "phaazon/hop.nvim"
  use "andymass/vim-matchup"
  use "nacro90/numb.nvim"
  use "monaqa/dial.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "windwp/nvim-spectre"
  use "folke/zen-mode.nvim"
  use "karb94/neoscroll.nvim"
  use "folke/todo-comments.nvim"
  use "kevinhwang91/nvim-bqf"
  use "ThePrimeagen/harpoon"
  use "MattesGroeger/vim-bookmarks"
  use "lunarvim/vim-solidity"
  use "blackCauldron7/surround.nvim"
  use "Shatur/neovim-session-manager"
  use "rcarriga/nvim-notify"
  use "tversteeg/registers.nvim"
  use "metakirby5/codi.vim"
  use "gelguy/wilder.nvim"
  use "dstein64/vim-win"
  -- use { "ray-x/navigator.lua", requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" } }
  use "machakann/vim-sandwich"
  use "wellle/targets.vim"
  use "tpope/vim-unimpaired"
  use "tpope/vim-surround"
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }
  use { "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" }
  use { "junegunn/fzf", dir = "~/.fzf", run = ":call fzf#install" }
  use "junegunn/fzf.vim"
  use "mbbill/undotree"
  use 'kevinhwang91/rnvimr'

  use "mfussenegger/nvim-treehopper"
  use {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
  }
  use "simnalamburt/vim-mundo"
  use "kdheepak/lazygit.nvim"
  use "alec-gibson/nvim-tetris"

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "rose-pine/neovim"
  use "rebelot/kanagawa.nvim"
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }
  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  -- use 'David-Kunz/cmp-npm' -- doesn't seem to work

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "RishabhRD/lspactions"
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "filipdutescu/renamer.nvim"
  use "simrat39/symbols-outline.nvim"
  use "ray-x/lsp_signature.nvim"
  use "b0o/SchemaStore.nvim"
  use "RishabhRD/popfix"
  use "RishabhRD/nvim-lsputils"
  use { "tami5/lspsaga.nvim" } -- nightly
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "ChristianChiarulli/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use "romgrk/nvim-treesitter-context"
  use "mizlan/iswap.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  -- use "f-person/git-blame.nvim"
  use "ruifm/gitlinker.nvim"
  use "mattn/vim-gist"
  use "mattn/webapi-vim"
  -- use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {
    "tanvirtin/vgit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }
  use { "bobrown101/git-blame.nvim" }
  use "rhysd/git-messenger.vim"

  -- DAP
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "Pocco81/DAPInstall.nvim"
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
