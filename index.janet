(bagatto/set-output-dir! "out")

(def last-commit-time
  (string/slice (sh/$< git show -s --format=%as) 0 4))

(defn parse-content
  [src attrs]
    (assert (string/has-prefix? "content/" (attrs :path)))
    (assert (string/has-suffix? ".md" (attrs :path)))
    (merge-into (bagatto/parse-mago src attrs)
      @{:dest (string/slice (attrs :path) (length "content/") -4)}))

(def data {:config {:attrs {:last-commit-time last-commit-time}}
           :blog-posts {:src (bagatto/slurp-* "content/blog/*")
                        :attrs parse-content
                        :transform (bagatto/attr-sorter :date :descending)}
           :404 {:src "content/404.md"
                 :attrs bagatto/parse-mago}
		   :static {:src (bagatto/* "static/*")
                    :attrs bagatto/parse-base}})



(defn path-gen-content
  [data item]
    (path/join (item :dest) "index.html"))

(def site {:index {:dest "index.html"
                   :out (bagatto/renderer "/templates/index")}
           :blog-index {:dest "blog/index.html"
                        :out (bagatto/renderer "/templates/blog-index")}
           :blog-posts {:each :blog-posts
                        :dest path-gen-content
                        :out  (bagatto/renderer "/templates/page")}
           :404 {:dest "404.html"
                 :out (fn [d] (bagatto/render "/templates/page" d (d :404)))}
           :static {:each :static
                    :dest (bagatto/path-copier "")}})
