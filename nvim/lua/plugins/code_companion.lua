return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            display = {
                chat = {
                    window = {
                        layout = "vertical",
                        position = "right",
                        width = 0.35,
                    },
                },
            },
            adapters = {
                interatctions = {
                    chat = {
                        adapter = { name = "copilot", model = "claude-sonnet-4.6" },
                    },
                },
            },
        },
    },
}
