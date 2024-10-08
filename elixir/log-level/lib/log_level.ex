defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 && !legacy? ->
        :trace

      level == 1 ->
        :debug

      level == 2 ->
        :info

      level == 3 ->
        :warning

      level == 4 ->
        :error

      level == 5 && !legacy? ->
        :fatal

      true ->
        :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    msg = to_label(level, legacy?)

    cond do
      msg == :error || msg == :fatal ->
        :ops

      msg == :unknown && legacy? ->
        :dev1

      msg == :unknown ->
        :dev2

      true ->
        false
    end
  end
end
