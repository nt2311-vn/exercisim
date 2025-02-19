defmodule RPNCalculator do
  def calculate!(stack, operation) do
    try do
      operation.(stack)
    rescue
      e -> raise RuntimeError, message: "Calculation failed: #{Exception.message(e)}"
    end
  end

  def calculate(stack, operation) do
    try do
      {:ok, operation.(stack)}
    rescue
      _ -> :error
    end
  end

  def calculate_verbose(stack, operation) do
    try do
      {:ok, operation.(stack)}
    rescue
      e -> {:error, e.message}
    end
  end
end
