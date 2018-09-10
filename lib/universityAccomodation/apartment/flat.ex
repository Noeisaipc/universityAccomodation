defmodule UniversityAccomodation.Apartment.Flat do
  use Ecto.Schema
  import Ecto.Changeset


  schema "flats" do
    field :address, :string
    has_many :inspection, UniversityAccomodation.Staff.Inspection
    has_many :dormitory, UniversityAccomodation.Dormitory.FlatDormitory
  end

  @doc false
  def changeset(flat, attrs) do
    flat
    |> cast(attrs, [:address])
    |> validate_required([:address])
  end
end
