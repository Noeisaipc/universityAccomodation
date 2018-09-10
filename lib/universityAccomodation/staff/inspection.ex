defmodule UniversityAccomodation.Staff.Inspection do
  use Ecto.Schema
  import Ecto.Changeset


  schema "inspections" do
    field :comment, :string
    field :indicator, :boolean, default: false
    field :inspection_date, :date
    belongs_to :employee, UniversityAccomodation.Staff.Employee
    belongs_to :flat, UniversityAccomodation.Apartment.Flat
  end

  @doc false
  def changeset(inspection, attrs) do
    inspection
    |> cast(attrs, [:inspection_date, :indicator, :comment])
    |> validate_required([:inspection_date, :indicator, :comment])
  end
end
