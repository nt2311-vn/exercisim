import gleam/list
import gleam/string

pub fn message(log_line: String) -> String {
  case list.last(string.split(log_line, ":")) {
    Error(Nil) -> ""
    Ok(str) -> string.trim(str)
  }
}

pub fn log_level(log_line: String) -> String {
  case list.first(string.split(log_line, "]")) {
    Error(Nil) -> ""
    Ok(str) -> string.lowercase(string.replace(str, "[", ""))
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
