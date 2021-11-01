vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Don't show matching
vim.opt.shortmess:append "c"

local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    local prev = vim.api.nvim_buf_get_lines(0, line - 1, line, true)
    return col ~= 0 and prev[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true),
                          mode, true)
end

cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"}),
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'buffer'},
        {name = 'path'}, {name = 'nvim_lua'}, {name = 'buffer'},
        {name = 'calc'}, {name = 'emoji'}, {name = 'treesitter'},
    }),

    documentation = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
    },
})

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}}),
})
