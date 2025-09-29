defmodule Book.Inventory.BookAuthor do
  use Ash.Resource, otp_app: :book, domain: Book.Inventory, data_layer: AshPostgres.DataLayer

  postgres do
    table "book_authors"
    repo Book.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    integer_primary_key :book_id
    integer_primary_key :author_id
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

    belongs_to :author, Book.Inventory.Author do
      source_attribute :author_id
      allow_nil? false
      destination_attribute :author_id
      attribute_type :integer
      attribute_writable? true
    end
  end
end
