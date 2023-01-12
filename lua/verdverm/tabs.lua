-- toggle tabs & spaces

local function init()
	vim.api.nvim_command("vnoremap <Leader>s :!expand -t2<CR>")
	vim.api.nvim_command("vnoremap <Leader>t :!unexpand -t2<CR>")
end

return {
  init = init
}

