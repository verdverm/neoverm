local function set_filetypes()
  vim.api.nvim_command("autocmd BufNewFile,BufRead,BufEnter,BufWinEnter *.cue set filetype=cue")
  vim.api.nvim_command("autocmd BufNewFile,BufRead *.inc set filetype=makefile")
  vim.api.nvim_command("autocmd BufNewFile,BufRead Jenkinsfile* set filetype=groovy")
end

local function init()
  set_filetypes()
end

return {
  init = init
}
