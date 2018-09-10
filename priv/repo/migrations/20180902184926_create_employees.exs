defmodule UniversityAccomodation.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :last_name, :string
      add :address, :string
      add :birth_date, :date
      add :gender, :string
      add :charge, :string
      add :location, :string
    end

  end
end
