;; extends

; Base capture so uncaptured/error-recovered SQL (e.g. T-SQL) doesn't inherit
; the surrounding Python string color when injected.
(program) @sql.base
