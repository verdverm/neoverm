local function multi_highlighter()
  -- support highlighting mutliple lines
  vim.api.nvim_command("highlight LineHighlight ctermbg=blue guibg=blue")
  vim.api.nvim_command("nnoremap <Leader>l :call matchadd('LineHighlight', '\\%'.line('.').'l')<CR>")
  vim.api.nvim_command("vnoremap <Leader>l :<c-u>call HiglightVisualLines()<CR>")
  vim.api.nvim_command("nnoremap <leader>c :call clearmatches()<CR>")
  vim.api.nvim_exec([[
  function! HiglightVisualLines()
      for i in range(line('v'),line("'>"))
          call matchadd('LineHighlight', '\%'.i.'l')
      endfor
  endfunction
  ]], true)
end

local function init()
  multi_highlighter()
end

return {
  init = init
}
