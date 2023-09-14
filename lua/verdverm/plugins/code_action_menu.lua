local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  vim.api.nvim_exec([[
    autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
  ]], false)

  -- Keymaps
  map('n', '<leader>fm', '<CMD>CodeActionMenu<CR>', options)

  require'nvim-lightbulb'.setup({
    sign = { enabled = false },
    number = { enabled = true },
    virtual_text = { enabled = true, text = "" },
  })

end

return {
  init = init
}
