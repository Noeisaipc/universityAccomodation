defmodule UniversityAccomodation.Repo.Migrations.AddParentForStudent do
  use Ecto.Migration

  def change do
    create table(:family_members) do
      add(:name, :string, null: false)
      add(:last_name, :string, null: false)
      add(:address, :string, null: false)
      add(:phone_number, :string)
      add(:relationship, :string, null: false)
      add :student_id, references(:students, on_delete: :nothing)
    end


    create index(:family_members, [:student_id])
  end
end
