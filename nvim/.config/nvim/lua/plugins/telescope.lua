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
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-d>"] = actions.delete_buffer
            },
            i = {
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    }
}

vim.cmd([[au FileType TelescopePrompt nmap <buffer> v <c-v>]])
vim.cmd([[au FileType TelescopePrompt nmap <buffer> x <c-x>]])

M = {}
local function refactor(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
        prompt_bufnr
    )
    require("telescope.actions").close(prompt_bufnr)
    require("refactoring").refactor(content.value)
end

M.refactors = function()
    local opts = require("telescope.themes").get_cursor()
    require("telescope.pickers").new(opts, {
        prompt_title = "refactors",
        finder = require("telescope.finders").new_table({
            results = require("refactoring").get_refactors(),
        }),
        sorter = require("telescope.config").values.generic_sorter(opts),
        attach_mappings = function(_, map)
            map("i", "<CR>", refactor)
            map("n", "<CR>", refactor)
            return true
        end
    }):find()
end

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<c-d>", actions.git_delete_branch)
            map("n", "<c-d>", actions.git_delete_branch)
            return true
        end,
    })
end

keymap('n', '<leader>f', ':lua require("telescope.builtin").git_files()<cr>',                                                    opts )
keymap('n', '<leader>g', ':lua require("telescope.builtin").live_grep()<cr>',                                                    opts )
keymap('n', '<c-p>',     ':lua require("telescope.builtin").find_files()<cr>',                                                   opts )
keymap('n', '<leader>s', ':lua require("telescope.builtin").git_status()<cr>',                                                   opts )
keymap('n', '<A-b>',     ':lua require("telescope.builtin").git_branches()<cr>',                                                 opts )
keymap('n', '<A-t>',     ':lua require("telescope.builtin").treesitter()<cr>',                                                   opts )
keymap('n', '<A-q>',     ':lua require("telescope.builtin").quickfix()<cr>',                                                     opts )
keymap("n", "<space>b",  ':lua require("telescope.builtin").buffers()<cr>',                                                     opts )
keymap('n', '<space>ca', ':lua require("telescope.builtin").lsp_code_actions(require("telescope.themes").get_dropdown({}))<cr>', opts )

keymap("v", "<Leader>rt", [[ <Esc><Cmd>lua M.refactors()<CR>]], opts)

-- neoclip
keymap('n', '<A-y>', ':lua require("telescope").extensions.neoclip.default()<cr>', opts )
