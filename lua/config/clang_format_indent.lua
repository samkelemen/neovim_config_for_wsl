-- Match indent settings to the nearest .clang-format
local style_defaults = {
  llvm = 2, google = 2, chromium = 2, mozilla = 2, gnu = 2,
  webkit = 4, microsoft = 4,
}

local function apply_clang_format_indent(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  if name == "" then return end

  local cf = vim.fs.find({ ".clang-format", "_clang-format" }, {
    upward = true,
    path = vim.fs.dirname(name),
  })[1]
  if not cf then return end

  local width, tab_width, use_tab, base
  for line in io.lines(cf) do
    -- only top-level keys (no leading whitespace)
    width     = width     or tonumber(line:match("^IndentWidth:%s*(%d+)"))
    tab_width = tab_width or tonumber(line:match("^TabWidth:%s*(%d+)"))
    use_tab   = use_tab   or line:match("^UseTab:%s*(%a+)")
    base      = base      or line:match("^BasedOnStyle:%s*(%a+)")
  end

  width = width or (base and style_defaults[base:lower()])
  if not width then return end

  local bo = vim.bo[buf]
  bo.shiftwidth  = width
  bo.softtabstop = width
  bo.tabstop     = tab_width or width
  bo.expandtab   = (use_tab == nil or use_tab == "Never")
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("ClangFormatIndent", { clear = true }),
  pattern = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  callback = function(args) apply_clang_format_indent(args.buf) end,
})
