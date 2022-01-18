local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  vim.g.floaterm_shell = "/bin/bash"

  map('n', '<leader>tt', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 bash --login<CR>', options)
  map('n', '<leader>ld', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazydocker<CR>', options)
  map('n', '<leader>lg', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>', options)

end

return {
  init = init
}
