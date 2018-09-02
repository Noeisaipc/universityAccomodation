defmodule UniversityAccomodation.Repo.Migrations.CreateDormitory do
  use Ecto.Migration

  def change do
    create table(:dormitories) do
      add :dormitory_number, :string
      add :hire, :integer
      add :student_id, references(:students, on_delete: :nothing)
    end



  end
end
