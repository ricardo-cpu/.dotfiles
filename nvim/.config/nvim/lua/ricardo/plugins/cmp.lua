local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
    experimental = {
        ghost_text = true
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
        }),
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.score,
            function(entry1, entry2)
                local _, entry1_under = entry1.completion_item.label:find("^_+")
                local _, entry2_under = entry2.completion_item.label:find("^_+")
                entry1_under = entry1_under or 0
                entry2_under = entry2_under or 0
                if entry1_under < entry2_under then
                    return true
                elseif entry1_under > entry2_under then
                    return false
                end
            end,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm(),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4),  { 'i', 'c' }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "calc" },
    },
    documentation = {
        border = "rounded",
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 50,
        min_width = 50,
        max_height = math.floor(vim.o.lines * 0.4),
        min_height = 3,
    },
})
