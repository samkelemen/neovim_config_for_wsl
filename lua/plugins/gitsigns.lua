-- lua/plugins/gitsigns.lua
return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        current_line_blame = false,
        on_attach = function(bufnr)
            local gs = require("gitsigns")

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            -- Navigation (falls back to native ]c/[c inside diff mode)
            map("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gs.nav_hunk("next")
                end
            end, "Next hunk")
            map("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gs.nav_hunk("prev")
                end
            end, "Prev hunk")

            -- Actions
            map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
            map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
            map("v", "<leader>hs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Stage selected lines")
            map("v", "<leader>hr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Reset selected lines")
            map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
            map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
            map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
            map("n", "<leader>hi", gs.preview_hunk_inline, "Preview hunk inline")
            map("n", "<leader>hb", function()
                gs.blame_line({ full = true })
            end, "Blame line")
            map("n", "<leader>hd", gs.diffthis, "Diff against index")
            map("n", "<leader>hq", gs.setqflist, "Hunks to quickfix")

            -- Toggles
            map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle line blame")
            map("n", "<leader>tw", gs.toggle_word_diff, "Toggle word diff")

            -- Text object
            map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
        end,
    },
}
