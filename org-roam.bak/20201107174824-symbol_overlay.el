(use-package symbol-overlay
  :straight t
  :bind (("M-i" . symbol-overlay-put)
         ("M-n" . symbol-overlay-switch-forward)
         ("M-p" . symbol-overlay-switch-backward)
         ("<f7>" . symbol-overlay-mode)
         ("<f8>" . symbol-overlay-remove-all)))

(define-transient-command t/overlay/command ()
              "Symbol Overlay transient"
              ["Symbol Overlay"
               ["Overlays"
                ("." "Add/Remove at point" symbol-overlay-put)
                ("k" "Remove All" symbol-overlay-remove-all)
                ]
               ["Move to Symbol"
                ("n" "Next" symbol-overlay-switch-forward)
                ("p" "Previous" symbol-overlay-switch-backward)
                ]
               ["Other"
                ("m" "Hightlight symbol-at-point" symbol-overlay-mode)
                ]
               ])
