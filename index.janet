(bagatto/set-output-dir! "out")

(def last-commit-time
  (string/slice (sh/$< git show -s --format=%as) 0 4))

(def data {:config {:attrs {:base-url "https://isaacfreund.com"
                            :last-commit-time last-commit-time}}
           :blog-posts {:src (bagatto/slurp-* "content/blog/*")
                        :attrs bagatto/parse-mago
                        :transform (bagatto/attr-sorter :date :descending)}
           :404 {:src "content/404.md"
                 :attrs bagatto/parse-mago}
           :static {:src (bagatto/* "static/*")
                    :attrs bagatto/parse-base}})

(def site {:index {:dest "index.html"
                   :out (bagatto/renderer "/templates/index")}
           :blog-index {:dest "blog/index.html"
                        :out (bagatto/renderer "/templates/blog-index")}
           :blog-feed {:dest "blog/feed.xml"
                       :out (bagatto/renderer "/templates/blog-feed")}
           :blog-posts {:each :blog-posts
                        :dest (fn [_ item]
                                (string/format "blog/%s/index.html" (item :slug)))
                        :out (bagatto/renderer "/templates/page")}
           :404 {:dest "404.html"
                 :out (fn [data]
                        (bagatto/render "/templates/page" data (data :404)))}
           :static {:each :static
                    :dest (bagatto/path-copier "")}})
