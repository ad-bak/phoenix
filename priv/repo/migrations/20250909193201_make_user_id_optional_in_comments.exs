defmodule Discuss.Repo.Migrations.MakeUserIdOptionalInComments do
  use Ecto.Migration

  def change do
    alter table(:comments) do
      modify :user_id, :integer, null: true
    end
  end
end
