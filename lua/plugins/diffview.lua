-- lua/plugins/diffview.lua
return {
    "sindrets/diffview.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewRefresh",
        "DiffviewFileHistory",
    },
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview open (working tree)" },
        { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview current file history" },
        { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview repo history" },
        { "<leader>gh", ":DiffviewFileHistory<cr>", mode = "v", desc = "Diffview selection history" },
    },
    opts = {
        enhanced_diff_hl = true,
        view = {
            merge_tool = {
                layout = "diff3_mixed",
            },
        },
    },
}
