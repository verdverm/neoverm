local function treesitter_cue()
  vim.api.nvim_command("autocmd BufNewFile,BufRead,BufEnter,BufWinEnter *.cue set filetype=cue")

  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.cue = {
    install_info = {
      url = "https://github.com/eonpatapon/tree-sitter-cue", -- local path or git repo
      files = {"src/parser.c", "src/scanner.c"},
      branch = "main", -- default branch in case of git repo if different from master

      --url = "~/nvim/tree-sitter-cue", -- local path or git repo
      --files = {"src/parser.c"},
      -- optional entries:
      -- branch = "main", -- default branch in case of git repo if different from master
      -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
      -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "cue" -- if filetype does not agrees with parser name
  }
end

local function init()
  treesitter_cue()
end

return {
  init = init
}
