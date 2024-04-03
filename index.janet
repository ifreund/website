(bagatto/set-output-dir! "out")

(def data {:config {:attrs {:root "isaacfreund.com"
                            :title "Isaac Freund"}}})

(def site {:index {:dest "index.html"
                   :out (bagatto/renderer "/templates/index")}})
