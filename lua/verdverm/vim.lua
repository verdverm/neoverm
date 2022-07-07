local function set_augroup()
  vim.api.nvim_command("augroup WrapInMarkdown")
  vim.api.nvim_command("autocmd FileType markdown setlocal wrap")
  vim.api.nvim_command("autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif")
  vim.api.nvim_command("autocmd FileChangedShellPost * echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("augroup END")
end

local function set_vim_g()
  vim.g.mapleader = ","
end

local function set_vim_o()
  local settings = {
    backup = false,
    undofile = true,
    undolevels = 1000,
    undoreload = 10000,
    errorbells = false,
    -- expandtab = true,
    hidden = true,
    history=1000,
    scrolloff = 5,
    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
    showmode = false,
    termguicolors = true,
    foldlevel = 10,
    list = true,
  }

  -- Generic vim.o
  for k, v in pairs(settings) do
    vim.o[k] = v
  end

  -- Custom vim.o
  vim.o.clipboard = 'unnamedplus'
  vim.o.shortmess = vim.o.shortmess .. 'c'

  vim.opt.listchars = {
    tab = '··',
    extends = '⟩',
    precedes = '⟨',
    trail = '·'
  }

  -- Not yet in vim.o
  vim.cmd('set encoding=utf8')
  vim.cmd('set nowritebackup')
  vim.cmd('set shiftwidth=2')
  vim.cmd('set secure')
  vim.cmd('set splitright')
  vim.cmd('set tabstop=2')
  vim.cmd('set updatetime=100')
	vim.cmd('au FocusGained * checktime')
	vim.cmd('au CursorHold * checktime')
end

local function set_vim_wo()
  vim.wo.number = true
  vim.wo.relativenumber = false
  vim.wo.wrap = false
end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = false }

  map('n', '<C-h>', '<CMD>wincmd h<CR>', options)
  map('n', '<C-j>', '<CMD>wincmd j<CR>', options)
  map('n', '<C-k>', '<CMD>wincmd k<CR>', options)
  map('n', '<C-l>', '<CMD>wincmd l<CR>', options)
end

local function set_filetypes()
  vim.api.nvim_command("autocmd BufNewFile,BufRead *.inc set filetype=makefile")
end

local function init()
  set_augroup()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
  set_keymaps()
  set_filetypes()
end

return {
  init = init
}
