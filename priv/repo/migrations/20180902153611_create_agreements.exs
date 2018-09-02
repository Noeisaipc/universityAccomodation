defmodule UniversityAccomodation.Repo.Migrations.CreateAgreements do
  use Ecto.Migration

  def change do
    create table(:agreements) do
      add :booking_time, :integer
      add :date_to_arrival, :date
      add :date_to_leave, :date
      add :student_id, references(:students, on_delete: :nothing)
      add :dormitory_id, references(:dormitories, on_delete: :nothing)
    end

    create index(:agreements, [:student_id])
    create index(:agreements, [:dormitory_id])
  end
end
