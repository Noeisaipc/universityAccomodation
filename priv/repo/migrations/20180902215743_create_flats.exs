defmodule UniversityAccomodation.Repo.Migrations.CreateFlats do
  use Ecto.Migration

  def change do
    create table(:flats) do
      add :address, :string
    end


  end
end
