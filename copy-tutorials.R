files <- c(
  "privefl/memory-mapping.Rmd",
  "privefl/tidyverse-list-columns.Rmd",
  "privefl/all-in-R.Rmd",
  "privefl/refs.bib",
  "abaghela/eQTLanalysis.Rmd",
  "pzhang/xlsx_tutorial.Rmd",
  "pzhang/pubmed_result_1000genomescancerbreast.txt",
  "Unsupervised_clustering_AC/PCA.html"
)
file.copy(files, basename(files), overwrite = TRUE)

if (!dir.exists("data/hapmap3_pop")) {
  dir.create("data/hapmap3_pop")
  file.copy("privefl/data/hapmap3_pop", "data", recursive = TRUE)
}
