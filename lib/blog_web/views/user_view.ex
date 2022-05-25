defmodule BlogWeb.UserView do
  use BlogWeb, :view

  def render("create.json", %{user: user}) do
    %{
      result: "User created",
      user: user
    }
  end
end
