defmodule Newsletter do
  def read_emails(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
    |> Enum.reject(fn x -> x == "" end)
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    email_list = read_emails(emails_path)
    log_pid = open_log(log_path)

    email_list
    |> Enum.each(fn email -> if send_fun.(email) == :ok, do: log_sent_email(log_pid, email) end)

    close_log(log_pid)
  end
end
