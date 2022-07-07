-- toggle tabs & spaces
function _G.tt()
	local tabs_enabled = vim.inspect(vim.b.tabs_enabled)
	if tabs_enabled == "nil" then
			print("indent tabs")
			vim.b.tabs_enabled = true
			vim.cmd('set noexpandtab')
			vim.cmd('retab!')
	else
			print("indent spaces")
			vim.b.tabs_enabled = nil
			vim.cmd('set expandtab')
			vim.cmd('retab!')
	end
end

local function init()
	print("tt")
	vim.api.nvim_set_keymap('n', '<leader>c', ":lua tt()<CR>", { noremap = true })
	vim.api.nvim_set_keymap('n', '<leader>v', ":retab!<CR>", { noremap = true})
  vim.g.buffergator_suppress_keymaps = 1
  vim.api.nvim_set_keymap('n', '<leader>b', ":BuffergatorToggle<CR>", {noremap = true  })
end

return {
	init = init
}

