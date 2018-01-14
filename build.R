#! /usr/bin/env Rscript

rmarkdown::render(input         = "presentation.Rmd",
                  output_format = "revealjs::revealjs_presentation",
                  output_file   = "presentation.html")

# html_document themes
rmarkdown::render(input         = "presentation.Rmd",
                  output_format = "html_document",
                  output_file   = "index.html")

current_user <- Sys.info()[["user"]]

if (current_user == "Lukas") {
  out_dir <- "~/Sync/public.tadaa-data.de/pruefungstutorien/qm1_wise_18/"
} else if (current_user == "tobi") {
  out_dir <- "~/Dokumente/syncthing/public.tadaa-data.de/pruefungstutorien/qm1_wise_18"
} else {
  out_dir <- ""
}

if (out_dir == "") {
  stop("No output directory defined")
}

out_docs   <- c(list.files(pattern = "*.html"), "presentation.Rmd")
out_assets <- c("assets", "img")

sapply(out_docs,   file.copy, to = out_dir, overwrite = T, recursive = F)
sapply(out_assets, file.copy, to = out_dir, overwrite = T, recursive = T)
