defmodule Book.Repo do
  use Ecto.Repo,
    otp_app: :book,
    adapter: Ecto.Adapters.Postgres
end
