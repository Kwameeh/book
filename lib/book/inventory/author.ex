defmodule Book.Inventory.Author do
  use Ash.Resource, otp_app: :book, domain: Book.Inventory, data_layer: AshPostgres.DataLayer

  postgres do
    table "authors"
    repo Book.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    integer_primary_key :author_id

    attribute :first_name, :string do
      allow_nil? false
    end

    attribute :last_name, :string do
      allow_nil? false
    end

    attribute :biography, :string
    attribute :nationality, :string
    attribute :birth_date, :date
    attribute :death_date, :date
    timestamps()
  end
end
