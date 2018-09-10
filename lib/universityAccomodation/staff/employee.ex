defmodule UniversityAccomodation.Staff.Employee do
  use Ecto.Schema
  import Ecto.Changeset


  schema "employees" do
    field :address, :string
    field :birth_date, :date
    field :charge, :string
    field :gender, :string
    field :last_name, :string
    field :location, :string
    field :name, :string
    has_one :student_house, UniversityAccomodation.StudentHouse
    has_many :inspection, UniversityAccomodation.Staff.Inspection
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :last_name, :address, :birth_date, :gender, :charge, :location])
    |> validate_required([:name, :last_name, :address, :birth_date, :gender, :charge, :location])
  end
end
