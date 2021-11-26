local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local set_var = vim.api.nvim_set_var

-- devicons
require("nvim-web-devicons").setup()
-- indent line
require("indent_blankline").setup {buftype_exclude = {"terminal"}}
-- gitsigns
require('gitsigns').setup{current_line_blame = true}
-- autotag
require('nvim-treesitter.configs').setup { autotag = {enable = true} }
-- impatient
require('impatient')
-- Comment
require("Comment").setup()
-- colorizer
require("colorizer").setup()
-- marks
require('marks').setup{}

-- harpoon
require('harpoon').setup()
keymap('n', '<leader>n', ':lua require("harpoon.mark").add_file()<cr>', opts)
keymap('n', '<leader><space>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
keymap('n', '<f1>', ':lua require("harpoon.ui").nav_file(1)<cr>', opts)
keymap('n', '<f2>', ':lua require("harpoon.ui").nav_file(2)<cr>', opts)
keymap('n', '<f3>', ':lua require("harpoon.ui").nav_file(3)<cr>', opts)
keymap('n', '<f4>', ':lua require("harpoon.ui").nav_file(4)<cr>', opts)

-- vim-vsnip
vim.cmd("let g:vsnip_snippet_dirs = ['" .. GitDir() .. '/.vsnip' .. "', '~/.vsnip']")
vim.cmd("let g:vsnip_filetypes = {}")
vim.cmd("let g:vsnip_filetypes.markdown = ['tex']")

-- Goyo
set_var('goyo_width', 100)

-- Submode
set_var('submode_keep_leaving_key', 1)
set_var('submode_timeout', 0)

vim.cmd([[
fun! Submode_alias(map, key, exec, mode)
  call submode#enter_with('mode', a:mode, '', a:map, a:exec)
  call submode#map('mode',        a:mode, '', a:key, a:exec)
endf
]])

-- AsyncRun/ AsyncTasks

set_var('asyncrun_open', 4)

keymap('n', 'cn', ':cn<cr>', opts)
keymap('n', 'cp', ':cp<cr>', opts)

-- Hop.nvim
require('hop').setup()
keymap('n', '<space>w', ':HopWord<cr>', opts)

-- place this in one of your configuration file(s)
keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})


-- FTerm.nvim
vim.cmd([[highlight VertSplit guibg=#1b1d24]])
vim.cmd("command! FTerm lua require('FTerm').toggle()")

keymap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

set_var('asynctasks_term_pos', 'bottom')

-- nvim-tree.lua
require('nvim-tree').setup{open_on_setup = true, view = {side = 'right'}}
keymap('n', '<leader>nn', ':NvimTreeToggle<cr>', opts )

-- EasyAlign
keymap('n', 'ga', '<Plug>(EasyAlign)', {} )
keymap('x', 'ga', '<Plug>(EasyAlign)', {} )

-- ArgWrap

keymap('n', '<leader>a', ':ArgWrap<cr>', opts )

-- vim-visual-multi

set_var('multi_cursor_use_default_mapping', 0)

set_var('multi_cursor_start_word_key      ', '<C-s>' )
set_var('multi_cursor_select_all_word_key ', '<A-s>' )
set_var('multi_cursor_start_key           ', 'g<C-s>')
set_var('multi_cursor_select_all_key      ', 'g<A-s>')
set_var('multi_cursor_next_key            ', '<C-s>' )
set_var('multi_cursor_prev_key            ', '<C-p>' )
set_var('multi_cursor_skip_key            ', '<C-x>' )
set_var('multi_cursor_quit_key            ', '<Esc>' )

-- Emmet
vim.cmd([[ au FileType html,css packadd emmet-vim ]])
set_var('user_emmet_expandabbr_key', '<localleader>')
