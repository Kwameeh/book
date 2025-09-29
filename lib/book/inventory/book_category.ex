defmodule Book.Inventory.BookCategory do
  use Ash.Resource, otp_app: :book, domain: Book.Inventory, data_layer: AshPostgres.DataLayer

  postgres do
    table "book_categories"
    repo Book.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    integer_primary_key :category_id
    integer_primary_key :book_id
    timestamps()
  end

  relationships do
    belongs_to :book, Book.Inventory.Book do
      source_attribute :book_id
      attribute_type :integer
      attribute_writable? true
      allow_nil? false

      # defaults to :id
      destination_attribute :book_id
    end

    belongs_to :category, Book.Inventory.Category do
      source_attribute :category_id
      attribute_type :integer
      attribute_writable? true
      allow_nil? false

      # defaults to :id
      destination_attribute :category_id
    end
  end
end
