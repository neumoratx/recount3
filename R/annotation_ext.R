#' Obtain the file extension for a given organism and annotation
#'
#' Given an `organism` and an `annotation`, this function returns the
#' corresponding file extension used in the `recount3` files.
#'
#' @param annotation A `character(1)` specifying which annotation you want to
#' use.
#' @inheritParams locate_url
#'
#'
#' @return A `character(1)` with the annotation file extension to be used.
#' @export
#'
#' @family internal functions for accessing the recount3 data
#' @examples
#'
#' annotation_ext("human")
#' annotation_ext("human", "fantom6_cat")
#' annotation_ext("human", "refseq")
#' annotation_ext("mouse")
#' annotation_ext("rat")
annotation_ext <- function(organism = c("human", "mouse", "rat", "pig", "rabbit"),
    annotation = annotation_options(organism)) {
    organism <- match.arg(organism)
    annotation <- match.arg(annotation)

    ## Define the annotation to work with
    if (organism == "human") {
        ann_ext <- switch(annotation,
            gencode_v26 = "G026",
            gencode_v29 = "G029",
            ercc = "ERCC",
            fantom6_cat = "F006",
            refseq = "R109",
            sirv = "SIRV",
            l1000 = "L01K"
        )
    } else if (organism == "mouse") {
        ann_ext <- switch(annotation,
            gencode_v23 = "M023",
            ercc = "ERCC",
            sirv = "SIRV"
        )
    } else if (organism == "rat") {
        ann_ext <- switch(annotation,
            "rbn72" = "M105",
            ercc = "ERCC",
            sirv = "SIRV"
        )
    } else if (organism == "pig") {
        ann_ext <- switch(annotation,
            "p111" = "MP11",
            ercc = "ERCC",
            sirv = "SIRV"
        )
    } else if (organism == "rabbit") {
        ann_ext <- switch(annotation,
            "mr20" = "MR20",
            ercc = "ERCC",
            sirv = "SIRV"
        )
    }

    return(ann_ext)
}
