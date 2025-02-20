# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(_opts \\ []), do: Agent.start_link(fn -> %{plots: %{}, next_id: 1} end)

  def list_registrations(pid) do
    Agent.get(pid, &Map.values(&1.plots))
  end

  def register(pid, register_to) do
    # Please implement the register/2 function
  end

  def release(pid, plot_id) do
    # Please implement the release/2 function
  end

  def get_registration(pid, plot_id) do
    # Please implement the get_registration/2 function
  end
end
