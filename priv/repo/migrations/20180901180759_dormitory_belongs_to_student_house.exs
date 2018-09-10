defmodule UniversityAccomodation.Repo.Migrations.DormitoryBelongsToStudentHouse do
  use Ecto.Migration

  def change do
    alter table(:dormitories) do
      add :student_house_id, references(:student_houses)
    end

    create index(:dormitories, [:student_house_id])
  end
end
