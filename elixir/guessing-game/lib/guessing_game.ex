defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess) do
    cond do
      guess == nil || guess == :no_guess -> "Make a guess"
      secret_number == guess -> "Correct"
      secret_number - guess == 1 || secret_number - guess == -1 -> "So close"
      secret_number > guess -> "Too low"
      secret_number < guess -> "Too high"
    end
  end
end
