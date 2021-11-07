local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

-- Telescope.nvim
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        find_command = {"rg", "--ignore", "--hidden", "--files", GitDir()},
        winblend = 20,
        mappings = {
            n = {
                ["<esc>"] = actions.close,
            },

        }
    }
}

keymap('n', '<leader>f', ':lua require("telescope.builtin").git_files()<cr>',    opts )
keymap('n', '<leader>g', ':lua require("telescope.builtin").live_grep()<cr>',    opts )
keymap('n', '<c-p>',     ':lua require("telescope.builtin").find_files()<cr>',   opts )
keymap('n', '<leader>s', ':lua require("telescope.builtin").git_status()<cr>',   opts )
keymap('n', '<leader>c', ':lua require("telescope.builtin").git_commits()<cr>',  opts )
keymap('n', '<leader>d', ':lua require("telescope.builtin").git_bcommits()<cr>', opts )
