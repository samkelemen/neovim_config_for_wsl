-- lua/config/options.lua
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.g.autoformat = false

local win32yank = "/mnt/c/Users/skelemen/AppData/Local/Microsoft/WinGet/Packages/equalsraf.win32yank_Microsoft.Winget.Source_8wekyb3d8bbwe/win32yank.exe"

-- Yank to the system clipboard
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
    name = "win32yank",
    copy = {
        ["+"] = { win32yank, "-i", "--crlf" },
        ["*"] = { win32yank, "-i", "--crlf" },
    },
    paste = {
        ["+"] = { win32yank, "-o", "--lf" },
        ["*"] = { win32yank, "-o", "--lf" },
    },
    cache_enabled = 0,
}

-- Set the colorscheme to habamax
vim.cmd.colorscheme("habamax")

-- Don't change the cwd when I move into a file
vim.opt.autochdir = false

-- Code folding via treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false -- don't fold on open

-- Show full diagnostic messages inline
vim.diagnostic.config({
    virtual_text = {
        prefix = "",
        format = function(d)
            local icons = { ERROR = " ", WARN = " ", INFO = " ", HINT = " " }
            return icons[vim.diagnostic.severity[d.severity]] .. d.message
        end,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
        },
    },
    underline = true,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})
