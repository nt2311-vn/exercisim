defmodule NameBadge do
  def print(id, name, department) do
    case department do
      nil ->
        if id == nil, do: "#{name} - OWNER", else: "[#{id}] - #{name} - OWNER"

      _ ->
        if id == nil,
          do: "#{name} - #{department |> String.upcase()}",
          else: "[#{id}] - #{name} - #{department |> String.upcase()}"
    end
  end
end
