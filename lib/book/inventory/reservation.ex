defmodule Book.Inventory.Reservation do
  use Ash.Resource, otp_app: :book, domain: Book.Inventory, data_layer: AshPostgres.DataLayer

  postgres do
    table "reservations"
    repo Book.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    integer_primary_key :reservation_id

    attribute :member_id, :string do
      allow_nil? false
    end

    attribute :book_id, :integer do
      allow_nil? false
    end

    attribute :reservation_date, :date do
      allow_nil? false
    end
    # status ENUM('active', 'fulfilled', 'expired', 'cancelled') DEFAULT 'active',

    attribute :status, :string

    attribute :expiry_date, :date do
      allow_nil? false
    end

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



      allow_nil? false

      # defaults to :id

    end
  end
end
