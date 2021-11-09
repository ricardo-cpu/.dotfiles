local cmp = require "cmp"

-- nvim-cmp setup
cmp.setup {
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format(
            "%s %s",
            require("plugins.lspkind_icons").icons[vim_item.kind],
            vim_item.kind
            )

            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                buffer = "[BUF]",
            })[entry.source.name]

            return vim_item
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
    },
}
