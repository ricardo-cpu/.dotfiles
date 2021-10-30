local opts = { noremap = true, silent = true }

dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.python = {
  type = 'executable';
  command = 'python3';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    stopOnEntry = false,

    program = "${file}";

    runInTerminal = false,
  },
}

vim.cmd([[ let g:dap_virtual_text = v:true ]])
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

vim.g.dap_virtual_text = false
vim.g.dap_virtual_text = true
vim.g.dap_virtual_text = 'all frames'

vim.api.nvim_set_keymap('n', '<F5>',      [[<cmd>lua require'dap'.continue()<cr>]],                       opts)
vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require'dap'.toggle_breakpoint()<cr>]],              opts)
vim.api.nvim_set_keymap('n', '<right>',   [[<cmd>lua require'dap'.step_over()<cr>]],                      opts)
vim.api.nvim_set_keymap('n', '<left>',    [[<cmd>lua require'dap'.step_back()<cr>]],                      opts)
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>lua require'telescope'.extensions.dap.variables{}<cr>]], opts)
