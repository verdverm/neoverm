-- toggle tabs & spaces
local function init()
  -- helpers to change indentation type
  vim.api.nvim_command("vnoremap <Leader>s :!expand -t2<CR>")
  vim.api.nvim_command("vnoremap <Leader>t :!unexpand -t2<CR>")

  -- overrides to filetype indentation
  vim.api.nvim_command("autocmd FileType groovy setlocal shiftwidth=2 softtabstop=2 expandtab")
  vim.api.nvim_command("autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 expandtab")
end

return {
  init = init
}
