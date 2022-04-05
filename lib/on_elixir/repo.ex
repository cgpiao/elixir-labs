defmodule OnElixir.Repo do
  use Ecto.Repo,
    otp_app: :on_elixir,
    adapter: Ecto.Adapters.Postgres
end
