local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  map('n', '<F3>', ':NERDTreeToggle<CR>', options)
  map('n', '<leader>nf', ':NERDTreeFind<CR>', options)
  map('n', '<leader>nt', ':NERDTreeToggle<CR>', options)

end

return {
  init = init
}

