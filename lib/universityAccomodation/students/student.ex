defmodule UniversityAccomodation.Student do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "students" do
    field :matricula, :string
    field :name, :string
    field :last_name, :string
    field :address,  :string
    field :phone_number, :string
    field :category, :string
    has_one :parent, UniversityAccomodation.Family
    has_one :dormitory, UniversityAccomodation.Dormitory.StudentHouseDormitory
    has_one :agreement, UniversityAccomodation.Agreement.StudentAgreement
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

  def getAgreementStudentsHouse do
    query = from s in UniversityAccomodation.Student,
      join: a in UniversityAccomodation.Agreement.StudentAgreement,
      where: s.id == a.student_id and not is_nil(a.student_id),
      preload: [:agreement]
    UniversityAccomodation.Repo.all(query)
  end

  def getStudentWhitOutStudentHouseRoom do
    query = from s in UniversityAccomodation.Student,
      left_join: d in UniversityAccomodation.Dormitory.FlatDormitory, on: s.id == d.student_id,
      left_join: d2 in UniversityAccomodation.Dormitory.StudentHouseDormitory, on: s.id == d2.student_id,
      where: is_nil(d.student_id) and is_nil(d2.student_id)
    UniversityAccomodation.Repo.all(query)
  end

  def getStudentsWhitOutParentAssigned do
    query = from s in UniversityAccomodation.Student,
      left_join: p in UniversityAccomodation.Family, on: s.id == p.student_id,
      where: is_nil(p.student_id)
    UniversityAccomodation.Repo.all(query)
  end


  def getStudentsCategory do
    query = from s in UniversityAccomodation.Student,
      group_by: s.category,
      select: [s.category,count(s.category)]
      UniversityAccomodation.Repo.all(query)
  end
end
