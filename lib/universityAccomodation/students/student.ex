defmodule UniversityAccomodation.Student do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query



  schema "students" do
    field :matricula, :string
    field :name, :string
    field :last_name, :string
    field :address,  :string
    has_one :dormitory, UniversityAccomodation.Dormitory.StudentHouseDormitory
    has_one :agreement, UniversityAccomodation.Agreement
    has_one :flat_dormitory, UniversityAccomodation.Dormitory.FlatDormitory
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:matricula,:name, :last_name,:adress])
    |> cast_assoc(:dormitory)
    |> validate_required([:matricula,:name, :last_name,:adress])
  end

  def getAllStudents() do
    query =  from u in UniversityAccomodation.Student,
        select: [u.name]
    UniversityAccomodation.Repo.one(query)
  end

  def countStudent() do
    query = from(u in UniversityAccomodation.Student,
            select: {count(u.id)})
    UniversityAccomodation.Repo.one(query)
  end

  def getStudentRoom(user_id) do
    query = from u in UniversityAccomodation.Student,
        where: u.id == ^user_id,
        select: u
    UniversityAccomodation.Repo.one(query)
  end



end
