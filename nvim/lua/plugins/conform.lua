return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            python = { "black" },
            cpp = { "clang-format" },
            lua = { "stylua" },
        },
        formatters = {
            black = {
                prepend_args = { "--line-length", "120" },
            },
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = false,
        },
    },
}
