defmodule Book.Inventory.Category do
  use Ash.Resource, otp_app: :book, domain: Book.Inventory, data_layer: AshPostgres.DataLayer

  postgres do
    table "categories"
    repo Book.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    integer_primary_key :category_id

    attribute :category_name, :string do
      allow_nil? false
    end

    attribute :description, :string
    timestamps()
  end
end
