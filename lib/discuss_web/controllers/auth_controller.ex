defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller

  def signout(conn, _params) do
    conn
    |> put_flash(:info, "You have been signed out.")
    |> redirect(to: ~p"/")
  end

  def request(conn, %{"provider" => provider}) do
    conn
    |> put_flash(:info, "OAuth authentication for #{provider} not yet implemented.")
    |> redirect(to: ~p"/")
  end

  def callback(conn, %{"provider" => provider}) do
    conn
    |> put_flash(:info, "OAuth callback for #{provider} not yet implemented.")
    |> redirect(to: ~p"/")
  end
end