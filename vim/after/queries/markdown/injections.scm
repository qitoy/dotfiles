;; extends
(
  (inline) @injection.content
  (#vim-match? @injection.content "^\(import\|export\)")
  (#set! injection.language "typescriptreact")
)
