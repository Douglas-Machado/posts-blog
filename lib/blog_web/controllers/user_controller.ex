defmodule BlogWeb.UserController do
  use BlogWeb, :controller

  alias Blog.Users
  alias Blog.Users.User

  def create(conn, params) do
    params["user"]
    |> Users.call()
    |> handle_create(conn)
  end

  defp handle_create({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_create({:error, %{result: result, status: status}}, conn) do
    conn
    |> put_status(status)
    |>put_view(BlogWeb.ErrorView)
    |> render("error.json", result: result)
  end

end
