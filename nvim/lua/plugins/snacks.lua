-- lua/plugins/snacks.lua
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        image = { enabled = true },
        -- bonus: makes opening large/binary files faster
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        -- VS Code-style fold chevrons in the gutter
        statuscolumn = {
            enabled = true,
            left = { "mark", "sign" },
            right = { "fold", "git" },
            folds = {
                open = true, -- show icon on open folds too
                git_hl = false,
            },
        },
    },
}
