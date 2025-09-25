defmodule Book.Secrets do
  use AshAuthentication.Secret

  def secret_for([:authentication, :tokens, :signing_secret], Book.Accounts.User, _opts, _context) do
    Application.fetch_env(:book, :token_signing_secret)
  end
end
