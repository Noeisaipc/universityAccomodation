defmodule UniversityAccomodation.Dormitory do
  use Ecto.Schema
  import Ecto.Changeset

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
end
