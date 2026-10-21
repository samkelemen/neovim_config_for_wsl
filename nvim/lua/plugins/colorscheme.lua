return {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("onedark").setup({
            style = "darker",
        })
        require("onedark").load()
        vim.api.nvim_set_hl(0, "@sql.base", { link = "Normal" })
    end,
}
