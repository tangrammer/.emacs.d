(use-package engine-mode
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

(defengine clojuredocs
  "https://clojuredocs.org/search?q=%s"
  :keybinding "c"
  :docstring "Searchin' the clojuredocs.")



(engine/set-keymap-prefix (kbd "C-x /"))
