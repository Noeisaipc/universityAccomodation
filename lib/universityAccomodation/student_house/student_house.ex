defmodule UniversityAccomodation.StudentHouse do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "student_houses" do
    field :name, :string
    field :address, :string
    field :phone_number, :string
    has_many :dormitory, UniversityAccomodation.Dormitory.StudentHouseDormitory
    belongs_to :employee,  UniversityAccomodation.Staff.Employee
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :adress, :phone_number])
    |> validate_required([:name, :adress, :phone_number])
  end

  def getAvailableRoomsForEachHouse() do
    query =  from house in UniversityAccomodation.StudentHouse,
    join: rooms in assoc(house, :dormitory),
    where: is_nil(rooms.student_id),
    select: [rooms]
    UniversityAccomodation.Repo.all(query)
  end

end
