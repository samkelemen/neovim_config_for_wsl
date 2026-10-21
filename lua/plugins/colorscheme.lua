return {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("onedark").setup({
            style = "darker",
            -- Brighter comments; the default grey is hard to read on the dark background
            highlights = {
                ["Comment"] = { fg = "#8b95a7" },
                ["@comment"] = { fg = "#8b95a7" },
                ["@lsp.type.comment"] = { fg = "#8b95a7" },
            },
        })
        require("onedark").load()
        vim.api.nvim_set_hl(0, "@sql.base", { link = "Normal" })
    end,
}
