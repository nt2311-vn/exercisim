defmodule LogParser do
  def valid_line?(line) do
    String.match?(line, ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/)
  end

  def split_line(line) do
    String.split(line, ~r/<[~=*-]+>|<>/)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end-of-line\d+/i, "")
  end

  def tag_with_user_name(line) do
    case Regex.run(~r/User[\s\t\n]+([^[\s\t\n]+)/, line) do
      [_, username] -> "[USER] #{username} #{line}"
      _ -> line
    end
  end
end
