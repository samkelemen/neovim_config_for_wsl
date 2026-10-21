-- treesitter.lua
-- nvim-treesitter config for the new `main` branch (rewrite)
-- Requires: Neovim 0.12+, tree-sitter-cli (>= 0.26.1), a C compiler, tar, curl
--
-- lazy.nvim spec. If you use another plugin manager, adapt accordingly
-- (the important parts are branch = 'main' and running :TSUpdate on build).

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- the plugin does not support lazy-loading
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        -- Optional: setup() is not required for defaults, shown here for clarity
        ts.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        -- Languages to install parsers + queries for
        local languages = { "lua", "python", "cpp", "bash", "sql" }

        -- Install parsers (no-op if already installed; runs asynchronously)
        ts.install(languages)

        -- Enable features per filetype.
        -- NOTE: in the rewrite, features are NOT enabled automatically.
        vim.api.nvim_create_autocmd("FileType", {
            pattern = languages, -- filetypes happen to match parser names here
            callback = function()
                -- Highlighting (this is what gives you syntax colors)
                vim.treesitter.start()

                -- Indentation (provided by nvim-treesitter, experimental)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

                -- Folds (optional — uncomment to enable treesitter-based folding)
                -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                -- vim.wo[0][0].foldmethod = 'expr'
            end,
        })
    end,
}
