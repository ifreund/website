(bagatto/set-output-dir! "out")

(def git-commit-year
  (string/slice (sh/$< git show -s --format=%as) 0 4))

(def data {:config {:attrs {:base-url "https://isaacfreund.com"
                            :git-commit-year git-commit-year}}
           :index {:attrs {:title "Isaac Freund"}}
           :blog-index {:attrs {:title "Blog"}}
           :blog-posts {:src (bagatto/slurp-* "content/blog/*")
                        :attrs bagatto/parse-mago
                        :transform (bagatto/attr-sorter :date :descending)}
           :404 {:src "content/404.md"
                 :attrs bagatto/parse-mago}
           :static {:src (bagatto/* "static/*")
                    :attrs bagatto/parse-base}})

(defn renderer2
  [template item]
  (fn [data] (bagatto/render template data (data item))))

(def site {:index {:dest "index.html"
                   :out (renderer2 "/templates/index" :index)}
           :blog-index {:dest "blog/index.html"
                        :out (renderer2 "/templates/blog-index" :blog-index)}
           :blog-feed {:dest "blog/feed.xml"
                       :out (bagatto/renderer "/templates/blog-feed")}
           :blog-posts {:each :blog-posts
                        :dest (fn [_ item]
                                (string/format "blog/%s/index.html" (item :slug)))
                        :out (bagatto/renderer "/templates/page")}
           :404 {:dest "404.html"
                 :out (renderer2 "/templates/page" :404)}
           :static {:each :static
                    :dest (bagatto/path-copier "")}})
