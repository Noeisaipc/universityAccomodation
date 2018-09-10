defmodule UniversityAccomodation.Dormitory.FlatDormitory do
  use Ecto.Schema
  import Ecto.Changeset


  schema "flat_dormitories" do
    field :dormitory_number, :string
    field :hire, :integer
    belongs_to :flat, UniversityAccomodation.Apartment.Flat
    belongs_to :student, UniversityAccomodation.Student
  end

  @doc false
  def changeset(flat_dormitory, attrs) do
    flat_dormitory
    |> cast(attrs, [:dormitory_number, :hire])
    |> validate_required([:dormitory_number, :hire])
  end
end
