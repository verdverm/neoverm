local function init()
  local map = vim.api.nvim_set_keymap
  local options = { noremap = true }
  map('n', '<F3>', ':NERDTreeToggle<CR>', options)
  map('n', '<leader>nf', ':NERDTreeFind<CR>', options)
  map('n', '<leader>nt', ':NERDTreeToggle<CR>', options)

  -- open nerdtree with vim
  vim.api.nvim_create_autocmd("VimEnter",{
    command = "NERDTree"
  })

  -- Exit Vim if NERDTree is the only window remaining in the only tab.
  vim.api.nvim_create_autocmd("BufEnter",{
    command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"
  })

  -- vim.g.NERDTreeGitStatusUseNerdFonts = 1
  local icons = {
    Modified  ='~',
    Staged    ='+',
    Untracked ='?',
    Renamed   ='r',
    Unmerged  ='=',
    Deleted   ='X',
    Dirty     ='~',
    Ignored   ='.',
    Clean     ='✔︎',
    Unknown   ='?',
  }
  vim.g.NERDTreeGitStatusIndicatorMapCustom = icons
  vim.g.NERDTreeGitStatusConcealBrackets = 1

end

return {
  init = init
}

