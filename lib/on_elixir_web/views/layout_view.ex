defmodule OnElixirWeb.LayoutView do
  use OnElixirWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}
  def username(mail) do
    index = mail |> :binary.match("@") |> elem(0)
    mail |> String.slice(0..(index - 1))
  end
end
