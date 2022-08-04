#' load_data.R
#'
#' Downloads datasets from shared Google Drive to local temporary folder
#'  to read into R, then cleans up and removes the temp folder and local file.
#'
#' @param link full path to Google drive stored dataset
#' @param filetype csv or xlsx
#'
#' @return data.frame
#' @export
#'
#' @examples
#' drive_link <- 'https://drive.google.com/file/d/1MLpcVs9jXcFz6CgPAOemOiaS2hgzGKx1/view?usp=sharing'
#' my_data <- load_data(drive_link)
load_data <- function(link, filetype = 'csv'){

  dir.create("tmp")

  setwd('./tmp/')

  download <- googledrive::drive_download(link, type = 'csv')

  filename <- list.files()[1]

  data <- utils::read.csv(filename)

  setwd('..')

  unlink("tmp", recursive = TRUE)

  return(data)

}

