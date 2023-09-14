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
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'neovim/nvim-lspconfig',
    -- 'nvim-lua/lsp_extensions.nvim',
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }

  use 'hashivim/vim-terraform'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
    --config = function ()
    --  require'verdverm.plugins.treesitter'.init()
    --end,
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
      'onsails/lspkind-nvim'
    },
    --config = function ()
    --  require'verdverm.plugins.cmp'.init()
    --  require'verdverm.plugins.lspkind'.init()
    --end
  } 



  print("INIT")
  -- Debuggers
  use {
    'mfussenegger/nvim-dap',
    'leoluz/nvim-dap-go',
    "rcarriga/nvim-dap-ui",
    --config = function ()
    --  print("SETUP DAP")
    --  require'verdverm.plugins.dap'.init()
    --end
  }


  -- Telescope
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    -- requires = 'rmagatti/session-lens',
    --config = function ()
    --  print("SETUP TELE")
    --  require'verdverm.plugins.telescope'.init()
    --end
  }

  -- Themes
  use {
    'folke/tokyonight.nvim',
    --config = function ()
    --  require'verdverm.plugins.tokyonight'.init()
    --end
  }

  -- Git Support
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    --config = function ()
    --  require'verdverm.plugins.gitsigns'.init()
    --end
  }

  -- Filebrowser
  use {
    'preservim/nerdtree',
    requires = {
      'Xuyuanp/nerdtree-git-plugin',
    },
    --config = function ()
    --  require'verdverm.plugins.nerdtree'.init()
    --end
  }
  -- NerdFont (must be after NertTree
  use {
    'ryanoasis/vim-devicons',
    --config = function ()
    --  require'verdverm.plugins.devicons'.init()
    --end
  }

  use 'jeetsukumaran/vim-buffergator'

  -- Utilities

  use 'easymotion/vim-easymotion'

  use 'tpope/vim-surround'

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'hoob3rt/lualine.nvim',
    --config = function ()
    --  require'verdverm.plugins.lualine'.init()
    --end
  }

  use 'preservim/nerdcommenter'

  use 'romgrk/nvim-treesitter-context'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    --config = function()
    --  require"trouble".setup()
    --end
  }

  use {
    'folke/lsp-colors.nvim',
    --config = function()
    --  require("lsp-colors").setup()
    --end
  }

  use {
    'voldikss/vim-floaterm',
    --config = function ()
    --  require'verdverm.plugins.floaterm'.init()
    --end
  }

  use {
    'weilbith/nvim-code-action-menu',
    requires = {
      'kosayoda/nvim-lightbulb'
    },
    cmd = 'CodeActionMenu',
  }

  -- https://github.com/jjo/vim-cue
  use 'jjo/vim-cue'

  -- https://github.com/untitled-ai/jupyter_ascending.vim
  -- https://alpha2phi.medium.com/jupyter-notebook-vim-neovim-c2d67d56d563
  use 'untitled-ai/jupyter_ascending.vim'

  -- Sessions (put last so other modules referenced are already loaded)
  use {
    'rmagatti/auto-session',
  }

end

local function init()
  packer_verify()
  packer_startup()

  require'verdverm.plugins.treesitter'.init()
  require'verdverm.plugins.cmp'.init()
  require'verdverm.plugins.lspkind'.init()
  require'verdverm.plugins.lspconfig'.init()
  require'verdverm.plugins.dap'.init()
  require'verdverm.plugins.telescope'.init()
  require'verdverm.plugins.tokyonight'.init()
  require'verdverm.plugins.gitsigns'.init()
  require'verdverm.plugins.nerdtree'.init()
  require'verdverm.plugins.devicons'.init()
  require'verdverm.plugins.lualine'.init()
  require"trouble".setup()
  require("lsp-colors").setup()
  require'verdverm.plugins.floaterm'.init()
  require'verdverm.plugins.code_action_menu'.init()
  require'verdverm.plugins.auto_session'.init()
end

return {
  init = init
}
