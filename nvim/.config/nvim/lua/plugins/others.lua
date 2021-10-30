local opts = { noremap = true, silent = true }
local o = vim.o

require("nvim_comment").setup()
require("colorizer").setup()
require('nvim-web-devicons').setup()

-- vim-vsnip
if GitDir() == '' then
    vim.api.nvim_set_var('vsnip_snippet_dir', '~/.vsnip')
else
    vim.api.nvim_set_var('vsnip_snippet_dir', GitDir() .. '/.vsnip')
end

-- nvim-ts-autotag
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

-- Goyo
vim.api.nvim_set_var('goyo_width', 100)

-- gitsigns
require('gitsigns').setup{
    current_line_blame = true
}

-- Indent Line

require("indent_blankline").setup {
    buftype_exclude = {"terminal"}
}

-- Submode
vim.api.nvim_set_var('submode_keep_leaving_key', 1)
vim.api.nvim_set_var('submode_timeout', 0)

vim.cmd([[
fun! Submode_alias(map, key, exec, mode)
  call submode#enter_with('localleader', a:mode, '', a:map, a:exec)
  call submode#map('localleader',        a:mode, '', a:key, a:exec)
endf
]])

vim.fn.Submode_alias('<localleader>j', 'j', ':m .+1<cr>==', 'n')
vim.fn.Submode_alias('<localleader>k', 'k', ':m .-2<cr>==', 'n')

vim.fn.Submode_alias('<localleader>j', 'j', ":m '>+1<cr>gv=gv", 'v')
vim.fn.Submode_alias('<localleader>k', 'k', ":m '<-2<cr>gv=gv", 'v')

vim.fn.Submode_alias('<localleader>m', 'm', "@:", 'n')

-- AsyncRun/ AsyncTasks

vim.api.nvim_set_var('asyncrun_open', 4)

vim.api.nvim_set_keymap('n', 'cn', ':cn<cr>', opts)
vim.api.nvim_set_keymap('n', 'cp', ':cp<cr>', opts)

-- FTerm.nvim

vim.cmd([[highlight VertSplit guibg=#1b1d24]])
vim.cmd("command! FTerm lua require('FTerm').toggle()")

vim.api.nvim_set_keymap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
vim.api.nvim_set_keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

vim.api.nvim_set_var('asynctasks_term_pos', 'bottom')

-- nvim-tree.lua
vim.api.nvim_set_keymap('n', '<leader>nn', ':NvimTreeToggle<cr>', opts )
require('nvim-tree').setup{open_on_setup = true, view = {side = 'right'}}

-- EasyAlign

vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {} )
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {} )

-- ArgWrap

vim.api.nvim_set_keymap('n', '<leader>a', ':ArgWrap<cr>', opts )

-- vim-visual-multi

vim.api.nvim_set_var('multi_cursor_use_default_mapping', 0)

vim.api.nvim_set_var('multi_cursor_start_word_key      ', '<C-s>' )
vim.api.nvim_set_var('multi_cursor_select_all_word_key ', '<A-s>' )
vim.api.nvim_set_var('multi_cursor_start_key           ', 'g<C-s>')
vim.api.nvim_set_var('multi_cursor_select_all_key      ', 'g<A-s>')
vim.api.nvim_set_var('multi_cursor_next_key            ', '<C-s>' )
vim.api.nvim_set_var('multi_cursor_prev_key            ', '<C-p>' )
vim.api.nvim_set_var('multi_cursor_skip_key            ', '<C-x>' )
vim.api.nvim_set_var('multi_cursor_quit_key            ', '<Esc>' )

-- Emmet
vim.cmd([[ au FileType html,css packadd emmet-vim ]])
vim.api.nvim_set_var('user_emmet_expandabbr_key', '<localleader>')
