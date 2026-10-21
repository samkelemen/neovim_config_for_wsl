return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        lazy = false,
        config = function()
            require("bufferline").setup({
                options = {
                    custom_filter = function(buf)
                        return vim.bo[buf].buftype ~= "terminal"
                    end,
                },
            })
        end,
    },
}
