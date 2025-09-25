defmodule Book.Accounts do
  use Ash.Domain, otp_app: :book, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource Book.Accounts.Token
    resource Book.Accounts.User
    resource Book.Accounts.ApiKey
  end
end
