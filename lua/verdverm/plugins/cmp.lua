local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmpnext = function(cmp,fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif vim.fn["vsnip#jumpable"](1) == 1 then
    feedkey("<Plug>(vsnip-jump-next)", "")
  elseif has_words_before() then
    cmp.complete()
  else
    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
  end
end

local cmpprev = function(cmp)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
    feedkey("<Plug>(vsnip-jump-prev)", "")
  end
end

local function init()
  local cmp = require'cmp'
  local lspkind = require'lspkind'

  cmp.setup({
    formatting = {
      format = lspkind.cmp_format({
        maxwidth = 50,
        menu = ({
          buffer = "[Buffer]",
          cmp_tabnine = "[T9]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          treesitter = "[TS]",
          vsnip = "[VSnip]",
        }),
        with_text = true
      }),
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ["<Tab>"] = cmp.mapping(function(fallback) cmpnext(cmp,fallback) end, { "i", "s" }),
      ["<C-l>"] = cmp.mapping(function(fallback) cmpnext(cmp,fallback) end, { "i", "s" }),
      ["<C-k>"] = cmp.mapping(function(fallback) cmpnext(cmp,fallback) end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function() cmpprev(cmp) end, { "i", "s" }),
      ["<C-j>"] = cmp.mapping(function() cmpprev(cmp) end, { "i", "s" }),
      ["<C-h>"] = cmp.mapping(function() cmpprev(cmp) end, { "i", "s" }),
    },
    sources = {
      { name = 'cmp_tabnine' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'treesitter' },
      { name = 'vsnip' },
    }
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  vim.o.completeopt = 'menu,menuone,noselect'
end

return {
  init = init
}
