# utils.R

#' Check if grep is available in the system
#'
#' This function checks if the grep command is available in the system.
#'
#' @return Logical value: TRUE if grep is available, FALSE otherwise.
#'
#' @keywords internal
check_grep_availability <- function() {
  tryCatch({
    system("grep --version", intern = TRUE, ignore.stdout = TRUE, ignore.stderr = TRUE)
    TRUE
  }, error = function(e) {
    FALSE
  }, warning = function(w) {
    FALSE
  })
}

#' Build a grep command with proper escaping and options
#'
#' Builds a platform-safe grep command.
#'
#' @param pattern Pattern to search for.
#' @param files Character vector of file paths.
#' @param options Additional grep options (default "").
#' @param count Logical; if TRUE, adds -c to count matches.
#'
#' @return A character string with the grep command.
#'
#' @keywords internal
build_grep_cmd <- function(pattern, files, options = "", count = FALSE) {
  sys_info <- get_system_info()

  if (!sys_info$has_grep) {
    stop("The 'grep' command is not available on this system. ",
         "Please install grep or ensure it's in your PATH.")
  }

  # Add count option if requested
  if (count) options <- paste(options, "-c")

  # Escape pattern for shell
  escaped_pattern <- gsub("'", "'\\\\''", pattern)

  # Properly quote file paths
  file_paths <- paste(shQuote(files), collapse = " ")

  if (sys_info$is_windows) {
    # On Windows with git bash or grep in PATH, same command applies
    cmd <- sprintf("grep %s \"%s\" %s", options, escaped_pattern, file_paths)
  } else {
    cmd <- sprintf("grep %s '%s' %s", options, escaped_pattern, file_paths)
  }

  cmd
}

#' Execute a shell command safely
#'
#' Executes a shell command, handling errors gracefully.
#'
#' @param cmd Command to execute.
#' @param intern Logical; if TRUE, captures output.
#'
#' @return Command output as character vector, or empty vector on error.
#'
#' @keywords internal
safe_system_call <- function(cmd, intern = TRUE) {
  tryCatch({
    output <- system(cmd, intern = intern)
    output
  }, error = function(e) {
    character(0)
  }, warning = function(w) {
    character(0)
  })
}

#' Get platform-specific system information
#'
#' Detects system details.
#'
#' @return A list with system information.
#'
#' @keywords internal
get_system_info <- function() {
  os_type <- .Platform$OS.type
  os_name <- Sys.info()[["sysname"]]

  list(
    os_type = os_type,
    os_name = os_name,
    is_windows = grepl("Windows", os_name, ignore.case = TRUE),
    is_unix = os_type == "unix",
    has_grep = check_grep_availability()
  )
}
