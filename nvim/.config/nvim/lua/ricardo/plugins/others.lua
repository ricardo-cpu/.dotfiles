local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local set_var = vim.api.nvim_set_var

-- devicons
require("nvim-web-devicons").setup()
-- indent line
require("indent_blankline").setup {buftype_exclude = {"terminal"}, char = "|"}
-- gitsigns
require('gitsigns').setup{current_line_blame = true}
-- impatient
require('impatient')
-- nvim-comment
require("nvim_comment").setup()
-- colorizer
require("colorizer").setup()
-- marks
require('marks').setup({})
-- neoclip
require('neoclip').setup()
keymap('n', '<leader>c', [[:Telescope neoclip ]], {})
keymap('n', '<A-y>', ':lua require("telescope").extensions.neoclip.default()<cr>', opts )

-- stabilize.nvim
require("stabilize").setup({
    ignore = {
        filetype = {},
        buftype = {}
    },
})

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
vim.cmd([[ imap <expr> <tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<tab>']])
vim.cmd([[ smap <expr> <tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<tab>']])
vim.cmd([[ imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>' ]])
vim.cmd([[ smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>' ]])

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
keymap('n', '<F11>', ':silent! AsyncTask run<cr>',   opts)
keymap('n', '<F12>', ':silent! AsyncTask build<cr>', opts)

-- Hop.nvim
require('hop').setup()
keymap('n', '<space>w', ':HopWord<cr>', opts)

-- FTerm.nvim
require('FTerm').setup({cmd = {'tmux'}})
vim.cmd("command! FTerm lua require('FTerm').toggle()")

keymap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

set_var('asynctasks_term_pos', 'bottom')

-- nvim-tree.lua
require('nvim-tree').setup{view = {side = 'right'}}
keymap('n', '<leader>nn', ':NvimTreeToggle<cr>', opts )
vim.cmd([[ au BufEnter NvimTree hi clear StatusLine ]])

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

-- Matchup
vim.g.loaded_tatchit = 1

-- refactoring
require("telescope").load_extension("refactoring")

keymap(
	"v",
	"<space>rt",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

keymap(
	"n",
	"<space>rp",
	":lua require('refactoring').debug.printf({below = false})<CR>",
	{ noremap = true }
)

keymap("v", "<space>rp", ":lua require('refactoring').debug.print_var({})<CR>", { noremap = true })
keymap("n", "<space>rc", ":lua require('refactoring').debug.cleanup({})<CR>",   { noremap = true })

