defmodule Book.Inventory do
  use Ash.Domain,
    otp_app: :book, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource Book.Inventory.Book
    resource Book.Inventory.Author
    resource Book.Inventory.Category
    resource Book.Inventory.BookAuthor
    resource Book.Inventory.BookCategory
    resource Book.Inventory.Borrowing
    resource Book.Inventory.Reservation
  end
end
