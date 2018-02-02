#! /usr/bin/env Rscript

cat("\nRendering presentation...\n\n")
rmarkdown::render(input         = "presentation.Rmd",
                  output_format = "revealjs::revealjs_presentation",
                  output_file   = "presentation.html", quiet = TRUE)

cat("Rendering single page version...\n\n")
# html_document themes
rmarkdown::render(input         = "presentation.Rmd",
                  output_format = "html_document",
                  output_file   = "index.html", quiet = TRUE)

current_user <- Sys.info()[["user"]]

cat("\nI hope you're really", current_user, "\n")

if (current_user == "Lukas") {
  out_dir <- "~/Sync/public.tadaa-data.de/pruefungstutorien/qm1_wise_18/"
} else if (current_user == "tobi") {
  out_dir <- "~/Dokumente/syncthing/public.tadaa-data.de/pruefungstutorien/qm1_wise_18"
} else {
  out_dir <- ""
}

if (out_dir == "") {
  cat("\n\n**No output directory defined, moving nothing**\n\n")
}

out_docs   <- c(list.files(pattern = "*.html"), "presentation.Rmd")
out_assets <- c("assets", "img")

copy_docs <- sapply(out_docs,   file.copy, to = out_dir, overwrite = T, recursive = F)
copy_assets <- sapply(out_assets, file.copy, to = out_dir, overwrite = T, recursive = T)

if (all(copy_docs)) {
  cat("\nAll docs copied successfully\n")
}
if (all(copy_assets)) {
  cat("\nAll assets copied successfully\n")
}
cat("\nAll done.\n")
timestamp()
