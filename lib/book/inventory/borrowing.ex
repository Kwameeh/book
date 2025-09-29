defmodule Book.Inventory.Borrowing do
  use Ash.Resource, otp_app: :book, domain: Book.Inventory, data_layer: AshPostgres.DataLayer

  postgres do
    table "borrowings"
    repo Book.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    integer_primary_key :borrowing_id

    attribute :member_id, :integer do
      allow_nil? false
    end

    attribute :book_id, :integer do
      allow_nil? false
    end

    attribute :issue_date, :date do
      allow_nil? false
    end

    attribute :due_date, :date do
      allow_nil? false
    end

    attribute :return_date, :date
    attribute :status, :string
    attribute :fine_amount, :decimal
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

    belongs_to :member, Book.Accounts.User do

      attribute_type :integer
      attribute_writable? true
      allow_nil? false

      # defaults to :id

    end
  end
end
