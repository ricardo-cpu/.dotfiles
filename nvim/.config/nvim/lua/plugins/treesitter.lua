local o = vim.o

-- nvim tree sitter

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = {},
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
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
            },
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

o.foldexpr = "nvim_treesitter#foldexpr()"
