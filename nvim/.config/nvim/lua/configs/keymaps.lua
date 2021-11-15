local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

vim.api.nvim_set_var('mapleader', ',')
vim.api.nvim_set_var('localmapleader', [[\]])
keymap('n', 'ttt', ':lua Transparent()<cr>', opts)
keymap('n', 'aa', 'ggVG', opts)
keymap('n', '<space><space>', 'i<space><esc>', opts)
keymap('n', '<space>n', ':bn<cr>', opts)
keymap('n', '<space>p', ':bp<cr>', opts)
keymap('n', 'cc', ':lua StatusClipboard()<cr>', opts)
keymap('n', '<c-i>', '<c-i>', opts)
keymap('n', '<A-m', '@:', opts)

-- Disable highlight
keymap('n', '<A-h>', ':noh<cr>', opts)

-- copy
keymap('n', 'Y', 'y$', opts)

-- text-objectis quotes
keymap('o', 'ix', [[i']], opts)
keymap('o', 'iq', [[i"]], opts)
keymap('o', 'ax', [[a']], opts)
keymap('o', 'aq', [[a!]], opts)

-- indent
keymap('n', '<A-j>', ':m .+1<cr>==', opts)
keymap('n', '<A-k>', ':m .-2<cr>==', opts)
keymap('v', '<A-j>', ":m '>+1<cr>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<cr>gv=gv", opts)

-- Shiftwidth
keymap('n', '<A-,>', '<ap', opts)
keymap('n', '<A-.>', '>ap', opts)

-- Fast editing and reloading of vimrc configs
keymap('n', '<A-e>', ':vs ~/.vimrc<cr>', opts)
keymap('n', '<leader>e', ':vs ' .. GitDir() .. '/.vim<cr>', opts)

-- Switch CWD to the directory of the open buffer
keymap('n', 'cd', ':cd %:p:h<cr>:pwd<cr>', opts)
