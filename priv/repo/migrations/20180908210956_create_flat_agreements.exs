defmodule UniversityAccomodation.Repo.Migrations.CreateFlatAgreements do
  use Ecto.Migration

  def change do
    create table(:flat_agreements) do
      add :booking_time, :integer
      add :date_to_arrival, :date
      add :date_to_leave, :date
      add :student_id, references(:students, on_delete: :nothing)
      add :dormitory_id, references(:flat_dormitories, on_delete: :nothing)

    end

    create index(:flat_agreements, [:student_id])
    create index(:flat_agreements, [:dormitory_id])
  end
end
