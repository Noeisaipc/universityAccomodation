defmodule UniversityAccomodation.Repo.Migrations.CreateStudentHouse do
  use Ecto.Migration

  def change do
    create table(:student_houses) do
      add :name, :string
      add :address, :string
      add :phone_number, :string
    end
  end

end
