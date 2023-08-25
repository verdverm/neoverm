-- toggle tabs & spaces
local function indentation_switcher()
  -- helpers to change indentation type
  vim.api.nvim_command("vnoremap <Leader>s :!expand -t2<CR>")
  vim.api.nvim_command("vnoremap <Leader>t :!unexpand -t2<CR>")

end

local function indentation_overrides()
  -- overrides to filetype indentation
  vim.api.nvim_command("autocmd FileType groovy setlocal shiftwidth=2 softtabstop=2 expandtab")
  vim.api.nvim_command("autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 expandtab")
end

local function init()
  indentation_switcher()
  indentation_overrides()
end


return {
  init = init
}
