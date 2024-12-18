defmodule TakeANumber do
  def start(), do: spawn(&receive_loop/0)

  @spec receive_loop(integer) :: integer | nil
  defp receive_loop(state \\ 0) do
    receive do
      {:report_state, pid} ->
        send(pid, state)
        receive_loop(state)

      {:take_a_number, pid} ->
        send(pid, state + 1)
        receive_loop(state + 1)

      :stop ->
        nil

      _ ->
        receive_loop(state)
    end
  end
end
