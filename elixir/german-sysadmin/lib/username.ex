defmodule Username do
  def sanitize([]), do: []

  def sanitize([h | t]) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
    sanitized =
      case h do
        ?ä ->
          ~c"ae"

        ?ö ->
          ~c"oe"

        ?ü ->
          ~c"ue"

        ?ß ->
          ~c"ss"

        x when x >= ?a and x <= ?z ->
          [x]

        ?_ ->
          ~c"_"

        _ ->
          ~c""
      end

    sanitized ++ sanitize(t)
  end
end
