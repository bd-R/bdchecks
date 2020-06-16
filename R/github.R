#' Get Githb Project Information
#'
#' `get_github_project()` is a function for retrieve information for a given github
#' project
#'
#' @param repo Repository that we want to work on
#' @param project Name of the project that we want to get
#' @param header API header (currently it's required for work with projects)
#' 
#' @importFrom gh gh
#' 
#' @return A data.frame that contains title, url, data information of a given
#' project
#'
get_github_project <- function(
  repo = "tdwg/bdq",
  project = "Core Tests and Assertions (TG2)",
  header = c("Accept" = "application/vnd.github.inertia-preview+json")
) {
  # Get all projects
  projects <- gh::gh(
    paste0("/repos/", repo, "/projects"),
    .send_headers = header,
    .limit = Inf
  )
  # Find wanted project
  foo <- lapply(projects, "[[", "name") == project
  if (sum(foo) == 0) {
    stop("Project '", project, "' not found under repository ", repo)
  } else {
    columns <- gh::gh(
      paste0("/projects/", projects[[foo]]$id, "/columns"),
      .send_headers = header,
      .limit = Inf
    )
  }
  if (length(columns) == 0) {
    stop("No columns found under wanted project")
  }
  result <- list()
  for (i in seq_along(columns)) {
    entry <- gh::gh(
      paste0("/projects/columns/", columns[[i]]$id, "/cards"),
      .send_headers = header,
      .limit = Inf
    )
    for (j in seq_along(entry)) {
      res <- gh::gh(entry[[j]]$content_url, .limit = Inf)
      result[[length(result) + 1]] <-
      data.frame(
        title = res$title,
        test = columns[[i]]$name,
        labels = paste(sort(sapply(res$labels, "[[", "name")), collapse = "; "),
        url = sub("api.github.com/repos", "github.com", entry[[j]]$content_url),
        created = res$created_at,
        updated = res$updated_at,
        state = res$state
      )
    }
  }
  return(do.call(rbind, result))
}
