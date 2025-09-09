defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  
  alias Discuss.{Topic, Repo}

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render(conn, :index, topics: topics)
  end

  def show(conn, %{"id" => topic_id}) do
    topic = Repo.get!(Topic, topic_id) |> Repo.preload([:comments, :user])
    render(conn, :show, topic: topic)
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"topic" => topic_params}) do
    # For now, create topics without user association (we'll add auth later)
    changeset = Topic.changeset(%Topic{}, topic_params)

    case Repo.insert(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic created successfully!")
        |> redirect(to: ~p"/")
      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def edit(conn, %{"id" => topic_id}) do
    topic = Repo.get!(Topic, topic_id)
    changeset = Topic.changeset(topic, %{})
    render(conn, :edit, changeset: changeset, topic: topic)
  end

  def update(conn, %{"id" => topic_id, "topic" => topic_params}) do
    topic = Repo.get!(Topic, topic_id)
    changeset = Topic.changeset(topic, topic_params)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic updated successfully!")
        |> redirect(to: ~p"/#{topic_id}")
      {:error, changeset} ->
        render(conn, :edit, changeset: changeset, topic: topic)
    end
  end
end
