defmodule UniversityAccomodation.Repo.Migrations.AddDirectorRelationToStudentHouse do
  use Ecto.Migration

  def change do
    alter table(:student_houses) do
      add :employee_id, references(:employees)
    end

    create index(:student_houses, [:employee_id])
  end
end
