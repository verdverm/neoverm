local function init()
  require'nvim-treesitter.configs'.setup{
    ensure_installed = {
      'bash',
      'c',
      'css',
      'cue',
      'dockerfile',
      'go',
      'gomod',
      'graphql',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'lua',
      'make',
      'markdown',
      'python',
      'rust',
      'scss',
      'svelte',
      'toml',
      'tsx',
      'typescript',
      'vue',
      'yaml',
    },
    highlight = {
      enable = false,
      additional_vim_regex_highlighting = false
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enable = true
    }
  }

  vim.cmd[[set foldmethod=expr]]
  vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
end

return {
  init = init
}
