defmodule DiscussWeb.CommentController do
  use DiscussWeb, :controller
  
  alias Discuss.{Comment, Topic, Repo}

  def create(conn, %{"topic_id" => topic_id, "comment" => comment_params}) do
    # For now, create comments without user association (we'll add auth later)
    topic = Repo.get!(Topic, topic_id)
    
    changeset = topic
    |> Ecto.build_assoc(:comments)
    |> Comment.changeset(comment_params)

    case Repo.insert(changeset) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Comment added!")
        |> redirect(to: ~p"/#{topic_id}")
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Failed to add comment")
        |> redirect(to: ~p"/#{topic_id}")
    end
  end

  def delete(conn, %{"topic_id" => topic_id, "id" => comment_id}) do
    comment = Repo.get!(Comment, comment_id)
    Repo.delete!(comment)
    
    conn
    |> put_flash(:info, "Comment deleted!")
    |> redirect(to: ~p"/#{topic_id}")
  end
end