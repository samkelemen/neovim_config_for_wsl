;; extends

; Strings assigned to variables ending in "_query" or "_sql" are SQL
((assignment
  left: (identifier) @_name
  right: (string (string_content) @injection.content))
  (#lua-match? @_name "_query$")
  (#set! injection.language "sql"))

((assignment
  left: (identifier) @_name
  right: (string (string_content) @injection.content))
  (#lua-match? @_name "_sql$")
  (#set! injection.language "sql"))

; Strings starting with a "--sql" marker
((string (string_content) @injection.content)
  (#lua-match? @injection.content "^%-%-sql")
  (#set! injection.language "sql"))

; f-strings returned by functions named "*_query": every literal segment
; (the parts between {interpolations}) is combined into one SQL document
((function_definition
  name: (identifier) @_name
  body: (block
    (return_statement
      (string (string_content) @injection.content))))
  (#lua-match? @_name "_query$")
  (#set! injection.language "sql")
  (#set! injection.combined))
