defmodule UniversityAccomodation.Repo.Migrations.CreateInspections do
  use Ecto.Migration

  def change do
    create table(:inspections) do
      add :inspection_date, :date
      add :indicator, :boolean, default: false, null: false
      add :comment, :text
      add :employee_id, references(:employees, on_delete: :nothing)
      add :flat_id, references(:flats, on_delete: :nothing)
    end

    create index(:inspections, [:employee_id])
    create index(:inspections, [:flat_id  ])
  end
end
