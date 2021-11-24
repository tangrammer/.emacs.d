(use-package engine-mode
:straight t
  )

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d"
)

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w"
  :docstring "Searchin' the wikis.")



(engine/set-keymap-prefix (kbd "C-x /"))
