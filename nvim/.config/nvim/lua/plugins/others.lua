local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- harpoon
require("harpoon").setup({
    global_settings = {
        save_on_toggle = true,
        save_on_change = true,
    },
})

keymap('n', '<leader>n', ':lua require("harpoon.mark").add_file()<cr>', opts)
keymap('n', '<leader><space>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
keymap('n', '<f1>', ':lua require("harpoon.ui").nav_file(1)<cr>', opts)
keymap('n', '<f2>', ':lua require("harpoon.ui").nav_file(2)<cr>', opts)
keymap('n', '<f3>', ':lua require("harpoon.ui").nav_file(3)<cr>', opts)
keymap('n', '<f4>', ':lua require("harpoon.ui").nav_file(4)<cr>', opts)

-- vim-vsnip
vim.cmd("let g:vsnip_snippet_dirs = ['" .. GitDir() .. '/.vsnip' .. "', '~/.vsnip']")

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

keymap('n', 'cn', ':cn<cr>', opts)
keymap('n', 'cp', ':cp<cr>', opts)

-- FTerm.nvim

require('FTerm').setup({
    cmd = 'tmux'
})
vim.cmd([[highlight VertSplit guibg=#1b1d24]])
vim.cmd("command! FTerm lua require('FTerm').toggle()")

keymap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

vim.api.nvim_set_var('asynctasks_term_pos', 'bottom')

-- nvim-tree.lua
keymap('n', '<leader>nn', ':NvimTreeToggle<cr>', opts )
require('nvim-tree').setup{open_on_setup = true, view = {side = 'right'}}

-- EasyAlign

keymap('n', 'ga', '<Plug>(EasyAlign)', {} )
keymap('x', 'ga', '<Plug>(EasyAlign)', {} )

-- ArgWrap

keymap('n', '<leader>a', ':ArgWrap<cr>', opts )

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
