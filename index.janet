(bagatto/set-output-dir! "out")

(def last-commit-time
  (string/slice (sh/$< git show -s --format=%as) 0 4))

(def data {:config {:attrs {:last-commit-time last-commit-time}}
           :404    {:src "content/404.md"
                    :attrs bagatto/parse-mago}
		   :static {:src (bagatto/* "static/*")
                    :attrs bagatto/parse-base}})

(def site {:index {:dest "index.html"
                   :out (bagatto/renderer "/templates/index")}
           :404 {:dest "404.html"
                 :out (fn [d] (bagatto/render "/templates/page" d (d :404)))}
           :static {:each :static
                    :dest (bagatto/path-copier "")}})
