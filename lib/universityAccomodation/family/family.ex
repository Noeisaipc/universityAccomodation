defmodule UniversityAccomodation.Family do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "family_members" do
    field :matricula, :string
    field :name, :string
    field :last_name, :string
    field :address,  :string
    field :phone_number, :string
    field :relationship, :string
    belongs_to :student, UniversityAccomodation.Student
  end

end
