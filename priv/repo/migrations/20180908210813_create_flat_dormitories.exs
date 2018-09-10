defmodule UniversityAccomodation.Repo.Migrations.CreateFlatDormitories do
  use Ecto.Migration

  def change do
    create table(:flat_dormitories) do
      add :dormitory_number, :string
      add :hire, :integer
      add :flat, references(:flats, on_delete: :nothing)
      add :student_id, references(:students, on_delete: :nothing)
    end

    create index(:flat_dormitories, [:flat])
    create index(:flat_dormitories, [:student_id])
  end
end
