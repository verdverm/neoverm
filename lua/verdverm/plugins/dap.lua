local function init()
  print("DAP INIT")


  --local map = vim.api.nvim_set_keymap
  --local mapOpts = { noremap = true }

  --require('mason-nvim-dap').setup({
  --  ensure_installed = { "python", "delve" }
  --})

  require'dap-go'.setup({
    dap_configurations = {
      {
        type = "go",
        name = "Attach remote",
        mode = "remote",
        request = "attach",
      },
    },
  })

  local dap, dapui =require("dap"),require("dapui")
  dap.listeners.after.event_initialized["dapui_config"]=function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"]=function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"]=function()
    dapui.close()
  end

  vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
  vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

  vim.keymap.set('n', '<F9>', require 'dap'.continue)
  vim.keymap.set('n', '<F10>', require 'dap'.step_over)
  vim.keymap.set('n', '<F11>', require 'dap'.step_into)
  vim.keymap.set('n', '<F12>', require 'dap'.step_out)
  vim.keymap.set('n', '<F8>', require 'dap'.toggle_breakpoint)
  vim.keymap.set('n', '<leader>B', require 'dap'.toggle_breakpoint)

  print("DAP DONE")
end

return {
  init = init
}

