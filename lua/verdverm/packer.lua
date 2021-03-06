local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Language Servers
  use {
    'lspcontainers/lspcontainers.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/lsp_extensions.nvim',
    },
    config = function ()
      require'verdverm.plugins.lspconfig'.init()
    end
  }
  use 'hashivim/vim-terraform'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
    config = function ()
      require'verdverm.plugins.treesitter'.init()
    end,
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'rafamadriz/friendly-snippets',

      'ray-x/cmp-treesitter',
      {
        'tzachar/cmp-tabnine',
        run = "./install.sh",
      },
      'onsails/lspkind-nvim'
    },
    config = function ()
      require'verdverm.plugins.cmp'.init()
      require'verdverm.plugins.cmp_tabnine'.init()
      require'verdverm.plugins.lspkind'.init()
    end
  }

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'rmagatti/session-lens',
    config = function ()
      require'verdverm.plugins.telescope'.init()
    end
  }

  -- Themes
  use {
    'folke/tokyonight.nvim',
    config = function ()
      require'verdverm.plugins.tokyonight'.init()
    end
  }

  -- Git Support
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require'verdverm.plugins.gitsigns'.init()
    end
  }

  -- Sessions
  use {
    'rmagatti/auto-session',
    config = function ()
      require'verdverm.plugins.auto_session'.init()
    end
  }

  -- Filebrowser
  use {
    'preservim/nerdtree',
    config = function ()
      require'verdverm.plugins.nerdtree'.init()
    end
  }

  use 'jeetsukumaran/vim-buffergator'

  -- Utilities

  use "jbyuki/venn.nvim"

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'hoob3rt/lualine.nvim',
    config = function ()
      require'verdverm.plugins.lualine'.init()
    end
  }

  use 'preservim/nerdcommenter'

  use 'romgrk/nvim-treesitter-context'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require"trouble".setup()
    end
  }

  use {
    'folke/lsp-colors.nvim',
    config = function()
      require("lsp-colors").setup()
    end
  }

  use {
    'voldikss/vim-floaterm',
    config = function ()
      require'verdverm.plugins.floaterm'.init()
    end
  }

  use {
    'weilbith/nvim-code-action-menu',
    requires = {
      'kosayoda/nvim-lightbulb'
    },
    cmd = 'CodeActionMenu',
    config = function ()
      require'verdverm.plugins.code_action_menu'.init()
    end
  }

  -- https://github.com/glacambre/firenvim
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }
end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
