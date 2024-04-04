(bagatto/set-output-dir! "out")

(def last-commit-time
  (string/slice (sh/$< git show -s --format=%as) 0 4))

(def data {:config {:attrs {:last-commit-time last-commit-time}}
           :blog-posts {:src (bagatto/slurp-* "content/blog/*")
                        :attrs bagatto/parse-mago
                        :transform (bagatto/attr-sorter "date")}
           :404 {:src "content/404.md"
                 :attrs bagatto/parse-mago}
		   :static {:src (bagatto/* "static/*")
                    :attrs bagatto/parse-base}})

# I've inherited this path scheme from hugo and it's not worth changing now
(defn path-gen-each-md [dirname]
  (fn [data item]
    (let [basename (path/basename (item :path))]
      (assert (string/has-suffix? ".md" basename))
      (string/format "%s/%s/index.html" dirname (string/slice basename 0 -4)))))
  
(def site {:index {:dest "index.html"
                   :out (bagatto/renderer "/templates/index")}
           :blog-posts {:each :blog-posts
                        :dest (path-gen-each-md "blog") 
                        :out  (bagatto/renderer "/templates/page")}
           :404 {:dest "404.html"
                 :out (fn [d] (bagatto/render "/templates/page" d (d :404)))}
           :static {:each :static
                    :dest (bagatto/path-copier "")}})
