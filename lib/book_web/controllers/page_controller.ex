defmodule BookWeb.PageController do
  use BookWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
