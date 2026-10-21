-- lua/plugins/ufo.lua
-- Adds a VS Code-style "⋯ N lines" hint after folded lines.
-- Delete this file to go back to plain treesitter folds.

-- Render the folded line's own (highlighted) text, then the hint, truncating to fit the window
local function fold_hint(virtText, lnum, endLnum, width, truncate)
    local suffix = ("  \u{22ef} %d lines "):format(endLnum - lnum)
    local suffixWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - suffixWidth
    local curWidth = 0
    local newVirtText = {}

    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            table.insert(newVirtText, { chunkText, chunk[2] })
            break
        end
        curWidth = curWidth + chunkWidth
    end

    table.insert(newVirtText, { suffix, "Comment" })
    return newVirtText
end

return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    keys = {
        -- ufo's versions keep foldlevel at 99, so new folds still start open
        { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
        { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    },
    opts = {
        provider_selector = function()
            return { "treesitter", "indent" }
        end,
        fold_virt_text_handler = fold_hint,
    },
}
