require("nvim-autopairs").setup({
    -- treesitter integration
    check_ts = true,

    fast_wrap = {
        map = "<M-e>",
    },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
