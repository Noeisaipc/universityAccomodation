defmodule UniversityAccomodation.Dormitory.StudentHouseDormitory do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "dormitories" do
    field :dormitory_number, :string
    field :hire, :integer
    belongs_to :student, UniversityAccomodation.Student
    belongs_to :student_house, UniversityAccomodation.StudentHouse
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:dormitoryNumber, :hire])
    |> validate_required([:dormitoryNumber, :hire])
  end

  def getAvailableRooms() do
    query =  from room in UniversityAccomodation.Dormitory.StudentHouseDormitory,
    left_join: student in UniversityAccomodation.Student, on: room.student_id < student.id,
    where: is_nil(student.id),
    select: [room.dormitory_number, room.hire]
    UniversityAccomodation.Repo.all(query)
  end



end
