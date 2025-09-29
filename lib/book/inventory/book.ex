defmodule Book.Inventory.Book do
  use Ash.Resource, otp_app: :book, domain: Book.Inventory, data_layer: AshPostgres.DataLayer

  postgres do
    table "books"
    repo Book.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    integer_primary_key :book_id

    attribute :isbn, :string do
      allow_nil? false
    end

    attribute :title, :string do
      allow_nil? false
    end

    attribute :author, :string do
      allow_nil? false
    end

    attribute :publisher_id, :integer
    attribute :publication_date, :date
    attribute :genre, :string
    attribute :language, :string
    attribute :total_copies, :integer
    attribute :available_copies, :integer
    attribute :price, :decimal
    attribute :status, :string
    timestamps()
  end
end
