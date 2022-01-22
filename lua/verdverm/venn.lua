function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  local map = vim.api.nvim_buf_set_keymap
  local options = { noremap = false }
  if venn_enabled == "nil" then
      print("enabling venn")
      vim.b.venn_enabled = true
      vim.cmd[[setlocal ve=all]]
      -- draw a line on HJKL keystokes
      map(0, "n", "J", "<C-v>j:VBox<CR>", options)
      map(0, "n", "K", "<C-v>k:VBox<CR>", options)
      map(0, "n", "L", "<C-v>l:VBox<CR>", options)
      map(0, "n", "H", "<C-v>h:VBox<CR>", options)
      -- draw a box by pressing "f" with visual selection
      map(0, "v", "f", ":VBox<CR>", options)
  else
      vim.cmd[[setlocal ve=]]
      vim.cmd[[mapclear <buffer>]]
      vim.b.venn_enabled = nil
  end

end

local function init()
  vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
end

return {
  init = init
}
