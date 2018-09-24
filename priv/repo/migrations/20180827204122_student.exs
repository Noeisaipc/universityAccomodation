defmodule UniversityAccomodation.Repo.Migrations.Student do
  use Ecto.Migration

  def change do
    create table(:students) do
      add(:matricula, :string, unique: true)
      add(:name, :string, null: false)
      add(:last_name, :string, null: false)
      add(:address, :string, null: false)
      add(:phone_number, :string)
      add(:category, :string, null: false)
    end

  end
end
