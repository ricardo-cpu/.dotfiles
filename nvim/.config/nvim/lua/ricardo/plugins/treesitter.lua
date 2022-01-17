local o = vim.o

-- nvim tree sitter

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = {},
        use_languagetree = true,
        additional_vim_regex_highlighting = true,
    },
    ensure_installed = {
        "bash",
        "vim",
        "python",
        "javascript",
        "lua",
        "dockerfile",
        "rust",
        "cpp",
        "toml",
        "json",
        "yaml",
        "html",
        "css"
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["il"] = "@loop.inner",
                ["al"] = "@loop.outer",
                ["ii"] = "@conditional.inner",
                ["oi"] = "@conditional.outer"
            },
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    matchup = {
        enable = true
    }
}

o.foldexpr = "nvim_treesitter#foldexpr()"

-- autotag
require('nvim-treesitter.configs').setup { autotag = {enable = true} }

require'treesitter-context'.setup{
    patterns = {
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
        },
    },
}
