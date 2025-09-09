defmodule Discuss.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :text, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :topic_id, references(:topics, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:comments, [:user_id])
    create index(:comments, [:topic_id])
  end
end
