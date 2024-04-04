(bagatto/set-output-dir! "out")

(def data {:static {:src (bagatto/* "static/*")
                    :attrs bagatto/parse-base}})

(def site {:index {:dest "index.html"
                   :out (bagatto/renderer "/templates/index")}
           :static {:each :static
                    :dest (bagatto/path-copier "")}})
