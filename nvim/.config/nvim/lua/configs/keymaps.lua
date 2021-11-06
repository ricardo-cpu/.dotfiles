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

-- Disable highlight
keymap('n', '<localleader>h', ':noh<cr>', opts)

-- Moving
keymap('n', 'k', 'gk', opts)
keymap('n', 'j', 'gj', opts)

-- copy
keymap('n', 'Y', 'y$', opts)
--
-- text-objectis quotes
keymap('o', 'ix', [[i']], opts)
keymap('o', 'iq', [[i"]], opts)
keymap('o', 'ax', [[a']], opts)
keymap('o', 'aq', [[a!]], opts)


-- Shiftwidth
keymap('n', '<localleader>,', '<ap', opts)
keymap('n', '<localleader>.', '>ap', opts)

-- Fast editing and reloading of vimrc configs
keymap('n', '<localleader>e', ':vs ~/.vimrc<cr>', opts)
keymap('n', '<leader>e', ':vs ' .. GitDir() .. '/.vim<cr>', opts)

-- Switch CWD to the directory of the open buffer
keymap('n', 'cd', ':cd %:p:h<cr>:pwd<cr>', opts)
