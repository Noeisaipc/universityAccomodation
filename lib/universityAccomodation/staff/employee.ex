defmodule UniversityAccomodation.Staff.Employee do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "employees" do
    field :address, :string
    field :birth_date, :date
    field :charge, :string
    field :gender, :string
    field :last_name, :string
    field :location, :string
    field :name, :string
    field :phone_number, :string
    has_one :student_house, UniversityAccomodation.StudentHouse
    has_many :inspection, UniversityAccomodation.Staff.Inspection
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :last_name, :address, :birth_date, :gender, :charge, :location])
    |> validate_required([:name, :last_name, :address, :birth_date, :gender, :charge, :location])
  end

  def getDirectorEmployee do
    query = from e in UniversityAccomodation.Staff.Employee,
          join: s in UniversityAccomodation.StudentHouse,on: e.id == s.employee_id,
          where: e.charge == "Director",
          preload: [:student_house]
    UniversityAccomodation.Repo.all(query)
  end
end
