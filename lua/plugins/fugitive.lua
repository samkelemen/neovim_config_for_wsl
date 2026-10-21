-- lua/plugins/fugitive.lua
return {
    "tpope/vim-fugitive",
    cmd = {
        "Git",
        "G",
        "Gdiffsplit",
        "Gvdiffsplit",
        "Gread",
        "Gwrite",
        "Ggrep",
        "GMove",
        "GDelete",
        "GBrowse",
        "Gedit",
    },
    keys = {
        { "<leader>ga", "<cmd>Gwrite<cr>", desc = "Fugitive git add (stage) current buffer" },
        { "<leader>gs", "<cmd>Git<cr>", desc = "Fugitive status" },
        { "<leader>gc", "<cmd>Git commit<cr>", desc = "Fugitive commit" },
        { "<leader>gp", "<cmd>Git push<cr>", desc = "Fugitive push" },
        { "<leader>gP", "<cmd>Git pull<cr>", desc = "Git pull" },
        { "<leader>gl", "<cmd>Git log --oneline --graph --decorate<cr>", desc = "Fugitive log" },
        { "<leader>gb", "<cmd>Git blame<cr>", desc = "Fugitive blame" },
        { "<leader>gv", "<cmd>Gvdiffsplit<cr>", desc = "Fugitive vertical diff split" },
    },
}
