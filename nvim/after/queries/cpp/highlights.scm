;; extends

; Whole `// TODO:` comments in neon blue (group set in plugins/colorscheme.lua)
((comment) @comment.todo.neon
  (#lua-match? @comment.todo.neon "^//%s*TODO:")
  (#set! priority 130))
