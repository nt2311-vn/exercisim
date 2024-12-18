defmodule TakeANumber do
  def start() do
    spawn(fn -> receive_loop(0) end)
  end

  @spec receive_loop(integer) :: integer | nil
  def receive_loop(state) do
    receive do
      {:report_state, sender} ->
        send(sender, state)
        receive_loop(state)

      {:take_a_number, sender} ->
        send(sender, state + 1)
        receive_loop(state + 1)

      :stop ->
        nil

      _ ->
        receive_loop(state)
    end
  end
end
