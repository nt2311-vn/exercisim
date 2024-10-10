import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[ERROR]:" <> msg -> msg
    "[WARNING]:" <> msg -> msg
    "[INFO]:" <> msg -> msg
    _ -> log_line
  }
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]" <> _ -> "error"
    "[WARNING]" <> _ -> "warning"
    _ -> "info"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
